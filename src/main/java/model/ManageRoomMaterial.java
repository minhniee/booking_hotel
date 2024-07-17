package model;

public class ManageRoomMaterial {
    private String room_id;
    private String material_id;

    public ManageRoomMaterial(String room_id, String material_id) {
        this.room_id = room_id;
        this.material_id = material_id;
    }

    public String getRoom_id() {
        return room_id;
    }

    public void setRoom_id(String room_id) {
        this.room_id = room_id;
    }

    public String getMaterial_id() {
        return material_id;
    }

    public void setMaterial_id(String material_id) {
        this.material_id = material_id;
    }
}
