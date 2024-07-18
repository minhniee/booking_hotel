package DAO;

import context.DBContext;
import model.CartItem;
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
}
