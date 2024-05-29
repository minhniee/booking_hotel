package controller.authentication;

import DAO.AccountDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "VerifyEmail", value = "/verify")
public class VerifyEmail extends HttpServlet {
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
        String key = request.getParameter("key1");
        AccountDAO aDao= new AccountDAO();
        if (aDao.searchCode(key)) {
            HttpSession session = request.getSession();
            String fullName = (String) session.getAttribute("fullName");
            String address = (String) session.getAttribute("address");
            String userName = (String) session.getAttribute("userName");
            String password = (String) session.getAttribute("password");
            String gender = (String) session.getAttribute("gender");
            String email = (String) session.getAttribute("email");
            String phone = (String) session.getAttribute("phone");
            String birthdate = (String) session.getAttribute("birthdate");
            aDao.register(userName, password, fullName, address, gender, email, phone, birthdate, "customer");
            response.sendRedirect("success.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}