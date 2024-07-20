package model;

import java.sql.Date;
import java.sql.Timestamp;

public class Payment {
    private String id;

    private String booking_id;

    private double total;

    private Timestamp payment_date;

    private int payment_method_id;


    public Payment(String id,String booking_id, double total, Timestamp payment_date, int payment_method_id) {
        this.id = id;
        this.booking_id = booking_id;
        this.total = total;
        this.payment_date = payment_date;
        this.payment_method_id = payment_method_id;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getBooking_id() {
        return booking_id;
    }

    public void setBooking_id(String booking_id) {
        this.booking_id = booking_id;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public Timestamp getPayment_date() {
        return payment_date;
    }

    public void setPayment_date(Timestamp payment_date) {
        this.payment_date = payment_date;
    }

    public int getPayment_method_id() {
        return payment_method_id;
    }

    public void setPayment_method_id(int payment_method_id) {
        this.payment_method_id = payment_method_id;
    }
}
