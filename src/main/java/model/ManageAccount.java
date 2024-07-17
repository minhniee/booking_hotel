package model;

import java.sql.Date;

public class ManageAccount {
    private String id;
    private String userName;
    private String password; // Hashed or encrypted password
    private String fullName;
    private String email;
    private String role;
    private Boolean gender; // Corrected declaration
    private String phone;
    private Date dob; // Or LocalDate depending on Java version
    private String address;
    private boolean confirm;

    public ManageAccount(String id, String userName, String password, String fullName, String email, String role, Boolean gender, String phone, Date dob, String address, boolean confirm) {
        this.id = id;
        this.userName = userName;
        this.password = password;
        this.fullName = fullName;
        this.email = email;
        this.role = role;
        this.gender = gender;
        this.phone = phone;
        this.dob = dob;
        this.address = address;
        this.confirm = confirm;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean isConfirm() {
        return confirm;
    }

    public void setConfirm(boolean confirm) {
        this.confirm = confirm;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Boolean getGender() {
        return gender;
    }

    public void setGender(Boolean gender) {
        this.gender = gender;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
