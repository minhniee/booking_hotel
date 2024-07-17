package DAO;

import context.DBContext;
import model.RoomImage;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ManageRoomImage extends DBContext {
    public ArrayList<RoomImage> images(String id){
        ArrayList<RoomImage> images = new ArrayList<>();
        String sql = "  select * from room_images where room_class_id = ?";
        try {
            PreparedStatement stm = getConnection().prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                images.add(new RoomImage(rs.getInt(1)
                        ,rs.getString(2)
                        ,rs.getString(3) ));
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return images;
    }
    public RoomImage getImage(int id){
        String sql = "  select * from room_images where id = ?";
        try {
            PreparedStatement stm = getConnection().prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new RoomImage(rs.getInt(1)
                        ,rs.getString(2), rs.getString(3));
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return null;

    }
    public void UpdateImage(int id, String room_class_id, String image){
        String sql ="UPDATE [dbo].[room_images]\n" +
                "   SET [room_class_id] = ?\n" +
                "      ,[image_url] = ?\n" +
                " WHERE id = ?";
        try {
            PreparedStatement stm = getConnection().prepareStatement(sql);
            stm.setString(1, room_class_id);
            stm.setString(2, image);
            stm.setInt(3, id);
            stm.executeUpdate();
        }catch (Exception e) {
            e.printStackTrace();
        }

    }
}
