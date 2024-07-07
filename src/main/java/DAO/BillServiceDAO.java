package DAO;

import context.DBContext;
import model.BillDetailService;
import model.BillService;
import model.Cart;
import model.CartItem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class BillServiceDAO  extends DBContext {
    public BillService addBillService(BillService billService) {
        String query = "INSERT INTO [bill_service] ([account_id]\n" +
                "      ,[booking_id]\n" +
                "      ,[total_amount]\n" +
                "      ,[order_date]) VALUES (?, ?, ? , GETDATE())";
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, billService.getAccountId());
            ps.setString(2, billService.getBookingId());
            ps.setDouble(3, billService.getTotalAmount());
            ps.executeUpdate();

            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    int generatedId = generatedKeys.getInt(1);
                    billService.setId(generatedId);  // Assuming your Cart class has a setId method
                    return billService;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void addBillDetailService(BillDetailService billDetailService) {
        String query = "INSERT INTO [bill_detail_service] ([bill_service_id]\n" +
                "      ,[service_id]\n" +
                "      ,[quantity]) VALUES (?, ?, ?)";
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, billDetailService.getBillServiceId());
            ps.setString(2, billDetailService.getServiceId());
            ps.setInt(3, billDetailService.getQuantity());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
