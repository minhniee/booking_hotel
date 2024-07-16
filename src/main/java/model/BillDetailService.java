package model;

public class BillDetailService {
    private int id;
    private int billServiceId;
    private String serviceId;
    private int quantity;

    public BillDetailService() {
    }

    public BillDetailService(int billServiceId, String serviceId, int quantity) {
        this.billServiceId = billServiceId;
        this.serviceId = serviceId;
        this.quantity = quantity;
    }

    public BillDetailService(int id, int billServiceId, String serviceId, int quantity) {
        this.id = id;
        this.billServiceId = billServiceId;
        this.serviceId = serviceId;
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBillServiceId() {
        return billServiceId;
    }

    public void setBillServiceId(int billServiceId) {
        this.billServiceId = billServiceId;
    }

    public String getServiceId() {
        return serviceId;
    }

    public void setServiceId(String serviceId) {
        this.serviceId = serviceId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
