package model;

import java.sql.Date;

public class Account {

    private String id;
    private String userName;
    private String password; // Hashed or encrypted password
    private String fullName;
    private String email;
    private String role;
    private Boolean gender; // Corrected declaration
    private String phone;
    private Date dob; // Or LocalDate depending on Java version
    private String address; // Separate Address class if needed
    // Getters, setters, and other methods for user data access and manipulation



    public Account(String id, String userName, String password, String fullName, String email, String role, Boolean gender, String phone, Date dob, String address) {
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
    }

    public Account( String userName, String fullName, String email,  Boolean gender, String phone, Date dob, String address) {

        this.userName = userName;
        this.fullName = fullName;
        this.email = email;
        this.gender = gender;
        this.phone = phone;
        this.dob = dob;
        this.address = address;
    }

    public Account() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Boolean getGender() { // Corrected getter
        return gender;
    }

    public void setGender(Boolean gender) { // Corrected setter
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
