package DAO;

import context.DBContext;
import model.RoomClass;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ManageRoomClassDAO extends DBContext {
    public ArrayList<RoomClass> getRoomClassList() {
        ArrayList<RoomClass> list = new ArrayList<>();
        String sql = "select * from room_class";
        try {
            PreparedStatement stm = getConnection().prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new RoomClass(rs.getString(1), rs.getString(2)
                        ,rs.getDouble(3)
                        ,rs.getString(4), null));
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public RoomClass getRoomClassById(String id) {
        String sql = "select * from room_class where id=?";
        try {
            PreparedStatement stm = getConnection().prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new RoomClass(rs.getString(1)
                        ,rs.getString(2)
                        ,rs.getDouble(3)
                        , rs.getString(4),null );
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public void UpdateRoomClass(String id, String name, double price, String image) {
        String sql = "UPDATE [dbo].[room_class]\n" +
                "   SET\n" +
                "      [class_name] = ?\n" +
                "      ,[base_price] = ?\n" +
                "      ,[main_image] = ?\n" +
                " WHERE id = ?";
        try {
            PreparedStatement stm = getConnection().prepareStatement(sql);
            stm.setString(1, name);
            stm.setDouble(2, price);
            stm.setString(3, image);
            stm.setString(4, id);
            stm.executeUpdate();
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void InsertRoomClass(String id, String name, double price, String image) {
        String sql = "INSERT INTO [dbo].[room_class]\n" +
                "           ([id]\n" +
                "           ,[class_name]\n" +
                "           ,[base_price]\n" +
                "           ,[main_image])\n" +
                "     VALUES\n" +
                "           (?\n" +
                "           ,?\n" +
                "           ,?\n" +
                "           ,?)";
        try {
            PreparedStatement stm = getConnection().prepareStatement(sql);
            stm.setString(1, id);
            stm.setString(2, name);
            stm.setDouble(3, price);
            stm.setString(4, image);
            stm.executeUpdate();
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
    public ArrayList<RoomClass> getRoomClassListByName(String name) {
        ArrayList<RoomClass> list = new ArrayList<>();
        String sql = "  select * from room_class where class_name like ?";
        try {
            PreparedStatement stm = getConnection().prepareStatement(sql);
            stm.setString(1, "%"+name+"%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new RoomClass(rs.getString(1)
                        ,rs.getString(2)
                        ,rs.getDouble(3),rs.getString(4),null ));
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
