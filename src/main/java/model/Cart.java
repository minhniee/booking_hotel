package model;

import java.util.List;

public class Cart {
    private int id;
    private String accountId;
    private double totalAmount;
    private List<CartItem> cartItems;

    public Cart() {
    }

    public Cart(int id, String accountId, double totalAmount, List<CartItem> cartItems) {
        this.id = id;
        this.accountId = accountId;
        this.totalAmount = totalAmount;
        this.cartItems = cartItems;
    }

    public Cart( String accountId, double totalAmount) {
        this.accountId = accountId;
        this.totalAmount = totalAmount;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public List<CartItem> getCartItems() {
        return cartItems;
    }

    public void setCartItems(List<CartItem> cartItems) {
        this.cartItems = cartItems;
    }
}
