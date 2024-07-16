package controller.authentication;

import DAO.AccountDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import util.Email;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "resetPass", value = "/resetPass")
public class resetPass extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
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
        request.getRequestDispatcher("resetPass.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        System.out.println(email);
        HttpSession ss= request.getSession();;
        AccountDAO adao = new AccountDAO();
        Account acc = adao.checkEmailExist(email);

        if (acc == null) {
            request.setAttribute("msg", "Email cannot be linked to any account");
        } else {
            Email emailObj = new Email();
            ss.setAttribute("email",email);
            String link = "http://localhost:8080/Booking_Hotell/resetpass2.jsp";
            emailObj.sendEmail(email, "Email Verification", "Email associated with the account: " + acc.getUserName() + ". Click the link to change password: " + link);
            request.setAttribute("msg", "Please check your email to reset password");
        }

        request.getRequestDispatcher("resetPass.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
