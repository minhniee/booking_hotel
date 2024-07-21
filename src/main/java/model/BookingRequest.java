package model;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class BookingRequest {
    private int person;
    private LocalDate checkInDate;
    private LocalDate checkOutDate;
    private double pricePerNight;

    // Constructor, getter và setter


    public BookingRequest(int person, LocalDate checkInDate, LocalDate checkOutDate, double pricePerNight) {
        this.person = person;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
        this.pricePerNight = pricePerNight;
    }

    public int getPerson() {
        return person;
    }

    public void setPerson(int person) {
        this.person = person;
    }

    public LocalDate getCheckInDate() {
        return checkInDate;
    }

    public void setCheckInDate(LocalDate checkInDate) {
        this.checkInDate = checkInDate;
    }

    public LocalDate getCheckOutDate() {
        return checkOutDate;
    }

    public void setCheckOutDate(LocalDate checkOutDate) {
        this.checkOutDate = checkOutDate;
    }

    public double getPricePerNight() {
        return pricePerNight;
    }

    public void setPricePerNight(double pricePerNight) {
        this.pricePerNight = pricePerNight;
    }

    public double calculateRevenue() {
        long daysBetween = ChronoUnit.DAYS.between(checkInDate, checkOutDate);
        return daysBetween * pricePerNight;
    }
}
