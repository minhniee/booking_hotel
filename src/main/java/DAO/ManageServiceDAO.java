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
    public ArrayList<ManageService> getManageServicesByName(String id) {
        ArrayList<ManageService> getManageServicesByName = new ArrayList<>();
        String sql = "  select * from service where service_name like ?";
        try {
            PreparedStatement stm = getConnection().prepareStatement(sql);
            stm.setString(1,"%"+ id+ "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                getManageServicesByName.add(new ManageService(rs.getString(1)
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
        return getManageServicesByName;
    }
    public void updateService(String id, int  category_id, String service_name, String description, double price, int quantity, String image ) {
          String sql = "UPDATE [dbo].[service]\n" +
                  "   SET \n" +
                  "      [category_id] = ?\n" +
                  "      ,[service_name] = ?\n" +
                  "      ,[description] = ?\n" +
                  "      ,[price] =?\n" +
                  "      ,[quantity] =?\n" +
                  "      ,[image] = ?\n" +
                  " WHERE id = ?";
          try {
              PreparedStatement stm = getConnection().prepareStatement(sql);
              stm.setInt(1, category_id);
              stm.setString(2, service_name);
              stm.setString(3, description);
              stm.setDouble(4, price);
              stm.setInt(5, quantity);
              stm.setString(6, image);
              stm.setString(7, id);
              stm.executeUpdate();

          }catch (Exception e) {
              e.printStackTrace();
          }
    }
    public ManageService getManageServiceById(String id) {
       String sql = "select * from service where id = ?";
       try {
           PreparedStatement stm = getConnection().prepareStatement(sql);
           stm.setString(1, id);
           ResultSet rs = stm.executeQuery();
           while (rs.next()) {
               return new ManageService(rs.getString(1)
                       ,rs.getInt(2)
                       ,rs.getString(3)
                       ,rs.getString(4)
                       ,rs.getDouble(5)
                       ,rs.getInt(6)
                       ,rs.getString(7));
           }
       }catch (Exception e) {
           e.printStackTrace();
       }
       return null;
    }
    public ManageService getManageServiceByImage(String image) {
        String sql = "select * from service where image = ?";
        try {
            PreparedStatement stm = getConnection().prepareStatement(sql);
            stm.setString(1, image);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new ManageService(rs.getString(1)
                        ,rs.getInt(2)
                        ,rs.getString(3)
                        ,rs.getString(4)
                        ,rs.getDouble(5)
                        ,rs.getInt(6)
                        ,rs.getString(7));
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public void InsertManageService(String id, int category_id, String service_name, String description, double price, int quantity, String image) {
        String sql = "INSERT INTO [dbo].[service]\n" +
                "           ([id]\n" +
                "           ,[category_id]\n" +
                "           ,[service_name]\n" +
                "           ,[description]\n" +
                "           ,[price]\n" +
                "           ,[quantity]\n" +
                "           ,[image])\n" +
                "     VALUES\n" +
                "           (?\n" +
                "           ,?\n" +
                "           ,?\n" +
                "           ,?\n" +
                "           ,?\n" +
                "           ,?\n" +
                "           ,?)";
        try {
            PreparedStatement stm = getConnection().prepareStatement(sql);
            stm.setString(1, id);
            stm.setInt(2, category_id);
            stm.setString(3, service_name);
            stm.setString(4, description);
            stm.setDouble(5, price);
            stm.setInt(6, quantity);
            stm.setString(7, image);
            stm.executeUpdate();
        }catch (Exception e) {
            e.printStackTrace();
        }



    }



}
