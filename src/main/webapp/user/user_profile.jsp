<%--<%@ include file="../layout/cdnpkg.jsp" %>--%>
<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<c:set var="url"--%>
<%--       value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>--%>
<%--<link rel="stylesheet" href="${url}/user">--%>
<%--<style>--%>
<%--    body {--%>
<%--        font-family: 'Roboto', sans-serif;--%>
<%--        background: #f7f7f7;--%>
<%--    }--%>

<%--    .container {--%>
<%--        max-width: 1200px;--%>
<%--        margin: 0 auto;--%>
<%--        padding: 20px;--%>
<%--    }--%>

<%--    .bg-white {--%>
<%--        background: #fff;--%>
<%--        border-radius: 8px;--%>
<%--        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);--%>
<%--    }--%>

<%--    .border-right {--%>
<%--        border-right: 1px solid #ddd;--%>
<%--    }--%>

<%--    .nav-link {--%>
<%--        color: #333;--%>
<%--        transition: background-color 0.3s, color 0.3s;--%>
<%--    }--%>

<%--    .nav-link.active, .nav-link:hover {--%>
<%--        background-color: #007bff;--%>
<%--        color: #fff;--%>
<%--    }--%>

<%--    .card {--%>
<%--        border: none;--%>
<%--        border-radius: 8px;--%>
<%--        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);--%>
<%--    }--%>

<%--    .form-control {--%>
<%--        border-radius: 4px;--%>
<%--        border: 1px solid #ccc;--%>
<%--        padding: 10px;--%>
<%--        font-size: 14px;--%>
<%--    }--%>

<%--    .form-control:focus {--%>
<%--        border-color: #007bff;--%>
<%--        box-shadow: 0 0 0 0.2rem rgba(38, 143, 255, 0.25);--%>
<%--    }--%>

<%--    .labels {--%>
<%--        font-weight: bold;--%>
<%--        margin-bottom: 5px;--%>
<%--        display: block;--%>
<%--    }--%>

<%--    .error-message {--%>
<%--        font-size: 12px;--%>
<%--        color: #dc3545;--%>
<%--        margin-top: 5px;--%>
<%--        display: block;--%>
<%--    }--%>

<%--    .profile-button {--%>
<%--        background-color: #007bff;--%>
<%--        border-color: #007bff;--%>
<%--        border-radius: 4px;--%>
<%--        color: #fff;--%>
<%--        padding: 10px 20px;--%>
<%--        font-size: 16px;--%>
<%--        cursor: pointer;--%>
<%--        transition: background-color 0.3s;--%>
<%--    }--%>

<%--    .profile-button:hover {--%>
<%--        background-color: #0056b3;--%>
<%--    }--%>

<%--    .text-right {--%>
<%--        text-align: right;--%>
<%--    }--%>

<%--    .mt-5 {--%>
<%--        margin-top: 3rem;--%>
<%--    }--%>

<%--    .mb-5 {--%>
<%--        margin-bottom: 3rem;--%>
<%--    }--%>

<%--    .row {--%>
<%--        margin: 0;--%>
<%--    }--%>

<%--    .col-md-3 {--%>
<%--        padding: 15px;--%>
<%--    }--%>

<%--    .col-md-5 {--%>
<%--        padding: 15px;--%>
<%--    }--%>

<%--    .nav-item {--%>
<%--        margin-bottom: 10px;--%>
<%--    }--%>

<%--    .nav-item a {--%>
<%--        text-decoration: none;--%>
<%--        display: flex;--%>
<%--        align-items: center;--%>
<%--        padding: 10px;--%>
<%--        border-radius: 4px;--%>
<%--    }--%>

<%--    .nav-item a i {--%>
<%--        margin-right: 10px;--%>
<%--    }--%>
<%--    .message {--%>
<%--        font-size: 14px;--%>
<%--        color: #007bff;--%>
<%--        margin-top: 15px;--%>
<%--        display: block;--%>
<%--    }--%>

<%--</style>--%>

