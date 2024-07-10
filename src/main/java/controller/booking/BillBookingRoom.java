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
import model.Booking;
import model.Payment;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Timer;

//import static controller.booking.BookingDetail;

/**
 * @author minhl
 */
@WebServlet(name = "BillBookingRoomServlet", urlPatterns = {"/BillBookingRoom"})
public class BillBookingRoom extends HttpServlet {

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
        String account_id = request.getParameter("accountid");
        String checkinDateParam = request.getParameter("checkinDate");
        String checkoutDateParam = request.getParameter("checkoutDate");
        String childrenParam = request.getParameter("children");
        String adultsParam = request.getParameter("adults");
        String roomId = request.getParameter("roomId");
        String bookingId = request.getParameter("bookingid");
        String vnp_Amount = request.getParameter("vnp_Amount");
        String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");

        try {
//                if (account_id == null || checkinDateParam == null || checkoutDateParam == null ||
//                        childrenParam == null || adultsParam == null || roomId == null || bookingId == null ||
//                        vnp_Amount == null || vnp_ResponseCode == null) {
//                    request.setAttribute("noti", "Invalid input parameters");
//                    request.getRequestDispatcher("errorPage.jsp").forward(request, response);
//                    return;
//                }

//                DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
//                DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

//                LocalDate dateCheckIn = LocalDate.parse(checkinDateParam, inputFormatter);
//                LocalDate dateCheckOut = LocalDate.parse(checkoutDateParam, inputFormatter);
//
//                String checkinDate = dateCheckIn.format(outputFormatter);
//                String checkoutDate = dateCheckOut.format(outputFormatter);
            LocalDateTime currentDate = LocalDateTime.now();

            int adults = Integer.parseInt(adultsParam);
            int children = Integer.parseInt(childrenParam);
            double priceValue = Double.parseDouble(vnp_Amount);

            Booking booking = new Booking(bookingId, roomId, Date.valueOf(checkinDateParam),
                    Date.valueOf(checkoutDateParam), adults, children,
                    priceValue, 1, account_id, Date.valueOf(String.valueOf(currentDate)));
            bookingDAO bookingDao = new bookingDAO();
            bookingDao.insertBooking(booking);
            bookingDao.stateBooking(bookingId);
            request.setAttribute("noti", "Add successful");

            request.getRequestDispatcher("booking/billBooking.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            //            request.setAttribute("paymentMethod", payment);
            request.setAttribute("bookingID", bookingId);
            request.setAttribute("accountid", account_id);
            request.setAttribute("checkinDate", checkinDateParam);
            request.setAttribute("checkoutDate", checkoutDateParam);
            request.setAttribute("children", childrenParam);
            request.setAttribute("adults", adultsParam);
            request.setAttribute("roomId", roomId);
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
//        String checkinDateParam = request.getParameter("checkinDate");
//        String checkoutDateParam = request.getParameter("checkoutDate");
//        String childrenParam = request.getParameter("children");
//        String adultsParam = request.getParameter("adults");
//        String roomId = request.getParameter("roomId");
//        String bookingId = request.getParameter("bookingid");
        String vnp_Amount = request.getParameter("vnp_Amount");
        String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
        HttpSession session = request.getSession();
        String bookingID = (String) session.getAttribute("bookingID");
        String account_id = (String) session.getAttribute("accountid");
        String checkinDateParam = (String) session.getAttribute("checkinDate");
        String checkoutDateParam = (String) session.getAttribute("checkoutDate");
        String childrenParam = (String) session.getAttribute("children");
        String adultsParam = (String) session.getAttribute("adults");
        String roomId = (String) session.getAttribute("roomId");
        roomDAO roomDAO = new roomDAO();
        paymentDAO paymentDAO = new paymentDAO();
        bookingDAO bookingDao = new bookingDAO();


        try {

            DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
            DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

            LocalDate dateCheckIn = LocalDate.parse(checkinDateParam, inputFormatter);
            LocalDate dateCheckOut = LocalDate.parse(checkoutDateParam, inputFormatter);

            String checkinDate = dateCheckIn.format(outputFormatter);
            String checkoutDate = dateCheckOut.format(outputFormatter);
            LocalDateTime currentDate = LocalDateTime.now();

            int adults = Integer.parseInt(adultsParam);
            int children = Integer.parseInt(childrenParam);
            double priceValue = Double.parseDouble(vnp_Amount);

            if (vnp_ResponseCode.equals("00")) {
                Booking booking = new Booking(bookingID, roomId, Date.valueOf(checkinDate),
                        Date.valueOf(checkoutDate), adults, children,
                        priceValue, 1, account_id, Date.valueOf(currentDate.format(outputFormatter)));

                Payment p = new Payment(bookingID,priceValue, Date.valueOf(currentDate.format(outputFormatter)), 1);

                // cancel back state room.
                Timer timer = TimerTask.timer;
                timer.cancel();
                // update state room by "unavalidable"
                roomDAO.updateRoomStatus(roomId, "Unavailable");
                // table booking
                bookingDao.insertBooking(booking);
                // table booking status
                bookingDao.stateBooking(bookingID);
                // table payment
                paymentDAO.insertPayment(p);

                request.setAttribute("noti", "Add successful");
                request.setAttribute("bookingID", bookingID);
                request.setAttribute("accountid", account_id);
                request.setAttribute("checkinDate", checkinDateParam);
                request.setAttribute("checkoutDate", checkoutDateParam);
                request.setAttribute("children", childrenParam);
                request.setAttribute("adults", adultsParam);
                request.setAttribute("roomId", roomId);
                request.setAttribute("amount", vnp_Amount);
                request.setAttribute("roomId", roomId);
                request.setAttribute("roomId", roomId);
            }else{
                request.setAttribute("noti", "not successful");
            }
            request.getRequestDispatcher("booking/billBooking.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            //            request.setAttribute("paymentMethod", payment);
            request.setAttribute("bookingID", bookingID);
            request.setAttribute("accountid", account_id);
            request.setAttribute("checkinDate", checkinDateParam);
            request.setAttribute("checkoutDate", checkoutDateParam);
            request.setAttribute("children", childrenParam);
            request.setAttribute("adults", adultsParam);
            request.setAttribute("roomId", roomId);
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
