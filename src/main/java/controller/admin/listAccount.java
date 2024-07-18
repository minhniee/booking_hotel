package controller.admin;

import DAO.listAccountDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Account;
import model.ManageAccount;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "listAccount", value = "/listAccount")
public class listAccount extends HttpServlet {
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
        ArrayList<ManageAccount> listAccounts = new ArrayList<>();
        listAccountDAO dao = new listAccountDAO();
        listAccounts = dao.listAccount();
        request.setAttribute("listAccounts", listAccounts);
        request.getRequestDispatcher("listAccount.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String text = request.getParameter("text");
        listAccountDAO dao = new listAccountDAO();
        ArrayList<ManageAccount> listAccounts = new ArrayList<>();
        listAccounts = dao.listAccountByNameOrPhone(text);
        request.setAttribute("listAccounts", listAccounts);
        request.getRequestDispatcher("listAccount.jsp").forward(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }
}