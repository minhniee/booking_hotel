package model;

public class Chart {
    private int month;
    private double price;

    public Chart(int month, double price) {
        this.month = month;
        this.price = price;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
