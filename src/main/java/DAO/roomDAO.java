package DAO;

import context.DBContext;
import model.Room;

import java.sql.Connection;
import java.sql.Timestamp;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class roomDAO {
    protected Connection con = null;
    protected PreparedStatement pr = null;
    protected ResultSet rs = null;

    public ArrayList<Room> getRoom() {
        ArrayList<Room> list = new ArrayList<>();
        try {
            con = new DBContext().getConnection();
            if (con != null) {
                String sql = "SELECT room.id, room_class_id, room_class.class_name, room.state, room.name, room.num_adults, base_price\n"
                        + "FROM room INNER JOIN room_class ON room.room_class_id = room_class.id";
                pr = con.prepareStatement(sql);

                System.out.println(sql);
                rs = pr.executeQuery();

                while (rs.next()) {
                    String roomClassName = rs.getString(3);
                    String statusName = rs.getString(4); // Foreign key
                    String roomName = rs.getString(5); // Foreign key
                    int numAdults = rs.getInt(6);
                    String id = rs.getString(1);
                    String roomClassId = rs.getString(2);
                    Double base_price = rs.getDouble(7);

//                    Room p = new Room(id, roomClassName, statusId, roomName, numAdults, statusName, roomImg);
//                    Room p = new Room(className, roomName, numAdults, );
                    Room p = new Room(id, roomClassId, roomClassName, roomName, numAdults, statusName, base_price);
                    list.add(p);
                }
                con.close();
            }

        } catch (SQLException ex) {
            Logger.getLogger(Room.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Room> getRoomByType() {
        ArrayList<Room> list = new ArrayList<>();
        try {
            con = new DBContext().getConnection();
            String sql = "SELECT  room_class.id, room_class.class_name, room_class.base_price, room_class.main_image\n" +
                    "                    FROM     room_class \n" +
                    "where room_class.main_image like '%room.jpg%' order by base_price asc;";

            pr = con.prepareStatement(sql);

            System.out.println(sql);
            System.err.println("ok");
            rs = pr.executeQuery();

            while (rs.next()) {
                String roomClassId = rs.getString(1);
                String roomClassName = rs.getString(2);
                double basePrice = rs.getDouble(3); // Foreign key
                String roomImg = rs.getString(4); // Foreign key

                Room p = new Room(roomClassId, roomClassName, basePrice, roomImg);
                list.add(p);
            }
            con.close();

        } catch (SQLException ex) {
            Logger.getLogger(Room.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Room> getRoomByTypeValid() {
        ArrayList<Room> list = new ArrayList<>();
        try {
            con = new DBContext().getConnection();
            String sql = "SELECT distinct room_class.class_name, room_class.base_price, room_class.main_image\n" +
                    "FROM room INNER JOIN\n" +
                    " room_class ON room.room_class_id = room_class.id INNER JOIN\n" +
                    "room_images ON room_class.id = room_images.room_class_id where state ='available';";

            pr = con.prepareStatement(sql);

            System.out.println(sql);
            System.err.println("ok");
            rs = pr.executeQuery();

            while (rs.next()) {
                String roomClassName = rs.getString(1);
                double basePrice = rs.getDouble(2);
                String roomImg = rs.getString(3);

                Room p = new Room(roomClassName, basePrice, roomImg);
                list.add(p);
            }
            con.close();

        } catch (SQLException ex) {
            Logger.getLogger(Room.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Room> getRoomByRoomClass(String className, String state) {
        ArrayList<Room> list = new ArrayList<>();
        try {
            con = new DBContext().getConnection();
            String sql = "SELECT room.id, room_class.class_name\n" +
                    "FROM room INNER JOIN\n" +
                    " room_class ON room.room_class_id = room_class.id\n" +
                    "where room_class.class_name = ? and room.state = ?" ;


            pr = con.prepareStatement(sql);
            pr.setString(1, className);
            pr.setString(2, state);

            System.out.println(sql);
            System.err.println("ok");
            rs = pr.executeQuery();

            while (rs.next()) {
                String roomId = rs.getString(1);
//                double basePrice =rs.getDouble(2);
                String roomClassName = rs.getString(2);

                Room p = new Room(roomId, roomClassName);
                list.add(p);
            }
            con.close();

        } catch (SQLException ex) {
            Logger.getLogger(Room.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void updateRoom(Room room) {
        try {
            con = new DBContext().getConnection();
            String sql = "UPDATE room "
                    + "SET room_class_id = ?, "
                    + "    name = ?, "
                    + "    num_adults = ?, "
                    + "    state = ?, "
                    + "WHERE id = ?";
            pr = con.prepareStatement(sql);
            pr.setString(1, room.getRoomClassId());
            pr.setString(3, room.getRoomName());
            pr.setInt(4, room.getNumAdults());
            pr.setString(5, room.getStatusName());
            pr.setString(6, room.getId());
            pr.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Room.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteRoom(String roomId) {
        try {
            con = new DBContext().getConnection();
            String sql = "DELETE FROM room WHERE id = ?";
            pr = con.prepareStatement(sql);
            pr.setString(1, roomId);
            pr.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Room.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Room getRoomById(String roomId) {
        Room room = null;
        try {
            con = new DBContext().getConnection();
            String sql = "SELECT room_class.class_name, room.state, room.name, room.num_adults, room.id, base_price "
                    + "FROM room INNER JOIN room_class ON room.room_class_id = room_class.id "
                    + "WHERE room.id = ?";
            pr = con.prepareStatement(sql);
            pr.setString(1, roomId);
            rs = pr.executeQuery();

            if (rs.next()) {
                String roomClassName = rs.getString(1);
                String statusName = rs.getString(2);
                String roomName = rs.getString(3);
                int numAdults = rs.getInt(4);
                String id = rs.getString(5);
                Double base_price = rs.getDouble(6);

                room = new Room(id, roomClassName, roomName, numAdults, statusName, base_price);
            }

            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(roomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return room;
    }

//    public void stateRoomWhenSelect(String roomId){
//        try {
//            con = new DBContext().getConnection();
//                    String sql = "UPDATE room SET state = 'Inprocess' WHERE room.id =? and state='Available';";
//            pr = con.prepareStatement(sql);
//            pr.setString(1, roomId);
//
//            pr.executeUpdate();
//        } catch (SQLException e) {
//            // Xử lý ngoại lệ
//            e.printStackTrace();
//        } finally {
//            // Đóng conection và statement
//            try {
//                if (pr != null) {
//                    pr.close();
//                }
//                if (con != null) {
//                    con.close();
//                }
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }
//    }
//
//    public void stateRoomWhenConfirm(String roomId){
//        try {
//            con = new DBContext().getConnection();
//            String sql = "UPDATE room SET state = 'Unavailable' WHERE room.id =? and state='Inprocess';";
//            pr = con.prepareStatement(sql);
//            pr.setString(1, roomId);
//
//            pr.executeUpdate();
//        } catch (SQLException e) {
//            // Xử lý ngoại lệ
//            e.printStackTrace();
//        } finally {
//            // Đóng conection và statement
//            try {
//                if (pr != null) {
//                    pr.close();
//                }
//                if (con != null) {
//                    con.close();
//                }
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }
//    }

    public  void updateRoomStatus(String roomId, String state) {

        try {
         con = new DBContext().getConnection();
                    String sql = "UPDATE room SET state = ? WHERE id = ?";
            pr = con.prepareStatement(sql);
            pr.setString(1, state);
            pr.setString(2, roomId);

            pr.executeUpdate();
        } catch (SQLException e) {
            // Xử lý ngoại lệ
            e.printStackTrace();
        } finally {
            // Đóng conection và statement
            try {
                if (pr != null) {
                    pr.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

//    public void rollbackRooms() throws SQLException {
//
//        try {
//            con = new DBContext().getConnection();
//            String sql = "UPDATE room SET state = 'Available' WHERE state = 'Inprocess' AND timestamp < ?";
//            pr = con.prepareStatement(sql);
//            pr.setTimestamp(1, new Timestamp(System.currentTimeMillis() - 1 * 60 * 1000));
//
//            pr.executeUpdate();
//        } finally {
//            if (pr != null) {
//                pr.close();
//            }
//            if (con != null) {
//                con.close();
//            }
//        }
//    }


}
