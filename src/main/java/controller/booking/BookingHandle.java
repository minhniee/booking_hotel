/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.booking;

import DAO.roomDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Room;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Arrays;
import java.util.List;

/**
 * @author minhl
 */
@WebServlet(name = "BookingHandleServlet", urlPatterns = {"/BookingHandle"})
public class BookingHandle extends HttpServlet {


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
        if (session.getAttribute("account") == null) {
            response.sendRedirect("login.jsp");
        } else {
            String url = "";
            String locate = request.getParameter("locate");
            if (locate != null) {
                url = "Room";
            } else {
                url = "home";
            }
            // Current date and time
            LocalDateTime now = LocalDateTime.now();
            int earlyBirdDays = 0;
            int children = 0;
            int adults = 0;
            int person = 1;

            // Date formatter
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");
            String today = formatter.format(now);

            // Get parameters from request
            String checkInDate = request.getParameter("checkInDate");
            String checkOutDate = request.getParameter("checkOutDate");
            String childrenParam = request.getParameter("children");
            String adultsParam = request.getParameter("adults");

            // Parse children and adults parameters
            if (childrenParam != null && !childrenParam.isEmpty()) {
                children = Integer.parseInt(childrenParam);
            }
            if (adultsParam != null && !adultsParam.isEmpty()) {
                adults = Integer.parseInt(adultsParam);
            }
            person = adults + children;

            // Parse dates
            LocalDate date1 = LocalDate.parse(checkInDate, formatter);
            LocalDate date2 = LocalDate.parse(checkOutDate, formatter);
            LocalDate currentDate = LocalDate.parse(today, formatter);

            // Calculate days between check-in and check-out
            long daysBetween = ChronoUnit.DAYS.between(date1, date2);

            // Calculate early bird days
            earlyBirdDays = (int) ChronoUnit.DAYS.between(currentDate, date1);

            // Determine URL based on validation
            if (checkInDate.isEmpty() || checkOutDate.isEmpty() || daysBetween <= 0 || earlyBirdDays < 0) {
                request.setAttribute("noti",
                        "Please choose a date greater than the current date!");
                request.setAttribute("currentDate", currentDate);
            } else if (person >= 3) {
                request.setAttribute("noti", "Too many persons (2 people/per room)");
            } else {
                roomDAO roomDAO = new roomDAO();
                List<Room> rooms = roomDAO.getRoomClasses(roomDAO.checkAllRoomsStatus(date1, date2));

                // Example list of holidays (you can replace it with your actual holiday list or logic)
                List<LocalDate> holidays = Arrays.asList(
                        LocalDate.of(now.getYear(), 1, 1),
                        LocalDate.of(now.getYear(), 12, 25)
                        // Add more holidays as needed
                );

//                    long quantity = roomDAO.getRoomQuantity(room.getId()); // Assuming this method returns the quantity of rooms
                int quantity = rooms.size();
                System.out.println(quantity);
                for (Room room : rooms) {

                    BigDecimal basePrice = BigDecimal.valueOf(room.getBasePrice());

                    if (daysBetween < 3) {
                        basePrice = basePrice.add(basePrice.multiply(BigDecimal.valueOf(0.3)));
                    } else if (daysBetween < 10) {
                        basePrice = basePrice.add(basePrice.multiply(BigDecimal.valueOf(0.15)));
                    } else {
                        basePrice = basePrice.subtract(basePrice.multiply(BigDecimal.valueOf(0.1)));
                    }

                    // Check if the date1 is a holiday and the room quantity is less than 10
                    if (holidays.contains(date1) && quantity < 10) {
                        basePrice = basePrice.add(basePrice.multiply(BigDecimal.valueOf(0.2))); // Increase by 20%
                    }

                    // Round to 2 decimal places
                    basePrice = basePrice.setScale(2, RoundingMode.HALF_UP);
                    room.setBasePrice(basePrice.doubleValue());
                }

                request.setAttribute("rooms", rooms);
                session.setAttribute("nights", daysBetween);
                session.setAttribute("persons", person);
                session.setAttribute("adults", adults);
                session.setAttribute("children", children);
                session.setAttribute("checkInDate", checkInDate);
                session.setAttribute("checkOutDate", checkOutDate);
                session.setAttribute("earlyBirdDays", earlyBirdDays);

                url = "/homePage/rooms2.jsp";
            }
            System.out.println(daysBetween);
            System.out.println(earlyBirdDays);
            request.getRequestDispatcher(url).forward(request, response);
        }
    }


//    private static LocalDate[] parseDateRange(String dateRangeString) {
//        String[] dateStrings = dateRangeString.split(" to ");
//        if (dateStrings.length == 2) {
//            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
//            LocalDate startDate = LocalDate.parse(dateStrings[0].trim(), formatter);
//            LocalDate endDate = LocalDate.parse(dateStrings[1].trim(), formatter);
//            return new LocalDate[]{startDate, endDate};
//        } else {
//            return null;
//        }
//    }


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
