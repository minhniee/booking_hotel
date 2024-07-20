package DAO;

import context.DBContext;
import model.CartItem;
import model.Material;
import model.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceDAO extends DBContext {
    public List<Service> getAllServices() {
        List<Service> services = new ArrayList<>();
        String query = "SELECT * FROM service";
        try (Connection connection = new DBContext().getConnection();
             PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Service service = new Service();
                service.setId(rs.getString("id"));
                service.setCategoryId(rs.getInt("category_id"));
                service.setServiceName(rs.getString("service_name"));
                service.setDescription(rs.getString("description"));
                service.setPrice(rs.getDouble("price"));
                service.setQuantity(rs.getInt("quantity"));
                service.setImage(rs.getString("image"));
                services.add(service);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return services;
    }

    public ArrayList<Service> getService() {
        ArrayList<Service> service = new ArrayList<>();
        try {
            String sql = "SELECT id,category_id,service_name,description,price,quantity,image\n" +
                    "FROM service";
            PreparedStatement stm = getConnection().prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                service.add(new Service(rs.getString(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getInt(6),
                        rs.getString(7)));
            }

        } catch (Exception e) {

        }
        return service;
    }

    public List<Service> getServicesByCategory(int categoryId) {
        List<Service> services = new ArrayList<>();
        String query = "SELECT * FROM service WHERE category_id = ?";
        try (Connection connection = new DBContext().getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, categoryId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Service service = new Service();
                    service.setId(rs.getString("id"));
                    service.setCategoryId(rs.getInt("category_id"));
                    service.setServiceName(rs.getString("service_name"));
                    service.setDescription(rs.getString("description"));
                    service.setPrice(rs.getDouble("price"));
                    service.setQuantity(rs.getInt("quantity"));
                    service.setImage(rs.getString("image"));
                    services.add(service);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return services;
    }

    public List<Service> searchServices(String keyword) {
        List<Service> services = new ArrayList<>();
        String query = "SELECT * FROM service WHERE service_name LIKE ?";
        try (Connection connection = new DBContext().getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, "%" + keyword + "%");
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Service service = new Service();
                    service.setId(rs.getString("id"));
                    service.setCategoryId(rs.getInt("category_id"));
                    service.setServiceName(rs.getString("service_name"));
                    service.setDescription(rs.getString("description"));
                    service.setPrice(rs.getDouble("price"));
                    service.setQuantity(rs.getInt("quantity"));
                    service.setImage(rs.getString("image"));
                    services.add(service);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return services;
    }

    public Service getServiceById(String id) {
        Service service = null;
        String query = "SELECT * FROM service WHERE id = ?";
        try (Connection connection = new DBContext().getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    service = new Service();
                    service.setId(rs.getString("id"));
                    service.setCategoryId(rs.getInt("category_id"));
                    service.setServiceName(rs.getString("service_name"));
                    service.setDescription(rs.getString("description"));
                    service.setPrice(rs.getDouble("price"));
                    service.setQuantity(rs.getInt("quantity"));
                    service.setImage(rs.getString("image"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return service;
    }

    public void updateQuantityService(Service service) {
        String query = "UPDATE [service] SET quantity = ? WHERE id = ?";
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, service.getQuantity());
            ps.setString(2, service.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void updateService(Service service){
        String query = "UPDATE service SET category_id = ?, service_name = ?, description = ?, price = ?, quantity = ? WHERE id = ?";
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
                ps.setInt(1,service.getCategoryId());
                ps.setString(2,service.getServiceName());
                ps.setString(3,service.getDescription());
                ps.setDouble(4,service.getPrice());
                ps.setInt(6,service.getQuantity());
                ps.setString(7,service.getId());
                ps.executeUpdate();
        } catch (Exception e) {
                e.printStackTrace();
        }

    }

    public void updateService1(Service service) {
        try {
            String sql = "UPDATE service SET  price = ?, quantity = ?\n" +
                    "WHERE id = ?";
            PreparedStatement stm = getConnection().prepareStatement(sql);
            stm.setDouble(1, service.getPrice());
            stm.setInt(2, service.getQuantity());
            stm.setString(3, service.getId());
            stm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Service> getServicesByBooking(String bookingId, String accountId) {
        List<Service> services = new ArrayList<>();
        String query = "  select s.*, bds.quantity from booking b\n" +
                "  join bill_service bs on b.id = bs.booking_id\n" +
                "  left join bill_detail_service bds on bs.id = bds.bill_service_id\n" +
                "  left join [service] s on s.id = bds.service_id\n" +
                "  where b.id = ? and b.account_id = ?";
        try  {
            Connection connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1,bookingId);
            ps.setString(2,accountId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Service service = new Service();
                service.setId(rs.getString("id"));
                service.setCategoryId(rs.getInt("category_id"));
                service.setServiceName(rs.getString("service_name"));
                service.setDescription(rs.getString("description"));
                service.setPrice(rs.getDouble("price"));
                service.setQuantity(rs.getInt(8));
                service.setImage(rs.getString("image"));
                services.add(service);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return services;
    }
}
