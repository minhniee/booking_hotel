package model;

public class RoomManager {
    private String id;
    private String  room_class;


    private String room_name;
    private int num_ad;
    private String status_name;

    public RoomManager(String id, String room_class, String room_name, int num_ad, String status_name) {
        this.id = id;
        this.room_class = room_class;


        this.room_name = room_name;
        this.num_ad = num_ad;
        this.status_name = status_name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getStatus_name() {
        return status_name;
    }

    public void setStatus_name(String status_name) {
        this.status_name = status_name;
    }




    public String getRoom_class() {
        return room_class;
    }

    public void setRoom_class(String room_class) {
        this.room_class = room_class;
    }




    public String getRoom_name() {
        return room_name;
    }

    public void setRoom_name(String room_name) {
        this.room_name = room_name;
    }

    public int getNum_ad() {
        return num_ad;
    }

    public void setNum_ad(int num_ad) {
        this.num_ad = num_ad;
    }
}
