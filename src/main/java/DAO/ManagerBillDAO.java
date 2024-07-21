package DAO;

import context.DBContext;
import model.Bill;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ManagerBillDAO extends DBContext {
    public Bill getBill(String id) {
        String sql ="  select * from bill where booking_id = ?";
        try {
            PreparedStatement stm = getConnection().prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new Bill(rs.getString(1)
                        ,rs.getString(2)
                        ,rs.getString(3)
                        ,rs.getDouble(4 ) );
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
