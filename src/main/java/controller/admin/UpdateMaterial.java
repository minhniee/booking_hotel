package controller.admin;

import DAO.ManageMaterialDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Material;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateMaterial", value = "/UpdateMaterial")
public class UpdateMaterial extends HttpServlet {
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
        ManageMaterialDAO dao = new ManageMaterialDAO();
        Material material = dao.getMaterialById(id);
        request.setAttribute("material", material);
        request.getRequestDispatcher("Admin/UpdateMaterial.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));
        String image = request.getParameter("image");
        ManageMaterialDAO dao = new ManageMaterialDAO();
        dao.UpdateMaterial(id, name , quantity ,price, image);
        HttpSession session = request.getSession();
        session.setAttribute("success", "Successfully updated !!!");
        response.sendRedirect("ManageMaterial");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}