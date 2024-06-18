package model;

import java.util.Date;

public class DetailListBooking {
    private String name;
    private String phone;
    private String email;
    private String material;
    private Date payment_date;
    private Date billing_date;
    private String payment_name;
    private double total_amount;

    public DetailListBooking(String name, String phone, String email, String material, Date payment_date, Date billing_date,String payment_name, double total_amount) {
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.material = material;
        this.payment_date = payment_date;
        this.billing_date = billing_date;
        this.payment_name = payment_name;
        this.total_amount = total_amount;
    }

    public Date getBilling_date() {
        return billing_date;
    }

    public void setBilling_date(Date billing_date) {
        this.billing_date = billing_date;
    }

    public double getTotal_amount() {
        return total_amount;
    }

    public void setTotal_amount(double total_amount) {
        this.total_amount = total_amount;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getPayment_date() {
        return payment_date;
    }

    public void setPayment_date(Date payment_date) {
        this.payment_date = payment_date;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public String getPayment_name() {
        return payment_name;
    }

    public void setPayment_name(String payment_name) {
        this.payment_name = payment_name;
    }
}
