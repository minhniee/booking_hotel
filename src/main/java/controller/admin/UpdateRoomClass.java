package controller.admin;

import DAO.ManageRoomClassDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.RoomClass;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateRoomClass", value = "/UpdateRoomClass")
public class UpdateRoomClass extends HttpServlet {
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
        ManageRoomClassDAO dao = new ManageRoomClassDAO();
        RoomClass roomClass = dao.getRoomClassById(id);
        request.setAttribute("roomClass", roomClass);
        request.getRequestDispatcher("Admin/UpdateRoomClass.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String image = request.getParameter("image");
        ManageRoomClassDAO dao = new ManageRoomClassDAO();
        dao.UpdateRoomClass(id, name, price, image);
        HttpSession session = request.getSession();
        session.setAttribute("success", "Successfully updated !!!");
        response.sendRedirect("ManageRoomClass");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}