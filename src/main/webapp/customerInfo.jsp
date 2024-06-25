<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <title>Customer Information</title>
    <style>
        h1 {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
            background-color: rgb(255,127,80);
            padding: 10px;
            border: 1px solid;
            text-align: center;
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
        .pagination {
            margin-top: 20px;
            text-align: center;
        }

        .pagination form {
            display: inline-block;
        }

        .pagination button {
            padding: 8px 16px;
            background-color: rgba(73, 174, 80, 0.88);
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            margin: 0 2px;
        }

        .pagination button.disabled {
            background-color: #ccc;
            pointer-events: none;
        }

    </style>
</head>
<body>
<div class="container">
    <h1>Customer Information</h1>
    <table class="customer-table">
        <tr>
            <th>ID</th>
            <th>Name</th>
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
                    <form action="customerInfo" method="post">
                        <input type="hidden" name="customerId" value="${customer.id}">
                        <button type="submit">View Bookings</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
    <div class="pagination">
        <c:if test="${currentPage > 1}">
            <form action="customerInfo" method="get">
                <input type="hidden" name="page" value="${currentPage - 1}">
                <button type="submit">&laquo; Previous</button>
            </form>
        </c:if>
        <c:forEach begin="1" end="${totalPages}" var="pageNumber">
            <form action="customerInfo" method="get">
                <input type="hidden" name="page" value="${pageNumber}">
                <button type="submit" class="<c:if test='${pageNumber == currentPage}'>disabled</c:if>">
                        ${pageNumber}
                </button>
            </form>
        </c:forEach>
        <c:if test="${currentPage < totalPages}">
            <form action="customerInfo" method="get">
                <input type="hidden" name="page" value="${currentPage + 1}">
                <button type="submit">Next &raquo;</button>
            </form>
        </c:if>
    </div>

</div>
</body>
</html>
