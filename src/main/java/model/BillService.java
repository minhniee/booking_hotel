package model;
import java.sql.Date;
import java.util.List;

public class BillService {
    private int id;
    private String accountId;
    private String bookingId;
    private double totalAmount;
    private Date orderDate;

    public BillService() {
    }

    public BillService(String accountId, String bookingId, double totalAmount) {
        this.accountId = accountId;
        this.bookingId = bookingId;
        this.totalAmount = totalAmount;
    }

    public BillService(int id, String accountId, String bookingId, double totalAmount, Date orderDate) {
        this.id = id;
        this.accountId = accountId;
        this.bookingId = bookingId;
        this.totalAmount = totalAmount;
        this.orderDate = orderDate;
    }

    public BillService(String accountId, String bookingId, double totalAmount, Date orderDate) {
        this.accountId = accountId;
        this.bookingId = bookingId;
        this.totalAmount = totalAmount;
        this.orderDate = orderDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    public String getBookingId() {
        return bookingId;
    }

    public void setBookingId(String bookingId) {
        this.bookingId = bookingId;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }
}
