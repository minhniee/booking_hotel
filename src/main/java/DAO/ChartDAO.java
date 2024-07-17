package DAO;

import context.DBContext;
import model.Chart;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ChartDAO extends DBContext {
    public ArrayList<Chart> getchar(){
        ArrayList<Chart> charts = new ArrayList<Chart>();
        String sql = "select MONTH(billing_date), total_amount  from bill_detail\n";
        try {
            PreparedStatement stm = getConnection().prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                charts.add(new Chart(rs.getInt(1), rs.getDouble(2)));
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
return charts;
    }
}
