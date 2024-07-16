/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vnpay;

import DAO.roomDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Room;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        if (session.getAttribute("total") == null) {
            response.sendRedirect("index");
        } else {
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MM/dd/yyyy");
            String prefixId = "";
            String account_id = request.getParameter("accountid");
            String checkinDateParam = session.getAttribute("checkInDate").toString();
            String checkoutDateParam = session.getAttribute("checkOutDate").toString();
            String childrenParam = request.getParameter("children");
            String adultsParam = request.getParameter("adults");
            String roomId = session.getAttribute("roomId").toString();

            LocalDate checkInDate = LocalDate.parse(checkinDateParam, dtf);
            LocalDate checkOutDate = LocalDate.parse(checkoutDateParam, dtf);
            System.out.println(checkInDate);
            System.out.println(checkOutDate);
            System.out.println(roomId);


            String bookingID = prefixId + generateUniqueKey();

            long cost = (long) session.getAttribute("total");




            String vnp_Version = "2.1.0";
            String vnp_Command = "pay";
            String orderType = "billpayment";
            long amount = cost * 23000 * 100 ;
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
            vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + bookingID.toUpperCase());
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

            cld.add(Calendar.SECOND, 120);
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

            session.setAttribute("cost", cost);
            session.setAttribute("bookingID", bookingID);
            session.setAttribute("checkInDate", checkinDateParam);
            session.setAttribute("checkOutDate", checkoutDateParam);
            session.setAttribute("children", childrenParam);
            session.setAttribute("adults", adultsParam);
            session.setAttribute("roomId", roomId);

            response.sendRedirect(paymentUrl);

        }
    }

    public static String generateUniqueKey() {
        String key;

        // Generate a UUID and take the first 12 characters (to ensure length 12)
        String uuid = UUID.randomUUID().toString().replace("-", "");
        key = uuid.substring(0, 12);

        return key;
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
