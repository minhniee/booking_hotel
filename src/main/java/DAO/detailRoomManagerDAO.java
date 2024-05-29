package DAO;

import context.DBContext;
import model.DetailRoomManager;
import model.Material;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class detailRoomManagerDAO extends DBContext {
    public DetailRoomManager getdetailRoomManager(String id) {
        String sql = "  select * from room_class where id = ?";
        try {
            PreparedStatement stm = getConnection().prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()){
              return new DetailRoomManager(rs.getString(1)
                      , rs.getString(2)
                      ,rs.getDouble(3) );
            }
        }catch (Exception e){

        }
            return null;
    }
    public ArrayList<Material> getMaterialList(String id) {
        ArrayList<Material> materials =  new ArrayList<>();
        String sql = "  select r.room_id,m.* from room_material r inner join\n" +
                "  material m on r.material_id=m.id\n" +
                "  where r.room_id = ?";

        try {
            PreparedStatement stm = getConnection().prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                materials.add(new Material(rs.getString(1)
                        , rs.getString(2)
                        , rs.getString(3)
                        , rs.getInt(4)
                        , rs.getDouble(5)
                        , rs.getString(6)));
            }
        } catch (Exception e) {

        }
        return materials;
    }
}
