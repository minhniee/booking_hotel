package DAO;

import context.DBContext;
import model.ManageService;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ManageServiceDAO extends DBContext {
    public ArrayList<ManageService> getManageServices() {
        ArrayList<ManageService> getManageServices = new ArrayList<>();
        String sql = "select * from service";
        try {
            PreparedStatement stm = getConnection().prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                getManageServices.add(new ManageService(rs.getString(1)
                        ,rs.getInt(2)
                        ,rs.getString(3)
                        ,rs.getString(4)
                        ,rs.getDouble(5)
                        ,rs.getInt(6)
                        ,rs.getString(7)));
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return getManageServices;
    }
    public ArrayList<ManageService> getManageServicesById(int id) {
        ArrayList<ManageService> getManageServices = new ArrayList<>();
        String sql = "  select * from service where category_id = ?";
        try {
            PreparedStatement stm = getConnection().prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                getManageServices.add(new ManageService(rs.getString(1)
                        ,rs.getInt(2)
                        ,rs.getString(3)
                        ,rs.getString(4)
                        ,rs.getDouble(5)
                        ,rs.getInt(6)
                        ,rs.getString(7)));
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return getManageServices;
    }

}
