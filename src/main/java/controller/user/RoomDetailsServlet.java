package controller.user;

import DAO.RoomClassDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Material;
import model.RoomClass;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "RoomDetailsServlet", urlPatterns = {"/roomDetails"})
public class RoomDetailsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String roomClassId = request.getParameter("room_class_id");
        RoomClassDAO roomClassDAO = new RoomClassDAO();
        RoomClass roomClass = roomClassDAO.getRoomClassById(roomClassId);


        request.setAttribute("roomClass", roomClass);
        List<Material> materials = roomClassDAO.getMaterialsByRoomClassId(roomClassId);
        request.setAttribute("materials", materials);
        request.getRequestDispatcher("roomDetails.jsp").forward(request, response);
    }
}
