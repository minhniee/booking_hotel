package model;

import java.util.List;

public class RoomClass {
    private String id;
    private String className;
    private double basePrice;
    private String mainImage;
    private List<String> imageUrls; // List to hold multiple image URLs

    // Constructors
    public RoomClass() {}

    public RoomClass(String id, String className, double basePrice, String mainImage, List<String> imageUrls) {
        this.id = id;
        this.className = className;
        this.basePrice = basePrice;
        this.mainImage = mainImage;
        this.imageUrls = imageUrls;
    }

    public RoomClass(String id, String className, String mainImage, List<String> imageUrls) {
        this.id = id;
        this.className = className;
        this.mainImage = mainImage;
        this.imageUrls = imageUrls;
    }


    // Getters and Setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public double getBasePrice() {
        return basePrice;
    }

    public void setBasePrice(double basePrice) {
        this.basePrice = basePrice;
    }

    public String getMainImage() {
        return mainImage;
    }

    public void setMainImage(String mainImage) {
        this.mainImage = mainImage;
    }

    public List<String> getImageUrls() {
        return imageUrls;
    }

    public void setImageUrls(List<String> imageUrls) {
        this.imageUrls = imageUrls;
    }
}
