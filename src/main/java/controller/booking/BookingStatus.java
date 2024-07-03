package controller.booking;

import DAO.billDAO;
import DAO.bookingDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Bill;
import model.Booking;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.UUID;

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
        request.getRequestDispatcher("Admin/checkbooking.jsp").forward(request, response);

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String action = request.getParameter("action");
        String bookingId = request.getParameter("bookingid");
        String accountId = request.getParameter("accountid");
        String price = request.getParameter("price");
        double totalPrice=0;
//        try {
//
         totalPrice = Double.parseDouble(price);
//        }catch (Exception e){
//            System.out.println(price);
//            System.out.println("loi o day ");
//        }
        bookingDAO booking = new bookingDAO();
        booking.confirmBooking(bookingId, action);

        if (action.equalsIgnoreCase("confirm")){
        String billId = generateUniqueKey();
        Bill bill = new Bill(billId, accountId,bookingId, totalPrice);
        new billDAO().insertBill(bill);
        }

        doGet(request,response);

    }

    public static String generateUniqueKey() {
        String key;

        // Generate a UUID and take the first 12 characters (to ensure length 12)
        String uuid = UUID.randomUUID().toString().replace("-", "");
        key = uuid.substring(0, 8);

        return key;
    }

    public void destroy() {
    }
}