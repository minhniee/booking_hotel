/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.service;

import DAO.BillServiceDAO;
import DAO.CartDAO;
import DAO.bookingDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.*;
import util.Email;

import java.io.IOException;
import java.lang.reflect.Array;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

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
                bookingDAO bdao = new bookingDAO();
                Account account = (Account) request.getSession().getAttribute("account");
                Cart cart = cartDAO.getCartByAccountId(account.getId());

                //add bill service
                BillService billService = new BillService(account.getId(), bookingId, cart.getTotalAmount());
                billService = billServiceDAO.addBillService(billService);
                LocalDateTime currentDate = LocalDateTime.now();
                request.setAttribute("currentDate", currentDate);

                //add bill service detail
                for (CartItem c: cart.getCartItems()){
                    BillDetailService billDetailService = new BillDetailService(billService.getId(), c.getServiceId(), c.getQuantity());
                    billServiceDAO.addBillDetailService(billDetailService);
                }

                //delete cart item and cart
                cartDAO.deleteCartItemByCartId(cart.getId());
                cartDAO.deleteCartById(cart.getId());

//                request.setAttribute("noti", "Add successful");
                request.setAttribute("billService", billService);

                //invoice
                String vnp_TxnRef = request.getParameter("vnp_TxnRef");
                Booking b = bdao.getBookingById(bookingId);
                request.setAttribute("vnp_TxnRef", vnp_TxnRef);
                request.setAttribute("account", account);
                request.setAttribute("b", b);
                request.setAttribute("cart", cart);

                //send mail
                // Construct the email content
                String emailContent = "<!DOCTYPE html>\n" +
                        "<html lang=\"en\">\n" +
                        "<head>\n" +
                        "    <meta charset=\"utf-8\" />\n" +
                        "    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n" +
                        "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n" +
                        "    <link href=\"images/favicon.png\" rel=\"icon\" />\n" +
                        "    <title>Service Invoice </title>\n" +
                        "    <meta name=\"author\" content=\"harnishdesign.net\">\n" +
                        "\n" +
                        "    <!-- Web Fonts\n" +
                        "    ======================= -->\n" +
                        "    <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900' type='text/css'>\n" +
                        "\n" +
                        "</head>\n" +
                        "<body>\n" +
                        "<!-- Container -->\n" +
                        "<div class=\"container-fluid invoice-container\">\n" +
                        "    <!-- Header -->\n" +
                        "    <header>\n" +
                        "        <div class=\"row align-items-center gy-3\">\n" +
                        "            <div class=\"col-sm-7 text-center text-sm-start\"> <img id=\"logo\" src=\"images/logo.png\" title=\"Koice\" alt=\"Koice\" /> </div>\n" +
                        "            <div class=\"col-sm-5 text-center text-sm-end\">\n" +
                        "                <h4 class=\"mb-0\">Invoice</h4>\n" +
                        "                <p class=\"mb-0\">Invoice Number - "+vnp_TxnRef+"</p>\n" +
                        "            </div>\n" +
                        "        </div>\n" +
                        "        <hr>\n" +
                        "    </header>\n" +
                        "\n" +
                        "    <!-- Main Content -->\n" +
                        "    <main>\n" +
                        "        <div class=\"row\">\n" +
                        "            <div class=\"col-sm-6 mb-3\"> <strong>Full Name:</strong> <span>"+account.getFullName()+"</span> </div>\n" +
                        "            <div class=\"col-sm-6 mb-3 text-sm-end\"> <strong>Booking Date:</strong> <span>"+currentDate+"</span> </div>\n" +
                        "        </div>\n" +
                        "        <hr class=\"mt-0\">\n" +
                        "        <div class=\"row\">\n" +
                        "            <div class=\"col-sm-5\"> <strong>Hotel Details:</strong>\n" +
                        "                <address>\n" +
                        "                    The Orchid Hotel<br />\n" +
                        "                    Plot No.3, Nr. HDFC Bank, Ashram Road<br />\n" +
                        "                    Ahmedabad, Gujarat,<br />\n" +
                        "                    India.\n" +
                        "                </address>\n" +
                        "            </div>\n" +
                        "            <div class=\"col-sm-7\">\n" +
                        "                <div class=\"row\">\n" +
                        "                    <div class=\"col-sm-4\"> <strong>Check In:</strong>\n" +
                        "                        <p>"+b.getCheckInDate()+"</p>\n" +
                        "                    </div>\n" +
                        "                    <div class=\"col-sm-4\"> <strong>Check Out:</strong>\n" +
                        "                        <p>"+b.getCheckOutDate()+"</p>\n" +
                        "                    </div>\n" +
                        "                    <div class=\"col-sm-4\"> <strong>Rooms:</strong>\n" +
                        "                        <p>"+b.getRoomId()+"</p>\n" +
                        "                    </div>\n" +
                        "                    <div class=\"col-sm-4\"> <strong>Booking ID:</strong>\n" +
                        "                        <p>"+b.getId()+"</p>\n" +
                        "                    </div>\n" +
                        "                    <div class=\"col-sm-4\"> <strong>Payment Mode:</strong>\n" +
                        "                        <p>Credit Card</p>\n" +
                        "                    </div>\n" +
                        "                </div>\n" +
                        "            </div>\n" +
                        "        </div>\n" +
                        "        <div class=\"table-responsive\">\n" +
                        "            <table class=\"table\">\n" +
                        "                <thead>\n" +
                        "                <tr>\n" +

                        "                    <th>Service Name</th>\n" +
                        "                    <th>Description</th>\n" +
                        "                    <th>Price</th>\n" +
                        "                    <th>Quantity</th>\n" +
                        "                    <th>Total</th>\n" +
                        "                </tr>\n" +
                        "                </thead>\n" +
                        "                <tbody>\n";

                for (CartItem c: cart.getCartItems()) {
                    emailContent += "                    <tr>\n" +

                            "                        <td>" + c.getService().getServiceName() + "</td>\n" +
                            "                        <td>" + c.getService().getDescription() + "</td>\n" +
                            "                        <td>$" + c.getService().getPrice() + "</td>\n" +
                            "                        <td>" + c.getQuantity() +
                            "                        </td>\n" +
                            "                        <td>$" + c.getQuantity() * c.getService().getPrice() + "</td>\n" +
                            "\n" +
                            "                    </tr>\n";
                }


                emailContent +=  "                </tbody>\n" +
                        "            </table>\n" +
                        "            <h3>Total: $"+cart.getTotalAmount()+"</h3>\n" +
                        "        </div>\n" +
                        "        <br>\n" +
                        "        <p class=\"text-1 text-muted\"><strong>Please Note:</strong> Amount payable is inclusive of central & state goods & services Tax act applicable slab rates. Please ask Hotel for invoice at the time of check-out.</p>\n" +
                        "    </main>\n" +
                        "    <!-- Footer -->\n" +
                        "    <footer class=\"text-center\">\n" +
                        "        <hr>\n" +
                        "        <p class=\"lh-base\"><strong>Koice Inc.</strong><br>\n" +
                        "            4th Floor, Plot No.22, Above Public Park, 145 Murphy Canyon Rd,<br>\n" +
                        "            Suite 100-18, San Diego CA 2028. </p>\n" +
                        "        <hr>\n" +
                        "        <p class=\"text-1\"><strong>NOTE :</strong> This is computer generated receipt and does not require physical signature.</p>\n" +
                        "        <div class=\"btn-group btn-group-sm d-print-none\"> <a href=\"javascript:window.print()\" class=\"btn btn-light border text-black-50 shadow-none\"><i class=\"fa fa-print\"></i> Print & Download</a> </div>\n" +
                        "    </footer>\n" +
                        "</div>\n" +
                        "</body>\n" +
                        "</html>";

                // Send the email
                boolean emailSent = Email.sendEmail(account.getEmail(), "Invoice", emailContent);

                request.getRequestDispatcher("services/invoice.jsp").forward(request, response);
            }else{
                request.setAttribute("noti", "not successful");
                request.getRequestDispatcher("services/billService.jsp").forward(request, response);
            }
//            request.getRequestDispatcher("services/billService.jsp").forward(request, response);
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
