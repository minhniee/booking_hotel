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
    private static final int ITEMS_PER_PAGE = 10;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FilteStaff.filterRoleStaff(request, response);
        roomDAO dao = new roomDAO();
        ArrayList<Room> listRoom = dao.getRoom();

        int totalRooms = listRoom.size();
        int totalPages = (int) Math.ceil((double) totalRooms / ITEMS_PER_PAGE);

        int currentPage = 1;
        if (request.getParameter("page") != null) {
            currentPage = Integer.parseInt(request.getParameter("page"));
        }

        int startIndex = (currentPage - 1) * ITEMS_PER_PAGE;
        int endIndex = Math.min(startIndex + ITEMS_PER_PAGE, totalRooms);
        ArrayList<Room> paginatedRooms = new ArrayList<>(listRoom.subList(startIndex, endIndex));

        request.setAttribute("rooms", paginatedRooms);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);

        request.getRequestDispatcher("roomManager.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FilteStaff.filterRoleStaff(request, response);
    }

    private void retainFormData(HttpServletRequest request) {
        request.setAttribute("id", request.getParameter("id"));
        request.setAttribute("roomClassId", request.getParameter("roomClassId"));
        request.setAttribute("roomClass", request.getParameter("roomClass"));
        request.setAttribute("roomName", request.getParameter("roomName"));
        request.setAttribute("numAdults", request.getParameter("numAdults"));
        request.setAttribute("price", request.getParameter("price"));
        request.setAttribute("status", request.getParameter("status"));
    }

    @Override
    public String getServletInfo() {
        return "Room Manager Servlet";
    }
}
