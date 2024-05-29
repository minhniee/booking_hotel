/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */


package controller.staff;

import DAO.roomDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import model.Room;

@WebServlet(name = "RoomManager", value = "/roomManager")
public class RoomManager extends HttpServlet {
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Room> listRoom = new ArrayList<>();
        roomDAO dao = new roomDAO();
        listRoom = dao.getRoom();
        request.setAttribute("rooms", listRoom);
        request.getRequestDispatcher("roomManager.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "edit":
                    
                    String roomIdEdit = request.getParameter("roomId");
                    response.sendRedirect("editRoom.jsp?roomId=" + roomIdEdit);
                    break;
                case "delete":
                   
                    String roomIdDelete = request.getParameter("roomId");
                    roomDAO deleteDAO = new roomDAO();
                    deleteDAO.deleteRoom(roomIdDelete);
                    response.sendRedirect("deleteRoom.jsp?roomId=" + roomIdDelete);
                    break;
                default:
                    response.sendRedirect("roomManager");
                    break;
            }
        }
    }
    
    @Override
    public String getServletInfo() {
        return "Room Manager Servlet";
    }
}
