/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.booking;

import DAO.bookingDAO;
import DAO.roomDAO;
import jakarta.mail.Session;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Booking;
import model.Room;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Timer;
import java.util.UUID;

/**
 * @author minhl
 */
@WebServlet(name = "BookingDetail", urlPatterns = {"/BookingDetail"})
public class BookingDetail extends HttpServlet {
    private static   String currenRoom="";
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
        HttpSession session = request.getSession();
        Object object = session.getAttribute("account");
        if (object == null) {
            response.sendRedirect("login.jsp");
        } else {
            String checkInDate = session.getAttribute("checkInDate").toString();
            String checkOutDate = session.getAttribute("checkOutDate").toString();
            String roomClassName = request.getParameter("roomClassName");
            String roomClassId = request.getParameter("roomClassId");
            String basePrice = request.getParameter("basePrice");
            String total = request.getParameter("total");


            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MM/dd/yyyy");
            LocalDate checkInDatep = LocalDate.parse(checkInDate, dtf);
            LocalDate checkOutDatep = LocalDate.parse(checkOutDate, dtf);

            // get room available
            List<String> availableRooms = new roomDAO().checkAllRoomsStatusByClassId(checkInDatep, checkOutDatep, roomClassId);
            String roomId = availableRooms.stream().findFirst().get();

            session.setAttribute("roomClassName", roomClassName);
            session.setAttribute("basePrice",basePrice);
            session.setAttribute("total", (long) Double.parseDouble(total));
            session.setAttribute("roomId", roomId);
            request.getRequestDispatcher("booking-old/booking.jsp").forward(request, response);
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

//        String prefixId = "";
//        String location = request.getParameter("location");
//        String payment = request.getParameter("paymentMethod");
//        String account_id = request.getParameter("accountid");
//        String checkinDateParam = request.getParameter("checkInDate");
//        String checkoutDateParam = request.getParameter("checkOutDate");
//        String childrenParam = request.getParameter("children");
//        String adultsParam = request.getParameter("adults");
//        String roomId = request.getParameter("roomId");
//        String price = request.getParameter("price");
//        String bookingId = generateUniqueKey().toUpperCase();
//
//
//        DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
//        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//
//        try {
//            LocalDateTime currentDate = LocalDateTime.now();
//
//            if ("ha noi".equalsIgnoreCase(location)) prefixId = "HN";
//            if ("da nang".equalsIgnoreCase(location)) prefixId = "DN";
//            if ("quy nhon".equalsIgnoreCase(location)) prefixId = "QN";
//            if ("Ho Chi Minh".equalsIgnoreCase(location)) prefixId = "HCM";
//            // Parse and format dates
//
//            LocalDate dateCheckIn = LocalDate.parse(checkinDateParam, inputFormatter);
//            LocalDate dateCheckOut = LocalDate.parse(checkoutDateParam, inputFormatter);
//
//            String checkInDate = dateCheckIn.format(outputFormatter);
//            String checkOutDate = dateCheckOut.format(outputFormatter);
//
//            int adults = Integer.parseInt(adultsParam);
//            int children = Integer.parseInt(childrenParam);
//            double priceValue = Double.parseDouble(price);
//
//            bookingId = prefixId + bookingId;
//            Booking booking = new Booking(bookingId, roomId, Date.valueOf(checkInDate),
//                    Date.valueOf(checkOutDate), adults, children,
//                    priceValue, 1, account_id, Date.valueOf(currentDate.format(outputFormatter)));
//
//            // Insert booking into database
//            bookingDAO bookingDao = new bookingDAO();
//            bookingDao.insertBooking(booking);
//            bookingDao.stateBooking(bookingId);
////                PrintWriter out = response.getWriter();
////                out.println("thank for booking ");
//            TimerTask.timer.cancel();
//            // Set response status
//            response.setStatus(HttpServletResponse.SC_OK);
//        } catch (DateTimeParseException e) {
//            // Handle date parsing errors
//            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid date format: " + e.getMessage());
//        } catch (NumberFormatException e) {
//            // Handle number parsing errors
//            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid number format: " + e.getMessage());
//        } catch (Exception e) {
//            // Handle other errors
//            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing the request: " + e.getMessage());
//        }
    }


    public static String generateUniqueKey() {
        String key;

        // Generate a UUID and take the first 12 characters (to ensure length 12)
        String uuid = UUID.randomUUID().toString().replace("-", "");
        key = uuid.substring(0, 12);

        return key;
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

