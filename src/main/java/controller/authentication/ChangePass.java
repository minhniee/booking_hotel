package controller.authentication;

import DAO.AccountDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

import java.io.IOException;

@WebServlet(name = "ChangePass", urlPatterns = {"/ChangePass"})
public class ChangePass extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (var out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangePass</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePass at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/user/changePass.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String oldPass = request.getParameter("oldPass");
        String newPass = request.getParameter("password");
        String confirmPass = request.getParameter("confirmPassword");

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        if (account == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        String errorMsg = null;
        if (oldPass.isEmpty() || newPass.isEmpty() || confirmPass.isEmpty()) {
            errorMsg = "All fields are required.";
        } else if (newPass.length() < 6) {
            errorMsg = "New Password must be at least 6 characters long.";
        } else if (!newPass.equals(confirmPass)) {
            errorMsg = "New Password and Repeat Password do not match.";
        } else {
            AccountDAO accountDAO = new AccountDAO();
            Account storedAccount = accountDAO.checkAccountExist(account.getUserName());

            if (!oldPass.equals(storedAccount.getPassword())) {
                errorMsg = "Old password is incorrect.";
            }
        }

        if (errorMsg != null) {
            request.setAttribute("msgrr", errorMsg);
            request.getRequestDispatcher("/user/changePass.jsp").forward(request, response);
            return;
        }

        AccountDAO accountDAO = new AccountDAO();
        accountDAO.updatePassword(account.getId(), newPass);
        request.setAttribute("msgss", "Change password successful");
        request.getRequestDispatcher("/user/changePass.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "ChangePass Servlet";
    }
}
