/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.booking;

import DAO.bookingDAO;
import DAO.paymentDAO;
import DAO.roomDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Booking;
import model.Payment;
import model.Room;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.time.temporal.ChronoUnit;

//import static controller.booking.BookingDetail;

/**
 * @author minhl
 */
@WebServlet(name = "BillBookingRoomServlet", urlPatterns = {"/Invoice"})
public class Invoice extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        bookingDAO bookingDAO = new bookingDAO();
        roomDAO roomDAO = new roomDAO();
        Booking booking = null;
        Room room = null;
        try {
            booking = bookingDAO.GetBookingById(bookingId);
            room = roomDAO.getRoomById(booking.getRoomId());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

//        Account account = (Account) session.getAttribute("account");
//        String account_id = account.getId();
        try {
            if (booking.getAccountId() == null || booking.getCheckInDate() == null || booking.getCheckOutDate() == null ||
                      booking.getRoomId() == null || booking.getId() == null ||
                    vnp_Amount == null || vnp_ResponseCode == null) {
                request.setAttribute("noti", "Invalid input parameters");
                request.getRequestDispatcher("errorPage.jsp").forward(request, response);
                return;
            }

            DateTimeFormatter currentDateFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");

            LocalDate checkInDate = booking.getCheckInDate().toLocalDate();
            LocalDate checkOutDate = booking.getCheckOutDate().toLocalDate();

            int nights =(int) ChronoUnit.DAYS.between(checkInDate,checkOutDate);

            if (nights < 3) {
                room.setBasePrice(room.getBasePrice() + (room.getBasePrice() * 0.3));
            } else if (nights < 10) {
                room.setBasePrice(room.getBasePrice() + (room.getBasePrice() * 0.1));
            }else {
                room.setBasePrice(room.getBasePrice() - (room.getBasePrice() * 0.1));
            }

            LocalDateTime currentDate = LocalDateTime.now();
            Timestamp timePayment = Timestamp.valueOf(currentDate);
            String invoiceDate = currentDate.format(currentDateFormatter);

            int adults = booking.getNumAdults();
            int children = booking.getNumChildren();
            double priceValue = booking.getBookingPrice();


            bookingDAO.updateStateBooking(bookingId,"confirm");
            // insert pay
            Payment payment = new Payment(vnp_TxnRef,bookingId,priceValue,timePayment,1);
             new paymentDAO().insertPayment(payment);
             request.setAttribute("checkInDate",booking.getCheckInDate());
             request.setAttribute("checkOutDate",booking.getCheckOutDate());
             request.setAttribute("roomId",booking.getRoomId());
             request.setAttribute("bookingID",booking.getId());
             request.setAttribute("nights",nights);
             request.setAttribute("basePrice",room.getBasePrice());
            request.setAttribute("noti", "Add successful");
            request.setAttribute("vnp_TxnRef", vnp_TxnRef);
            request.setAttribute("invoiceDate", invoiceDate);

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
            request.setAttribute("vnp_TxnRef",vnp_TxnRef);
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
