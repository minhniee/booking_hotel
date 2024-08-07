package controller.admin;

import DAO.managerBookingDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.ManagerBooking;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Array;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "HistoryBooking", value = "/HistoryBooking")
public class HistoryBooking extends HttpServlet {
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
        ArrayList<ManagerBooking> managerBookings = new ArrayList<>();
        managerBookingDAO dao = new managerBookingDAO();
        try {
            managerBookings = dao.managerBookingList();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("managerBookings", managerBookings);
        request.getRequestDispatcher("Admin/HistoryBooking.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String text = request.getParameter("text");
        managerBookingDAO dao = new managerBookingDAO();
        ArrayList<ManagerBooking> managerBookings = new ArrayList<>();
        managerBookings = dao.getManagerBooking(text);
        request.setAttribute("managerBookings", managerBookings);
        request.getRequestDispatcher("Admin/HistoryBooking.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}