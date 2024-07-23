/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

/**
 * @author minhl
 */
public class FilteAdmin {

    protected static void filterRoleAdmin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            if ("admin".equals(account.getRole())) {
                req.getRequestDispatcher("chartData").forward(req, resp);
            } else {
                resp.sendError(HttpServletResponse.SC_FORBIDDEN, "You do not have the required permissions to access this resource.");
            }
        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Account not found. Please log in.");
        }
    }


}
