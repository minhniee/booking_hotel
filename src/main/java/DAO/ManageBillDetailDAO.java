package DAO;

import context.DBContext;

import java.sql.PreparedStatement;
import java.time.LocalDate;
import java.util.Date;

public class ManageBillDetailDAO extends DBContext {
    public void InsertBillDetail(String id, String bill_id, String account_id, String material, double total_amount , LocalDate billing_date){
      String sql = "INSERT INTO [dbo].[bill_detail]\n" +
              "           ([id]\n" +
              "           ,[bill_id]\n" +
              "           ,[account_id]\n" +
              "           ,[material]\n" +
              "           ,[total_amount]\n" +
              "           ,[billing_date])\n" +
              "     VALUES\n" +
              "           (?\n" +
              "           ,?\n" +
              "           ,?\n" +
              "           ,?\n" +
              "           ,?\n" +
              "           ,?)";
      try {
          java.sql.Date sqlDate = java.sql.Date.valueOf(billing_date);

          PreparedStatement stm = getConnection().prepareStatement(sql);
          stm.setString(1, id);
          stm.setString(2, bill_id);
          stm.setString(3, account_id);
          stm.setString(4, material);
          stm.setDouble(5,total_amount);
          stm.setDate(6, sqlDate);
          stm.executeUpdate();
      }catch (Exception e) {
          e.printStackTrace();
      }
    }
}
