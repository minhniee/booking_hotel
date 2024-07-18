package model;

public class CartItem {
    private int id;
    private int cartId;
    private String serviceId;
    private int quantity;
    private Service service;

    public CartItem() {
    }

    public CartItem(int id, int cartId, String serviceId, int quantity, Service service) {
        this.id = id;
        this.cartId = cartId;
        this.serviceId = serviceId;
        this.quantity = quantity;
        this.service = service;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public String getServiceId() {
        return serviceId;
    }

    public void setServiceId(String serviceId) {
        this.serviceId = serviceId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }
}
