<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="Assets/css/styleDashboard.css">
    <%@include file="layout/cdnpkg.jsp"%>
    <title>Room Manager</title>
    <style>
        .room-table td {
            color: black;
            background-color: snow;
        }
        .container {
            max-width: 1050px;
            margin: 0 auto;
            padding: 20px;
            font-family: Arial, sans-serif;
        }

        h1 {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
            background-color: rgb(255, 127, 80);
            padding: 10px;
            border: 1px solid;
            text-align: center;
        }

        .room-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            text-align: center;
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
<%@include file="dashBoardStaff1.jsp"%>
<div class="main-content">

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
        <li class="active">
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
    <h1>Room Manager</h1>
    <table class="room-table" border="1">
        <tr>
            <th>ID</th>
            <th>Room Class ID</th>
            <th>Room Class Name</th>
            <th>Status Name</th>
            <th>Num Adults</th>
            <th>Price</th>
            <th>Room Image</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="room" items="${rooms}">
            <tr>
                <td>${room.id}</td>
                <td>${room.roomClassId}</td>
                <td>${room.roomClassName}</td>
                <td>${room.statusName}</td>
                <td>${room.numAdults}</td>
                <td>${room.basePrice}</td>
                <td><img src="Assets1/img/rooms/${room.roomImg}" alt="${room.roomImg}" width="100"></td>
                <td class="room-actions">
                        <%--                    <form action="roomManager" method="post" style="display:inline;">--%>
                        <%--                        <input type="hidden" name="action" value="edit">--%>
                        <%--                        <input type="hidden" name="roomId" value="${room.id}">--%>
                        <%--                        <button type="submit">Edit</button>--%>
                        <%--                    </form>--%>
                    <a href="editRoom?id=${room.id}"><button type="submit">Edit</button></a>
                </td>
            </tr>
        </c:forEach>
    </table>

    <div class="pagination">
        <c:if test="${currentPage > 1}">
            <form action="roomManager" method="get">
                <input type="hidden" name="page" value="${currentPage - 1}">
                <button type="submit">&laquo; Previous</button>
            </form>
        </c:if>
        <c:forEach begin="1" end="${totalPages}" var="pageNumber">
            <form action="roomManager" method="get">
                <input type="hidden" name="page" value="${pageNumber}">
                <button type="submit" class="<c:if test='${pageNumber == currentPage}'>disabled</c:if>">
                        ${pageNumber}
                </button>
            </form>
        </c:forEach>
        <c:if test="${currentPage < totalPages}">
            <form action="roomManager" method="get">
                <input type="hidden" name="page" value="${currentPage + 1}">
                <button type="submit">Next &raquo;</button>
            </form>
        </c:if>
    </div>
</div>
</div>
</body>
</html>
