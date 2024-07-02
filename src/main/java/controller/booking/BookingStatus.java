package controller.booking;

import DAO.bookingDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Booking;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "BookingStatusServlet", value = "/BookingStatus")
public class BookingStatus extends HttpServlet {
    private String message;



    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//        response.setContentType("text/html");
        try {
       bookingDAO booking = new bookingDAO();
            ArrayList<Booking> listBooking = booking.GetBookingsPending();

            request.setAttribute("listBooking", listBooking);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.getRequestDispatcher("checkbooking.jsp").forward(request, response);

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String action = request.getParameter("action");
        String bookingId = request.getParameter("bookingid");
        bookingDAO booking = new bookingDAO();
        booking.confirmBooking(bookingId, action);
//        request.getRequestDispatcher("checkbooking.jsp").forward(request, response);
        // Hello
        doGet(request,response);

    }

    public void destroy() {
    }
}