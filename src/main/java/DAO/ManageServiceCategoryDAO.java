package DAO;

import context.DBContext;
import model.ManageServiceCategory;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ManageServiceCategoryDAO extends DBContext {
    public ArrayList<ManageServiceCategory> selectAll() {
        ArrayList<ManageServiceCategory> list = new ArrayList<>();
        String sql = "select * from service_category";
        try {
            PreparedStatement stm = getConnection().prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new ManageServiceCategory(rs.getInt(1)
                        ,rs.getString(2)));
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String[] args) {
        ArrayList<ManageServiceCategory> list = new ManageServiceCategoryDAO().selectAll();
        for (ManageServiceCategory msc : list) {
            System.out.println(msc.getName());
        }
    }
}
