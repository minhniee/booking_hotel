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
            color: black;
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
<%@include file="dashBoardStaff1.jsp"%>
<div class="main-content" >
<div class="container">
    <form action="customerDetail" >

    </form>
    <h1>Customer Detail</h1>
    <div class="customer-container">
        <c:set var="cus" value="${customer}"/>
        <p>ID: ${customerId}</p>
        <p>Full Name: ${cus.fullName}</p>
        <p>Email: ${cus.email}</p>
        <p>Phone: ${cus.phone}</p>
        <%--        <p>Gender: ${customer.gender ? "Male" : "Female"}</p>--%>
        <p>Gender: ${cus.gender != null ? (cus.gender ? "Male" : "Female") : ""}</p>
        <p>Date of Birth: ${cus.dob}</p>
        <p>Address: ${cus.address}</p>

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
            <c:forEach var="od" items="${booking}">
                <tr>
                    <td>${od.id}</td>
                    <td>${od.checkInDate}</td>
                    <td>${od.checkOutDate}</td>
                    <td>${od.numAdults}</td>
                    <td>${od.numChildren}</td>
                    <td>${od.bookingPrice}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>