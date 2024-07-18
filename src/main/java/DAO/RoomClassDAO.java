package DAO;

import context.DBContext;
import model.Material;
import model.RoomClass;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RoomClassDAO extends DBContext {

    public RoomClass getRoomClassById(String roomClassId) {
        RoomClass roomClass = null;
        String sql = "SELECT * FROM room_class WHERE id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, roomClassId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    roomClass = new RoomClass();
                    roomClass.setId(rs.getString("id"));
                    roomClass.setClassName(rs.getString("class_name"));
                    roomClass.setBasePrice(rs.getDouble("base_price"));
                    roomClass.setMainImage(rs.getString("main_image"));
                    // Fetch the associated images
                    roomClass.setImageUrls(getRoomImages(roomClassId));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return roomClass;
    }

    private List<String> getRoomImages(String roomClassId) {
        List<String> imageUrls = new ArrayList<>();
        String sql = "SELECT image_url FROM room_images WHERE room_class_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, roomClassId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    imageUrls.add(rs.getString("image_url"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return imageUrls;
    }

    public List<Material> getMaterialsByRoomClassId(String roomClassId) {
        List<Material> materials = new ArrayList<>();
        String query = "SELECT DISTINCT m.id, m.material_name, m.quantity, m.price, m.material_image " +
                "FROM material m " +
                "INNER JOIN room_material rm ON m.id = rm.material_id " +
                "INNER JOIN room r ON rm.room_id = r.id " +
                "WHERE r.room_class_id = ?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, roomClassId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Material material = new Material(
                        rs.getString("id"),
                        rs.getString("material_name"),
                        rs.getInt("quantity"),
                        rs.getDouble("price"),
                        rs.getString("material_image")
                );
                materials.add(material);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return materials;
    }
    public List<String> getImagesByRoomId(String roomId) {
        List<String> imageUrls = new ArrayList<>();
        String sql = "SELECT ri.image_url " +
                "FROM room r " +
                "INNER JOIN room_images ri ON r.room_class_id = ri.room_class_id " +
                "WHERE r.id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, roomId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    imageUrls.add(rs.getString("image_url"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return imageUrls;
    }
}
