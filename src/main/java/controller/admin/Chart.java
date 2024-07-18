package controller.admin;

import DAO.ChartDAO;
import org.json.JSONArray;
import org.json.JSONObject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "Chart", value = "/chartData")
public class Chart extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ChartDAO chartDAO = new ChartDAO();
        List<model.Chart> charts = chartDAO.getCharts();

        // Convert list to JSON
        JSONArray jsonArray = new JSONArray();
        for (model.Chart chart : charts) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("month", chart.getMonth());
            jsonObject.put("totalAmount", chart.getPrice());
            jsonArray.put(jsonObject);
        }

        request.setAttribute("revenueData", jsonArray.toString());
        request.getRequestDispatcher("Admin/dashboard.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            // Your HTML content here, if needed
            response.getWriter().println("<!DOCTYPE html>");
            response.getWriter().println("<html>");
            response.getWriter().println("<head>");
            response.getWriter().println("<title>Servlet Chart</title>");
            response.getWriter().println("</head>");
            response.getWriter().println("<body>");
            response.getWriter().println("<h1>Servlet Chart at " + request.getContextPath() + "</h1>");
            response.getWriter().println("</body>");
            response.getWriter().println("</html>");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet to fetch chart data in JSON format";
    }
}
