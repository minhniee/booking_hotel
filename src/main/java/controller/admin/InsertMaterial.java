package controller.admin;

import DAO.ManageMaterialDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Material;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;

@WebServlet(name = "InsertMaterial", value = "/InsertMaterial")
@MultipartConfig
public class InsertMaterial extends HttpServlet {
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
        request.getRequestDispatcher("Admin/InsertMaterial.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));
        Part image = request.getPart("image");
        String realPath = request.getServletContext().getRealPath("/Assets/image/material");
        String filename = Path.of(image.getSubmittedFileName()).getFileName().toString();


        // Ensure the directory exists
        if (!Files.exists(Path.of(realPath))) {
            Files.createDirectory(Path.of(realPath));
        }
        image.write(realPath +"/"+ filename);
        ManageMaterialDAO dao = new ManageMaterialDAO();
        Material material = dao.getMaterialById(id);
        Material materialImage = dao.getMaterialByImage(filename);
        if(material != null ) {
            request.setAttribute("error", "Id is already in use!!!");
            request.getRequestDispatcher("Admin/InsertMaterial.jsp").forward(request, response);
        }else if(materialImage != null){
            request.setAttribute("errorImg", "Image is already in use!!!");
            request.getRequestDispatcher("Admin/InsertMaterial.jsp").forward(request, response);
        }else{
            dao.InsertMaterial(id.toUpperCase(), name, quantity, price, filename);
            HttpSession session = request.getSession();
            session.setAttribute("success", "Successfully Inserted Material!!!");
            response.sendRedirect("ManageMaterial");
        }


    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}