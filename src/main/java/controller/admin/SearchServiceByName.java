package controller.admin;

import DAO.ManageServiceCategoryDAO;
import DAO.ManageServiceDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.ManageService;
import model.ManageServiceCategory;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "SearchServiceByName", value = "/SearchServiceByName")
public class SearchServiceByName extends HttpServlet {
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
        String text = request.getParameter("text");
        ManageServiceDAO dao = new ManageServiceDAO();
        ArrayList<ManageService> list = new ArrayList<>();
        list= dao.getManageServicesByName(text);
        request.setAttribute("manageServices", list);
        ArrayList<ManageServiceCategory> manageServiceCategory = new ArrayList<>();
        ManageServiceCategoryDAO manageServiceCategoryDAO = new ManageServiceCategoryDAO();
        manageServiceCategory = manageServiceCategoryDAO.selectAll();
        request.setAttribute("manageServiceCategory", manageServiceCategory);
        request.getRequestDispatcher("Admin/ManageService.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}