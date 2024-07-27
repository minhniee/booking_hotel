package controller.admin;

import DAO.ManageRoomClassDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.RoomClass;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;

@WebServlet(name = "UpdateImageRoomClass", value = "/UpdateImageRoomClass")
@MultipartConfig
public class UpdateImageRoomClass extends HttpServlet {
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
        request.getRequestDispatcher("Admin/UpdateImageRoomClass.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        Part image = request.getPart("image");
        String oldImage = request.getParameter("oldImage");
        String filename = null;
        if (image != null && image.getSize() > 0) {
            // New image file is uploaded
            String realPath = request.getServletContext().getRealPath("/Assets1/img/rooms");
            filename = Path.of(image.getSubmittedFileName()).getFileName().toString();
            // Ensure the directory exists
            if (!Files.exists(Path.of(realPath))) {
                Files.createDirectory(Path.of(realPath));
            }
            image.write(realPath + "/" + filename);
        } else {
            // No new image file is uploaded, use old image
            filename = oldImage;
        }
        ManageRoomClassDAO dao = new ManageRoomClassDAO();
        RoomClass roomClassImage = dao.getRoomClassByImage(filename);
    //    if (roomClassImage == null) {
            dao.UpdateRoomClass(id, name, price, filename);
            HttpSession session = request.getSession();
            session.setAttribute("success", "Successfully updated !!!");
            response.sendRedirect("ManageRoomClass");
//        }else{
//            HttpSession session = request.getSession();
//            session.setAttribute("success", "Duplicate image !!!");
//            response.sendRedirect("ManageRoomClass");
//        }

    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }
}