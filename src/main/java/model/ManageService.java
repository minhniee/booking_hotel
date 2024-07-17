package model;

public class ManageService {
    private String id ;
    private int category_id;
    private String service_name;
    private String description;
    private double price;
    private int quantity;
    private String image;

    public ManageService(String id, int category_id, String service_name, String description, double price, int quantity, String image) {
        this.id = id;
        this.category_id = category_id;
        this.service_name = service_name;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
        this.image = image;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
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
