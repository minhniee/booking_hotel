<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <title>Title</title>
    <style>
        .text-right{
            text-align: center;
            margin: auto;
            font-size: 40px;
            font-family: auto;
        }
        .table{
            background-color: #f6e7d1;
        }

        .input-group-text, select.form-control:not([size]):not([multiple]), .form-control:not(.form-control-sm):not(.form-control-lg) {
            border-color: black;
        }
        .btn-primary {
            background-color: blue;
        }


    </style>
</head>
<body>
<%@include file="dashBoardStaff1.jsp"%>
<div class="main-content" >
    <div class="table">
    <form action="profileStaff" method="post" onsubmit="return validateForm()">
        <div class="p-3 py-5" style="border-style: groove;    border-radius: 30px;">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h4 class="text-right">Profile Settings</h4>
            </div>
            <div class="row mt-2">
                <div class="col-md-6">
                    <label class="labels">User name</label>
                    <input readonly style="background-color: #e9e8e8; font-weight:520;" type="text" name="userName" class="form-control" placeholder="first name" value="${account.userName}">
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-md-12">
                    <label class="labels">Full name</label>
                    <input type="text" name="fname" class="form-control" placeholder="enter full name" value="${account.fullName}">
                    <small class="error-message text-danger" id="fullNameError"></small>
                </div>
                <div class="col-md-12">
                    <label class="labels">Email</label>
                    <input type="text" name="email" class="form-control" placeholder="enter email" value="${account.email}" readonly>
                    <small class="error-message text-danger" id="emailError"></small>
                </div>
                <div class="col-md-12">
                    <label class="labels">Gender</label>
                    <select name="gender" class="form-control">
                        <option value="true" ${account.gender ? 'selected' : ''}>Male</option>
                        <option value="false" ${!account.gender ? 'selected' : ''}>Female</option>
                    </select>
                </div>
                <div class="col-md-12">
                    <label class="labels">Phone</label>
                    <input type="text" name="phone" class="form-control" placeholder="enter phone number" value="${account.phone}">
                    <small class="error-message text-danger" id="phoneError"></small>
                </div>
                <div class="col-md-12">
                    <label class="labels">Date of birth</label>
                    <input type="date" name="dob" class="form-control" max="2024-07-31" value="${account.dob}">
                    <small class="error-message text-danger" id="dobError"></small>
                </div>
                <div class="col-md-12">
                    <label class="labels">Address</label>
                    <input type="text" name="address" class="form-control" placeholder="enter address" value="${account.address}">
                    <small class="error-message text-danger" id="addressError"></small>
                </div>
            </div>
            <div class="mt-5 text-center">
                <button class="btn btn-primary profile-button" type="submit">Save Profile</button>
            </div>


        </div>
    </form>
    </div>
</div>

</div>
</body>
</html>
<script>
    function validateForm() {
        const fullName = document.querySelector('[name="fname"]').value.trim();
        const email = document.querySelector('[name="email"]').value.trim();
        const phone = document.querySelector('[name="phone"]').value.trim();
        const dob = document.querySelector('[name="dob"]').value.trim();
        const address = document.querySelector('[name="address"]').value.trim();

        const nameRegex = /^[A-Z][a-z]*(?: [A-Z][a-z]*){0,2}$/;
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        const phoneRegex = /^\d{10}$/;

        let isValid = true;

        // Clear previous error messages
        document.getElementById('fullNameError').textContent = '';
        document.getElementById('emailError').textContent = '';
        document.getElementById('phoneError').textContent = '';
        document.getElementById('dobError').textContent = '';
        document.getElementById('addressError').textContent = '';

        if (!fullName) {
            document.getElementById('fullNameError').textContent = 'Full name is required.';
            isValid = false;
        } else if (!nameRegex.test(fullName)) {
            document.getElementById('fullNameError').textContent = 'Full name must start with a capital letter and only contain letters and spaces.';
            isValid = false;
        } else if (fullName.length > 20) {
            document.getElementById('fullNameError').textContent = 'Full name cannot be longer than 20 characters.';
            isValid = false;
        }

        if (!email) {
            document.getElementById('emailError').textContent = 'Email is required.';
            isValid = false;
        } else if (!emailRegex.test(email)) {
            document.getElementById('emailError').textContent = 'Please enter a valid email address.';
            isValid = false;
        }

        if (!phone) {
            document.getElementById('phoneError').textContent = 'Phone number is required.';
            isValid = false;
        } else if (!phoneRegex.test(phone)) {
            document.getElementById('phoneError').textContent = 'Phone number must be exactly 10 digits.';
            isValid = false;
        }

        if (!dob) {
            document.getElementById('dobError').textContent = 'Date of birth is required.';
            isValid = false;
        }

        if (!address) {
            document.getElementById('addressError').textContent = 'Address is required.';
            isValid = false;
        } else if (address.length > 50) {
            document.getElementById('addressError').textContent = 'Address cannot be longer than 50 characters.';
            isValid = false;
        }

        return isValid;
    }
</script>

</div>
</div>
</div>
