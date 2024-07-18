package controller.staff;

import DAO.MaterialDAO;
import DAO.ServiceDAO;
import DAO.roomDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Material;
import model.Room;
import model.Service;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

@WebServlet(name = "editService", value = "/editService")
public class editService extends HttpServlet {
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
        ServiceDAO dao = new ServiceDAO();
        Service service = dao.getServiceById(id);
        request.setAttribute("service", service);
        request.setAttribute("errorMessages", new HashMap<String, String>());
        request.getRequestDispatcher("editService.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        String serviceName = request.getParameter("serviceName");
        String description = request.getParameter("description");
        double price = Double.valueOf(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Part part1 = request.getPart("image");
        String fileName1 = extractFileName(part1);
        fileName1 = new File(fileName1).getName();
        if (fileName1 != null && !fileName1.isEmpty()) {
            String uploadPath = getServletContext().getRealPath("") + File.separator + "Assets/image/services";
            // Create the directory if it does not exist
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            part1.write(uploadPath + File.separator + fileName1);
        }
        String roomImg = (fileName1 != null && !fileName1.isEmpty()) ? fileName1 : request.getParameter("oldImage");

        Service service = new Service(id, categoryId, serviceName, description, price, quantity, roomImg);
        ServiceDAO dao = new ServiceDAO();
        dao.updateService(service);
        response.sendRedirect("ViewService");

    }
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }
}