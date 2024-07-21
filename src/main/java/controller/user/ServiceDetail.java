package controller.user;

import java.io.*;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DAO.RoomClassDAO;
import DAO.ServiceDAO;
import DAO.bookingDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Account;
import model.Booking;
import model.Service;

@WebServlet(name = "ServiceDetailServlet", value = "/servicedetailcus")
public class ServiceDetail extends HttpServlet {

    public void init() {

    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String bid = request.getParameter("bookingID");
        bookingDAO bookingDAO = new bookingDAO();
        try {
            // Get the session and account information
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("account");

            //booking
            Booking bookingdetail = bookingDAO.getBookingById(bid);
            request.setAttribute("data", bookingdetail);

            //service
            ServiceDAO serviceDAO = new ServiceDAO();
            List<Service> serviceList = serviceDAO.getServicesByBooking(bid, account.getId());
            request.setAttribute("serviceList", serviceList);

            double total = 0;
            for (Service service:serviceList){
                total += service.getQuantity() * service.getPrice();
            }
            request.setAttribute("total", total);

        } catch (Exception e) {
            // Handle SQL exceptions
            throw new RuntimeException(e);
        }
        request.getRequestDispatcher("/user/servicedetail.jsp").forward(request, response);
    }

    public void destroy() {
    }
}