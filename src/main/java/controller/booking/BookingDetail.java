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
import model.Account;
import model.Booking;
import model.Room;
import util.Email;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
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
            List<String> availableRooms = new roomDAO().getRoomByClassId(checkInDatep, checkOutDatep, roomClassId);
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

        HttpSession session = request.getSession();
        String account_id = request.getParameter("accountid");
        String checkinDateParam = getSessionAttribute(session, "checkInDate");
        String checkoutDateParam = getSessionAttribute(session, "checkOutDate");
        String childrenParam = getSessionAttribute(session, "children");
        String adultsParam = getSessionAttribute(session, "adults");
        String roomId = getSessionAttribute(session, "roomId");
        String price = request.getParameter("price");
        String bookingId = generateUniqueKey().toUpperCase();

        try {
            LocalDateTime currentDate = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");
            LocalDate checkInDate = LocalDate.parse(checkinDateParam, formatter);
            LocalDate checkOutDate = LocalDate.parse(checkoutDateParam, formatter);

            int adults = Integer.parseInt(adultsParam);
            int children = Integer.parseInt(childrenParam);
            double priceValue = Double.parseDouble(price);

            Booking booking = new Booking(
                    bookingId, roomId, Date.valueOf(checkInDate),
                    Date.valueOf(checkOutDate), adults, children,
                    priceValue, 1, account_id, Timestamp.valueOf(currentDate)
            );

            // Insert booking into database
            bookingDAO bookingDao = new bookingDAO();
            bookingDao.insertBooking(booking);
            bookingDao.insertStateBooking(bookingId);

            // Set response status and forward to the next page
//            session.setAttribute("bookingId", bookingId);
            Account account = (Account) session.getAttribute("account");
            Email.sendEmail(account.getEmail(),"Thank for booking",content(account.getFullName()));
            request.getRequestDispatcher("homePage/thankbooking.jsp").forward(request, response);
//            response.setStatus(HttpServletResponse.SC_OK);
        } catch (DateTimeParseException e) {
//            handleException(response, HttpServletResponse.SC_BAD_REQUEST, "Invalid date format: " + e.getMessage());
        } catch (NumberFormatException e) {
//            handleException(response, HttpServletResponse.SC_BAD_REQUEST, "Invalid number format: " + e.getMessage());
        } catch (Exception e) {
//            handleException(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing the request: " + e.getMessage());
        }
    }

    private String getSessionAttribute(HttpSession session, String attributeName) throws ServletException {
        Object attribute = session.getAttribute(attributeName);
        if (attribute == null) {
            throw new ServletException("Missing session attribute: " + attributeName);
        }
        return attribute.toString();
    }

    private void handleException(HttpServletResponse response, int statusCode, String message) throws IOException {
        response.sendError(statusCode, message);
    }

    private static String content(String cusName){
        return "<!DOCTYPE html>\n" +
                "<html>\n" +
                "<head>\n" +
                "    <title>Booking Order Update</title>\n" +
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
                "            <h1>Booking Order Update</h1>\n" +
                "        </div>\n" +
                "        <div class=\"content\">\n" +
                "            <p>Dear "+ cusName+",</p>\n" +
                "            <p>Thank you for booking with us. Your order is currently being handled by our admin team. We will notify you once the process is complete.</p>\n" +
                "            <p>If you have any questions or need further assistance, feel free to reply to this email.</p>\n" +
                "            <p>We appreciate your patience and look forward to serving you.</p>\n" +
                "            <p>Thank you!</p>\n" +
                "            <p>Best regards,</p>\n" +
                "            <p>FU Hotel</p>\n" +
                "        </div>\n" +
                "        <div class=\"footer\">\n" +
                "            <p>&copy; 2024 FU Hotel. All rights reserved.</p>\n" +
                "            <p>FU Hotel</p>\n" +
                "        </div>\n" +
                "    </div>\n" +
                "</body>\n" +
                "</html>\n";
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

