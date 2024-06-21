<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <title>Room Manager</title>
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
        <h1>Room Manager</h1>
        <table class="room-table" border="1">
            <tr>
                <th>ID</th>
                <th>Room Class ID</th>
                <th>Room Class Name</th>
                <th>Status</th>
                <th>Name</th>
                <th>Num Adults</th>
                <th>Price</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="room" items="${rooms}">
                <tr>
                    <td>${room.id}</td>
                    <td>${room.roomClassId}</td>
                    <td>${room.roomClassName}</td>
                    <td>${room.statusName}</td>
                    <td>${room.roomName}</td>
                    <td>${room.numAdults}</td>
                    <td>${room.basePrice}</td>
                    <td class="room-actions">
                        <form action="roomManager" method="post" style="display:inline;">
                             <input type="hidden" name="action" value="edit">
                            <input type="hidden" name="roomId" value="${room.id}">
                            <button type="submit">Edit</button>
                        </form>
                        <form action="roomManager" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="roomId" value="${room.id}">
                            <button type="submit">Delete</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>

