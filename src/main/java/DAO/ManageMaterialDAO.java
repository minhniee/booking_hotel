package DAO;

import context.DBContext;
import model.Material;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ManageMaterialDAO extends DBContext {
    public ArrayList<Material> getAllMaterial() {
        ArrayList<Material> materials = new ArrayList<Material>();
        String sql = "select * from material";
        try {
            PreparedStatement stm = getConnection().prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                materials.add(new Material(rs.getString(1)
                        ,rs.getString(2)
                        ,rs.getInt(3)
                        ,rs.getDouble(4)
                        ,rs.getString(5)));
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return materials;
    }
   public void UpdateMaterial(String id, String name, int quantity, double price, String image) {
     String sql = "UPDATE [dbo].[material]\n" +
             "   SET \n" +
             "      [material_name] = ?\n" +
             "      ,[quantity] = ?\n" +
             "      ,[price] = ?\n" +
             "      ,[material_image] = ?\n" +
             " WHERE id = ?";
     try {
         PreparedStatement stm = getConnection().prepareStatement(sql);
         stm.setString(1, name);
         stm.setInt(2, quantity);
         stm.setDouble(3, price);
         stm.setString(4, image);
         stm.setString(5, id);
         stm.executeUpdate();
     }catch (Exception e) {
         e.printStackTrace();
     }
   }
   public Material getMaterialById(String id) {
        String sql = "select * from material where id = ?";
        try {
            PreparedStatement stm = getConnection().prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new Material(rs.getString(1)
                        ,rs.getString(2), rs.getInt(3),rs.getDouble(4),rs.getString(5) );
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return null;
   }
   public void InsertMaterial(String id, String name, int quantity, double price, String image) {
        String sql = "INSERT INTO [dbo].[material]\n" +
                "           ([id]\n" +
                "           ,[material_name]\n" +
                "           ,[quantity]\n" +
                "           ,[price]\n" +
                "           ,[material_image])\n" +
                "     VALUES\n" +
                "           (?\n" +
                "           ,?\n" +
                "           ,?\n" +
                "           ,?\n" +
                "           ,?)";
        try {
            PreparedStatement stm = getConnection().prepareStatement(sql);
            stm.setString(1, id);
            stm.setString(2, name);
            stm.setInt(3, quantity);
            stm.setDouble(4, price);
            stm.setString(5, image);
            stm.executeUpdate();
        }catch (Exception e) {
            e.printStackTrace();
        }
   }
   public ArrayList<Material> getMaterialByName(String name){
        ArrayList<Material> getMaterialByName = new ArrayList<>();
        String sql = "select * from material where material_name like ?";
        try {
            PreparedStatement stm = getConnection().prepareStatement(sql);
            stm.setString(1,"%"+ name+"%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                getMaterialByName.add(new Material(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), rs.getString(5)));
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return getMaterialByName;
   }
}
