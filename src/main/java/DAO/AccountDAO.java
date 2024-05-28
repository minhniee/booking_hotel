package DAO;

import model.Account;
import java.sql.*;
import java.util.UUID;

public class AccountDAO extends MyDAO{
    public Account checkLogin(String user_name, String password) {
        String sql = "SELECT [id], [user_name], [password], [full_name], [email], [role], [gender], [phone], [dob], [address] FROM [dbo].[account] WHERE user_name = ? AND [password] = ?";
        Account a = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, user_name);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                a = new Account();
                a.setId(rs.getString("id"));
                a.setUserName(rs.getString("user_name"));
                a.setFullName(rs.getString("full_name"));
                a.setEmail(rs.getString("email"));
                a.setRole(rs.getString("role"));
                a.setGender(rs.getBoolean("gender"));
                a.setPhone(rs.getString("phone"));
                a.setAddress(rs.getString("address"));
                a.setDob(rs.getDate("dob"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return a;
    }
    public static String generateShortString() {
        String id = UUID.randomUUID().toString();
        return id.substring(0, 8);
    }
    public void register(String username, String password, String fullname, String address, String gender, String email, String phone, String dob, String role) {
        String sql = "INSERT INTO account (id, user_name, password, full_name, email, role, gender, phone, dob, address) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            String id = generateShortString();
            ps.setString(1, id);
            ps.setString(2, username);
            ps.setString(3, password);
            ps.setString(4, fullname);
            ps.setString(5, email);
            ps.setString(6, role);
            ps.setBoolean(7, "male".equalsIgnoreCase(gender)); // Assume male is true (1) and female is false (0)
            ps.setString(8, phone);
            ps.setString(9, dob);
            ps.setString(10, address);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public Account checkAccountExist(String username) {
        String sql = "SELECT * FROM Account WHERE user_name = ?";
        int check = 0;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setUserName(rs.getString(2));
                return a;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Account updateProfile(int id, String fullname, String phone) {
        try {
            String sql = "UPDATE Account SET Fullname=?, Phone=? WHERE id=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, fullname);
            ps.setString(2, phone);
            ps.setInt(3, id);
            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                sql = "SELECT * FROM Account WHERE id=?";
                ps = con.prepareStatement(sql);
                ps.setInt(1, id);
                rs = ps.executeQuery();

                if (rs.next()) {
                    Account updatedAccount = new Account();
                    updatedAccount.setId(rs.getString("id"));
                    updatedAccount.setFullName(rs.getString("Fullname"));
                    updatedAccount.setPhone(rs.getString("Phone"));
                    return updatedAccount;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }
}
