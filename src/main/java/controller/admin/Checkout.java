package controller.admin;

import DAO.ManageBillDetailDAO;
import DAO.ManageMaterialDAO;
import DAO.ManagerBillDAO;
import DAO.billDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Bill;
import model.Material;

import java.time.LocalDate;
import java.util.Date;
import java.util.UUID;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.text.SimpleDateFormat;

@WebServlet(name = "Checkout", value = "/Checkout")
public class Checkout extends HttpServlet {
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
    private String generateRandomId() {
        return UUID.randomUUID().toString().replace("-", "").substring(0, 20); // Adjust length if needed
    }

    // Format the date as YYYY/MM/DD
    private String formatDate(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        return sdf.format(date);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        FilteAdmin.filterRoleAdmin(request,response);

        ManageMaterialDAO dao = new ManageMaterialDAO();
        String id = request.getParameter("id");
        ArrayList<Material> list = new ArrayList<>();
        list = dao.getAllMaterial();
        ManagerBillDAO bdao = new ManagerBillDAO();
        Bill bill = bdao.getBill(id);
        request.setAttribute("bill", bill);
        request.setAttribute("list", list);
        request.getRequestDispatcher("Admin/CheckOut.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        FilteAdmin.filterRoleAdmin(request,response);

        String bill_id = request.getParameter("id");
        String booking_id = request.getParameter("booking_id");
        String accountid = request.getParameter("accountid");
        Double amount = Double.parseDouble(request.getParameter("amount"));
        String material =  request.getParameter("material");
        Double total_amount = Double.parseDouble(request.getParameter("total_amount"));
        ManageBillDetailDAO dao = new ManageBillDetailDAO();
        String id = generateRandomId(); // Generate random ID
        LocalDate date = LocalDate.now();
        dao.InsertBillDetail(id, bill_id, accountid, material, total_amount, date);


    response.sendRedirect("listBooking");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}