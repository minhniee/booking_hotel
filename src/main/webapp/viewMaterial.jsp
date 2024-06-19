<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <title>View Material</title>
    <style>
        .container {
            max-width: 950px;
            margin: 0 auto;
            padding: 20px;
            font-family: Arial, sans-serif;
        }

        h1 {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
        }

        .room-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
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
    </style>
</head>
<body>
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
                <td>${material.image}</td>
                <td class="room-actions">
                    <form action="editMaterial.jsp" method="post" style="display:inline;">
                        <input type="hidden" name="roomId" value="${material.id}">
                        <button type="submit">Edit</button>
                    </form>

                </td>
            </tr>
        </c:forEach>
    </table><!-- Pagination Links -->
    <div class="pagination">
        <c:if test="${page > 1}">
            <a href="viewMaterial?page=${page - 1}">&laquo; Previous</a>
        </c:if>
        <c:forEach begin="1" end="${totalPages}" var="pageNumber">
            <c:choose>
                <c:when test="${pageNumber == page}">
                    <strong>${pageNumber}</strong>
                </c:when>
                <c:otherwise>
                    <a href="viewMaterial?page=${pageNumber}">${pageNumber}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:if test="${page < totalPages}">
            <a href="viewMaterial?page=${page + 1}">Next &raquo;</a>
        </c:if>
    </div>
</div>
</body>
</html>

