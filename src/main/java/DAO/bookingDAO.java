package DAO;

import context.DBContext;
import model.Booking;
import model.Room;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class bookingDAO {
    protected Connection con = null;
    protected PreparedStatement pr = null;
    protected ResultSet rs = null;

    public void insertBooking(Booking booking) {
        Connection con = new DBContext().getConnection();
        String sql = "INSERT INTO booking (id,room_id, payment_id, account_id, checkin_date, checkout_date, num_child, num_adults, booking_price, booking_date) " +
                "VALUES (?,?, ?, ?, ?, ?, ?, ?, ?,?)";
        try (PreparedStatement pr = con.prepareStatement(sql)) {
            pr.setString(1, booking.getId());
            pr.setString(2, booking.getRoomId());
            pr.setInt(3, booking.getPaymentId());
            pr.setString(4, booking.getCustomerId());
            pr.setDate(5, booking.getCheckinDate());
            pr.setDate(6, booking.getCheckoutDate());
            pr.setInt(7, booking.getNumChildren());
            pr.setInt(8, booking.getNumAdults());
            pr.setDouble(9, booking.getBookingPrice());
            pr.setDate(10, booking.getBookingDate());

            pr.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Handle or log the exception as needed
        }
    }

    public void stateBooking(String bookingId) {
        Connection con = new DBContext().getConnection();
        String sql = "INSERT INTO booking_status (booking_id, state) " +
                "VALUES (?,?)";
        try (PreparedStatement pr = con.prepareStatement(sql)) {
            pr.setString(1, bookingId);
            pr.setString(2, "pending");

            pr.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Handle or log the exception as needed
        }
    }

    public ArrayList<Booking> GetAllBookings() throws SQLException {
        con = new DBContext().getConnection();
        String sql = "SELECT b.[id]\n" +
                "      ,[room_id]\n" +
                "      ,[payment_id]\n" +
                "      ,[account_id]\n" +
                "      ,[checkin_date]\n" +
                "      ,[checkout_date]\n" +
                "      ,[num_child]\n" +
                "      ,[num_adults]\n" +
                "      ,[booking_price]\n" +
                "      ,[booking_date],\n" +
                "\t  bs.state\n" +
                "  FROM [booking] as b\n" +
                "  join booking_status as bs on bs.booking_id = b.id ";
        ArrayList<Booking> bookings = new ArrayList<>();
        pr = con.prepareStatement(sql);
        ResultSet rs = pr.executeQuery();
        while (rs.next()) {
            String id = rs.getString("id");
            String roomId = rs.getString("room_id");
            Date checkInDate = rs.getDate("checkin_date");
            Date checkOutDate = rs.getDate("checkout_date");
            int numAdults = rs.getInt("num_adults");
            int numChildren = rs.getInt("num_child");
            double bookingPrice = rs.getDouble("booking_price");
            int paymentId = rs.getInt("payment_id");
            String accountId = rs.getString("account_id");
            Date bookingDate = rs.getDate("booking_date");
            String bookingStatus = rs.getString("state");
            Booking b = new Booking(id, roomId, checkInDate, checkOutDate, numAdults, numChildren, bookingPrice, paymentId, accountId, bookingDate,bookingStatus);
            bookings.add(b);
        }
        return bookings;

    }

    public ArrayList<Booking> GetBookingsPending() throws SQLException {
        con = new DBContext().getConnection();
        String sql = "SELECT b.[id]\n" +
                "      ,[room_id]\n" +
                "      ,[payment_id]\n" +
                "      ,[account_id]\n" +
                "      ,[checkin_date]\n" +
                "      ,[checkout_date]\n" +
                "      ,[num_child]\n" +
                "      ,[num_adults]\n" +
                "      ,[booking_price]\n" +
                "      ,[booking_date],\n" +
                "\t  bs.state\n" +
                "  FROM booking as b\n" +
                "  join booking_status as bs on bs.booking_id = b.id "+
                "where bs.state = 'pending'";
        ArrayList<Booking> bookings = new ArrayList<>();
        pr = con.prepareStatement(sql);
        ResultSet rs = pr.executeQuery();
        while (rs.next()) {
            String id = rs.getString("id");
            String roomId = rs.getString("room_id");
            Date checkInDate = rs.getDate("checkin_date");
            Date checkOutDate = rs.getDate("checkout_date");
            int numAdults = rs.getInt("num_adults");
            int numChildren = rs.getInt("num_child");
            double bookingPrice = rs.getDouble("booking_price");
            int paymentId = rs.getInt("payment_id");
            String accountId = rs.getString("account_id");
            Date bookingDate = rs.getDate("booking_date");
            String bookingStatus = rs.getString("state");
            Booking b = new Booking(id, roomId, checkInDate, checkOutDate, numAdults, numChildren, bookingPrice, paymentId, accountId, bookingDate,bookingStatus);
            bookings.add(b);
        }
        return bookings;

    }

    public void confirmBooking(String bookingId, String action) {
        try {
            con = new DBContext().getConnection();
            String sql = "UPDATE booking_status set state=? where booking_id =? ";

            pr = con.prepareStatement(sql);
            if (action.equals("reject")){
            pr.setString(1, "cancelled");
            }else if(action.equals("confirm")) {
            pr.setString(1, "confirmed");
            }
            pr.setString(2, bookingId);
            pr.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Room.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


    public static void main(String[] args) throws SQLException {
        ArrayList<Booking> bookings = new bookingDAO().GetAllBookings();
        int count = 0;
        for (Booking a : bookings) {
            System.out.println(a.toString());
        }
//        new bookingDAO().confirmBooking("F877D5065A54","confirm");


    }
}
