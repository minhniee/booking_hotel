package DAO;

import context.DBContext;
import model.Booking;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class bookingDAO {

    public void insertBooking(Booking booking) {
        Connection con = new DBContext().getConnection();
        String sql = "INSERT INTO booking (id,room_id, payment_id, account_id, checkin_date, checkout_date, num_child, num_adults, booking_price) " +
                "VALUES (?,?, ?, ?, ?, ?, ?, ?, ?)";
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

            pr.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Handle or log the exception as needed
        }
    }

    public void stateBooking(String bookingId, boolean state) {
        Connection con = new DBContext().getConnection();
        String sql = "INSERT INTO booking_status (booking_id, status) " +
                "VALUES (?,?)";
        try (PreparedStatement pr = con.prepareStatement(sql)) {
            pr.setString(1, bookingId);
            pr.setBoolean(2, state);

            pr.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Handle or log the exception as needed
        }
    }



    public static void main(String[] args) {
        Booking b = new Booking("B123", "L1001",  Date.valueOf("2024-06-22"),  Date.valueOf("2024-06-22"), 2,1 , 500.00, 1, "1233");
        new bookingDAO().insertBooking(b);

    }
}
