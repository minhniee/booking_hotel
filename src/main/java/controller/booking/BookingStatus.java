package controller.booking;

import DAO.AccountDAO;
import DAO.billDAO;
import DAO.bookingDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Bill;
import model.Booking;
import util.Email;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
        String accountId = request.getParameter("acid");
        String price = request.getParameter("price");
//        String email = request.getParameter("email");
        System.out.println(accountId +"asdsadsda");
        String bookingDate = request.getParameter("bookingdate");

//        totalPrice = Double.parseDouble(price);

        if (action.equalsIgnoreCase("reject")) {

        AccountDAO dao = new AccountDAO();
        Account ac =dao.getAccountById(accountId);
        String email = ac.getEmail();
        double totalPrice = 0;
//            SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");

            // Date format for the desired output date string
//            SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

//            String vnp_CreateDate = "";
//            Date date = null;
//            try {
//                date = inputFormat.parse(bookingDate);
//                vnp_CreateDate = outputFormat.format(date);
//            } catch (ParseException e) {
//                throw new RuntimeException(e);
//            }
//            System.out.println(bookingId);
//            System.out.println(price);
//            System.out.println(vnp_CreateDate);
//
//            request.setAttribute("trantype", "02");
//            request.setAttribute("order_id", bookingId);
//            request.setAttribute("amount", (int) totalPrice);
//            request.setAttribute("trans_date", vnp_CreateDate);
            Email.sendEmail(email,"Your booking have been cancle","Sorry booking have been cancle");
            bookingDAO booking = new bookingDAO();
            booking.updateStateBooking(bookingId, action);
//            request.getRequestDispatcher("vnpayRefund").forward(request, response);

        }


//        if (action.equalsIgnoreCase("confirm")) {
//            HttpSession session = request.getSession();
//            Account account = (Account) session.getAttribute("account");
//
//            if (account != null) {
//                Email email = new Email();
//                Email.sendEmail(account.getEmail(), "Comfirm Booking  ", "Successful");
//                bookingDAO booking = new bookingDAO();
//                booking.updateStateBooking(bookingId, "confirm");
//            } else {
//                System.out.println("cannot catch session");
//            }
//            String billId = generateUniqueKey();
//            Bill bill = new Bill(billId, accountId, bookingId, totalPrice);
//            new billDAO().insertBill(bill);
//        }

        doGet(request, response);

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