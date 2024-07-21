package DAO;

import context.DBContext;
import model.Booking;
import model.Room;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
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
            pr.setDate(5, booking.getCheckInDate());
            pr.setDate(6, booking.getCheckOutDate());
            pr.setInt(7, booking.getNumChildren());
            pr.setInt(8, booking.getNumAdults());
            pr.setDouble(9, booking.getBookingPrice());
            pr.setTimestamp(10, booking.getBookingDate());

            pr.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Handle or log the exception as needed
        }
    }

    public Booking GetBookingById(String bookingId) throws SQLException {
        String sql = "SELECT b.[id], [room_id], [payment_id], [account_id], [checkin_date], " +
                "[checkout_date], [num_child], [num_adults], [booking_price], [booking_date] " +
                "FROM booking as b WHERE b.id = ?";

        try (Connection con = new DBContext().getConnection();
             PreparedStatement pr = con.prepareStatement(sql)) {

            pr.setString(1, bookingId);
            try (ResultSet rs = pr.executeQuery()) {
                if (rs.next()) {
                    String id = rs.getString("id");
                    String roomId = rs.getString("room_id");
                    Date checkinDate = rs.getDate("checkin_date");
                    Date checkoutDate = rs.getDate("checkout_date");
                    int numAdults = rs.getInt("num_adults");
                    int numChildren = rs.getInt("num_child");
                    double bookingPrice = rs.getDouble("booking_price");
                    int paymentId = rs.getInt("payment_id");
                    String accountId = rs.getString("account_id");
                    Timestamp bookingDate = rs.getTimestamp("booking_date");

                    return new Booking(id, roomId, checkinDate, checkoutDate, numAdults, numChildren,
                            bookingPrice, paymentId, accountId, bookingDate);
                }
            }
        } catch (SQLException e) {
            throw e;  // Propagate the exception to ensure it is handled by the calling method
        }

        return null;  // Return null if no booking is found
    }



    public void insertStateBooking(String bookingId) {
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
                "  FROM booking as b\n" +
                "  join booking_status as bs on bs.booking_id = b.id ";
        ArrayList<Booking> bookings = new ArrayList<>();
        pr = con.prepareStatement(sql);
        ResultSet rs = pr.executeQuery();
        while (rs.next()) {
            String id = rs.getString("id");
            String roomId = rs.getString("room_id");
            Date checkinDate = rs.getDate("checkin_date");
            Date checkoutDate = rs.getDate("checkout_date");
            int numAdults = rs.getInt("num_adults");
            int numChildren = rs.getInt("num_child");
            double bookingPrice = rs.getDouble("booking_price");
            int paymentId = rs.getInt("payment_id");
            String accountId = rs.getString("account_id");
            Timestamp bookingDate = rs.getTimestamp("booking_date");
            String bookingStatus = rs.getString("state");
            Booking b = new Booking(id, roomId, checkinDate, checkoutDate, numAdults, numChildren, bookingPrice, paymentId, accountId, bookingDate, bookingStatus);
            bookings.add(b);
        }
        return bookings;

    }

    public List<Booking> getAllBookingsAvailableByAccount(String accId) throws SQLException {
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
                "      ,[booking_date]" +
                "  FROM booking as b\n" +
                "  where account_id = ? and checkout_date >= GETDATE()";
        ArrayList<Booking> bookings = new ArrayList<>();
        pr = con.prepareStatement(sql);
        pr.setString(1, accId);
        ResultSet rs = pr.executeQuery();
        while (rs.next()) {
            String id = rs.getString("id");
            String roomId = rs.getString("room_id");
            Date checkinDate = rs.getDate("checkin_date");
            Date checkoutDate = rs.getDate("checkout_date");
            int numAdults = rs.getInt("num_adults");
            int numChildren = rs.getInt("num_child");
            double bookingPrice = rs.getDouble("booking_price");
            int paymentId = rs.getInt("payment_id");
            String accountId = rs.getString("account_id");
            Timestamp bookingDate = rs.getTimestamp("booking_date");
            Booking b = new Booking(id, roomId, checkinDate, checkoutDate, numAdults, numChildren, bookingPrice, paymentId, accountId, bookingDate);
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
                "  join booking_status as bs on bs.booking_id = b.id " +
                "where bs.state = 'pending'";
        ArrayList<Booking> bookings = new ArrayList<>();
        pr = con.prepareStatement(sql);
        ResultSet rs = pr.executeQuery();
        while (rs.next()) {
            String id = rs.getString("id");
            String roomId = rs.getString("room_id");
            Date checkinDate = rs.getDate("checkin_date");
            Date checkoutDate = rs.getDate("checkout_date");
            int numAdults = rs.getInt("num_adults");
            int numChildren = rs.getInt("num_child");
            double bookingPrice = rs.getDouble("booking_price");
            int paymentId = rs.getInt("payment_id");
            String accountId = rs.getString("account_id");

            Timestamp bookingDate = rs.getTimestamp("booking_date");
            String bookingStatus = rs.getString("state");
            Booking b = new Booking(id, roomId, checkinDate, checkoutDate, numAdults, numChildren, bookingPrice, paymentId, accountId, bookingDate, bookingStatus);
            bookings.add(b);
        }
        return bookings;

    }

    public void updateStateBooking(String bookingId, String action) {
        try {
            con = new DBContext().getConnection();
            String sql = "UPDATE booking_status set state=? where booking_id =? ";

            pr = con.prepareStatement(sql);
            if (action.equals("reject")) {
                pr.setString(1, "cancelled");
            } else if (action.equals("confirm")) {
                pr.setString(1, "confirmed");
            }
            pr.setString(2, bookingId);
            pr.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Room.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Booking cancelBooking(String bookingId, String accId) throws SQLException {
        String sql = "SELECT \n" +
                "    b.[id],\n" +
                "    b.[room_id],\n" +
                "    b.[payment_id],\n" +
                "    b.[account_id],\n" +
                "    b.[checkin_date],\n" +
                "    b.[checkout_date],\n" +
                "    b.[num_child],\n" +
                "    b.[num_adults],\n" +
                "    b.[booking_price],\n" +
                "    b.[booking_date],\n" +
                "    payment.id as paymentId \n" +
                "FROM \n" +
                "    booking AS b \n" +
                "    JOIN payment \n" +
                "    ON payment.booking_id = b.id\n" +
                "WHERE \n" +
                "    b.[account_id] = ? AND \n" +
                "    b.id = ?";

        try (Connection con = new DBContext().getConnection();
             PreparedStatement pr = con.prepareStatement(sql)) {

            pr.setString(1, accId);
            pr.setString(2, bookingId);

            try (ResultSet rs = pr.executeQuery()) {
                if (rs.next()) {
                    String id = rs.getString("id");
                    String roomId = rs.getString("room_id");
                    Date checkinDate = rs.getDate("checkin_date");
                    Date checkoutDate = rs.getDate("checkout_date");
                    int numAdults = rs.getInt("num_adults");
                    int numChildren = rs.getInt("num_child");
                    double bookingPrice = rs.getDouble("booking_price");
                    int paymentMethodId = rs.getInt("payment_id"); //paymentmethod_id
                    String payment = rs.getString(11); // paymentId
                    String accountId = rs.getString("account_id");
                    Timestamp bookingDate = rs.getTimestamp("booking_date");

//                    return new Booking(id, roomId, checkinDate, checkoutDate, numAdults, numChildren,bookingPrice, );
                    return new Booking(id, roomId, checkinDate, checkoutDate, numAdults, numChildren, bookingPrice, paymentMethodId, payment,accountId, bookingDate) ;

                }
            } catch (SQLException e) {
                e.printStackTrace();
                throw e;
            }
            return null;

        }

}
    public static void main(String[] args) throws SQLException {
        Booking bookings = new bookingDAO().cancelBooking("E2D6BAF2599A","1234");
        int count = 0;
        System.out.println(bookings.getPaymentIdd());
//        for (Booking a : bookings) {
//            System.out.println(a.toString());
//        }
//        new bookingDAO().confirmBooking("F877D5065A54","confirm");


    }
}