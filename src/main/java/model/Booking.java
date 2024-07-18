/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.sql.Timestamp;

public class Booking {
    private String id;
    private String roomId;
    private Date checkInDate;
    private Date checkOutDate;
    private int numAdults;
    private int numChildren;
    private double bookingPrice;
    private int paymentId ;
    private String accountId;
    private Timestamp bookingDate;
    private String bookingState;
    
    public Booking(String id, Date checkInDate, Date checkOutDate, int numAdults, int numChildren, double bookingPrice) {
        this.id = id;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
        this.numAdults = numAdults;
        this.numChildren = numChildren;
        this.bookingPrice = bookingPrice;
    }

    public Booking(String id, String roomId, Date checkInDate, Date checkOutDate, int numAdults, int numChildren, double bookingPrice, int paymentId, String accountId,Timestamp bookingDate) {
        this.id = id;
        this.roomId = roomId;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
        this.numAdults = numAdults;
        this.numChildren = numChildren;
        this.bookingPrice = bookingPrice;
        this.paymentId = paymentId;
        this.accountId = accountId;
        this.bookingDate = bookingDate;
    }

    public Booking(String id, String roomId, Date checkInDate, Date checkOutDate, int numAdults, int numChildren, double bookingPrice, int paymentId, String accountId, Timestamp bookingDate, String bookingState) {
        this.id = id;
        this.roomId = roomId;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
        this.numAdults = numAdults;
        this.numChildren = numChildren;
        this.bookingPrice = bookingPrice;
        this.paymentId = paymentId;
        this.accountId = accountId;
        this.bookingDate = bookingDate;
        this.bookingState = bookingState;
    }

    public Booking(String id, String roomId, Date checkInDate, Date checkOutDate, int numAdults, int numChildren, double bookingPrice) {
        this.id = id;
        this.roomId = roomId;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
        this.numAdults = numAdults;
        this.numChildren = numChildren;
        this.bookingPrice = bookingPrice;
    }


    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public String getCustomerId() {
        return accountId;
    }

    public void setCustomerId(String accountId) {
        this.accountId = accountId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId;
    }

    public java.sql.Date getCheckinDate() {
        return (java.sql.Date) checkInDate;
    }

    public void setCheckinDate(Date checkInDate) {
        this.checkInDate = checkInDate;
    }

    public java.sql.Date getCheckoutDate() {
        return (java.sql.Date) checkOutDate;
    }

    public void setCheckoutDate(Date checkOutDate) {
        this.checkOutDate = checkOutDate;
    }

    public int getNumAdults() {
        return numAdults;
    }

    public void setNumAdults(int numAdults) {
        this.numAdults = numAdults;
    }

    public int getNumChildren() {
        return numChildren;
    }

    public void setNumChildren(int numChildren) {
        this.numChildren = numChildren;
    }

    public double getBookingPrice() {
        return bookingPrice;
    }

    public void setBookingPrice(double bookingPrice) {
        this.bookingPrice = bookingPrice;
    }

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    public Timestamp getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Timestamp bookingDate) {
        this.bookingDate = bookingDate;
    }

    public String getBookingState() {
        return bookingState;
    }

    public void setBookingState(String bookingState) {
        this.bookingState = bookingState;
    }

    @Override
    public String toString() {
        return "Booking{" +
                "id='" + id + '\'' +
                ", roomId='" + roomId + '\'' +
                ", checkInDate=" + checkInDate +
                ", checkOutDate=" + checkOutDate +
                ", numAdults=" + numAdults +
                ", numChildren=" + numChildren +
                ", bookingPrice=" + bookingPrice +
                ", paymentId=" + paymentId +
                ", accountId='" + accountId + '\'' +
                ", bookingDate='" + bookingDate + '\'' +
                ", bookingState='" + bookingState + '\'' +
                '}';
    }
}

