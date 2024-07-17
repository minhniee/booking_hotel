package controller.admin;

import DAO.ManageMaterialDAO;
import DAO.ManageRoomMaterialDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.ManageRoomMaterial;
import model.Material;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "InsertMaterialRoom", value = "/InsertMaterialRoom")
public class InsertMaterialRoom extends HttpServlet {
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
        String room_id = request.getParameter("room_id");
        String room_class_id = request.getParameter("room_class_id");
        ManageMaterialDAO dao = new ManageMaterialDAO();
        ArrayList<Material> list = new ArrayList<Material>();
        list = dao.getAllMaterial();
        request.setAttribute("list", list);
        request.setAttribute("room_id", room_id);
        request.setAttribute("room_class_id", room_class_id);
        request.getRequestDispatcher("Admin/InsertMaterialRoom.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String room_id = request.getParameter("room_id");
        String room_class_id = request.getParameter("room_class_id");
        String material_id = request.getParameter("type");
        ManageRoomMaterialDAO dao = new ManageRoomMaterialDAO();
        ManageRoomMaterial material = dao.getMaterialRoom(room_id, material_id);
        if (material == null) {
           dao.InsertMaterialRoom(room_id, material_id);
            HttpSession session = request.getSession();
            session.setAttribute("success", "Successfully Inserted Material");
            response.sendRedirect("detailRoomManager?id=" + room_id + "&rid=" + room_class_id);
        }else{
            HttpSession session = request.getSession();
            session.setAttribute("success", "Material Room Already Exists");
            response.sendRedirect("detailRoomManager?id=" + room_id + "&rid=" + room_class_id);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}