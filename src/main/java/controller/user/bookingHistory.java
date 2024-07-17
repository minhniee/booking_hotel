package controller.user;

import DAO.bookingDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Account;
import model.Booking;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "bookingHistory", urlPatterns = "/bookingHistory")
public class bookingHistory extends HttpServlet {
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
        // Get the session and account information
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        // Check if the account is null
        if (account == null) {
            // If account is null, redirect to the login page or handle the error appropriately
            response.sendRedirect("login.jsp");
            return;
        }

        // Initialize DAO and booking list
        bookingDAO bookingDAO = new bookingDAO();
        ArrayList<Booking> data = new ArrayList<>();

        try {
            // Retrieve all bookings from the DAO
            ArrayList<Booking> bookingList = bookingDAO.GetAllBookings();

            // Filter bookings based on the account ID
            for (Booking booking : bookingList) {
                if (booking.getAccountId().equals(account.getId())) {
                    data.add(booking);
                }
            }

            // Set the filtered booking data as a request attribute
            request.setAttribute("data", data);
        } catch (SQLException e) {
            // Handle SQL exceptions
            throw new RuntimeException(e);
        }

        // Forward the request to the booking history JSP page
        request.getRequestDispatcher("/user/booking_history.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}