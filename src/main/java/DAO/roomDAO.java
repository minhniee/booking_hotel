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

//    public ArrayList<Room> getRoomByType() {
//        ArrayList<Room> list = new ArrayList<>();
//        try {
//            con = new DBContext().getConnection();
//            String sql = "SELECT  room_class.id, room_class.class_name, room_class.base_price, room_class.main_image\n" +
//                    "                    FROM     room_class \n" +
//                    "order by room_class.base_price asc;";
//
//            pr = con.prepareStatement(sql);
//
//            System.err.println("getRoomByType");
//            rs = pr.executeQuery();
//
//            while (rs.next()) {
//                String roomClassId = rs.getString(1);
//                String roomClassName = rs.getString(2);
//                double basePrice = rs.getDouble(3); // Foreign key
//                String roomImg = rs.getString(4); // Foreign key
//
//                Room p = new Room(roomClassId, roomClassName, basePrice, roomImg);
//                list.add(p);
//            }
//            con.close();
//
//        } catch (SQLException ex) {
//            Logger.getLogger(Room.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return list;
//    }

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

    public  List<String> checkAllRoomsStatus(LocalDate checkInDate ,LocalDate checkOutDate ) {
        List<String> availableRooms = new ArrayList<>();
        String query = "SELECT id, name, room_class_id FROM room";
        String bookingQuery = "SELECT * FROM booking WHERE room_id = ? AND(  ? BETWEEN checkin_date AND checkout_date OR ? BETWEEN checkin_date AND checkout_date)";
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

    public  List<String> checkAllRoomsStatusByClassId(LocalDate checkInDate ,LocalDate checkOutDate, String roomClassId ) {
        List<String> availableRooms = new ArrayList<>();
        String query = "SELECT id, name, room_class_id FROM room where room_class_id = ?";
        String bookingQuery = "SELECT * FROM booking WHERE room_id = ? AND(  ? BETWEEN checkin_date AND checkout_date OR ? BETWEEN checkin_date AND checkout_date)";
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

        LocalDate currentDate =LocalDate.parse("07/04/2024", formatter);
        LocalDate currentDate2 = LocalDate.parse("07/13/2024", formatter);
                ;
        List<String> availableRooms = r.checkAllRoomsStatusByClassId(currentDate,currentDate2,"EXS");

        System.out.println( availableRooms.stream().findFirst().get());
        System.out.println(availableRooms.get(0));
        System.out.println("Available rooms on " + currentDate + ": " + availableRooms);
        List<Room> availableRooms2 = r.getRoomClasses(availableRooms);
        for (Room room : availableRooms2) {
            System.out.println(room);
        }
    }
}





