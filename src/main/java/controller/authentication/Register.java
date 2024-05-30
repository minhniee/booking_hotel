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

        request.setAttribute("fullName", fullName);
        request.setAttribute("address", address);
        request.setAttribute("userName", userName);
        request.setAttribute("password", password);
        request.setAttribute("confirmPassword", confirmPassword);
        request.setAttribute("gender", gender);
        request.setAttribute("email", email);
        request.setAttribute("phone", phone);
        request.setAttribute("birthdate", birthdate);
        // Validate if username exists
        if (aDAO.checkAccountExist(userName) != null) {
            request.setAttribute("msg_Username", "Username exists");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        if (aDAO.checkEmailExist(email) != null) {
            request.setAttribute("msg_Username", "Email exists");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        // Attempt to send verification email
        try {
            Email emailObj = new Email(); // Assuming you have a constructor for your Email class
            String verificationCode = UUID.randomUUID().toString().substring(0, 8);
            aDAO.register(userName,  password,  fullName,  address,  gender,  email,  phone,  birthdate,  "customer");
            aDAO.addVerificationCode(userName, verificationCode);
            String link = "http://localhost:8080/Booking_Hotell/verify?key1=" + verificationCode + "&userName=" + userName;
            emailObj.sendEmail(email, "Email Verification", "Click the link to verify your email: " + link);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg_Error", "Error sending verification email");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        try {
            request.setAttribute("msg_register", "Please check your email for verification.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
