/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vnpay;

import DAO.AccountDAO;
import DAO.bookingDAO;
import controller.booking.TimerTask;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Booking;
import util.Email;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.*;

/**
 * @author admin
 */
@WebServlet(name = "PaymentVNpayServlet", urlPatterns = {"/paymentvnpay"})
public class PaymentVNpayServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
//        if (session.getAttribute("total") == null) {
//            response.sendRedirect("index");
//        } else {
        int timeExpert = 15;
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String bookingId = request.getParameter("bookingid");
        bookingDAO bookingDAO = new bookingDAO();
        AccountDAO accountDAO = new AccountDAO();
        Booking booking = bookingDAO.GetBookingById(bookingId);
        Account account = accountDAO.getAccountById(booking.getAccountId());
        System.out.println(account.getEmail());
        System.out.println(account.getUserName());
//            String checkinDateParam = session.getAttribute("checkInDate").toString();
//            String checkoutDateParam = session.getAttribute("checkOutDate").toString();
//            String childrenParam = session.getAttribute("children").toString();
//            String adultsParam = session.getAttribute("adults").toString();
//            String roomId = session.getAttribute("roomId").toString();

//            LocalDate checkInDate = LocalDate.parse(checkinDateParam, dtf);
//            LocalDate checkOutDate = LocalDate.parse(checkoutDateParam, dtf);
//            System.out.println("================= payment servlet");
//            System.out.println("check in:" + checkInDate);
//            System.out.println("check out:" + checkOutDate);
//            System.out.println("child" + childrenParam);
//            System.out.println("alduts" + adultsParam);
//            System.out.println("roomId" + roomId);

        long cost = (long) booking.getBookingPrice();
        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String orderType = "billpayment";
        long amount = cost * 23000 * 100;
        String bankCode = "";

        String vnp_TxnRef = Config.getRandomNumber(8);
        String vnp_IpAddr = "127.0.0.1";

        String vnp_TmnCode = Config.vnp_TmnCode;

        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");

        if (bankCode != null && !bankCode.isEmpty()) {
            vnp_Params.put("vnp_BankCode", bankCode);
        }
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", booking.getId());
        vnp_Params.put("vnp_OrderType", orderType);

        String locate = request.getParameter("language");
        if (locate != null && !locate.isEmpty()) {
            vnp_Params.put("vnp_Locale", locate);
        } else {
            vnp_Params.put("vnp_Locale", "vn");
        }
        vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

        cld.add(Calendar.MINUTE, timeExpert);
        String vnp_ExpireDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

        List fieldNames = new ArrayList(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator itr = fieldNames.iterator();

        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                //Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII));
                //Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;
//            +"&accountid="+account_id+"&bookingID="+bookingID+"&checkinDateParam="+checkinDateParam+"&checkoutDateParam="+checkoutDateParam+"&childrenParam="+childrenParam+"&adultsParam="+adultsParam+"&roomId="+roomId;
        request.setAttribute("code", "00");
        request.setAttribute("message", "success");
        request.setAttribute("data", paymentUrl);

//            request.setAttribute("paymentMethod", payment);
//            request.setAttribute("bookingID", bookingID);
//            request.setAttribute("accountid", account_id);
//            request.setAttribute("checkInDate", checkinDateParam);
//            request.setAttribute("checkOutDate", checkoutDateParam);
//            request.setAttribute("children", childrenParam);
//            request.setAttribute("adults", adultsParam);
//            request.setAttribute("roomId", roomId);
//            request.setAttribute("price", price);

//        request.setAttribute("cost", cost);
//        request.setAttribute("bookingID", bookingId);
//        request.setAttribute("checkInDate", booking.getCheckOutDate());
//        request.setAttribute("checkOutDate", booking.getCheckOutDate());
//        request.setAttribute("children", booking.getNumChildren());
//        request.setAttribute("adults", booking.getNumAdults());
//        request.setAttribute("roomId", booking.getRoomId());
//        request.setAttribute("bookingId",booking.getId());
//        System.out.println(account.getUserName());
        String content = "<!DOCTYPE html>\n" +
                "<html>\n" +
                "<head>\n" +
                "    <title>Room Booking Payment</title>\n" +
                "<link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/css2?family=Barlow&amp;family=Barlow+Condensed&amp;family=Gilda+Display&amp;display=swap\">"+
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
                "            background-color: #007BFF;\n" +
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
                "            <h1>Room Booking Payment</h1>\n" +
                "        </div>\n" +
                "        <div class=\"content\">\n" +
                "            <p>Dear "+ account.getFullName()+ ",</p>\n" +
                "            <p>Thank you for booking a room with us. Please click the button below to complete your payment </p>\n" +
                "            <p  style=\"color: red;\">The payment link will expire in 15 minutes. If you do not pay, your order will be automatically canceled</p>\n" +
                "            <a href=\""+paymentUrl+ "\" class=\"button\">Pay Now</a>\n" +
                "            <p>If you have any questions or need further assistance, feel free to reply to this email.</p>\n" +
                "            <p>Thank you!</p>\n" +
                "            <p>Best regards,</p>\n" +
                "            <p><strong>FU Hotel</strong></p>\n" +
                "        </div>\n" +
                "        <div class=\"footer\">\n" +
                "            <p>&copy; 2024 FU Hotel. All rights reserved.</p>\n" +
                "            <p>FU Hotel</p>\n" +
                "        </div>\n" +
                "    </div>\n" +
                "</body>\n" +
                "</html>\n";
        bookingDAO.updateStateBooking(bookingId,"inprocess");
        Email.sendEmail(account.getEmail(), "Room Booking Payment", content);
        TimerTask timerTask = new TimerTask();
        timerTask.timerRejectBooking(booking,account,"reject",timeExpert*60);

        response.sendRedirect("BookingStatus");
    }



    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
