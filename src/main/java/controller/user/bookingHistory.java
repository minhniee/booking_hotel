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
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        bookingDAO bookingdao = new bookingDAO();
        ArrayList<Booking> bookinglist = new ArrayList<>();
        ArrayList<Booking> data = new ArrayList<>();

        try {
            bookinglist = bookingdao.GetAllBookings();
            for (Booking booking : bookinglist) {
                if (booking.getAccountId()==account.getId()) {
                    data.add(booking);
                }
            }
            // In dữ liệu bookinglist ra console
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        request.setAttribute("data", data);
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