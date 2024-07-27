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
//        System.out.println(accountId +"asdsadsda");
        String bookingDate = request.getParameter("bookingdate");


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
            String contentEmail = "<!DOCTYPE html>\n" +
                    "<html>\n" +
                    "<head>\n" +
                    "<link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/css2?family=Barlow&amp;family=Barlow+Condensed&amp;family=Gilda+Display&amp;display=swap\">"+
                    "    <title>Room Booking Cancellation</title>\n" +
                    "    <style>\n" +
                    "        body {\n" +
                    "            font-family: Barlow, sans-serif;\n" +
                    "            margin: 0;\n" +
                    "            padding: 0;\n" +
                    "            background-color: #f2f2f2;\n" +
                    "        }\n" +
                    "        .container {\n" +
                    "            width: 100%;\n" +
                    "            max-width: 600px;\n" +
                    "            margin: 0 auto;\n" +
                    "            background-color: #ffffff;\n" +
                    "            padding: 20px;\n" +
                    "            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\n" +
                    "        }\n" +
                    "        .header {\n" +
                    "            background-color: #FF0000;\n" +
                    "            color: #ffffff;\n" +
                    "            padding: 10px 20px;\n" +
                    "            text-align: center;\n" +
                    "        }\n" +
                    "        .content {\n" +
                    "            padding: 20px;\n" +
                    "        }\n" +
                    "        .button {\n" +
                    "            display: inline-block;\n" +
                    "            padding: 10px 20px;\n" +
                    "            font-size: 16px;\n" +
                    "            color: #ffffff;\n" +
                    "            background-color: #007BFF;\n" +
                    "            text-align: center;\n" +
                    "            text-decoration: none;\n" +
                    "            border-radius: 5px;\n" +
                    "            margin-top: 20px;\n" +
                    "        }\n" +
                    "        .footer {\n" +
                    "            text-align: center;\n" +
                    "            padding: 10px;\n" +
                    "            font-size: 12px;\n" +
                    "            color: #888888;\n" +
                    "        }\n" +
                    "    </style>\n" +
                    "</head>\n" +
                    "<body>\n" +
                    "    <div class=\"container\">\n" +
                    "        <div class=\"header\">\n" +
                    "            <h1>Room Booking Cancellation</h1>\n" +
                    "        </div>\n" +
                    "        <div class=\"content\">\n" +
                    "            <p>Dear "+ac.getFullName()+ ",</p>\n" +
                    "            <p>We regret to inform you that your room booking has been canceled by our admin team due .</p>\n" +
                    "            <p>If you need further assistance or have any questions, please click the button below to contact us:</p>\n" +
                    "             <p></p>\n" +
                    "            <p>We apologize for any inconvenience this may have caused and appreciate your understanding.</p>\n" +
                    "            <p>Thank you!</p>\n" +
                    "            <p>Best regards,</p>\n" +
                    "            <p>FU Hotel</p>\n" +
                    "        </div>\n" +
                    "        <div class=\"footer\">\n" +
                    "            <p>&copy; 2024 FU Hotel. All rights reserved.</p>\n" +
                    "            <p>FU Hotel</p>\n" +
                    "        </div>\n" +
                    "    </div>\n" +
                    "</body>\n" +
                    "</html>\n";
            Email.sendEmail(email,"Room Booking Cancellation",contentEmail);
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


    public void destroy() {
    }
}