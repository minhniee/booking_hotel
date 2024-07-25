package controller.staff;

import DAO.CustomerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Booking;
import model.Customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerDetail", value = "/customerDetail")
public class CustomerDetail extends HttpServlet {
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
    private CustomerDAO customerDAO = new CustomerDAO();

//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
////        int id = Integer.parseInt(request.getParameter("id"));
////        Customer customer = customerDAO.getCustomerById(id);
////        request.setAttribute("customer", customer);
////        request.getRequestDispatcher("customerDetail.jsp").forward(request, response);
//        int id = Integer.parseInt(request.getParameter("id"));
//        CustomerDAO customerDAO = new CustomerDAO();
//        Customer customer = customerDAO.getCustomerById(id);
//        request.setAttribute("customer", customer);
//        request.getRequestDispatcher("customerDetail.jsp").forward(request, response);
//    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String customerId = request.getParameter("customerId");
        CustomerDAO customerDAO = new CustomerDAO();
        Customer customer = customerDAO.getCustomerById(customerId);
        List<Booking> listBookingByCustomerId = new ArrayList<>();
        listBookingByCustomerId = customerDAO.getBookingsByCustomerId(customerId);
        request.setAttribute("booking",listBookingByCustomerId);
        request.setAttribute("customer", customer);
        request.getRequestDispatcher("customerDetail.jsp").forward(request, response);
    }


//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        int customerId = Integer.parseInt(request.getParameter("customerId"));
//
//        // Giả sử bạn đã có lớp CustomerDAO với phương thức getCustomerById
//        CustomerDAO customerDAO = new CustomerDAO();
//        Customer customer = customerDAO.getCustomerById(customerId);
//
//        if (customer != null) {
//            request.setAttribute("customer", customer);
//            request.getRequestDispatcher("/customerDetail.jsp").forward(request, response);
//        } else {
//            response.sendRedirect("error.jsp"); // Redirect to an error page if customer not found
//        }
//    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}