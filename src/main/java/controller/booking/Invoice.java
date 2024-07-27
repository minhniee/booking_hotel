/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.booking;

import DAO.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.*;
import util.Email;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.time.temporal.ChronoUnit;
import java.util.Random;

//import static controller.booking.BookingDetail;

/**
 * @author minhl
 */
@WebServlet(name = "BillBookingRoomServlet", urlPatterns = {"/Invoice"})
public class Invoice extends HttpServlet {

    public static String getRandomNumber(int len) {
        Random rnd = new Random();
        String chars = "0123456789";
        StringBuilder sb = new StringBuilder(len);
        for (int i = 0; i < len; i++) {
            sb.append(chars.charAt(rnd.nextInt(chars.length())));
        }
        return sb.toString();
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        /* TODO output your page here. You may use following sample code. */
        HttpSession session = request.getSession();

//        String checkinDateParam = request.getAttribute("checkInDate").toString();
//        String checkoutDateParam = request.getAttribute("checkOutDate").toString();
//        String childrenParam = session.getAttribute("children").toString();
//        String adultsParam = session.getAttribute("adults").toString();
//        String roomId = session.getAttribute("roomId").toString();
//        String bookingId = re.getAttribute("bookingID").toString();
//        String cost = session.getAttribute("cost").toString();
//        Booking booking = (Booking) request.getAttribute("BookingObj");
//        String bookingId = booking.getId();

        String vnp_TxnRef = request.getParameter("vnp_TxnRef");
        String vnp_Amount = request.getParameter("vnp_Amount");
        String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
        String bookingId = request.getParameter("vnp_OrderInfo");
        String state = "";

        bookingDAO bookingDAO = new bookingDAO();
        roomDAO roomDAO = new roomDAO();
        AccountDAO accountDAO = new AccountDAO();
        Booking booking = null;
        Room room = null;
        Account account = null;
        try {
            booking = bookingDAO.GetBookingById(bookingId);
            room = roomDAO.getRoomById(booking.getRoomId());
            account = accountDAO.getAccountById(booking.getAccountId());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        try {
            if (booking.getAccountId() == null || booking.getCheckInDate() == null || booking.getCheckOutDate() == null || booking.getRoomId() == null || booking.getId() == null || vnp_Amount == null || vnp_ResponseCode == null) {
                request.setAttribute("noti", "Invalid input parameters");
                request.getRequestDispatcher("errorPage.jsp").forward(request, response);
                return;
            }

            DateTimeFormatter currentDateFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");

            LocalDate checkInDate = booking.getCheckInDate().toLocalDate();
            LocalDate checkOutDate = booking.getCheckOutDate().toLocalDate();

            int nights = (int) ChronoUnit.DAYS.between(checkInDate, checkOutDate);

            if (nights < 3) {
                room.setBasePrice(room.getBasePrice() + (room.getBasePrice() * 0.3));
            } else if (nights < 10) {
                room.setBasePrice(room.getBasePrice() + (room.getBasePrice() * 0.1));
            } else {
                room.setBasePrice(room.getBasePrice() - (room.getBasePrice() * 0.1));
            }

            LocalDateTime currentDate = LocalDateTime.now();
            Timestamp timePayment = Timestamp.valueOf(currentDate);
            String invoiceDate = currentDate.format(currentDateFormatter);

            int adults = booking.getNumAdults();
            int children = booking.getNumChildren();
            double priceValue = booking.getBookingPrice();
            billDAO billDAO = new billDAO();
            if (vnp_ResponseCode.equals("00")) {

                TimerTask.timer.cancel();
                bookingDAO.updateStateBooking(bookingId, "confirm");
                Bill bill = new Bill(getRandomNumber(4), booking.getAccountId(), booking.getId(), booking.getBookingPrice());
                billDAO.insertBill(bill);
                Payment payment = new Payment(vnp_TxnRef, bookingId, priceValue, timePayment, 1);
                new paymentDAO().insertPayment(payment);

                String email = "<!DOCTYPE html>\n" +
                        "<html lang=\"en\">\n" +
                        "<head>\n" +
                        "    <meta charset=\"UTF-8\">\n" +
                        "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
                        "    <title>Booking Confirmation Pending Approval</title>\n" +
                        "    <link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/css2?family=Barlow&amp;family=Barlow+Condensed&amp;family=Gilda+Display&amp;display=swap\">\n" +
                        "\n" +
                        "</head>\n" +
                        "<body style=\"font-family: Barlow, sans-serif; line-height: 1.6;\">\n" +
                        "    <table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n" +
                        "        <tr>\n" +
                        "            <td align=\"center\">\n" +
                        "                <table width=\"600\" cellpadding=\"20\" cellspacing=\"0\" border=\"0\" style=\"border: 1px solid #dddddd; border-radius: 5px; margin-top: 20px;\">\n" +
                        "                    <tr>\n" +
                        "                        <td align=\"center\" style=\"background-color: #72a322; color: white;\">\n" +
                        "                            <h1>Booking Confirmation Pending Approval</h1>\n" +
                        "                        </td>\n" +
                        "                    </tr>\n" +
                        "                    <tr>\n" +
                        "                        <td style=\"background-color: #ffffff; color: #333333;\">\n" +
                        "                            <p>Dear <strong>"+account.getUserName()+"</strong>,</p>\n" +
                        "                            <p>Thank you for choosing <strong>Renager</strong>. We are pleased to inform you that your booking has been successfully received and is currently pending approval from our admin team.</p>\n" +
                        "                            <p><strong>Booking Details:</strong></p>\n" +
                        "                            <ul>\n" +
                        "                                <li><strong>Booking ID:</strong> "+ bookingId+"</li>\n" +
                        "                                <li><strong>Check-in Date:</strong>"+booking.getCheckInDate()+"</li>\n" +
                        "                                <li><strong>Check-out Date:</strong> "+booking.getCheckOutDate()+"</li>\n" +
                        "                                <li><strong>Room Type:</strong> "+session.getAttribute("roomClassName").toString()+"</li>\n" +
                        "                                <li><strong>Number of Guests:</strong>"+ (children+adults)+" </li>\n" +
                        "                            </ul>\n" +
                        "                            <p>We will notify you once your booking has been approved. In the meantime, if you have any questions or need further assistance, please do not hesitate to contact us at <a href=\"mailto:renager.hotel@gmail.com\">renager.hotel@gmail.com</a> or call us at <strong>031234567</strong>.</p>\n" +
                        "                            <p>Thank you for your patience.</p>\n" +
                        "                            <p>Sincerely,</p>\n" +
                        "                            Renager Hotel<br>\n" +
                        "                            Thach That, Hoa Lac, Ha Noi<br>\n" +
                        "                            <a href=\"mailto:renager.hotel@gmail.com\">renager.hotel@gmail.com</a><br>\n" +
                        "                            031234567<br>\n" +
                        "                            <!-- <a href=\"[Hotel Website]\"></a></p> -->\n" +
                        "                        </td>\n" +
                        "                    </tr>\n" +
                        "                    <tr>\n" +
                        "                        <td align=\"center\" style=\"background-color: #f9f9f9; color: #999999; font-size: 12px;\">\n" +
                        "                            <p>You are receiving this email because you made a booking at [Hotel Name]. If you did not make this booking or no longer wish to receive these emails, please contact us at <a href=\"mailto:renager.hotel@gmail.com\">renager.hotel@gmail.com</a>.</p>\n" +
                        "                        </td>\n" +
                        "                    </tr>\n" +
                        "                </table>\n" +
                        "            </td>\n" +
                        "        </tr>\n" +
                        "    </table>\n" +
                        "</body>\n" +
                        "</html>\n";
                Email.sendEmail(account.getEmail(),"Thank for booking",email);

                state = "confirmed";
            } else {
                bookingDAO.updateStateBooking(bookingId, "reject");
                state = "cancelled";
            }
            // insert pay
            request.setAttribute("checkInDate", booking.getCheckInDate());
            request.setAttribute("checkOutDate", booking.getCheckOutDate());
            request.setAttribute("roomId", booking.getRoomId());
            request.setAttribute("bookingID", booking.getId());
            request.setAttribute("nights", nights);
            request.setAttribute("basePrice", room.getBasePrice());
            request.setAttribute("noti", "Add successful");
            request.setAttribute("vnp_TxnRef", vnp_TxnRef);
            request.setAttribute("invoiceDate", invoiceDate);
            request.setAttribute("state", state);

            request.getRequestDispatcher("homePage/invoice.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            e.printStackTrace();
            //            request.setAttribute("paymentMethod", payment);
            request.setAttribute("bookingID", bookingId.toUpperCase());
            request.setAttribute("accountid", booking.getAccountId());
            request.setAttribute("checkInDate", booking.getCheckInDate());
            request.setAttribute("checkOutDate", booking.getCheckOutDate());
            request.setAttribute("children", booking.getNumChildren());
            request.setAttribute("adults", booking.getNumAdults());
            request.setAttribute("roomId", booking.getRoomId());
            request.setAttribute("vnp_TxnRef", vnp_TxnRef);
            request.setAttribute("noti", "Invalid number format");
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        } catch (DateTimeParseException e) {
            e.printStackTrace();
            request.setAttribute("noti", "Invalid date format");
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("noti", "An unexpected error occurred");
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        }

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
//        processRequest(request, response);
//        String account_id = request.getParameter("accountid");
//        String checkinDateParam = request.getParameter("checkInDate");
//        String checkoutDateParam = request.getParameter("checkOutDate");
//        String childrenParam = request.getParameter("children");
//        String adultsParam = request.getParameter("adults");
//        String roomId = request.getParameter("roomId");
//        String bookingId = request.getParameter("bookingid");
//        String vnp_Amount = request.getParameter("vnp_Amount");
//        String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
//        HttpSession session = request.getSession();
//        String bookingID = (String) session.getAttribute("bookingID");
//        String account_id = (String) session.getAttribute("accountid");
//        String checkinDateParam = (String) session.getAttribute("checkInDate");
//        String checkoutDateParam = (String) session.getAttribute("checkOutDate");
//        String childrenParam = (String) session.getAttribute("children");
//        String adultsParam = (String) session.getAttribute("adults");
//        String roomId = (String) session.getAttribute("roomId");
//        roomDAO roomDAO = new roomDAO();
//        paymentDAO paymentDAO = new paymentDAO();
//        bookingDAO bookingDao = new bookingDAO();
//
//
//        try {
//
//            DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
//            DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//
//            LocalDate dateCheckIn = LocalDate.parse(checkinDateParam, inputFormatter);
//            LocalDate dateCheckOut = LocalDate.parse(checkoutDateParam, inputFormatter);
//
//            String checkInDate = dateCheckIn.format(outputFormatter);
//            String checkOutDate = dateCheckOut.format(outputFormatter);
//            LocalDateTime currentDate = LocalDateTime.now();
//
//            int adults = Integer.parseInt(adultsParam);
//            int children = Integer.parseInt(childrenParam);
//            double priceValue = Double.parseDouble(vnp_Amount);
//
//            if (vnp_ResponseCode.equals("00")) {
//                Booking booking = new Booking(bookingID, roomId, Date.valueOf(checkInDate),
//                        Date.valueOf(checkOutDate), adults, children,
//                        priceValue, 1, account_id, Date.valueOf(currentDate.format(outputFormatter)));
//
//                Payment p = new Payment(bookingID,priceValue, Date.valueOf(currentDate.format(outputFormatter)), 1);
//
//                // cancel back state room.
////                Timer timer = TimerTask.timer;
////                timer.cancel();
//                // update state room by "unavalidable"
////                roomDAO.updateRoomStatus(roomId, "Unavailable");
//                // table booking
//                bookingDao.insertBooking(booking);
//                // table booking status
//                bookingDao.stateBooking(bookingID);
//                // table payment
//                paymentDAO.insertPayment(p);
//
//                request.setAttribute("noti", "Add successful");
//                request.setAttribute("bookingID", bookingID);
//                request.setAttribute("accountid", account_id);
//                request.setAttribute("checkInDate", checkinDateParam);
//                request.setAttribute("checkOutDate", checkoutDateParam);
//                request.setAttribute("children", childrenParam);
//                request.setAttribute("adults", adultsParam);
//                request.setAttribute("roomId", roomId);
//                request.setAttribute("amount", vnp_Amount);
//                request.setAttribute("roomId", roomId);
//            }else{
//                request.setAttribute("noti", "not successful");
//            }
//            request.getRequestDispatcher("booking/billBooking.jsp").forward(request, response);
//        } catch (NumberFormatException e) {
//            e.printStackTrace();
//            //            request.setAttribute("paymentMethod", payment);
//            request.setAttribute("bookingID", bookingID);
//            request.setAttribute("accountid", account_id);
//            request.setAttribute("checkInDate", checkinDateParam);
//            request.setAttribute("checkOutDate", checkoutDateParam);
//            request.setAttribute("children", childrenParam);
//            request.setAttribute("adults", adultsParam);
//            request.setAttribute("roomId", roomId);
//            request.setAttribute("noti", "Invalid number format");
//            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
//        } catch (DateTimeParseException e) {
//            e.printStackTrace();
//            request.setAttribute("noti", "Invalid date format");
//            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
//        } catch (Exception e) {
//            e.printStackTrace();
//            request.setAttribute("noti", "An unexpected error occurred");
//            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
//        }
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
