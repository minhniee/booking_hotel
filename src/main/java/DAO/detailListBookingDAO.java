package DAO;

import context.DBContext;
import model.DetailListBooking;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class detailListBookingDAO extends DBContext {
    public DetailListBooking detailListBooking(String id){

        String sql = "select  a.full_name, a.phone , a.email,bd.material,p.payment_date,bd.billing_date, pm.paymentName,  bd.total_amount from booking b inner join payment p\n" +
                "on b.id = p.booking_id\n" +
                "inner join payment_method pm on\n" +
                "p.payment_method_id= pm.id\n" +
                "join bill  on\n" +
                "bill.booking_id = b.id\n" +
                "join account a on\n" +
                "bill.account_id = a.id\n" +
                "join bill_detail bd on\n" +
                "bill.id= bd.bill_id\n" +
                "where b.id = ?\n";
        try {
            PreparedStatement stm = getConnection().prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
              return new DetailListBooking(rs.getString(1)
                      ,rs.getString(2)
                      ,rs.getString(3)
                      ,rs.getString(4)
                      ,rs.getDate(5)
                      ,rs.getDate(6)
                      ,rs.getString(7)
                      ,rs.getDouble(8));
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
