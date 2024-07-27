package controller.staff;

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

@WebServlet(name = "ListBooking", value = "/ListBookingStaff")
public class ListBooking extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            bookingDAO booking = new bookingDAO();
            ArrayList<Booking> listBooking = booking.GetAllBookings();
            request.setAttribute("listBooking", listBooking);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.getRequestDispatcher("listBookingStatus.jsp").forward(request, response);

    }

    public void destroy() {
    }
}