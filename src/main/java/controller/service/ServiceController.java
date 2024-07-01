package controller.service;

import DAO.ServiceCategoryDAO;
import DAO.ServiceDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Service;
import model.ServiceCategory;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServiceController", urlPatterns = {"/services"})
public class ServiceController extends HttpServlet {

    private ServiceDAO serviceDAO = new ServiceDAO();
    private ServiceCategoryDAO categoryDAO = new ServiceCategoryDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String keyword = request.getParameter("keyword");
        List<Service> services;

        if (action != null && action.equals("search") && keyword != null) {
            services = serviceDAO.searchServices(keyword);
        } else if (request.getParameter("categoryId") != null) {
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            services = serviceDAO.getServicesByCategory(categoryId);
        } else {
            services = serviceDAO.getAllServices();
        }

        List<ServiceCategory> categories = categoryDAO.getAllCategories();

        request.setAttribute("services", services);
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("services/services.jsp").forward(request, response);
    }
}