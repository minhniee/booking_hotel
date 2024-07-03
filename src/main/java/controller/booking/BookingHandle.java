/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.booking;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.concurrent.TimeUnit;

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

        String url = "";
        HttpSession session = request.getSession();
        Object object = session.getAttribute("account");
        Account user = (Account) object;
        if (user == null || !user.getRole().equalsIgnoreCase("customer")) {
            request.getRequestDispatcher("errorPage/errors-500.jsp").forward(request, response);
            return;
        }

        SimpleDateFormat myFormat = new SimpleDateFormat("dd-MM-yyyy");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        String checkinDate = null;
        String checkoutDate = null;
        LocalDateTime now = LocalDateTime.now();
        int daysDiff = 0;
        int earlyBirdDays = 0;
        int children = 0;
        int adults = 0;
        int person = 1;

        String currentDate = formatter.format(now);
        String dateRangeString = request.getParameter("date");
        String location = request.getParameter("location");

        LocalDate[] dates = parseDateRange(dateRangeString);
        try {
            if (dates != null) {
                checkinDate = dates[0].format(formatter);
                checkoutDate = dates[1].format(formatter);
            }

            String childrenParam = request.getParameter("children");
            String adultsParam = request.getParameter("adults");
            if (childrenParam != null) {
                children = Integer.parseInt(childrenParam);
            }
            if (adultsParam != null) {
                adults = Integer.parseInt(adultsParam);
            }
            person = adults + children;

            Date date1 = myFormat.parse(checkinDate);
            Date date2 = myFormat.parse(checkoutDate);
            Date currDate = myFormat.parse(currentDate);

            long diff = (long) (date2.getTime() - date1.getTime());

            earlyBirdDays = (int) TimeUnit.DAYS.convert(date1.getTime() - currDate.getTime(), TimeUnit.MILLISECONDS);
            if (earlyBirdDays < 0) {
                earlyBirdDays = 0;
            }
            daysDiff = (int) TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);

            if (adults + children > 3 || checkinDate.isEmpty() || checkoutDate.isEmpty() || location.isEmpty()) {
                request.setAttribute("noti", "Date invalid");
                url = "/errorPage.jsp";
            } else {
                request.setAttribute("noti", "checkin: " + checkinDate + " checkout: " + checkoutDate + " Day: " + daysDiff);
                request.setAttribute("nights", daysDiff);
                request.setAttribute("persons", person);
                request.setAttribute("adults", adults);
                request.setAttribute("children", children);
                request.setAttribute("checkinDate", checkinDate);
                request.setAttribute("checkoutDate", checkoutDate);
                request.setAttribute("earlyBirdDays", earlyBirdDays);
                request.setAttribute("location", location);
                request.setAttribute("date",dateRangeString);
                url = "/booking/listRoom.jsp";
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("noti", "An error occurred: " + e.getMessage());
            url = "/errorPage.jsp";
        }
        System.out.println(daysDiff);
        request.getRequestDispatcher(url).forward(request, response);
    }

    private static LocalDate[] parseDateRange(String dateRangeString) {
        String[] dateStrings = dateRangeString.split(" to ");
        if (dateStrings.length == 2) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
            LocalDate startDate = LocalDate.parse(dateStrings[0].trim(), formatter);
            LocalDate endDate = LocalDate.parse(dateStrings[1].trim(), formatter);
            return new LocalDate[]{startDate, endDate};
        } else {
            return null;
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
