<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="Assets/css/styleDashboard.css">
    <%@include file="layout/cdnpkg.jsp"%>
    <title>Customer Information</title>
    <style>
        .customer-table td {
            color: black;
            background-color: snow;
        }
        .container {
            width: 80%;
            margin: 0 auto;
        }
        .customer-table {
            width: 100%;
            border-collapse: collapse;
        }
        .customer-table th, .customer-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        .customer-table th {
            background-color: #f2f2f2;
        }
        .customer-table tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .customer-table tr:hover {
            background-color: #ddd;
        }
        .customer-table button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 5px 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            margin: 2px 2px;
            cursor: pointer;
            border-radius: 4px;
        }
    </style>
</head>
<body>
<%@include file="dashBoardStaff1.jsp"%>
<div class="main-content" >
<div class="container">
    <h1>Customer Information</h1>
    <table class="customer-table">
        <tr>
            <th>ID</th>
            <th>Full Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Gender</th>
            <th>Date of Birth</th>
            <th>Address</th>
            <th>Action</th>
        </tr>
        <c:forEach var="customer" items="${customers}">
            <tr>
                <td>${customer.id}</td>
                <td>${customer.fullName}</td>
                <td>${customer.email}</td>
                <td>${customer.phone}</td>
                <td>${customer.gender != null ? (customer.gender ? "Male" : "Female") : ""}</td>
                <td>${customer.dob}</td>
                <td>${customer.address}</td>
                <td>
                        <%--                        <form action="customerDetail" method="get">--%>
                        <%--                            <input type="hidden" name="customerId" value="${customer.id}">--%>
                        <%--                            <button type="submit">View Bookings</button>--%>
                        <%--                        </form>--%>
                    <a href="customerDetail?customerId=${customer.id}"><button type="submit">View Bookings</button></a>
                </td>

            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
