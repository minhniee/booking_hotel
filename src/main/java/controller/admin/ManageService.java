package controller.admin;

import DAO.ManageServiceCategoryDAO;
import DAO.ManageServiceDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.ManageServiceCategory;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "ManageService", value = "/ManageService")
public class ManageService extends HttpServlet {
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
       ArrayList<model.ManageService> manageServices = new ArrayList<>();
       ManageServiceDAO manageServiceDAO = new ManageServiceDAO();
       manageServices = manageServiceDAO.getManageServices();
       ArrayList<ManageServiceCategory> manageServiceCategory = new ArrayList<>();
       ManageServiceCategoryDAO manageServiceCategoryDAO = new ManageServiceCategoryDAO();
       manageServiceCategory = manageServiceCategoryDAO.selectAll();
        request.setAttribute("manageServiceCategory", manageServiceCategory);
       request.setAttribute("manageServices", manageServices);
       request.getRequestDispatcher("Admin/ManageService.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       int id = Integer.parseInt(request.getParameter("type"));
        ManageServiceDAO manageServiceDAO = new ManageServiceDAO();
        ArrayList<model.ManageService> manageServices = new ArrayList<>();
        if(id == -1){
            ArrayList<ManageServiceCategory> manageServiceCategory = new ArrayList<>();
            ManageServiceCategoryDAO manageServiceCategoryDAO = new ManageServiceCategoryDAO();
            manageServiceCategory = manageServiceCategoryDAO.selectAll();
            request.setAttribute("manageServiceCategory", manageServiceCategory);
            manageServices = manageServiceDAO.getManageServices();
            request.setAttribute("manageServices", manageServices);
        }else{
            ArrayList<ManageServiceCategory> manageServiceCategory = new ArrayList<>();
            ManageServiceCategoryDAO manageServiceCategoryDAO = new ManageServiceCategoryDAO();
            manageServiceCategory = manageServiceCategoryDAO.selectAll();
            request.setAttribute("manageServiceCategory", manageServiceCategory);
            manageServices = manageServiceDAO.getManageServicesById(id);
            request.setAttribute("manageServices", manageServices);
        }
        request.setAttribute("subjectId", id);
        request.getRequestDispatcher("Admin/ManageService.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}