package controller.booking;

import DAO.RoomClassDAO;
import DAO.bookingDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Booking;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "bookingdetailcus", value = "/bookingdetailcus")
public class bookingdetailcus extends HttpServlet {
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
    request.getRequestDispatcher("/user/detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bid = request.getParameter("bookingID");
        bookingDAO bookingDAO = new bookingDAO();
        HttpSession ss = request.getSession();
        Booking bookingdetail = null;
        RoomClassDAO getImg= new RoomClassDAO();
        BigDecimal baseprice = null;
        try {
            // Retrieve all bookings from the DAO
            ArrayList<Booking> bookingList = bookingDAO.GetAllBookings();

            // Filter bookings based on the booking ID
            ArrayList<String> getAll_img = null;
            for (Booking booking : bookingList) {
                if (booking.getId().equals(bid)) {
                    bookingdetail = booking;
                    getAll_img = (ArrayList<String>) getImg.getImagesByRoomId(booking.getRoomId());
                    baseprice = getImg.getBasePriceByRoomId(booking.getRoomId());
                    break;
                }
            }
            request.setAttribute("base_price",baseprice);
            request.setAttribute("dataimg", getAll_img);
            // Set the filtered booking data as a request attribute
            request.setAttribute("data", bookingdetail);
        } catch (SQLException e) {
            // Handle SQL exceptions
            throw new RuntimeException(e);
        }
        request.getRequestDispatcher("/user/detail.jsp").forward(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }
}