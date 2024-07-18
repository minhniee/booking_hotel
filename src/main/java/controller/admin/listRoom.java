package controller.admin;

import DAO.ManageRoomClassDAO;
import DAO.getRoomManagerDAO;
import DAO.roomDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Room;
import model.RoomClass;
import model.RoomManager;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "listRoom", value = "/listRoomManager")
public class listRoom extends HttpServlet {
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
        ArrayList<RoomManager> listRoom = new ArrayList<>();
       getRoomManagerDAO dao = new getRoomManagerDAO();
       ArrayList<RoomClass> listRoomClass = new ArrayList<>();
       ManageRoomClassDAO mdao = new ManageRoomClassDAO();
       listRoomClass = mdao.getRoomClassList();
        listRoom = dao.getRoomManager();
        request.setAttribute("listRoomClass", listRoomClass);
        request.setAttribute("list", listRoom);
        request.getRequestDispatcher("ManagerListRoom.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
             String id = request.getParameter("type");
        ArrayList<RoomManager> listRoom = new ArrayList<>();
        ArrayList<RoomClass> listRoomClass = new ArrayList<>();
        ManageRoomClassDAO mdao = new ManageRoomClassDAO();
        getRoomManagerDAO dao = new getRoomManagerDAO();
             if(id.equals("-1")) {
                 listRoom = dao.getRoomManager();
                 listRoomClass = mdao.getRoomClassList();
                 request.setAttribute("list", listRoom);
                 request.setAttribute("listRoomClass", listRoomClass);
             }else {
                 listRoom = dao.getRoomManagerByName(id);
                 listRoomClass = mdao.getRoomClassList();
                 request.setAttribute("listRoomClass", listRoomClass);
                 request.setAttribute("list", listRoom);
             }
        request.setAttribute("subjectId", id);
           request.getRequestDispatcher("ManagerListRoom.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}