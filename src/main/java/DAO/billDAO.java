package DAO;

import context.DBContext;
import model.Bill;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class billDAO {

    protected Connection con = null;
    protected PreparedStatement pr = null;
    protected ResultSet rs = null;

    public void insertBill(Bill bill) {
        try {
            con = new DBContext().getConnection();

            String sql = "insert into bill values(?,?,?,?)";
            pr = con.prepareStatement(sql);
            pr.setString(1,bill.getBillId());
            pr.setString(2,bill.getAccountId());
            pr.setString(3,bill.getBookingId());
            pr.setDouble(4,bill.getTotalPrice());
            pr.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        Bill b= new Bill("12323","1234","QN8728D3505504",20000.0);
        billDAO dao = new billDAO();
        dao.insertBill(b);
    }

    }

