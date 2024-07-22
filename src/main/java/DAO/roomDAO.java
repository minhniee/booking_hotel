package DAO;

import context.DBContext;
import model.Room;

import java.sql.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
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
                String sql = "SELECT  r.id, r.room_class_id, c.class_name, r.state, r.num_adults, c.base_price, c.main_image\n" +
                        "FROM room r\n" +
                        "JOIN room_class c ON r.room_class_id = c.id;";
                pr = con.prepareStatement(sql);

                System.out.println(sql);
                rs = pr.executeQuery();

                while (rs.next()) {
                    String id = rs.getString(1);
                    String roomClassId = rs.getString(2);
                    String roomClassName = rs.getString(3);
                    String statusName = rs.getString(4); // Foreign key
                    int numAdults = rs.getInt(5);
                    Double base_price = rs.getDouble(6);
                    String roomImg = rs.getString(7);

//                    Room p = new Room(id, roomClassName, statusId, roomName, numAdults, statusName, roomImg);
//                    Room p = new Room(className, roomName, numAdults, );
                    Room p = new Room(id, roomClassId, roomClassName, statusName, numAdults, base_price, roomImg);
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
                    "order by room_class.base_price asc;";

            pr = con.prepareStatement(sql);

            System.err.println("getRoomByType");
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

    public ArrayList<Room> getRoomByRoomClass(String className, LocalDate checkInDate) {
        ArrayList<Room> list = new ArrayList<>();
        try {
            con = new DBContext().getConnection();
            String sql = "SELECT room.id, room_class.class_name\n" +
                    "FROM room INNER JOIN\n" +
                    " room_class ON room.room_class_id = room_class.id\n" +
                    "where room_class.class_name = ? " ;


            pr = con.prepareStatement(sql);
            pr.setString(1, className);

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

//    public void updateRoom(Room room) {
//        try {
//            con = new DBContext().getConnection();
//            String sql = "UPDATE room "
//                    + "SET room_class_id = ?, "
//                    + "    name = ?, "
//                    + "    num_adults = ?, "
//                    + "    state = ?, "
//                    + "WHERE id = ?";
//            pr = con.prepareStatement(sql);
//            pr.setString(1, room.getRoomClassId());
//            pr.setString(3, room.getRoomName());
//            pr.setInt(4, room.getNumAdults());
//            pr.setString(5, room.getStatusName());
//            pr.setString(6, room.getId());
//            pr.executeUpdate();
//            con.close();
//        } catch (SQLException ex) {
//            Logger.getLogger(Room.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }

    public void updateRoom(Room room) {
        Connection con = null;
        PreparedStatement pr1 = null;
        PreparedStatement pr2 = null;

        try {
            con = new DBContext().getConnection();
            con.setAutoCommit(false);

            // Cập nhật bảng room
            String sqlRoom = "UPDATE room "
                    + "SET room_class_id = ?, "
                    + "    name = ?, "
                    + "    num_adults = ?, "
                    + "    state = ? "
                    + "WHERE id = ?";
            pr1 = con.prepareStatement(sqlRoom);
            pr1.setString(1, room.getRoomClassId());
            pr1.setString(2, room.getRoomName());
            pr1.setInt(3, room.getNumAdults());
            pr1.setString(4, room.getStatusName());
            pr1.setString(5, room.getId());
            pr1.executeUpdate();

            // Cập nhật bảng room_class
            String sqlRoomClass = "UPDATE room_class "
                    + "SET class_name = ?, "
                    + "    base_price = ?, main_image = ? "
                    + "WHERE id = (SELECT room_class_id FROM room WHERE id = ?)";
            pr2 = con.prepareStatement(sqlRoomClass);
            pr2.setString(1, room.getRoomClassName());
            pr2.setDouble(2, room.getBasePrice());
            pr2.setString(3, room.getRoomImg());
            pr2.setString(4, room.getId());
            pr2.executeUpdate();

            con.commit();

        } catch (SQLException ex) {
            if (con != null) {
                try {
                    con.rollback(); // Rollback nếu có lỗi
                } catch (SQLException e) {
                    Logger.getLogger(Room.class.getName()).log(Level.SEVERE, null, e);
                }
            }
            Logger.getLogger(Room.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (pr1 != null) try { pr1.close(); } catch (SQLException ex) { /* ignore */ }
            if (pr2 != null) try { pr2.close(); } catch (SQLException ex) { /* ignore */ }
            if (con != null) try { con.close(); } catch (SQLException ex) { /* ignore */ }
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

    public Room getRoomById(String id) {
        Room room = null;
        try {
            con = new DBContext().getConnection();
            String sql = "SELECT r.id, r.room_class_id, c.class_name, r.state, r.num_adults, c.base_price, c.main_image " +
                    "FROM room r JOIN room_class c ON r.room_class_id = c.id " +
                    "WHERE r.id = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                room = new Room(rs.getString("id"),
                        rs.getString("room_class_id"),
                        rs.getString("class_name"),
                        rs.getString("state"),
                        rs.getInt("num_adults"),
                        rs.getDouble("base_price"),
                        rs.getString("main_image"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(roomDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) rs.close();
                if (pr != null) pr.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return room;
    }


    public  List<String> checkAllRoomsStatus(LocalDate checkInDate ,LocalDate checkOutDate ) {
        List<String> availableRooms = new ArrayList<>();
        String query = "SELECT id, name, room_class_id FROM room";
//        String bookingQuery = "SELECT * FROM booking WHERE room_id = ? AND(  ? BETWEEN checkin_date AND checkout_date OR ? BETWEEN checkin_date AND checkout_date)";
        String bookingQuery = "SELECT booking.* FROM booking join dbo.booking_status as bs on booking.id = bs.booking_id  WHERE room_id like ? AND( bs.state ='confirmed' or bs.state ='inprocess' ) AND(  ? BETWEEN checkin_date AND checkout_date OR ? BETWEEN checkin_date AND checkout_date)";

        try{
            con = new DBContext().getConnection();
            pr = con.prepareStatement(query);
            rs= pr.executeQuery();

            while (rs.next()) {
                String roomId = rs.getString("id");
                String roomName = rs.getString("name");
                String room_class_id = rs.getString("room_class_id");

                try (PreparedStatement pstmt = con.prepareStatement(bookingQuery)) {
                    pstmt.setString(1, roomId);
                    pstmt.setDate(2, Date.valueOf(checkInDate));
                    pstmt.setDate(3, Date.valueOf(checkOutDate));
                    ResultSet rsBookings = pstmt.executeQuery();

                    if (!rsBookings.next()) {
                        availableRooms.add(roomId);
                    }
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return availableRooms;
    }

    public  List<String> getRoomByClassId(LocalDate checkInDate ,LocalDate checkOutDate, String roomClassId ) {
        List<String> availableRooms = new ArrayList<>();
        String query = "SELECT id, name, room_class_id FROM room where room_class_id = ?";
//        String bookingQuery = "SELECT * FROM booking WHERE room_id = ? AND(  ? BETWEEN checkin_date AND checkout_date OR ? BETWEEN checkin_date AND checkout_date) ";
        String bookingQuery = "SELECT booking.* FROM booking join dbo.booking_status as bs on booking.id = bs.booking_id  WHERE room_id like ? and (bs.state like 'confirmed' or bs.state like 'inprocess') AND(  ? BETWEEN checkin_date AND checkout_date OR ? BETWEEN checkin_date AND checkout_date)";
        try{
            con = new DBContext().getConnection();
            pr = con.prepareStatement(query);
            pr.setString(1, roomClassId);
            rs= pr.executeQuery();

            while (rs.next()) {
                String roomId = rs.getString("id");
                String roomName = rs.getString("name");
                String room_class_id = rs.getString("room_class_id");

                try (PreparedStatement pstmt = con.prepareStatement(bookingQuery)) {
                    pstmt.setString(1, roomId);
                    pstmt.setDate(2, Date.valueOf(checkInDate));
                    pstmt.setDate(3, Date.valueOf(checkOutDate));
                    ResultSet rsBookings = pstmt.executeQuery();

                    if (!rsBookings.next()) {
                        availableRooms.add(roomId);
                    }
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return availableRooms;
    }

    public ArrayList<Room> getRoomClasses(List<String> roomIds) {
        ArrayList<Room> roomClasses = new ArrayList<>();
        try {
            con = new DBContext().getConnection();

            // Constructing the SQL query
            String query = "SELECT distinct rc.id, rc.class_name, rc.base_price, rc.main_image " +
                    "FROM room_class rc " +
                    "JOIN room r ON r.room_class_id = rc.id " +
                    "WHERE r.id IN (";

            // Appending placeholders for each room ID
            for (int i = 0; i < roomIds.size(); i++) {
                query += (i == 0 ? "?" : ", ?");
            }
            query += ") ORDER BY rc.base_price ASC";

            pr = con.prepareStatement(query);

            // Setting parameters for the prepared statement
            for (int i = 0; i < roomIds.size(); i++) {
                pr.setString(i + 1, roomIds.get(i));
            }

            rs = pr.executeQuery();

            while (rs.next()) {
                Room roomClass = new Room();
                roomClass.setRoomClassId(rs.getString("id"));
                roomClass.setRoomClassName(rs.getString("class_name"));
                roomClass.setBasePrice(rs.getDouble("base_price"));
                roomClass.setRoomImg(rs.getString("main_image"));
                // Set other properties as needed
                roomClasses.add(roomClass);
            }
        } catch (SQLException ex) {
            Logger.getLogger(roomDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) rs.close();
                if (pr != null) pr.close();
                if (con != null) con.close();
            } catch (SQLException ex) {
                Logger.getLogger(roomDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return roomClasses;
    }



    public static void main(String[] args) {
        roomDAO r = new roomDAO();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");

        LocalDate currentDate =LocalDate.parse("07/23/2024", formatter);
        LocalDate currentDate2 = LocalDate.parse("07/30/2024", formatter);
        ;
        List<String> availableRooms = r.checkAllRoomsStatus(currentDate,currentDate2);
        List<String> availableRooms1 = r.getRoomByClassId(currentDate,currentDate2,"PRD");

//        System.out.println( availableRooms1.stream().findFirst().get());
        System.out.println(availableRooms1.get(0));
        System.out.println("Available rooms on " + currentDate + ": " + availableRooms);
        List<Room> availableRooms2 = r.getRoomClasses(availableRooms);
//        for (String room : availableRooms) {
//            System.out.println(room);
//        }
    }
}





