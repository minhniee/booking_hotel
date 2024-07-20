/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpay;


import DAO.bookingDAO;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Booking;
import util.Email;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.TimeZone;

/**
 * @author CTT VNPAY
 */
@WebServlet(name = "vnpayRefund", value = "/vnpayRefund")
public class vnpayRefund extends HttpServlet {

    @Override

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //Command: refund
        String vnp_RequestId = Config.getRandomNumber(8);
        String vnp_Version = "2.1.0";
        String vnp_Command = "refund";
        String vnp_TmnCode = Config.vnp_TmnCode;
        String vnp_TransactionDate = "";
        String vnp_TransactionType = req.getParameter("trantype");
        String vnp_TxnRef = req.getParameter("order_id");
        String accountId = req.getParameter("accountId");
        double price = 0;
        Booking booking = null;
//        if (accountId != null) {
//            bookingDAO bookingDAO = new bookingDAO();
//            try {
//                booking = bookingDAO.cancelBooking(vnp_TxnRef, accountId);
//                vnp_TransactionType = "03";
//                price = booking.getBookingPrice();
//
//                LocalDate currentDate = LocalDate.now();
//                LocalDate checkInDate = booking.getCheckInDate().toLocalDate();
//                LocalDate checkOutDate = booking.getCheckOutDate().toLocalDate();
//
//
//                // Format the LocalDateTime object to the desired output format
//                Timestamp bookingTimestamp = booking.getBookingDate();
//
//                // Convert the Timestamp to LocalDateTime
//                LocalDateTime bookingDateTime = bookingTimestamp.toLocalDateTime();
//
//                // Define the output formatter for the desired format
//                DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
//                vnp_TransactionDate = bookingDateTime.format(outputFormatter);
//
//                long daysBetweenCheckinAndCheckout = ChronoUnit.DAYS.between(currentDate, checkInDate);
//                if (daysBetweenCheckinAndCheckout < 7) {
//                    req.getRequestDispatcher("homePage/datatest.jsp").forward(req, resp);
//                } else if (daysBetweenCheckinAndCheckout < 15) {
//
//                    price = price * 0.5;
//                    vnp_TransactionType = "02";
//                    System.out.println("-50%");
//                } else {
//                    vnp_TransactionType = "02";
//                    System.out.println("+100%");
//                }
//            } catch (SQLException e) {
//                throw new RuntimeException(e);
//            }
//        } else {
            vnp_TransactionDate = req.getParameter("trans_date");
            price = Double.parseDouble(req.getParameter("amount"));
//
//        }


        long amount = (long) price * 23000 * 100;
        String vnp_Amount = String.valueOf(amount);
        String vnp_OrderInfo = "Hoan tien GD OrderId:" + vnp_TxnRef;
        String vnp_TransactionNo = ""; //Assuming value of the parameter "vnp_TransactionNo" does not exist on your system.
        String vnp_CreateBy = "admin";

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());

        String vnp_IpAddr = Config.getIpAddress(req);

        JsonObject vnp_Params = new JsonObject();

        vnp_Params.addProperty("vnp_RequestId", vnp_RequestId);
        vnp_Params.addProperty("vnp_Version", vnp_Version);
        vnp_Params.addProperty("vnp_Command", vnp_Command);
        vnp_Params.addProperty("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.addProperty("vnp_TransactionType", vnp_TransactionType);
        vnp_Params.addProperty("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.addProperty("vnp_Amount", vnp_Amount);
        vnp_Params.addProperty("vnp_OrderInfo", vnp_OrderInfo);

        if (vnp_TransactionNo != null && !vnp_TransactionNo.isEmpty()) {
            vnp_Params.addProperty("vnp_TransactionNo", "{get value of vnp_TransactionNo}");
        }

        vnp_Params.addProperty("vnp_TransactionDate", vnp_TransactionDate);
        vnp_Params.addProperty("vnp_CreateBy", vnp_CreateBy);
        vnp_Params.addProperty("vnp_CreateDate", vnp_CreateDate);
        vnp_Params.addProperty("vnp_IpAddr", vnp_IpAddr);

        String hash_Data = String.join("|", vnp_RequestId, vnp_Version, vnp_Command, vnp_TmnCode,
                vnp_TransactionType, vnp_TxnRef, vnp_Amount, vnp_TransactionNo, vnp_TransactionDate,
                vnp_CreateBy, vnp_CreateDate, vnp_IpAddr, vnp_OrderInfo);

        String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hash_Data);

        vnp_Params.addProperty("vnp_SecureHash", vnp_SecureHash);

        URL url = new URL(Config.vnp_ApiUrl);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("Content-Type", "application/json");
        con.setDoOutput(true);
        DataOutputStream wr = new DataOutputStream(con.getOutputStream());
        wr.writeBytes(vnp_Params.toString());
        wr.flush();
        wr.close();
        int responseCode = con.getResponseCode();
        System.out.println("nSending 'POST' request to URL : " + url);
        System.out.println("Post Data : " + vnp_Params);
        System.out.println("Response Code : " + responseCode);
        BufferedReader in = new BufferedReader(
                new InputStreamReader(con.getInputStream()));
        String output;
        StringBuffer response = new StringBuffer();
        while ((output = in.readLine()) != null) {
            response.append(output);
        }
        in.close();


        //send email
        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            Email email = new Email();
            Email.sendEmail(account.getEmail(), "Cancel Booking  ", "Cancel Booking and you will return 100% ");
        } else {
            System.out.println("cannot catch session");
        }
        // change status room
        bookingDAO bookingd = new bookingDAO();
        bookingd.confirmBooking(vnp_TxnRef, "reject");

        //test data
        System.out.println("Booking Refund");
        System.out.println(vnp_TransactionType);
        System.out.println(vnp_TxnRef);
        System.out.println(price);
        System.out.println(amount);

        System.out.println(response);

    }
}
