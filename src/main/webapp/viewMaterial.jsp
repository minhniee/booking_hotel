<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="Assets/css/styleDashboard.css">
    <%@include file="layout/cdnpkg.jsp"%>
    <title>View Material</title>
    <style>
        .room-table td {
            color: black;
            background-color: snow;
        }
        .container {
            text-align: center;
            max-width: 950px;
            margin: 0 auto;
            padding: 20px;
            font-family: Arial, sans-serif;
        }

        h1 {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
            background-color: rgb(255,127,80);
            padding: 10px;
            border: 1px solid;
        }

        .room-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            margin-bottom: 30px;
        }

        .room-table th, .room-table td {
            padding: 10px;
            border: 1px solid #ddd;
        }

        .room-table th {
            background-color: #f2f2f2;
            color: #333;
            font-weight: bold;
        }

        .room-actions {
            margin-top: 20px;
        }

        .room-actions input[type="text"] {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .room-actions button {
            padding: 8px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            margin-left: 10px;
        }

        .room-actions button:hover {
            background-color: #45a049;
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
        <li class="active">
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
        <li>
            <a href="roomManager">
                <i class="fas fa-cog"></i>
                <span>Room</span>
            </a>
        </li>
        <li>
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
    <h1>View Material</h1>
    <table class="room-table" border="1">
        <tr>
            <th>Room ID</th>
            <th>ID</th>
            <th>Room Name</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Image</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="material" items="${material}">
            <tr>
                <td>${material.room_id}</td>
                <td>${material.id}</td>
                <td>${material.name}</td>
                <td>${material.quantity}</td>
                <td>${material.price}</td>
                <td><img src="Assets/image/material/${material.image}" alt="${material.name}" width="100"></td>
                <td class="room-actions">
                        <%--                    <form action="editMaterial" method="post" style="display:inline;">--%>
                        <%--                        <input type="hidden" name="roomId" value="${material.id}">--%>
                        <%--                        <button type="submit">Edit</button>--%>
                        <%--                    </form>--%>

                    <a href="editMaterial?id=${material.id}"><button type="submit">Edit</button></a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <div class="pagination">
        <c:if test="${currentPage > 1}">
            <a href="ViewMaterial?page=${currentPage - 1}">&laquo; Previous</a>
        </c:if>
        <c:forEach begin="1" end="${totalPages}" var="pageNumber">
            <c:choose>
                <c:when test="${pageNumber == currentPage}">
                    <strong>${pageNumber}</strong>
                </c:when>
                <c:otherwise>
                    <a href="ViewMaterial?page=${pageNumber}">${pageNumber}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:if test="${currentPage < totalPages}">
            <a href="ViewMaterial?page=${currentPage + 1}">Next &raquo;</a>
        </c:if>
    </div>
</div>
</body>
</html>
