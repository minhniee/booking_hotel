package model;

import java.sql.Date;

public class ManagerBooking {
    private String id;
    private String   room_id;
    private int customer_id;
    private Date checkin_date;
    private Date checkout_date;
    private int num_child;
    private int num_adults;
    private double booking_price;

    public ManagerBooking(String id, String room_id, int customer_id, Date checkin_date, Date checkout_date, int num_child, int num_adults, double booking_price) {
        this.id = id;
        this.room_id = room_id;
        this.customer_id = customer_id;
        this.checkin_date = checkin_date;
        this.checkout_date = checkout_date;
        this.num_child = num_child;
        this.num_adults = num_adults;
        this.booking_price = booking_price;
    }

    public double getBooking_price() {
        return booking_price;
    }

    public void setBooking_price(double booking_price) {
        this.booking_price = booking_price;
    }

    public Date getCheckin_date() {
        return checkin_date;
    }

    public void setCheckin_date(Date checkin_date) {
        this.checkin_date = checkin_date;
    }

    public Date getCheckout_date() {
        return checkout_date;
    }

    public void setCheckout_date(Date checkout_date) {
        this.checkout_date = checkout_date;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getNum_adults() {
        return num_adults;
    }

    public void setNum_adults(int num_adults) {
        this.num_adults = num_adults;
    }

    public int getNum_child() {
        return num_child;
    }

    public void setNum_child(int num_child) {
        this.num_child = num_child;
    }

    public String getRoom_id() {
        return room_id;
    }

    public void setRoom_id(String room_id) {
        this.room_id = room_id;
    }

}
