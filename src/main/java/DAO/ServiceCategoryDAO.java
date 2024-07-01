package DAO;

import context.DBContext;
import model.ServiceCategory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ServiceCategoryDAO {
    public List<ServiceCategory> getAllCategories() {
        List<ServiceCategory> categories = new ArrayList<>();
        String query = "SELECT * FROM service_category";
        try (Connection connection = new DBContext().getConnection();
             PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                ServiceCategory category = new ServiceCategory();
                category.setId(rs.getInt("id"));
                category.setCategoryName(rs.getString("category_name"));
                categories.add(category);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return categories;
    }
}
