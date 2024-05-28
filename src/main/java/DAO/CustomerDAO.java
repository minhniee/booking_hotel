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
            String sql = "SELECT c.id, a.full_name, a.email, a.phone, c.gender, c.dob, c.address " +
                         "FROM Customer c JOIN account a ON c.account_id = a.id";
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
            if (resultSet != null) resultSet.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
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
            String sql = "SELECT c.id, a.full_name, a.email, a.phone, c.gender, c.dob, c.address " +
                     "FROM Customer c JOIN account a ON c.account_id = a.id " +
                     "WHERE c.id = ?";
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
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
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
            String sql = "SELECT b.id, b.checkin_date, b.checkout_date, b.num_adults, b.num_child, b.booking_price " +
                         "FROM Booking b WHERE b.customer_id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, customerId);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                Date checkinDate = resultSet.getDate("checkin_date");
                Date checkoutDate = resultSet.getDate("checkout_date");
                int numAdults = resultSet.getInt("num_adults");
                int numChildren = resultSet.getInt("num_child");
                double bookingPrice = resultSet.getDouble("booking_price");

                bookings.add(new Booking(id, checkinDate, checkoutDate, numAdults, numChildren, bookingPrice));
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

    

