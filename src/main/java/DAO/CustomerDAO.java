package DAO;

import context.DBContext;
import model.Customer;
import model.Booking;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO {

    public List<Customer> getAllCustomers() {
        List<Customer> customers = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {

            connection = new DBContext().getConnection();
            if (connection != null) {
                String sql = "SELECT id, full_name, email, phone, gender, dob, address \n" +
                        "FROM account";

                statement = connection.prepareStatement(sql);
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String fullName = resultSet.getString("full_name");
                    String email = resultSet.getString("email");
                    String phone = resultSet.getString("phone");
                    boolean gender = resultSet.getBoolean("gender");
                    Date dob = resultSet.getDate("dob");
                    String address = resultSet.getString("address");
                    customers.add(new Customer(id, fullName, email, phone, gender, dob, address, null));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return customers;
    }

    public Customer getCustomerById(int id) {
        Customer customer = null;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = new DBContext().getConnection();
            String sql = "SELECT id, full_name, email, phone, gender, dob, address \n" +
                    "FROM account" +
                    "WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String fullName = resultSet.getString("full_name");
                String email = resultSet.getString("email");
                String phone = resultSet.getString("phone");
                boolean gender = resultSet.getBoolean("gender");
                Date dob = resultSet.getDate("dob");
                String address = resultSet.getString("address");

                List<Booking> bookings = getBookingsByCustomerId(id);

                customer = new Customer(id, fullName, email, phone, gender, dob, address, bookings);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return customer;
    }

    private List<Booking> getBookingsByCustomerId(int customerId) {
        List<Booking> bookings = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = new DBContext().getConnection();
            String sql = "SELECT b.id, b.room_id, b.checkin_date, b.checkout_date, b.num_adults, b.num_child, b.booking_price \n"
                    + "FROM booking b WHERE b.account_id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, customerId);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                String id = resultSet.getString("id");
                String roomId = resultSet.getString("room_id");
                Date checkInDate = resultSet.getDate("checkin_date");
                Date checkOutDate = resultSet.getDate("checkout_date");
                int numAdults = resultSet.getInt("num_adults");
                int numChildren = resultSet.getInt("num_child");
                double bookingPrice = resultSet.getDouble("booking_price");

                bookings.add(new Booking(id, roomId, checkInDate, checkOutDate, numAdults, numChildren, bookingPrice));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bookings;
    }

    public static void main(String[] args) {
        CustomerDAO dao = new CustomerDAO();
        List<Customer> list = dao.getAllCustomers();
        for (Customer c : list) {
            System.out.println(c.toString());
        }
    }


}
