package DAO;

import context.DBContext;
import model.ManageRoomMaterial;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ManageRoomMaterialDAO extends DBContext {
    public void DeleteMaterialRoom(String room_id, String material_id) {
        String sql = "DELETE FROM [dbo].[room_material]\n" +
                "      WHERE room_id = ? and material_id = ? ";
        try {
            PreparedStatement stm = getConnection().prepareStatement(sql);
            stm.setString(1, room_id);
            stm.setString(2, material_id);
            stm.executeUpdate();
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
    public ManageRoomMaterial getMaterialRoom(String room_id, String material_id) {
        String sql = "  select * from room_material where room_id = ? and material_id =?";
        try {
            PreparedStatement stm = getConnection().prepareStatement(sql);
            stm.setString(1, room_id);
            stm.setString(2, material_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new ManageRoomMaterial(rs.getString("room_id"), rs.getString("material_id"));
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public void InsertMaterialRoom(String room_id, String material_id) {
        String sql = "INSERT INTO [dbo].[room_material]\n" +
                "           ([room_id]\n" +
                "           ,[material_id])\n" +
                "     VALUES\n" +
                "           (?\n" +
                "           ,?)";
        try {
            PreparedStatement stm = getConnection().prepareStatement(sql);
            stm.setString(1, room_id);
            stm.setString(2, material_id);
            stm.executeUpdate();
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
}
