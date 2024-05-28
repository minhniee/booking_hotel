/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


package model;

import java.sql.Date;
import java.util.List;

public class Customer {


    private int id;
    private String fullName;
    private String email;
    private String phone;
    private String address;
    private Date dob;
    private boolean gender;
    private List<Booking> bookings;

//    public Customer(int id, String fullName, String email, String phone, List<Booking> bookings) {
//        this.id = id;
//        this.fullName = fullName;
//        this.email = email;
//        this.phone = phone;
//        this.bookings = bookings;
//    }

    public Customer(int id, String fullName, String email, String phone, boolean gender, Date dob, String address , List<Booking> bookings) {
        this.id = id;
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.dob = dob;
        this.gender = gender;
        this.bookings = bookings;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public List<Booking> getBookings() {
        return bookings;
    }

    public void setBookings(List<Booking> bookings) {
        this.bookings = bookings;
    }
}
