package controller.admin;

import DAO.ManageRoomMaterialDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DeleteMaterialRoom", value = "/DeleteMaterialRoom")
public class DeleteMaterialRoom extends HttpServlet {
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
        String room_id = request.getParameter("room_id");
        String room_class_id = request.getParameter("room_class_id");
        ManageRoomMaterialDAO dao = new ManageRoomMaterialDAO();
        dao.DeleteMaterialRoom(room_id, id);
        HttpSession session = request.getSession();
        session.setAttribute("success", "Successfully Deleted Material");
        response.sendRedirect("detailRoomManager?id=" + room_id + "&rid=" + room_class_id);
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