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
        .pagination {
            margin-top: 20px;
            justify-content: end;
        }
        .pagination a {
            margin: 0 5px;
            padding: 8px 12px;
            text-decoration: none;
            color: #333;
            border: 1px solid #ddd;
        }

        .pagination a:hover {
            background-color: rgba(73, 174, 80, 0.88);
        }

        .pagination strong {
            margin: 0 2px;
            padding: 8px 16px;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            background-color: rgba(73, 174, 80, 0.88);
        }
        .customer-table td {
            color: black;
            background-color: snow;
        }
        .container {
            text-align: center;
            color: black;
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
        .container h1{
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
            background-color: rgb(255,127,80);
            padding: 10px;
            border: 1px solid;
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
                    <a href="customerDetail?customerId=${customer.id}"><button type="submit">View Bookings</button></a>
                </td>

            </tr>
        </c:forEach>
    </table>
    <div class="pagination">
        <c:if test="${currentPage > 1}">
            <a href="customerInfo?page=${currentPage - 1}">&laquo; Previous</a>
        </c:if>
        <c:forEach begin="1" end="${totalPages}" var="pageNumber">
            <c:choose>
                <c:when test="${pageNumber == currentPage}">
                    <strong>${pageNumber}</strong>
                </c:when>
                <c:otherwise>
                    <a href="customerInfo?page=${pageNumber}">${pageNumber}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:if test="${currentPage < totalPages}">
            <a href="customerInfo?page=${currentPage + 1}">Next &raquo;</a>
        </c:if>
    </div>
</div>
</div>
</body>
</html>
