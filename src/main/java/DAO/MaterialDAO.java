package DAO;

import context.DBContext;
import model.Material;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MaterialDAO extends DBContext {


    public ArrayList<Material> listMaterial() {
        ArrayList<Material> material = new ArrayList<>();
        try {
            String sql = "SELECT \n"
                    + "    rm.room_id,\n"
                    + "    m.id AS material_id,\n"
                    + "    m.material_name,\n"
                    + "    m.quantity,\n"
                    + "    m.price,\n"
                    + "    m.material_image\n"
                    + "FROM \n"
                    + "    material m\n"
                    + "JOIN \n"
                    + "    room_material rm ON m.id = rm.material_id";
            PreparedStatement stm = getConnection().prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                material.add(new Material(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getDouble(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {

        }
        return material;
    }



    public static void main(String[] args) {
        System.out.println(new DBContext().getConnection());
        MaterialDAO dao = new MaterialDAO();
    }


    public Material getMaterialById(String id) {
        Material material = null;
        try {
            String sql = "SELECT rm.room_id, m.id, m.material_name, m.quantity, m.price, m.material_image " +
                    "FROM material m JOIN room_material rm ON m.id = rm.material_id WHERE m.id = ?";
            PreparedStatement stm = getConnection().prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                material = new Material(rs.getString("room_id"),
                        rs.getString("id"),
                        rs.getString("material_name"),
                        rs.getInt("quantity"),
                        rs.getDouble("price"),
                        rs.getString("material_image"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return material;
    }

    public void updateMaterial(Material material) {
        try {
            String sql = "UPDATE material SET material_name = ?, quantity = ?, price = ?, material_image = ? " +
                    "WHERE id = ?";
            PreparedStatement stm = getConnection().prepareStatement(sql);
            stm.setString(1, material.getName());
            stm.setInt(2, material.getQuantity());
            stm.setDouble(3, material.getPrice());
            stm.setString(4, material.getImage());
            stm.setString(5, material.getId());
            stm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}


