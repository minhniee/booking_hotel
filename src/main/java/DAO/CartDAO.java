package DAO;

import context.DBContext;
import model.Cart;
import model.CartItem;
import model.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartDAO extends DBContext {
    public Cart getCartByAccountId(String accountId) {
        Cart cart = null;
        String query = "SELECT * FROM cart WHERE account_id = ?";
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, accountId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    cart = new Cart();
                    cart.setId(rs.getInt("id"));
                    cart.setAccountId(rs.getString("account_id"));
                    cart.setTotalAmount(rs.getDouble("total_amount"));
                    cart.setCartItems(getCartItemsByCartId(cart.getId()));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cart;
    }

    public List<CartItem> getCartItemsByCartId(int cartId) {
        List<CartItem> cartItems = new ArrayList<>();
        String query = "SELECT ci.*, s.* FROM cart_item ci JOIN service s ON ci.service_id = s.id WHERE ci.cart_id = ?";
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, cartId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    CartItem cartItem = new CartItem();
                    cartItem.setId(rs.getInt("id"));
                    cartItem.setCartId(rs.getInt("cart_id"));
                    cartItem.setServiceId(rs.getString("service_id"));
                    cartItem.setQuantity(rs.getInt("quantity"));

                    Service service = new Service();
                    service.setId(rs.getString("service_id"));
                    service.setCategoryId(rs.getInt("category_id"));
                    service.setServiceName(rs.getString("service_name"));
                    service.setDescription(rs.getString("description"));
                    service.setPrice(rs.getDouble("price"));
                    service.setQuantity(rs.getInt("quantity"));
                    service.setImage(rs.getString("image"));

                    cartItem.setService(service);
                    cartItems.add(cartItem);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cartItems;
    }

    public void addCartItem(CartItem cartItem) {
        String query = "INSERT INTO cart_item (cart_id, service_id, quantity) VALUES (?, ?, ?)";
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, cartItem.getCartId());
            ps.setString(2, cartItem.getServiceId());
            ps.setInt(3, cartItem.getQuantity());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateCartItem(CartItem cartItem) {
        String query = "UPDATE cart_item SET quantity = ? WHERE id = ?";
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, cartItem.getQuantity());
            ps.setInt(2, cartItem.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteCartItem(int cartItemId) {
        String query = "DELETE FROM cart_item WHERE id = ?";
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, cartItemId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateCartTotalAmount(int cartId, double totalAmount) {
        String query = "UPDATE cart SET total_amount = ? WHERE id = ?";
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setDouble(1, totalAmount);
            ps.setInt(2, cartId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
