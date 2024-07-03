package controller.admin;

import java.io.*;
import java.sql.SQLException;
import java.util.ArrayList;

import DAO.bookingDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Booking;

@WebServlet(name = "listBookingServlet", value = "/listBooking")
public class listBooking extends HttpServlet {
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
        request.getRequestDispatcher("Admin/listbooking.jsp").forward(request, response);

    }

    public void destroy() {
    }
}