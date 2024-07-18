package DAO;

import context.DBContext;
import model.Chart;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ChartDAO extends DBContext {
    public List<Chart> getCharts() {
        List<Chart> charts = new ArrayList<>();
        String sql = "SELECT MONTH(billing_date) AS month, SUM(total_amount) AS total " +
                "FROM bill_detail " +
                "GROUP BY MONTH(billing_date)";

        try {
            PreparedStatement stm = getConnection().prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int month = rs.getInt("month");
                double totalAmount = rs.getDouble("total");
                charts.add(new Chart(month, totalAmount));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } 
            // Close resources (Connection, Statement, ResultSet)



        return charts;
    }
}
