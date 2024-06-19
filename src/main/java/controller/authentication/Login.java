package controller.authentication;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import DAO.AccountDAO;
import model.Account;

@WebServlet(name = "Login", value = "/login")
public class Login extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output trang của bạn tại đây. Bạn có thể sử dụng mẫu mã sau. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NewServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewServlet tại " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        System.out.println("Username: " + username);
        System.out.println("Password: " + password);

        HttpSession session = request.getSession();
        AccountDAO aDAO = new AccountDAO();
        Account account = aDAO.checkLogin(username, password);

        if (account == null) {
            String msg = "Login failed!";
            request.setAttribute("msg", msg);
            System.out.println("Login failed");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else if (aDAO.checkConfirm(account.getUserName())) {
            session.setAttribute("account", account);
            System.out.println("Login successful, account saved to session: " + account);
            System.out.println("Session ID after login: " + session.getId());

            if ("admin".equals(account.getRole())) {
                response.sendRedirect("dashboard.jsp");
            } else if ("staff".equals(account.getRole())) {
                response.sendRedirect("dashboardstaff.jsp");
            } else {
                response.sendRedirect("index");
            }
        } else {
            request.setAttribute("msg", "Your account has not been verified. Please check your email!");
            System.out.println("Account not verified");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }


    @Override
    public String getServletInfo() {
        return "Mô tả ngắn gọn";
    }
}
