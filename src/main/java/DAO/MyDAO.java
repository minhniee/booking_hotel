package DAO;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MyDAO extends DBContext {
    protected Connection con;
    protected PreparedStatement ps;
    protected ResultSet rs;
    protected String xSql;

    public MyDAO() {
        con = getConnection(); // Lấy kết nối từ DBcontext
    }

    @Override
    protected void finalize() throws Throwable {
        try {
            if (rs != null && !rs.isClosed()) {
                rs.close();
            }
            if (ps != null && !ps.isClosed()) {
                ps.close();
            }
            if (con != null && !con.isClosed()) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            super.finalize();
        }
    }
}
