package controller.admin;

import DAO.ManageServiceCategoryDAO;
import DAO.ManageServiceDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.ManageService;
import model.ManageServiceCategory;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;

@WebServlet(name = "ManageInsertService", value = "/ManageInsertService")
@MultipartConfig
public class ManageInsertService extends HttpServlet {
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
        ArrayList<ManageServiceCategory> list = new ArrayList<>();
        ManageServiceCategoryDAO dao = new ManageServiceCategoryDAO();
        list = dao.selectAll();
        request.setAttribute("list", list);
        request.getRequestDispatcher("Admin/InsertService.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        int category = Integer.parseInt(request.getParameter("type"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        Part image = request.getPart("image");
        String realPath = request.getServletContext().getRealPath("/Assets/services");
        String filename = Path.of(image.getSubmittedFileName()).getFileName().toString();


        // Ensure the directory exists
        if (!Files.exists(Path.of(realPath))) {
            Files.createDirectory(Path.of(realPath));
        }
        image.write(realPath +"/"+ filename);
        ManageServiceDAO dao = new ManageServiceDAO();
        ManageService manageService = dao.getManageServiceById(id);
        ManageService manageServiceImage = dao.getManageServiceByImage(filename);
        ArrayList<ManageServiceCategory> list = new ArrayList<>();
        ManageServiceCategoryDAO mdao = new ManageServiceCategoryDAO();

        if(manageService != null) {
            list = mdao.selectAll();
            request.setAttribute("list", list);
            request.setAttribute("id","Id is already in use");
            request.getRequestDispatcher("Admin/InsertService.jsp").forward(request, response);
        }else if(manageServiceImage != null) {
            list = mdao.selectAll();
            request.setAttribute("list", list);
            request.setAttribute("errorImg","Image is already in use");
            request.getRequestDispatcher("Admin/InsertService.jsp").forward(request, response);

        }else {
            dao.InsertManageService(id, category, name,description,price,quantity,filename);
            HttpSession session = request.getSession();
            session.setAttribute("success", "Insert Successfully !!!");
            response.sendRedirect("ManageService");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}