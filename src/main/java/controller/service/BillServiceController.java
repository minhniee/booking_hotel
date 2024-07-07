/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.service;

import DAO.*;
import controller.booking.TimerTask;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.*;

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
@WebServlet(name = "BillServiceController", urlPatterns = {"/BillService"})
public class BillServiceController extends HttpServlet {

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
        String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
        HttpSession session = request.getSession();
        String bookingId = (String) session.getAttribute("bookingId");
        try {
            if (vnp_ResponseCode.equals("00")) {
                CartDAO cartDAO = new CartDAO();
                BillServiceDAO billServiceDAO = new BillServiceDAO();
                Account account = (Account) request.getSession().getAttribute("account");
                Cart cart = cartDAO.getCartByAccountId(account.getId());

                //add bill service
                BillService billService = new BillService(account.getId(), bookingId, cart.getTotalAmount());
                billService = billServiceDAO.addBillService(billService);

                //add bill service detail
                for (CartItem c: cart.getCartItems()){
                    BillDetailService billDetailService = new BillDetailService(billService.getId(), c.getServiceId(), c.getQuantity());
                    billServiceDAO.addBillDetailService(billDetailService);
                }

                //delete cart item and cart
                cartDAO.deleteCartItemByCartId(cart.getId());
                cartDAO.deleteCartById(cart.getId());

                request.setAttribute("noti", "Add successful");
                request.setAttribute("billService", billService);
            }else{
                request.setAttribute("noti", "not successful");
            }
            request.getRequestDispatcher("services/billService.jsp").forward(request, response);
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
