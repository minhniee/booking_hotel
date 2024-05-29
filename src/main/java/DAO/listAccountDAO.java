package DAO;

import context.DBContext;
import model.Account;

import java.sql.*;
import java.util.ArrayList;

public class listAccountDAO extends DBContext{
    public ArrayList<Account> listAccount(){
        ArrayList<Account> accounts = new ArrayList<>();
        try {
         String sql = "select * from account where role = 'customer' or role = 'staff'";
         PreparedStatement stm = getConnection().prepareStatement(sql);
         ResultSet rs = stm.executeQuery();
         while(rs.next()){
             accounts.add(new Account(rs.getString(1)
                     ,rs.getString(2)
                     , rs.getString(3)
                     ,rs.getString(4)
                     ,rs.getString(5)
                     ,rs.getString(6)
                     ,rs.getBoolean(7)
                     ,rs.getString(8)
                     ,rs.getDate(9)
                     ,rs.getString(10) ));
         }
        }catch (Exception e) {

        }
        return accounts;
    }
}