<%--<div class="container rounded bg-white mt-5 mb-5">--%>
<%--    <div class="row">--%>
<%--        <div class="col-md-3 border-right" style="margin-right: 30px;">--%>
<%--            <div class="card p-3">--%>
<%--                <div class="e-navlist e-navlist--active-bg">--%>
<%--                    <ul class="nav">--%>
<%--                        <li class="nav-item">--%>
<%--                            <a class="nav-link px-3 active" href="/Booking_Hotell">--%>
<%--                                <i class="fa fa-fw fas fa-home mr-1"></i><span> Home</span>--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                        <li class="nav-item">--%>
<%--                            <a class="nav-link px-3" href="/Booking_Hotell/user/user_profile.jsp">--%>
<%--                                <i class="fa fa-fw fa-user-cog mr-1"></i><span> Profile</span>--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                        <li class="nav-item">--%>
<%--                            <a class="nav-link px-3" href="/Booking_Hotell/ChangePass">--%>
<%--                                <i class="fa fa-fw fa-user-edit"></i><span> Change Password</span>--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                        <li class="nav-item">--%>
<%--                            <a class="nav-link px-3" href="/Booking_Hotell/bookingHistory">--%>
<%--                                <i class="fa fa-fw fa-history"></i><span> Booking history</span>--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="col-md-5 border-right" style="background-color: rgba(220,220,220,0.4);">--%>
<%--            <form action="${url}/UpdateProfile" method="post">--%>
<%--                <div class="p-3 py-5">--%>
<%--                    <div class="d-flex justify-content-between align-items-center mb-3">--%>
<%--                        <h4 class="text-right">Profile Settings</h4>--%>
<%--                    </div>--%>
<%--                    <div class="row mt-2">--%>
<%--                        <div class="col-md-6">--%>
<%--                            <label class="labels">User name</label>--%>
<%--                            <input readonly style="background-color: #e9e8e8; font-weight:520;" type="text" name="userName" class="form-control" placeholder="first name" value="${account.userName}">--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="row mt-3">--%>
<%--                        <div class="col-md-12">--%>
<%--                            <label class="labels">Full name</label>--%>
<%--                            <input type="text" name="fname" class="form-control" placeholder="enter full name" value="${account.fullName}">--%>
<%--                            <small class="error-message" id="fullNameError"><c:out value="${fullNameError}"/></small>--%>
<%--                        </div>--%>
<%--                        <div class="col-md-12">--%>
<%--                            <label class="labels">Email</label>--%>
<%--                            <input readonly style="background-color: #e9e8e8; font-weight:520;" type="text" name="email" class="form-control" value="${account.email}">--%>
<%--                            <small class="error-message" id="emailError"><c:out value="${emailError}"/></small>--%>
<%--                        </div>--%>
<%--                        <div class="col-md-12">--%>
<%--                            <label class="labels">Gender</label>--%>
<%--                            <select name="gender" class="form-control">--%>
<%--                                <option value="true" ${account.gender ? 'selected' : ''}>Male</option>--%>
<%--                                <option value="false" ${!account.gender ? 'selected' : ''}>Female</option>--%>
<%--                            </select>--%>
<%--                        </div>--%>
<%--                        <div class="col-md-12">--%>
<%--                            <label class="labels">Phone</label>--%>
<%--                            <input type="text" name="phone" class="form-control" placeholder="enter phone number" value="${account.phone}">--%>
<%--                            <small class="error-message" id="phoneError"><c:out value="${phoneError}"/></small>--%>
<%--                        </div>--%>
<%--                        <div class="col-md-12">--%>
<%--                            <label class="labels">Date of birth</label>--%>
<%--                            <input type="date" name="dob" class="form-control" max="2024-07-31" value="${account.dob}">--%>
<%--                            <small class="error-message" id="dobError"><c:out value="${dobError}"/></small>--%>
<%--                        </div>--%>
<%--                        <div class="col-md-12">--%>
<%--                            <label class="labels">Address</label>--%>
<%--                            <input type="text" name="address" class="form-control" placeholder="enter address" value="${account.address}">--%>
<%--                            <small class="error-message" id="addressError"><c:out value="${addressError}"/></small>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <small class="message" id="mess"><c:out value="${mess}"/></small>--%>
<%--                    <div class="mt-5 text-center">--%>
<%--                        <button class="btn profile-button" type="submit">Save Profile</button>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<%@ include file="../layout/cdnpkg.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="url"
       value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${url}/user">
<div class="container rounded bg-white mt-5 mb-5">
    <div class="row">
        <div class="col-md-3 border-right" style="margin-right: 30px;">
            <div class="col-12 col-lg-auto mb-3" style="width: 200px;">
                <div class="card p-3">
                    <div class="e-navlist e-navlist--active-bg">
                        <ul class="nav" style="text-wrap: nowrap">
                            <li class="nav-item"><a class="nav-link px-3 active" href="/Booking_Hotell"><i class="fa fa-fw fas fa-home mr-1"></i><span> Home</span></a></li>
                            <li class="nav-item"><a class="nav-link px-3" href="/Booking_Hotell/user/user_profile.jsp"><i class="fa fa-fw fa-user-cog mr-1"></i><span> Profile</span></a></li>
                            <li class="nav-item"><a class="nav-link px-3" href="/Booking_Hotell/ChangePass"><i class="fa fa-fw fa-user-edit " ></i><span> Change Password</span></a></li>
                            <li class="nav-item"><a class="nav-link px-3" href="/Booking_Hotell/bookingHistory"><i class="fa fa-fw fa-history " ></i><span> Booking history</span></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-5 border-right" style="border-radius: 10px; background-color: rgba(220,220,220,0.4);">
            <form action="${url}/UpdateProfile" method="post" onsubmit="return validateForm()">
                <div class="p-3 py-5">
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
                            <input type="text" name="email" class="form-control" placeholder="enter email" style="background-color: #e9e8e8; font-weight:520;" readonly value="${account.email}">
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
        }else {
            const birthDate = new Date(dob);
            const currentDate = new Date();
            let age = currentDate.getFullYear() - birthDate.getFullYear();
            const monthDiff = currentDate.getMonth() - birthDate.getMonth();
            const dayDiff = currentDate.getDate() - birthDate.getDate();
            if (monthDiff < 0 || (monthDiff === 0 && dayDiff < 0)) {
                age--;
            }
            if (age < 12) {
                document.getElementById('dobError').textContent = 'You must be at least 12 years old.';
                isValid = false;
            }
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
