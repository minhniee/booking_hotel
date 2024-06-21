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


}


