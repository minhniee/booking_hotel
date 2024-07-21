package model;

import java.util.Date;

public class BillDetailBooking {
    private int id;
    private String bill_id;
    private String account_id;
    private int material;
    private double total_amount;
    private Date billing_date;

    public BillDetailBooking(int id, String bill_id, String account_id, int material, double total_amount, Date billing_date) {
        this.id = id;
        this.bill_id = bill_id;
        this.account_id = account_id;
        this.material = material;
        this.total_amount = total_amount;
        this.billing_date = billing_date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBill_id() {
        return bill_id;
    }

    public void setBill_id(String bill_id) {
        this.bill_id = bill_id;
    }

    public String getAccount_id() {
        return account_id;
    }

    public void setAccount_id(String account_id) {
        this.account_id = account_id;
    }

    public int getMaterial() {
        return material;
    }

    public void setMaterial(int material) {
        this.material = material;
    }

    public double getTotal_amount() {
        return total_amount;
    }

    public void setTotal_amount(double total_amount) {
        this.total_amount = total_amount;
    }

    public Date getBilling_date() {
        return billing_date;
    }

    public void setBilling_date(Date billing_date) {
        this.billing_date = billing_date;
    }

}
