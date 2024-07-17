package controller.admin;
import DAO.ManageRoomImage;
import DAO.detailRoomManagerDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.DetailRoomManager;
import model.Material;
import model.RoomImage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "detailRoomManager", value = "/detailRoomManager")
public class detailRoomManagerServlet extends HttpServlet {
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
            out.println("<h1>Servlet NewServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String id = request.getParameter("id");
        String rid = request.getParameter("rid");
        detailRoomManagerDAO dao = new detailRoomManagerDAO();
        DetailRoomManager detailRoom = dao.getdetailRoomManager(rid);
        ArrayList<Material> materials = new ArrayList<>();
        materials = dao.getMaterialList(id);
        ManageRoomImage imgdao = new ManageRoomImage();
        ArrayList<RoomImage> roomImages = new ArrayList<>();
        roomImages = imgdao.images(rid);
        request.setAttribute("room_class_id", rid);
        request.setAttribute("room_id", id);
        request.setAttribute("roomImages", roomImages);
        request.setAttribute("materials", materials);
        request.setAttribute("detailRoom", detailRoom);
        request.getRequestDispatcher("detailRoomManager.jsp").forward(request, response);

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