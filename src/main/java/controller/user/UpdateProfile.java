package controller.user;

import DAO.AccountDAO;
import DAO.setAccountDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Account;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

@WebServlet(name = "UpdateProfile", value = "/UpdateProfile")
public class UpdateProfile extends HttpServlet {
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
//        String userName = request.getParameter("userName");
//        String fullName = request.getParameter("fname");
//        String email = request.getParameter("email");
//        String phone = request.getParameter("phone");
//        String address = request.getParameter("address");
//        Boolean gender = Boolean.valueOf(request.getParameter("gender"));
//        String dob = request.getParameter("dob");
//        AccountDAO dao = new AccountDAO();
//        dao.updateAccount(userName,fullName,email,false,phone,Date.valueOf(dob),address);
//        request.setAttribute("userName", userName);
//        request.setAttribute("fullName", fullName);
//        request.setAttribute("email", email);
//        request.setAttribute("gender", gender);
//        request.setAttribute("dob", dob);
//        request.setAttribute("phone", phone);
//
////        request.setAttribute("", account);
//        request.getRequestDispatcher("user/user_profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String fullName = request.getParameter("fname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        Boolean gender = Boolean.valueOf(request.getParameter("gender"));
        String dob = request.getParameter("dob");
        HttpSession ss = request.getSession();
        // Server-side validation
        String nameRegex = "^[A-Z][a-zA-Z\\s]*$";
        String emailRegex = "^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$";
        String phoneRegex = "^\\d{10}$";

        boolean hasError = false;

        if (fullName == null || fullName.trim().isEmpty()) {
            request.setAttribute("fullNameError", "Full name is required.");
            hasError = true;
        } else if (!fullName.matches(nameRegex)) {
            request.setAttribute("fullNameError", "Full name must start with a capital letter and only contain letters and spaces.");
            hasError = true;
        } else if (fullName.length() > 20) {
            request.setAttribute("fullNameError", "Full name cannot be longer than 20 characters.");
            hasError = true;
        }

        if (email == null || email.trim().isEmpty()) {
            request.setAttribute("emailError", "Email is required.");
            hasError = true;
        } else if (!email.matches(emailRegex)) {
            request.setAttribute("emailError", "Please enter a valid email address.");
            hasError = true;
        }

        if (phone == null || phone.trim().isEmpty()) {
            request.setAttribute("phoneError", "Phone number is required.");
            hasError = true;
        } else if (!phone.matches(phoneRegex)) {
            request.setAttribute("phoneError", "Phone number must be exactly 10 digits.");
            hasError = true;
        }

        if (dob == null || dob.trim().isEmpty()) {
            request.setAttribute("dobError", "Date of birth is required.");
            hasError = true;
        }else {
            // Check if the date of birth is more than 12 years ago
            Date birthDate = Date.valueOf(dob);
            Date currentDate = new Date(System.currentTimeMillis());
            int age = currentDate.getYear() - birthDate.getYear();
            if (birthDate.getMonth() > currentDate.getMonth() ||
                    (birthDate.getMonth() == currentDate.getMonth() && birthDate.getDate() > currentDate.getDate())) {
                age--;
            }
            if (age < 12) {
                request.setAttribute("dobError", "You must be at least 12 years old.");
                hasError = true;
            }
        }

        if (address == null || address.trim().isEmpty()) {
            request.setAttribute("addressError", "Address is required.");
            hasError = true;
        } else if (address.length() > 50) {
            request.setAttribute("addressError", "Address cannot be longer than 50 characters.");
            hasError = true;
        }

        if (hasError) {
            Account account = new Account(userName, fullName, email, gender, phone, dob != null ? Date.valueOf(dob) : null, address);
            request.setAttribute("account", account);
            request.getRequestDispatcher("user/user_profile.jsp").forward(request, response);
            return;
        }else {

       // If validation passes, update the account
        AccountDAO dao = new AccountDAO();
        dao.updateAccount(userName, fullName, email, gender, phone, Date.valueOf(dob), address);

        // Fetch the updated account information
        Account updatedAccount = dao.getAccountByUserName(userName);
        request.setAttribute("mess", "Updated profile successfully.");
        // Set the updated account information as request attributes
        ss.setAttribute("account", updatedAccount);
        request.getRequestDispatcher("user/user_profile.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}