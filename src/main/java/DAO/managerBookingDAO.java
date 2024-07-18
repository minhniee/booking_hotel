package DAO;

import context.DBContext;
import model.ManagerBooking;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class managerBookingDAO extends DBContext {
    public ArrayList<ManagerBooking> managerBookingList() {
        ArrayList<ManagerBooking> ManagerBooking = new ArrayList<ManagerBooking>();
        String sql = "  select id, room_id, account_id, checkin_date, checkout_date, num_child, num_adults, booking_price from booking\n";
        try {
            PreparedStatement stm = getConnection().prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                ManagerBooking.add(new ManagerBooking(rs.getString(1)
                        ,rs.getString(2)
                        ,rs.getInt(3)
                        ,rs.getDate(4)
                        ,rs.getDate(5)
                        ,rs.getInt(6)
                        ,rs.getInt(7)
                        ,rs.getDouble(8)));
            }
        }catch (Exception e) {}
        return ManagerBooking;
    }
    public ArrayList<ManagerBooking> getManagerBooking(String id) {
        ArrayList<ManagerBooking> list = new ArrayList<>();
        String sql = "  select id, room_id, account_id, checkin_date, checkout_date, num_child, num_adults, booking_price from booking where room_id like ?";
        try {
            PreparedStatement stm = getConnection().prepareStatement(sql);
            stm.setString(1, "%"+id+"%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new ManagerBooking(rs.getString(1)
                        ,rs.getString(2)
                        ,rs.getInt(3)
                        ,rs.getDate(4)
                        ,rs.getDate(5)
                        ,rs.getInt(6)
                        ,rs.getInt(7)
                        ,rs.getDouble(8)));

            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
