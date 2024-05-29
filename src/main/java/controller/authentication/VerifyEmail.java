package controller.authentication;

import DAO.AccountDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "VerifyEmail", value = "/verify")
public class VerifyEmail extends HttpServlet {
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Extract parameters from the URL
        String key1 = request.getParameter("key1");
        String userName = request.getParameter("userName");

        // Check if the verification code matches the one stored in the database
        AccountDAO accountDAO = new AccountDAO();
        boolean isVerified = false;
        try {
            isVerified = accountDAO.verifyCode(userName, key1);
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception or log it
            // Forward to the verification error page
            request.setAttribute("msg_Success", "An error occurred while verifying your account.");
            request.getRequestDispatcher("success.jsp").forward(request, response);
            return;
        }

        if (isVerified==true) {
            // Mark the account as verified
            request.setAttribute("msg_Success", "Your account has been successfully verified!");
            // Forward to the verification success page
            request.getRequestDispatcher("success.jsp").forward(request, response);
        } else {
            // Display error message to the user
            request.setAttribute("msg_Success", "Invalid or expired verification code.");
            // Forward to the verification error page
            request.getRequestDispatcher("success.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}