package controller.authentication;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import model.Account;
import model.Email;
import DAO.AccountDAO;

@WebServlet(name = "Register", value = "/register")
public class Register extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // You can decide what to do with GET request or simply forward to the registration page
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AccountDAO aDAO = new AccountDAO();
        String fullName = request.getParameter("fullName");
        String address = request.getParameter("address");
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String birthdate = request.getParameter("birthdate");
        // Validate if username exists
        if (aDAO.checkAccountExist(userName) != null) {
            request.setAttribute("msg_Username", "Username exists");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        // Attempt to send verification email
        try {
            Email emailObj = new Email();
            String key= UUID.randomUUID().toString();
            String key1 =key.substring(0,8);
            aDAO.addCode(key1);
            String link = "http://localhost:8080/Booking_Hotell/verify?key1=" + key1 + "&userName=" +userName;
            emailObj.sendEmail(email, "Email Verification", link);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg_Error", "Error sending verification email");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Attempt to register user
        try {
            request.setAttribute("msg_register", "Please check your email for verification.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg_register", "Error registering user");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
    @Override
    public String getServletInfo() {
        return "Servlet for user registration";
    }
}
