package model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private List<CartItem> items;

    public Cart() {
        this.items = new ArrayList<>();
    }

    public List<CartItem> getItems() {
        return items;
    }

    public void setItems(List<CartItem> items) {
        this.items = items;
    }

    public void addItem(CartItem item) {
        for (CartItem cartItem : items) {
            if (cartItem.getService().getId().equals(item.getService().getId())) {
                cartItem.setQuantity(cartItem.getQuantity() + item.getQuantity());
                return;
            }
        }
        items.add(item);
    }

    public void removeItem(String serviceId) {
        items.removeIf(item -> item.getService().getId().equals(serviceId));
    }

    public double getTotalAmount() {
        return items.stream().mapToDouble(item -> item.getService().getPrice() * item.getQuantity()).sum();
    }
}
