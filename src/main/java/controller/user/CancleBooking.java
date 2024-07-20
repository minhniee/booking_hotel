/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

import DAO.bookingDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Booking;

/**
 * @author minhl
 */
@WebServlet(name = "CancleBookingServlet", urlPatterns = {"/CancelBooking"})
public class CancleBooking extends HttpServlet {

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
        request.getRequestDispatcher("homePage/datatest.jsp").forward(request, response);
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
//        HttpSession session = request.getSession();
//        Account accountId = (Account) session.getAttribute("account");  // acc
//        String vnp_TxnRef = request.getParameter("order_id"); // bk id
//        double  price =0;
//        String vnp_CreateDate="";
//        if (accountId != null){
//            bookingDAO dao = new bookingDAO();
//
//            try {
//                Booking booking =  dao.cancelBooking(vnp_TxnRef,accountId.getId());
//
//
//                DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS");
//                DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
//
//                // Parse the original timestamp to a LocalDateTime object
//                LocalDateTime dateTime = LocalDateTime.parse(booking.getBookingDate().toString(), inputFormatter);
//
//                // Format the LocalDateTime object to the desired output format
//                 vnp_CreateDate = dateTime.format(outputFormatter);
//
//                  price = booking.getBookingPrice(); // pr
//                Date checkInDate =booking.getCheckInDate();
//
//                LocalDate today = LocalDate.now();
//                LocalDate checkIn = checkInDate.toLocalDate();
//
//                System.out.println("base" +price);
//                long daysBetweenCheckinAndCheckout = ChronoUnit.DAYS.between(today, (checkIn));
//                System.out.println("daysBetweenCheckinAndCheckout:" +daysBetweenCheckinAndCheckout);
//
//                if (daysBetweenCheckinAndCheckout < 7) {
//                    request.setAttribute("noti", "date check in <7 -100%");
//                    System.out.println("-100%");
////                    request.getRequestDispatcher("homePage/datatest.jsp").forward(request, response);
//                } else if (daysBetweenCheckinAndCheckout < 15) {
//                    price = price *0.5;
//                    request.setAttribute("noti", "date check in <15 -50%%");
//                    System.out.println("-50%");
////                    request.getRequestDispatcher("homePage/datatest.jsp").forward(request, response);
//                } else {
//                    System.out.println("+100%");
//                }
//                System.out.println(daysBetweenCheckinAndCheckout);
//            } catch (SQLException e) {
//                throw new RuntimeException(e);
//            }
//            bookingDAO booking = new bookingDAO();
//            booking.confirmBooking(vnp_TxnRef, "reject");
//            request.setAttribute("trantype", "03");
//            request.setAttribute("order_id", vnp_TxnRef);
//            request.setAttribute("amount", (int)price);
//            request.setAttribute("trans_date", vnp_CreateDate);
//            System.out.println(vnp_CreateDate);
//            request.getRequestDispatcher("vnpayRefund").forward(request, response);
        }
//        processRequest(request, response);


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

