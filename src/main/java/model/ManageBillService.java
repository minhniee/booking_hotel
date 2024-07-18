package model;

import java.util.Date;

public class ManageBillService {
    private String description;
    private String service_name;
    private String category_name;
    private int quantity;
    private Date order_date;
    private double price;

    public ManageBillService(String description, String service_name, String category_name, int quantity, Date order_date, double price) {
        this.description = description;
        this.service_name = service_name;
        this.category_name = category_name;
        this.quantity = quantity;
        this.order_date = order_date;
        this.price = price;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Date getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Date order_date) {
        this.order_date = order_date;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getService_name() {
        return service_name;
    }

    public void setService_name(String service_name) {
        this.service_name = service_name;
    }
}
