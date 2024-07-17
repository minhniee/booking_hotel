package controller.staff;

import DAO.MaterialDAO;
import DAO.listAccountDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Account;
import model.Material;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "ViewMaterial", value = "/ViewMaterial")
public class ViewMaterial extends HttpServlet {
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
    private static final int ITEMS_PER_PAGE = 5;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MaterialDAO dao = new MaterialDAO();
        ArrayList<Material> allMaterials = dao.listMaterial();
        int totalMaterials = allMaterials.size();

        int totalPages = (int) Math.ceil((double) totalMaterials / ITEMS_PER_PAGE);

        int page;
        String pageParam = request.getParameter("page");
        if (pageParam == null) {
            page = 1;
        } else {
            page = Integer.parseInt(pageParam);
        }

        int startIndex = (page - 1) * ITEMS_PER_PAGE;
        int endIndex = Math.min(startIndex + ITEMS_PER_PAGE, totalMaterials);

        ArrayList<Material> materialsForPage = new ArrayList<>(allMaterials.subList(startIndex, endIndex));

        request.setAttribute("material", materialsForPage);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", page);

        request.getRequestDispatcher("viewMaterial.jsp").forward(request, response);
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