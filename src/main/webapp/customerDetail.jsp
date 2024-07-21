<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="Assets/css/styleDashboard.css">
    <%@include file="layout/cdnpkg.jsp"%>
    <title>Customer Detail</title>
    <style>
        .container {
            width: 80%;
            margin: 0 auto;
        }
        .customer-container {
            margin-top: 20px;
            border: 1px solid #ddd;
            padding: 20px;
        }
        .customer-container h2 {
            margin-top: 0;
        }
        .customer-container p {
            margin-bottom: 10px;
        }
        .customer-container table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        .customer-container table th, .customer-container table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        .customer-container table th {
            background-color: #f2f2f2;
        }
        .customer-container table tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .customer-container table tr:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
<div class="sidebar">
    <div class="logo"></div>
    <ul class="menu">
        <li >
            <a href="dashboardstaff.jsp" >
                <i class="fas fa-tachometer-alt"></i>
                <span>Dashboard</span>
            </a>
        </li>
        <li >
            <a href="profileStaff.jsp">
                <i class="fas fa-user"></i>
                <span>Profile</span>
            </a>
        </li>
        <li>
            <a href="ViewService">
                <i class="fas fa-chart-bar"></i>
                <span>Service</span>
            </a>
        </li>
        <li >
            <a href="ViewMaterial">
                <i class="fas fa-briefcase"></i>
                <span>Material</span>
            </a>
        </li>
        <li>
            <a href="#">
                <i class="fas fa-question-circle"></i>
                <span>FAQ</span>
            </a>
        </li>
        <li >
            <a href="roomManager">
                <i class="fas fa-cog"></i>
                <span>Room</span>
            </a>
        </li>
        <li class="active">
            <a href="customerInfo">
                <i class="fas fa-star"></i>
                <span>Customer</span>
            </a>
        </li>
        <li class="logout">
            <a href="logout">
                <i class="fas fa-sign-out-alt"></i>
                <span>Logout</span>
            </a>
        </li>
    </ul>
</div>
<div class="container">
    <form action="customerDetail" >

    </form>
    <h1>Customer Detail</h1>
    <div class="customer-container">
        <p>ID: ${customer.id}</p>
        <p>Full Name: ${customer.fullName}</p>
        <p>Email: ${customer.email}</p>
        <p>Phone: ${customer.phone}</p>
        <%--        <p>Gender: ${customer.gender ? "Male" : "Female"}</p>--%>
        <p>Gender: ${customer.gender != null ? (customer.gender ? "Male" : "Female") : ""}</p>
        <p>Date of Birth: ${customer.dob}</p>
        <p>Address: ${customer.address}</p>

        <h2>Bookings</h2>
        <table>
            <tr>
                <th>Booking ID</th>
                <th>Checkin Date</th>
                <th>Checkout Date</th>
                <th>Adults</th>
                <th>Children</th>
                <th>Price</th>
            </tr>
            <c:forEach var="booking" items="${customer.bookings}">
                <tr>
                    <td>${booking.id}</td>
                    <td>${booking.checkinDate}</td>
                    <td>${booking.checkoutDate}</td>
                    <td>${booking.numAdults}</td>
                    <td>${booking.numChildren}</td>
                    <td>${booking.bookingPrice}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>