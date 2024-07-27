package controller.admin;

import DAO.ManageRoomImage;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.RoomImage;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;

@WebServlet(name = "UpdateImageRoom", value = "/UpdateImageRoom")
@MultipartConfig
public class UpdateImageRoom extends HttpServlet {
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
        int id = Integer.parseInt(request.getParameter("id"));
        String room_id = request.getParameter("room_id");
        String room_class_id = request.getParameter("room_class_id");
        ManageRoomImage dao = new ManageRoomImage();

        RoomImage roomImage = dao.getImage(id);
        request.setAttribute("room_id", room_id);
        request.setAttribute("room_class_id", room_class_id);
        request.setAttribute("room_image", roomImage);
        request.getRequestDispatcher("Admin/UpdateImageRoom.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String room_id = request.getParameter("room_id");
        String room_class_id = request.getParameter("room_class_id");
        int id = Integer.parseInt(request.getParameter("id"));
        Part image = request.getPart("image");
        String realPath = request.getServletContext().getRealPath("/Assets/image/demoRoom");
        String filename = Path.of(image.getSubmittedFileName()).getFileName().toString();


        // Ensure the directory exists
        if (!Files.exists(Path.of(realPath))) {
            Files.createDirectory(Path.of(realPath));
        }
        image.write(realPath +"/"+ filename);
        ManageRoomImage dao = new ManageRoomImage();
        RoomImage roomImage = dao.getImageFile(filename);
        if (roomImage == null){
            dao.UpdateImage(id, room_class_id, filename);
            HttpSession session = request.getSession();
            session.setAttribute("success", "Successfully updated!!!");
            response.sendRedirect("detailRoomManager?id=" + room_id + "&rid=" + room_class_id);
        }else{
            HttpSession session = request.getSession();
            session.setAttribute("success", "Duplicate image!!!");
            response.sendRedirect("detailRoomManager?id=" + room_id + "&rid=" + room_class_id);
        }


    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}