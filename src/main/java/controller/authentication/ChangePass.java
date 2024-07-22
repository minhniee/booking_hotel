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
import java.io.PrintWriter;

@WebServlet(name = "ChangePass", urlPatterns = {"/ChangePass"})
public class ChangePass extends HttpServlet {
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
        System.out.println("Entered doGet method");
        request.getRequestDispatcher("/user/changePass.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Entered doPost method");

        String oldPass = request.getParameter("oldPass");
        String password = request.getParameter("password");
        System.out.println("Old password from request: " + oldPass);
        System.out.println("New password from request: " + password);

        HttpSession session = request.getSession();
        System.out.println("Session ID in ChangePass: " + session.getId());

        Account account = (Account) session.getAttribute("account");
        System.out.println("Account from session: " + account);

        if (account == null) {
            System.out.println("No account found in session, redirecting to login");
            response.sendRedirect(request.getContextPath() + "/login.jsp"); // Redirect to login if not logged in
            return;
        } else {

            String username = account.getUserName();
            System.out.println("Username from session: " + username);
            AccountDAO adao = new AccountDAO();
            account = adao.checkAccountExist(account.getUserName());
            System.out.println("old pass:" +account.getPassword() );

            if (oldPass.equals(account.getPassword())) {
                AccountDAO accountDAO = new AccountDAO();
                accountDAO.updatePassword(account.getId(), password);
                System.out.println("Password changed successfully");
                session.setAttribute("msgss", "Change password successful");
            } else {
                System.out.println("Old password is incorrect");
                session.setAttribute("msgrr", "Old password is incorrect");
            }

            response.sendRedirect(request.getContextPath() + "/ChangePass");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
