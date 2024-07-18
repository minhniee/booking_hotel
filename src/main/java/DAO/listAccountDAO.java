package DAO;

import context.DBContext;
import model.Account;
import model.ManageAccount;

import java.sql.*;
import java.util.ArrayList;

public class listAccountDAO extends DBContext{
    public ArrayList<ManageAccount> listAccount(){
        ArrayList<ManageAccount> accounts = new ArrayList<>();
        try {
         String sql = "select id, user_name, password, full_name, email, role, gender, phone, dob, address, confirm from account where role = 'customer' or role = 'staff'\n";
         PreparedStatement stm = getConnection().prepareStatement(sql);
         ResultSet rs = stm.executeQuery();
         while(rs.next()){
             accounts.add(new ManageAccount(rs.getString(1)
                     ,rs.getString(2)
                     , rs.getString(3)
                     ,rs.getString(4)
                     ,rs.getString(5)
                     ,rs.getString(6)
                     ,rs.getBoolean(7)
                     ,rs.getString(8)
                     ,rs.getDate(9)
                     ,rs.getString(10)
                     ,rs.getBoolean(11)));
         }
        }catch (Exception e) {

        }
        return accounts;
    }
    public ArrayList<ManageAccount> listAccountByNameOrPhone(String text) {
        ArrayList<ManageAccount> accounts = new ArrayList<>();
        String sql = "SELECT id, user_name, password, full_name, email, role, gender, phone, dob, address, confirm \n" +
                "FROM account \n" +
                "WHERE (role = 'customer' OR role = 'staff') \n" +
                "  AND phone LIKE ?";
        try {
            PreparedStatement stm = getConnection().prepareStatement(sql);
            stm.setString(1, "%"+text+"%");
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                accounts.add(new ManageAccount(rs.getString(1)
                        ,rs.getString(2)
                        , rs.getString(3)
                        ,rs.getString(4)
                        ,rs.getString(5)
                        ,rs.getString(6)
                        ,rs.getBoolean(7)
                        ,rs.getString(8)
                        ,rs.getDate(9)
                        ,rs.getString(10)
                        ,rs.getBoolean(11)));
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return accounts;
    }
}
