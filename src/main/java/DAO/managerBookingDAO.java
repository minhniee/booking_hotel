package DAO;

import context.DBContext;
import model.Booking;
import model.ManagerBooking;

import java.sql.*;
import java.util.ArrayList;

public class managerBookingDAO extends DBContext {
//    public ArrayList<ManagerBooking> managerBookingList() {
//        ArrayList<ManagerBooking> ManagerBooking = new ArrayList<ManagerBooking>();
//        String sql = "  select id, room_id, account_id, checkin_date, checkout_date, num_child, num_adults, booking_price from booking\n";
//        try {
//            PreparedStatement stm =  getConnection().prepareStatement(sql);
//            ResultSet rs = stm.executeQuery();
//            while (rs.next()) {
//                ManagerBooking.add(new ManagerBooking(rs.getString(1)
//
//                        ,rs.getString(2)
//                        ,rs.getString(3)
//                        ,rs.getDate(4)
//                        ,rs.getDate(5)
//                        ,rs.getInt(6)
//                        ,rs.getInt(7)
//                        ,rs.getDouble(8)));
//            }
//        }catch (Exception e) {}
//        return ManagerBooking;
//    }

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
                        ,rs.getString(3)
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


    public ArrayList<ManagerBooking> managerBookingList() throws SQLException {

        ArrayList<ManagerBooking> bookings = new ArrayList<>();
        String sql = "  select id, room_id, account_id, checkin_date, checkout_date, num_child, num_adults, booking_price from booking\n";
        PreparedStatement pr = getConnection().prepareStatement(sql);
        ResultSet rs = pr.executeQuery();
        while (rs.next()) {
             String id = rs.getString(1);
             String   room_id = rs.getString(2);
             String customer_id = rs.getString(3);
             Date checkin_date  = rs.getDate(4) ;
             Date checkout_date  = rs.getDate(5) ;
             int num_child = rs.getInt(6);
             int num_adults = rs.getInt(7);
             double booking_price   = rs.getDouble(8);
            ManagerBooking b = new ManagerBooking(id,room_id,customer_id,checkin_date,checkout_date,num_child,num_adults,booking_price);
            bookings.add(b);
        }
        return bookings;

    }
}
