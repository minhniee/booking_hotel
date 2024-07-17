package controller.admin;

import DAO.ManageRoomClassDAO;
import DAO.getRoomManagerDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.RoomClass;
import model.RoomManager;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "UpdateRoom", value = "/UpdateRoom")
public class UpdateRoom extends HttpServlet {
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
        ArrayList<RoomClass> listRoomClass = new ArrayList<>();
        ManageRoomClassDAO mdao = new ManageRoomClassDAO();
        listRoomClass = mdao.getRoomClassList();
        request.setAttribute("listRoomClass", listRoomClass);
        getRoomManagerDAO dao = new getRoomManagerDAO();
        RoomManager roomManager = dao.getRoomManagerById(id);
        request.setAttribute("roomManager", roomManager);
        request.getRequestDispatcher("Admin/UpdateRoom.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String room_class_id = request.getParameter("type");
        String room_name = request.getParameter("name");
       int adults = Integer.parseInt(request.getParameter("adult"));
        String status = request.getParameter("status");
        getRoomManagerDAO dao = new getRoomManagerDAO();
        dao.UpdateRoom(id, room_class_id, room_name, adults, status);
        HttpSession session = request.getSession();
        session.setAttribute("success", "Successfully updated");
        response.sendRedirect("listRoomManager");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}