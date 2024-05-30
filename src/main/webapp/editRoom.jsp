<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit Room</title>
        <style>
            /* CSS for Edit Room Page */
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }

            .container {
                max-width: 600px;
                margin: 50px auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            }

            h1 {
                font-size: 24px;
                color: #333;
                margin-bottom: 20px;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-group label {
                display: block;
                font-weight: bold;
                margin-bottom: 5px;
            }

            .form-group input[type="text"],
            .form-group select {
                width: 100%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 3px;
            }

            .form-group button {
                padding: 8px 20px;
                background-color: #45a049;
                color: white;
                border: none;
                border-radius: 3px;
                cursor: pointer;
            }

            .form-group button:hover {
                background-color: #45a049;
            }
        </style>
        <script>
            function validateForm() {
                let roomClassId = document.getElementById('roomClassId').value;
                let roomClassName = document.getElementById('roomClass').value;
                let roomName = document.getElementById('roomName').value;
                let numAdults = document.getElementById('numAdults').value;
                let price = document.getElementById('price').value;

                // Kiểm tra nếu các trường bắt buộc đều được điền
                if (!roomClassId || !roomClassName || !roomName || !numAdults || !price) {
                    alert('All fields are required.');
                    return false;
                }

                // Kiểm tra nếu số người lớn là một số nguyên dương
                if (!Number.isInteger(Number(numAdults)) || Number(numAdults) <= 0) {
                    alert('Number of adults must be a positive integer.');
                    return false;
                }

                // Kiểm tra nếu giá là một số hợp lệ không âm
                let pricePattern = /^[0-9]+(\.[0-9]{1,2})?$/;
                if (!pricePattern.test(price) || Number(price) < 0) {
                    alert('Price must be a non-negative number.');
                    return false;
                }

                return true;
            }
        </script>

    </head>
    <body>
        <div class="container">
            <h1>Edit Room</h1>
            <c:if test="${not empty error}">
                <p style="color:red;">${error}</p>
            </c:if>
            <form action="roomManager" method="post" onsubmit="return validateForm()">
                <c:set var="room" value="${requestScope.room}" />
                <input type="hidden" name="id" value="${room.id}"/>
                <div class="form-group">
                    <label for="id">ID:</label>
                    <input type="text" id="id" name="roomClass" value="${room.id}" required />
                </div>
                <div class="form-group">
                    <label for="roomClassId">Room Class ID:</label>
                    <input type="text" id="roomClassId" name="roomClassId" value="${room.roomClassId}" required />
                </div>

                <div class="form-group">
                    <label for="roomClass">Room Class Name:</label>
                    <input type="text" id="roomClass" name="roomClass" value="${room.roomClassName}" required />
                </div>
                <div class="form-group">
                    <label for="status">Status:</label>
                    <select id="status" name="status" required>
                        <option value="Available" ${room.statusName == 'Available' ? 'selected' : ''}>Available</option>
                        <option value="Occupied" ${room.statusName == 'Occupied' ? 'selected' : ''}>Occupied</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="roomName">Name:</label>
                    <input type="text" id="roomName" name="roomName" value="${room.roomName}" required />
                </div>
                <div class="form-group">
                    <label for="numAdults">Num Adults:</label>
                    <input type="text" id="numAdults" name="numAdults" value="${room.numAdults}" required />
                </div>
                <div class="form-group">
                    <label for="price">Price:</label>
                    <input type="text" id="price" name="price" value="${room.basePrice}" required />
                </div>
                <input type="hidden" name="action" value="update">
                <button type="submit">Update</button>
                <button type="button" onclick="window.location.href = 'roomManager'">Cancel</button>
            </form>
        </div>
    </body>
</html>

<!--                <div class="form-group">
                                   <label for="payment">Payment:</label>
                                   <select id="payment" name="payment">
                                       <option value="payNow">Pay Now</option>
                                       <option value="payLater">Pay Later</option>
                                   </select>
                               </div>-->
