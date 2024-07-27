package DAO;

import context.DBContext;
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
    public void addVerificationCode(String userName, String verificationCode) throws SQLException {
        String query = "UPDATE account SET key1 = ?, confirm = 0 WHERE user_name = ?";
        try (
                PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, verificationCode);
            ps.setString(2, userName);
            ps.executeUpdate();
        }
    }

    public boolean verifyCode(String userName, String verificationCode) throws SQLException {
        String query = "SELECT * FROM account WHERE user_name = ? AND key1 = ? AND confirm = 0";
        try (
                PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, userName);
            ps.setString(2, verificationCode);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    // Update confirm to true
                    String updateQuery = "UPDATE account SET confirm = 1 WHERE user_name = ? AND key1 = ?";
                    try (PreparedStatement updatePs = con.prepareStatement(updateQuery)) {
                        updatePs.setString(1, userName);
                        updatePs.setString(2, verificationCode);
                        updatePs.executeUpdate();
                    }
                    return true;
                }
            }
        }
        return false;
    }
    public void updatePassword(String id, String newPassword) {
        String sql = "UPDATE account SET password = ? WHERE id = ?";
        PreparedStatement ps = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setString(2, id);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected == 0) {
                throw new SQLException("No account found with the provided ID.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error updating password: " + e.getMessage(), e);
        } finally {
            try {
                if (ps != null) ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void register(String username, String password, String fullname, String address, String gender, String email, String phone, String dob, String role) {
        if (username == null || username.trim().isEmpty()) {
            throw new IllegalArgumentException("User name cannot be null or empty");
        }
        if (password == null || password.trim().isEmpty()) {
            throw new IllegalArgumentException("Password cannot be null or empty");
        }
        if (fullname == null || fullname.trim().isEmpty()) {
            throw new IllegalArgumentException("Full name cannot be null or empty");
        }
        if (email == null || email.trim().isEmpty()) {
            throw new IllegalArgumentException("Email cannot be null or empty");
        }
        if (role == null || role.trim().isEmpty()) {
            throw new IllegalArgumentException("Role cannot be null or empty");
        }
        if (gender == null || gender.trim().isEmpty()) {
            throw new IllegalArgumentException("Gender cannot be null or empty");
        }
        if (phone == null || phone.trim().isEmpty()) {
            throw new IllegalArgumentException("Phone cannot be null or empty");
        }
        if (dob == null || dob.trim().isEmpty()) {
            throw new IllegalArgumentException("Date of birth cannot be null or empty");
        }
        if (address == null || address.trim().isEmpty()) {
            throw new IllegalArgumentException("Address cannot be null or empty");
        }

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


    public Account checkAccountExist(String userName) {
        String sql = "SELECT * FROM Account WHERE user_name = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, userName);
            rs = ps.executeQuery();
            if (rs.next()) {
                Account a = new Account();
                a.setId(rs.getString("id"));
                a.setUserName(rs.getString("user_name"));
                a.setPassword(rs.getString("password"));
                a.setFullName(rs.getString("full_name"));
                a.setEmail(rs.getString("email"));
                a.setRole(rs.getString("role"));
                a.setGender(rs.getBoolean("gender"));
                a.setPhone(rs.getString("phone"));
                a.setAddress(rs.getString("address"));
                a.setDob(rs.getDate("dob"));
                return a;
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
        return null;
    }

    public Account checkEmailExist(String email) {
        String sql = "SELECT * FROM Account WHERE email = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                Account a = new Account();
                a.setId(rs.getString("id"));
                a.setUserName(rs.getString("user_name"));
                a.setPassword(rs.getString("password"));
                a.setFullName(rs.getString("full_name"));
                a.setEmail(rs.getString("email"));
                a.setRole(rs.getString("role"));
                a.setGender(rs.getBoolean("gender"));
                a.setPhone(rs.getString("phone"));
                a.setAddress(rs.getString("address"));
                a.setDob(rs.getDate("dob"));
                return a;
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
        return null;
    }

    public boolean checkConfirm(String username) {
        String sql = "SELECT confirm FROM account WHERE user_name = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    int confirmValue = rs.getInt("confirm");
                    // Nếu giá trị confirm là 1 (đã xác nhận), trả về true
                    return confirmValue == 1;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        // Nếu không tìm thấy tài khoản hoặc có lỗi xảy ra, trả về false
        return false;
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
    public void updateAccount(String userName, String fullName, String email, boolean gender, String phone, Date dob, String address) {
        // Câu lệnh SQL UPDATE
        String sql = "UPDATE account SET full_name = ?, email = ?,gender=?, phone = ?, dob = ?, address = ? WHERE user_name = ?";

        try (
                // Thiết lập kết nối đến cơ sở dữ liệu
                Connection conn = new DBContext().getConnection(); // Chuẩn bị câu lệnh SQL
                PreparedStatement st = conn.prepareStatement(sql)) {
            // Thiết lập các tham số cho câu lệnh SQL
            st.setString(1, fullName);
            st.setString(2, email);
            st.setBoolean(3, gender);
            st.setString(4, phone);
            st.setDate(5, dob);
            st.setString(6, address);
            st.setString(7, userName);

            // Thực thi câu lệnh UPDATE
            int rowsAffected = st.executeUpdate();

            // Kiểm tra xem có bao nhiêu bản ghi đã được cập nhật
            if (rowsAffected > 0) {
                System.out.println("Account with name " + userName + " updated successfully.");
            } else {
                System.out.println("No account found with name " + userName);
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ nếu có lỗi xảy ra khi thực hiện câu lệnh SQL
            e.printStackTrace();
        }
    }
    public Account getAccountByUserName(String userName) {
        Account a = null;
        String sql = "SELECT * FROM account WHERE user_name = ?";
        try (
                Connection conn = new DBContext().getConnection();
                PreparedStatement st = conn.prepareStatement(sql)
        ) {
            st.setString(1, userName);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                a = new Account();
                a.setId(rs.getString("id"));
                a.setUserName(rs.getString("user_name"));
                a.setPassword(rs.getString("password"));
                a.setFullName(rs.getString("full_name"));
                a.setEmail(rs.getString("email"));
                a.setRole(rs.getString("role"));
                a.setGender(rs.getBoolean("gender"));
                a.setPhone(rs.getString("phone"));
                a.setAddress(rs.getString("address"));
                a.setDob(rs.getDate("dob"));
                return a;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return a;
    }

    public Account getAccountById(String accountId) {
        Account account = null;
        String sql = "SELECT * FROM account WHERE id = ?";
        try (
                Connection conn = new DBContext().getConnection();
                PreparedStatement st = conn.prepareStatement(sql)
        ) {
            st.setString(1, accountId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                account = new Account();
                account.setId(rs.getString("id"));
                account.setUserName(rs.getString("user_name"));
                account.setFullName(rs.getString("full_name"));
                account.setEmail(rs.getString("email"));
                account.setGender(rs.getBoolean("gender"));
                account.setPhone(rs.getString("phone"));
                account.setDob(rs.getDate("dob"));
                account.setAddress(rs.getString("address"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return account;
    }

//    public static void main(String[] args) {
//        Account av = new AccountDAO().getAccountById("8273650f");
//        System.out.println(av.getEmail());
//    }

}
