/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.booking;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.sql.Date;

import DAO.bookingDAO;
import DAO.roomDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Booking;
import model.Room;

/**
 * @author minhl
 */
@WebServlet(name = "BookingDetail", urlPatterns = {"/BookingDetail"})
public class BookingDetail extends HttpServlet {

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
            ArrayList<Room> room = new ArrayList();
            String checkinDate = request.getParameter("checkinDate");
            String checkoutDate = request.getParameter("checkoutDate");
            String roomType = request.getParameter("roomType");
            String persons = request.getParameter("persons");
            String nights = request.getParameter("nights");
            String adults = request.getParameter("adults");
            String children = request.getParameter("children");
            String earlyBirdDays = request.getParameter("earlyBirdDays");
            String total = request.getParameter("total");
            String location = request.getParameter("location");

            roomDAO roomDAO = new roomDAO();
            room = roomDAO.getRoomByRoomClass(roomType);
            String currenRoom = room.get(0).getId();
            roomDAO.stateRoomWhenSelect(currenRoom);
//            RoomStatusScheduler.startScheduler();


            request.setAttribute("checkinDate", checkinDate);
            request.setAttribute("checkoutDate", checkoutDate);
            request.setAttribute("roomType", roomType);
            request.setAttribute("persons", persons);
            request.setAttribute("nights", nights);
            request.setAttribute("earlyBirdDays", earlyBirdDays);
            request.setAttribute("total", total);
            request.setAttribute("adults", adults);
            request.setAttribute("children", children);
            request.setAttribute("location", location);
            request.setAttribute("currenRoom", currenRoom);
            request.getRequestDispatcher("booking/booking.jsp").forward(request, response);
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
            String bookingId = request.getParameter("location");
            String payment = request.getParameter("paymentMethod");
            String account_id = request.getParameter("accountid");
            String checkinDateParam = request.getParameter("checkinDate");
            String checkoutDateParam = request.getParameter("checkoutDate");
            String childrenParam = request.getParameter("children");
            String adultsParam = request.getParameter("adults");
            String roomId = request.getParameter("roomId");
            String price = request.getParameter("price");

            DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
            DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

            try {
                // Validate required parameters
                if (bookingId == null || payment == null || account_id == null ||
                        checkinDateParam == null || checkoutDateParam == null ||
                        childrenParam == null || adultsParam == null ||
                        roomId == null || price == null) {
                    throw new ServletException("Missing parameters");
                }

                // Parse and format dates
                LocalDate dateCheckIn = LocalDate.parse(checkinDateParam, inputFormatter);
                LocalDate dateCheckOut = LocalDate.parse(checkoutDateParam, inputFormatter);
                String checkinDate = dateCheckIn.format(outputFormatter);
                String checkoutDate = dateCheckOut.format(outputFormatter);

                // Parse numerical values
                int adults = Integer.parseInt(adultsParam);
                int children = Integer.parseInt(childrenParam);
                double priceValue = Double.parseDouble(price);

                // Create Booking object
                Booking booking = new Booking(bookingId, roomId, Date.valueOf(checkinDate),
                        Date.valueOf(checkoutDate), adults, children,
                        priceValue, 1, account_id);

                // Insert booking into database
                bookingDAO bookingDao = new bookingDAO();
                bookingDao.insertBooking(booking);

                // Set response status
                response.setStatus(HttpServletResponse.SC_OK);
            } catch (DateTimeParseException e) {
                // Handle date parsing errors
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid date format: " + e.getMessage());
            } catch (NumberFormatException e) {
                // Handle number parsing errors
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid number format: " + e.getMessage());
            } catch (Exception e) {
                // Handle other errors
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing the request: " + e.getMessage());
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

