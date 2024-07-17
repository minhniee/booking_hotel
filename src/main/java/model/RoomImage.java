package model;

import context.DBContext;

public class RoomImage extends DBContext {
    private int id;
    private String room_class_id;
    private String image;

    public RoomImage(int id, String room_class_id, String image) {
        this.id = id;
        this.room_class_id = room_class_id;
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getRoom_class_id() {
        return room_class_id;
    }

    public void setRoom_class_id(String room_class_id) {
        this.room_class_id = room_class_id;
    }
}
