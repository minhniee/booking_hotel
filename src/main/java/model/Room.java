package model;

import java.util.List;

public class Room {
    private String id;
    private String roomClassId; // Foreign key
    private String roomClassName;
    private int statusId; // Foreign key
    private String roomName;
    private int numAdults;
    private String statusName;
    private String roomImg;
    private double basePrice;

    public Room(String id, String roomClassId, String roomClassName, double basePrice, String roomImg) {
        this.id = id;
        this.roomClassId = roomClassId;
        this.roomClassName = roomClassName;
        this.basePrice = basePrice;
        this.roomImg = roomImg;
    }
    public Room(String id, String roomClassId, String roomClassName, int statusId, String roomName, int numAdults, String statusName, String roomImg, double basePrice) {
        this.id = id;
        this.roomClassId = roomClassId;
        this.roomClassName = roomClassName;
        this.statusId = statusId;
        this.roomName = roomName;
        this.numAdults = numAdults;
        this.statusName = statusName;
        this.roomImg = roomImg;
        this.basePrice = basePrice;
    }
    public Room(String id,String roomClassId,String roomClassName, String roomName, int numAdults, String statusName,double basePrice) {
        this.id = id;
        this.roomClassId = roomClassId;
        this.roomClassName = roomClassName;
        this.roomName = roomName;
        this.numAdults = numAdults;
        this.statusName = statusName;
        this.basePrice = basePrice;
    }
    public Room(String id,String roomClassName, String roomName, int numAdults, String statusName,double basePrice) {
        this.id = id;
        this.roomClassName = roomClassName;
        this.roomName = roomName;
        this.numAdults = numAdults;
        this.statusName = statusName;
        this.basePrice = basePrice;
    }
    

    public Room(String roomClassName, double basePrice, String roomImg) {
        this.roomClassName = roomClassName;
        this.basePrice = basePrice;
        this.roomImg = roomImg;
    }
    public Room(String id, String roomClassId, int statusId, String roomName, int numAdults, String statusName, String roomImg) {

        this.id = id;
        this.roomClassId = roomClassId;
        this.statusId = statusId;
        this.roomName = roomName;
        this.numAdults = numAdults;
        this.statusName = statusName;
        this.roomImg = roomImg;
    }

    public Room(String roomClassId, String roomClassName, double basePrice, String roomImg) {
        this.roomClassId = roomClassId;
        this.roomClassName = roomClassName;
        this.basePrice = basePrice;
        this.roomImg = roomImg;
    }

    public Room(String roomId, String roomClassName) {
        this.id = roomId;
        this.roomClassName = roomClassName;
    }


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRoomClassId() {
        return roomClassId;
    }

    public void setRoomClassId(String roomClassId) {
        this.roomClassId = roomClassId;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public int getNumAdults() {
        return numAdults;
    }

    public void setNumAdults(int numAdults) {
        this.numAdults = numAdults;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    public String getRoomImg() {
        return roomImg;
    }

    public void setRoomImg(String roomImg) {
        this.roomImg = roomImg;
    }

    public double getBasePrice() {
        return basePrice;
    }

    public void setBasePrice(double basePrice) {
        this.basePrice = basePrice;
    }

    public String getRoomClassName() {
        return roomClassName;
    }

    public void setRoomClassName(String roomClassName) {
        this.roomClassName = roomClassName;
    }


    @Override
    public String toString() {
        return "Room{" +
                "id='" + id + '\'' +
                ", roomClassId='" + roomClassId + '\'' +
                ", roomClassName='" + roomClassName + '\'' +
                ", statusId=" + statusId +
                ", roomName='" + roomName + '\'' +
                ", numAdults=" + numAdults +
                ", statusName='" + statusName + '\'' +
                ", roomImg='" + roomImg + '\'' +
                ", basePrice=" + basePrice +
                '}';
    }
}
