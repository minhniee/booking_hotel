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

@WebServlet(name = "InsertRoom", value = "/InsertRoom")
public class InsertRoom extends HttpServlet {
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
        ManageRoomClassDAO dao = new ManageRoomClassDAO();
        ArrayList<RoomClass> list = new ArrayList<RoomClass>();
        list = dao.getRoomClassList();
        request.setAttribute("list", list);
        request.getRequestDispatcher("Admin/InsertRoom.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String type = request.getParameter("type");
        String name = request.getParameter("name");
        int adults = Integer.parseInt(request.getParameter("adult"));
        String status = request.getParameter("status");
        getRoomManagerDAO dao = new getRoomManagerDAO();
        RoomManager roomManagerById = dao.getRoomManagerById(id);
        RoomManager roomManagerByName = dao.FindRoomByName(name);
        if (roomManagerById != null) {
            ManageRoomClassDAO cdao = new ManageRoomClassDAO();
            ArrayList<RoomClass> list = new ArrayList<RoomClass>();
            list = cdao.getRoomClassList();
            request.setAttribute("list", list);
            request.setAttribute("error", "Id  already exists");
            request.getRequestDispatcher("Admin/InsertRoom.jsp").forward(request, response);
        }else if (roomManagerByName != null){
            ManageRoomClassDAO cdao = new ManageRoomClassDAO();
            ArrayList<RoomClass> list = new ArrayList<RoomClass>();
            list = cdao.getRoomClassList();
            request.setAttribute("list", list);
            request.setAttribute("errorName", "Name  already exists");
            request.getRequestDispatcher("Admin/InsertRoom.jsp").forward(request, response);
        }else{
             dao.InsertRoom(id.toUpperCase(), type, name, adults, status);
             HttpSession session = request.getSession();
             session.setAttribute("success", "Successfully Inserted Room!!");
             response.sendRedirect("listRoomManager");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}