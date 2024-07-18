package controller.staff;

import DAO.MaterialDAO;
import DAO.ServiceDAO;
import DAO.roomDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Material;
import model.Room;
import model.Service;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "editService", value = "/editService")
public class editService extends HttpServlet {
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
        ServiceDAO dao = new ServiceDAO();
        Service service = dao.getServiceById(id);
        request.setAttribute("service", service);
        request.setAttribute("errorMessages", new HashMap<String, String>());
        request.getRequestDispatcher("editService.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy các tham số từ form
        String id = request.getParameter("id");
        String priceStr = request.getParameter("price");
        String quantityStr = request.getParameter("quantity");

        // Tạo một đối tượng Service
        Service service = new Service();
        service.setId(id);

        // Xử lý lỗi và xác thực dữ liệu
        Map<String, String> errorMessages = new HashMap<>();
        boolean isValid = true;

        // Kiểm tra giá
        double price = 0;
        try {
            price = Double.parseDouble(priceStr);
            if (price <= 0) {
                errorMessages.put("price", "Price must be a positive number.");
                isValid = false;
            }
        } catch (NumberFormatException e) {
            errorMessages.put("price", "Invalid price format.");
            isValid = false;
        }
        service.setPrice(price);

        // Kiểm tra số lượng
        int quantity = 0;
        try {
            quantity = Integer.parseInt(quantityStr);
            if (quantity <= 0) {
                errorMessages.put("quantity", "Quantity must be a positive integer.");
                isValid = false;
            }
        } catch (NumberFormatException e) {
            errorMessages.put("quantity", "Invalid quantity format.");
            isValid = false;
        }
        service.setQuantity(quantity);

        // Nếu dữ liệu hợp lệ, cập nhật dịch vụ
        if (isValid) {
            ServiceDAO dao = new ServiceDAO();
            dao.updateService1(service);
            response.sendRedirect("ViewService"); // Điều hướng đến trang danh sách dịch vụ
        } else {
            // Nếu có lỗi, gửi lại thông tin lỗi và dịch vụ hiện tại đến trang chỉnh sửa
            request.setAttribute("service", service);
            request.setAttribute("errorMessages", errorMessages);
            request.getRequestDispatcher("editService.jsp").forward(request, response);
        }
    }



    @Override
    public String getServletInfo() {
        return "Short description";
    }
}