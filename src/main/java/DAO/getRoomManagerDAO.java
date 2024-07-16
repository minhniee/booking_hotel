package DAO;

import context.DBContext;
import model.Room;
import model.RoomManager;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class getRoomManagerDAO extends DBContext {
    public ArrayList<RoomManager> getRoomManager() {
        ArrayList<RoomManager> roomManagers = new ArrayList<>();
      String sql = "  select * from room";
      try {
          PreparedStatement stm = getConnection().prepareStatement(sql);
          ResultSet rs = stm.executeQuery();
          while (rs.next()) {
              roomManagers.add(new RoomManager(rs.getString(1)
                      ,rs.getString(2)


                      ,rs.getString(3)
                      ,rs.getInt(4)
                      ,rs.getString(5)));
          }
      }catch (Exception e) {}
      return roomManagers;
    }
}
