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
        roomDAO dao = new roomDAO();

        if (action != null) {
            switch (action) {
                case "edit":
                    String roomIdEdit = request.getParameter("roomId");
                    Room roomToEdit = dao.getRoomById(roomIdEdit);
                    request.setAttribute("room", roomToEdit);
                    request.getRequestDispatcher("editRoom.jsp").forward(request, response);
                    break;
                case "delete":
                    String roomIdDelete = request.getParameter("roomId");
                    Room roomToDelete = dao.getRoomById(roomIdDelete);
                    request.setAttribute("room", roomToDelete);
                    request.getRequestDispatcher("deleteRoom.jsp").forward(request, response);
                    response.sendRedirect("roomManager");
                    break;
                case "update":
                    try {
                    String roomId = request.getParameter("id");
                    String roomClassId = request.getParameter("roomClassId");
                    String roomClassName = request.getParameter("roomClass");
                    String roomName = request.getParameter("roomName");
                    int numAdults = Integer.parseInt(request.getParameter("numAdults"));
                    double price = Double.parseDouble(request.getParameter("price"));

                    if (roomClassId.isEmpty() || roomClassName.isEmpty() || roomName.isEmpty()) {
                        throw new Exception("All fields are required.");
                    }

                    if (numAdults < 1) {
                        throw new Exception("Number of adults must be a positive integer.");
                    }

                    if (price < 0) {
                        throw new Exception("Price must be a non-negative number.");
                    }

                    Room updatedRoom = new Room(roomId, roomClassId, roomClassName, roomName, numAdults, request.getParameter("status"), price);
                    dao.updateRoom(updatedRoom);
                    response.sendRedirect("roomManager");
                } catch (NumberFormatException e) {
                    request.setAttribute("error", "Invalid number format.");
                    retainFormData(request);
                    request.getRequestDispatcher("editRoom.jsp").forward(request, response);
                } catch (Exception e) {
                    request.setAttribute("error", e.getMessage());
                    retainFormData(request);
                    request.getRequestDispatcher("editRoom.jsp").forward(request, response);
                }
                break;
                case "dele":
                    try {
                    String roomId = request.getParameter("id");
                    String roomClassId = request.getParameter("roomClassId");
                    String roomClassName = request.getParameter("roomClass");
                    String roomName = request.getParameter("roomName");
                    int numAdults = Integer.parseInt(request.getParameter("numAdults"));
                    double price = Double.parseDouble(request.getParameter("price"));
                    Room DeleteRoom = new Room(roomId, roomClassId, roomClassName, roomName, numAdults, request.getParameter("status"), price);
                    dao.deleteRoom(roomId);
                    response.sendRedirect("roomManager");
                
                } catch (Exception e) {
                    retainFormData(request);
                    request.getRequestDispatcher("editRoom.jsp").forward(request, response);
                }
                break;
                default:
                    response.sendRedirect("roomManager");
                    break;
            }
        }
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
