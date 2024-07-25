package controller.staff;
import jakarta.servlet.http.Part;
import DAO.MaterialDAO;
import DAO.roomDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Material;
import model.Room;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "EditRoom", value = "/editRoom")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class EditRoom extends HttpServlet {
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
        FilteStaff.filterRoleStaff(request, response);
        String id = request.getParameter("id");
        roomDAO dao = new roomDAO();
        Room room = dao.getRoomById(id);
        request.setAttribute("room", room);
        //  request.setAttribute("errorMessages", new HashMap<String, String>());
        request.getRequestDispatcher("editRoom.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        FilteStaff.filterRoleStaff(request, response);
        String id = request.getParameter("id");
        String roomClassId = request.getParameter("roomClassId");
        String roomClassName = request.getParameter("roomClass");
        String statusName = request.getParameter("status");
        int numAdults = Integer.parseInt(request.getParameter("numAdults"));
        double basePrice = Double.valueOf(request.getParameter("price"));
//        String roomImg = request.getParameter("image");

        Part part1 = request.getPart("image");
        String fileName1 = extractFileName(part1);
        fileName1 = new File(fileName1).getName();
        if (fileName1 != null && !fileName1.isEmpty()) {
            String uploadPath = getServletContext().getRealPath("") + File.separator + "Assets/image/room";
            // Create the directory if it does not exist
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            part1.write(uploadPath + File.separator + fileName1);
        }
        String roomImg = (fileName1 != null && !fileName1.isEmpty()) ? fileName1 : request.getParameter("oldImage");

        Room room = new Room(id, roomClassId, roomClassName, statusName, numAdults, basePrice, roomImg);
        roomDAO dao = new roomDAO();
        dao.updateRoom(room);
        response.sendRedirect("roomManager");

    }
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}