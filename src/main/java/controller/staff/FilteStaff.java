package controller.staff;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

public class FilteStaff {

    protected static void filterRoleAdmin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            if ("staff".equals(account.getRole())) {
                req.getRequestDispatcher("dashboardStaff1").forward(req, resp);
            } else {
                resp.sendError(HttpServletResponse.SC_FORBIDDEN, "You do not have the required permissions to access this resource.");
            }
        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Account not found. Please log in.");
        }
    }


}

