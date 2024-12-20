package controller.staff;

import DAO.MaterialDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Material;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "editMaterial", value = "/editMaterial")
@MultipartConfig
public class editMaterial extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NewServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        MaterialDAO dao = new MaterialDAO();
        Material material = dao.getMaterialById(id);
        request.setAttribute("material", material);
        request.setAttribute("errorMessages", new HashMap<String, String>());
        request.getRequestDispatcher("editMaterial.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String roomId = request.getParameter("roomId");
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String quantityStr = request.getParameter("quantity");
        String priceStr = request.getParameter("price");
//        String image = request.getParameter("image");
        String image = request.getParameter("oldImage");
        Part imageSrc = request.getPart("image");
        String realPath = request.getServletContext().getRealPath("/Assets/image/material");
        String filename = Path.of(imageSrc.getSubmittedFileName()).getFileName().toString();
        // Ensure the directory exists
        if (!Files.exists(Path.of(realPath))) {
            Files.createDirectory(Path.of(realPath));
        }
        if(filename != null && !filename.isEmpty()) {
            imageSrc.write(realPath + "/" + filename);
            image = filename;
        }

        Map<String, String> errorMessages = new HashMap<>();
        boolean hasError = false;

        int quantity = 0;
        double price = 0.0;

        try {
            quantity = Integer.parseInt(quantityStr);
            if (quantity <= 0) {
                errorMessages.put("quantity", "Quantity must be a positive integer.");
                hasError = true;
            }
        } catch (NumberFormatException e) {
            errorMessages.put("quantity", "Invalid quantity format.");
            hasError = true;
        }

        try {
            price = Double.parseDouble(priceStr);
            if (price <= 0) {
                errorMessages.put("price", "Price must be a positive number.");
                hasError = true;
            }
        } catch (NumberFormatException e) {
            errorMessages.put("price", "Invalid price format.");
            hasError = true;
        }

        if (hasError) {
            Material material = new Material(roomId, id, name, quantity, price, image);
            request.setAttribute("material", material);
            request.setAttribute("errorMessages", errorMessages);
            request.getRequestDispatcher("editMaterial.jsp").forward(request, response);
        } else {
            Material material = new Material(roomId, id, name, quantity, price, image);
            MaterialDAO dao = new MaterialDAO();
            dao.updateMaterial(material);
            response.sendRedirect("ViewMaterial");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
