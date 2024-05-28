/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

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

        SimpleDateFormat myFormat = new SimpleDateFormat("dd MMM, yyyy");
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd MMM, yyyy");

        String checkinDate = request.getParameter("checkinDate");
        String checkoutDate = request.getParameter("checkoutDate");
            LocalDateTime now = LocalDateTime.now();

        long daysDiff = 0 ;
        long earlyBirdDays = 0 ;
        int children =0;
        int adults = 1;
        int person=0;
        String url ="";
        String currentDate= dtf.format(now);

        try {
         children = Integer.parseInt(request.getParameter("children"));
         adults = Integer.parseInt(request.getParameter("adults"));
         person = adults + children;

            Date date1 = myFormat.parse(checkinDate);
            Date date2 = myFormat.parse(checkoutDate);
            Date currDate = myFormat.parse(currentDate);

            long diff = date2.getTime() - date1.getTime();
            earlyBirdDays = TimeUnit.DAYS.convert(date1.getTime() - currDate.getTime(), TimeUnit.MILLISECONDS);
            if (earlyBirdDays < 0){
                earlyBirdDays =0;
            }
            daysDiff = TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);

        } catch (ParseException e) {
            e.printStackTrace();
        }
        if ( adults + children >  3 || checkinDate.isEmpty() || checkoutDate.isEmpty() ){
            request.setAttribute("noti", "Date invalid");
            // to another page noti err
        }else{
//            request.setAttribute("noti", "checkin" + checkinDate +"checkout" + checkoutDate + "   Day: " + daysDiff);
            request.setAttribute("nights", daysDiff);
            request.setAttribute("persons", person);
            request.setAttribute("checkinDate", checkinDate);
            request.setAttribute("checkoutDate", checkoutDate);
            request.setAttribute("earlyBirdDays", earlyBirdDays);
            url = "/booking/listRoom.jsp";
        }
       request.getRequestDispatcher(url).forward(request, response);
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
