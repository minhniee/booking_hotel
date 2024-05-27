package DAO;

import context.DBContext;

import java.sql.PreparedStatement;

public class removeAccountDAO extends DBContext {
    public void removeAccount(int id) {
        String sql = "DELETE FROM account WHERE id = ?";
        try {
            PreparedStatement stm = getConnection().prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        }catch (Exception e) {

        }
    }
}
