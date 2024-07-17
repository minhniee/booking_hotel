package DAO;

import context.DBContext;
import model.Account;
import model.ManageAccount;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class setAccountDAO extends DBContext {
    public ManageAccount getAccountById(String id){
       String sql = "select id, user_name, password, full_name, email, role, gender, phone, dob, address, confirm from account where id = ? ";
       try {
           PreparedStatement stm = getConnection().prepareStatement(sql);
           stm.setString(1, id);
           ResultSet rs = stm.executeQuery();
           while (rs.next()){
               return new ManageAccount(rs.getString(1)
                       ,rs.getString(2)
                       , rs.getString(3)
                       ,rs.getString(4)
                       ,rs.getString(5)
                       ,rs.getString(6)
                       ,rs.getBoolean(7)
                       ,rs.getString(8)
                       ,rs.getDate(9)
                       ,rs.getString(10)
                       ,rs.getBoolean(11));
           }
       }catch (Exception e) {

       }

     return null;
    }
    public void updateAccount(String username, String password, String fullname, String email, String role, boolean gender, String phone, Date date,String address, boolean confirm, String id){
      String sql = "UPDATE [dbo].[account]\n" +
              "   SET [user_name] = ?\n" +
              "      ,[password] = ?\n" +
              "      ,[full_name] =?\n" +
              "      ,[email] = ?\n" +
              "      ,[role] = ?\n" +
              "      ,[gender] = ?\n" +
              "      ,[phone] = ?\n" +
              "      ,[dob] = ?\n" +
              "      ,[address] = ?\n" +
              "      ,[confirm] = ?\n" +
              " WHERE id = ?";
           try {
               PreparedStatement stm = getConnection().prepareStatement(sql);
               stm.setString(1, username);
               stm.setString(2, password);
               stm.setString(3, fullname);
               stm.setString(4, email);
               stm.setString(5, role);
               stm.setBoolean(6, gender);
               stm.setString(7, phone);
               stm.setDate(8, date);
               stm.setString(9, address);
               stm.setBoolean(10, confirm);
               stm.setString(11, id);
               stm.executeUpdate();
           }catch (Exception e) {}



    }
}
