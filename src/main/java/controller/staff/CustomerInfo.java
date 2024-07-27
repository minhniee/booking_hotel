package controller.staff;

import DAO.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.List;
import model.Customer;
import model.Material;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "CustomerInfo", urlPatterns = {"/customerInfo"})
public class CustomerInfo extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CustomerInfo</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerInfo at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    private static final int ITEMS_PER_PAGE = 10;
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        CustomerDAO customerDAO = new CustomerDAO();
        List<Customer> customers = customerDAO.getAllCustomers();

        int totalCustomers = customers.size();

        int totalPages = (int) Math.ceil((double) totalCustomers / ITEMS_PER_PAGE);

        int page;
        String pageParam = request.getParameter("page");
        if (pageParam == null) {
            page = 1;
        } else {
            page = Integer.parseInt(pageParam);
        }

        int startIndex = (page - 1) * ITEMS_PER_PAGE;
        int endIndex = Math.min(startIndex + ITEMS_PER_PAGE, totalCustomers);

        List<Customer> customersPage = new ArrayList<>(customers.subList(startIndex, endIndex));

        request.setAttribute("customers", customersPage);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", page);

        request.getRequestDispatcher("customerInfo.jsp").forward(request, response);

        request.setAttribute("customers", customers);
        request.getRequestDispatcher("customerInfo.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        int customerId = Integer.parseInt(request.getParameter("customerId"));
//        response.sendRedirect("customerDetail?customerId=" + customerId);

//        int customerId = Integer.parseInt(request.getParameter("customerId"));
//        System.out.println("Received customerId: " + customerId); // Logging
//        CustomerDAO customerDAO = new CustomerDAO();
//        Customer customer = customerDAO.getCustomerById(customerId);
//        request.setAttribute("customer", customer);
//        request.getRequestDispatcher("customerDetail.jsp").forward(request, response);
    }

    //        @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//    throws ServletException, IOException {
//        int customerId = Integer.parseInt(request.getParameter("customerId"));
//        CustomerDAO customerDAO = new CustomerDAO();
//        Customer customer = customerDAO.getCustomerById(customerId);
//        request.setAttribute("customer", customer);
//        request.getRequestDispatcher("customerDetail.jsp").forward(request, response);
//    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
