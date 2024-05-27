package DAO;

import context.DBContext;
import model.Room;

import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.concurrent.TimeUnit;
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
            String sql = "SELECT [id]\n" +
                    "      ,[room_class_id]\n" +
                    "      ,[status_id]\n" +
                    "      ,[name]\n" +
                    "      ,[num_adults]\n" +
                    "      ,[status_name]\n" +
                    "      ,[room_img]\n" +
                    "  FROM [booking_hotel_v3].[dbo].[room]";
            pr = con.prepareStatement(sql);

            System.out.println(sql);
            rs = pr.executeQuery();

            while (rs.next()) {
                 String id = rs.getString(1);
                 String roomClassId =rs.getString(2); // Foreign key
                 int statusId =rs.getInt(3); // Foreign key
                 String roomName =rs.getString(4);
                 int numAdults =rs.getInt(5);
                 String statusName=rs.getString(6);
                 String roomImg=rs.getString(7);

                Room p = new Room(id,roomClassId,statusId,roomName,numAdults,statusName,roomImg);
                list.add(p);
            }
            con.close();

        } catch (SQLException ex) {
            Logger.getLogger(Room.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Room> getRoomByType() {
        ArrayList<Room> list = new ArrayList<>();
        try {
            con = new DBContext().getConnection();
            String sql = "SELECT distinct       room_class.class_name, room_class.base_price, room.room_img\n" +
                    "FROM            room INNER JOIN\n" +
                    "room_class ON room.room_class_id = room_class.id\n" +
                    "where room_img like '%room.jpg%' order by base_price asc";

            pr = con.prepareStatement(sql);

            System.out.println(sql);
            System.err.println("ok");
            rs = pr.executeQuery();

            while (rs.next()) {
                String roomClassName = rs.getString(1);
                double basePrice =rs.getDouble(2); // Foreign key
                String roomImg =rs.getString(3); // Foreign key

                Room p = new Room(roomClassName,basePrice,roomImg);
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
            String sql = "SELECT distinct       room_class.class_name, room_class.base_price, room.room_img\n" +
                    "FROM            room INNER JOIN\n" +
                    "room_class ON room.room_class_id = room_class.id\n" +
                    "where room_img like '%room.jpg%' AND  room.status_name ='Available'  order by base_price asc";

            pr = con.prepareStatement(sql);

            System.out.println(sql);
            System.err.println("ok");
            rs = pr.executeQuery();

            while (rs.next()) {
                String roomClassName = rs.getString(1);
                double basePrice =rs.getDouble(2); // Foreign key
                String roomImg =rs.getString(3); // Foreign key

                Room p = new Room(roomClassName,basePrice,roomImg);
                list.add(p);
            }
            con.close();

        } catch (SQLException ex) {
            Logger.getLogger(Room.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }


    public static void main(String[] args) {
//        roomDAO dao = new roomDAO();
//        ArrayList<Room>  list = dao.getRoomByTypeValid();
//        for (Room r : list) {
//            System.out.println(r.toString());
//        }

        SimpleDateFormat myFormat = new SimpleDateFormat("dd MMM, yyyy");
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd MMM, yyyy");
        String inputString1 = "30 May, 2024";
        String inputString2 = "25 May, 2024";
        LocalDateTime now = LocalDateTime.now();
        String currentDate = dtf.format(now);

        try {
            Date date1 = myFormat.parse(inputString1);
            Date date2 = myFormat.parse(currentDate);

            long diff = date2.getTime() - date1.getTime();
            System.out.println ("Days: " + TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS));
        } catch (ParseException e) {
            e.printStackTrace();
        }
//        System.out.println(new DBContext().getConnection());
    }
}
