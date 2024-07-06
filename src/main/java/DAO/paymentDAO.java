package DAO;

import context.DBContext;
import model.Payment;

import java.sql.*;

public class paymentDAO {
    protected Connection con = null;
    protected PreparedStatement pr = null;
    protected ResultSet rs = null;

    public void insertPayment(Payment payment) throws SQLException {
        con = new DBContext().getConnection();
        String sql = "insert into payment values(?,?,?,?)";
        pr = con.prepareStatement(sql);
//        pr.setString(1, payment.getId());
        pr.setString(1, payment.getBooking_id());
        pr.setDouble(2, payment.getTotal());
        pr.setDate(3, payment.getPayment_date());
        pr.setInt(4, payment.getPayment_method_id());
        pr.executeUpdate();
    }

//    public static void main(String[] args) throws SQLException {
//        Payment p = new Payment( "a11c61d2861c", 600, Date.valueOf("2024-07-05"), 1);
//        new paymentDAO().insertPayment(p);
//    }
}
