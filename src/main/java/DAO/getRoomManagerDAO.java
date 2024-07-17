package DAO;

import com.oracle.wls.shaded.org.apache.xalan.processor.ProcessorText;
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
    public ArrayList<RoomManager> getRoomManagerByName(String name) {
        ArrayList<RoomManager> roomManagers = new ArrayList<>();
        String sql = "  select * from room where room_class_id = ?";
        try {
            PreparedStatement stm = getConnection().prepareStatement(sql);
            stm.setString(1, name);
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
    public ArrayList<RoomManager> SearchRoomManagerByName(String name) {
        ArrayList<RoomManager> roomManagers = new ArrayList<>();
        String sql = "  select * from room where name like ?";
        try {
            PreparedStatement stm = getConnection().prepareStatement(sql);
            stm.setString(1, "%"+name+"%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                roomManagers.add(new RoomManager(rs.getString(1)
                        ,rs.getString(2)


                        ,rs.getString(3)
                        ,rs.getInt(4)
                        ,rs.getString(5)));
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return roomManagers;
    }
    public RoomManager getRoomManagerById(String id) {
        String sql = "  select * from room where id = ?";
        try {
            PreparedStatement stm = getConnection().prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return  new RoomManager(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5));
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public void UpdateRoom(String id, String room_class_id, String name, int adult, String status){
        String sql = "UPDATE [dbo].[room]\n" +
                "   SET \n" +
                "     [room_class_id] = ?\n" +
                "      ,[name] = ?\n" +
                "      ,[num_adults] = ?\n" +
                "      ,[status_name] = ?\n" +
                " WHERE id = ?";
        try {
            PreparedStatement stm = getConnection().prepareStatement(sql);
            stm.setString(1, room_class_id);
            stm.setString(2, name);
            stm.setInt(3, adult);
            stm.setString(4, status);
            stm.setString(5, id);
            stm.executeUpdate();
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
    public RoomManager FindRoomByName(String id) {
        String sql = "  select * from room where name = ?";
        try {
            PreparedStatement stm = getConnection().prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return  new RoomManager(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5));
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
public void InsertRoom(String id, String room_class_id, String name, int adult, String status){
   String sql = "\n" +
           "INSERT INTO [dbo].[room]\n" +
           "           ([id]\n" +
           "           ,[room_class_id]\n" +
           "           ,[name]\n" +
           "           ,[num_adults]\n" +
           "           ,[status_name])\n" +
           "     VALUES\n" +
           "           (?\n" +
           "           ,?\n" +
           "           ,?\n" +
           "           ,?\n" +
           "           ,?)";
   try {
       PreparedStatement stm = getConnection().prepareStatement(sql);
       stm.setString(1, id);
       stm.setString(2, room_class_id);
       stm.setString(3, name);
       stm.setInt(4, adult);
       stm.setString(5, status);
       stm.executeUpdate();
   }catch (Exception e) {
       e.printStackTrace();
   }
}

}
