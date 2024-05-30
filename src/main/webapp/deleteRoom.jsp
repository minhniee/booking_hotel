<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <title>Delete Room</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
        }

        h1 {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
        }

        .room-info {
            margin-bottom: 20px;
        }

        button {
            padding: 10px 20px;
            background-color: green;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        button:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Delete Room</h1>
        <div class="room-info">
            <table class="room-table" border="1">
            <tr>
                <th>ID</th>
                <th>Room Class Name</th>
                <th>Status</th>
                <th>Name</th>
                <th>Num Adults</th>
                <th>Price</th>
            </tr>
            
                <tr>
                    <td>${room.id}</td>
                    <td>${room.roomClassName}</td>
                    <td>${room.statusName}</td>
                    <td>${room.roomName}</td>
                    <td>${room.numAdults}</td>
                    <td>${room.basePrice}</td>
                
                </tr>
        </table>
        </div>

        <p>Are you sure you want to delete this room?</p>
        
        <form action="roomManager" method="post">
            <input type="hidden" name="id" value="${room.id}">
            <input type="hidden" name="roomClassName" value="${room.roomClassName}">
            <input type="hidden" name="status" value="${room.statusName}">
            <input type="hidden" name="roomName" value="${room.roomName}">
            <input type="hidden" name="numAdults" value="${room.numAdults}">
            <input type="hidden" name="price" value="${room.basePrice}">
            <input type="hidden" name="action" value="dele">
            <button type="submit">Delete</button>
            <button type="button" onclick="window.location.href='roomManager'">Cancel</button>
        </form>
    </div>
</body>
</html>
