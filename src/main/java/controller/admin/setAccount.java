package controller.admin;

import DAO.setAccountDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Account;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

@WebServlet(name = "setAccount", value = "/setAccount")
public class setAccount extends HttpServlet {
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
        String id = request.getParameter("id");
        setAccountDAO dao = new setAccountDAO();
        Account account = dao.getAccountById(id);
        request.setAttribute("account", account);
        request.getRequestDispatcher("setAccount.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String id = request.getParameter("id");
       String password = request.getParameter("password");
       String username = request.getParameter("username");
       String email = request.getParameter("email");
       String phone = request.getParameter("phone");
       String address = request.getParameter("address");
       String dob = request.getParameter("dob");
       boolean gender = request.getParameter("gender").equals("Male");
       String fullname = request.getParameter("fullname");
       String role = request.getParameter("role");
       try {
            setAccountDAO dao = new setAccountDAO();
            dao.updateAccount(username,password,fullname,email,role,gender,phone,java.sql.Date.valueOf(dob),address,id );
            response.sendRedirect("listAccount");
       }catch (Exception e) {}
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}