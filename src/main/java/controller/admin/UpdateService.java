package controller.admin;

import DAO.ManageServiceCategoryDAO;
import DAO.ManageServiceDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.ManageService;
import model.ManageServiceCategory;
import java.nio.file.Files;
import java.nio.file.Path;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "UpdateService", value = "/UpdateService")
@MultipartConfig
public class UpdateService extends HttpServlet {
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
        ManageServiceCategoryDAO  mdao = new ManageServiceCategoryDAO();
        ManageServiceDAO dao = new ManageServiceDAO();
        ArrayList<ManageServiceCategory> list = new ArrayList<>();
        list = mdao.selectAll();
        request.setAttribute("list", list);
        ManageService manageService = dao.getManageServiceById(id);
        request.setAttribute("manageService", manageService);
        request.getRequestDispatcher("Admin/UpdateService.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String oldImage = request.getParameter("oldImage");
        int category = Integer.parseInt(request.getParameter("type"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        Part image = request.getPart("image");

        String filename = null;
        if (image != null && image.getSize() > 0) {
            // New image file is uploaded
            String realPath = request.getServletContext().getRealPath("/Assets/services");
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
        ManageServiceDAO dao = new ManageServiceDAO();
        ManageService manageService = dao.getManageServiceByImage(filename);
       if (manageService == null) {
            dao.updateService(id, category, name, description, price, quantity, filename);
            HttpSession session = request.getSession();
            session.setAttribute("success", "Updated Successfully!!!");
            response.sendRedirect("ManageService");
        }else {
            HttpSession session = request.getSession();
            session.setAttribute("success", "Duplicate image!!!");
            response.sendRedirect("ManageService");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}