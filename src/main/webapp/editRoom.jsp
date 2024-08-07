<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Room</title>
    <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
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
            background-color: #f6e7d1;
            border-radius: 20px;
            border: 2px solid;
            box-shadow: 0px 0px 10px rgba(220, 220, 220, 0.4);
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
        .form-group input[type="number"],
        .form-group input[type="file"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
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
            var roomClassId = document.getElementById('roomClassId').value.trim();
            var roomClassName = document.getElementById('roomClass').value.trim();
            var roomName = document.getElementById('roomName').value.trim();
            var numAdults = document.getElementById('numAdults').value.trim();
            var price = document.getElementById('price').value.trim();

            var isValid = true;
            var errorMessages = {};

            // Reset previous error messages
            document.getElementById('roomClassIdError').textContent = '';
            document.getElementById('roomClassError').textContent = '';
            document.getElementById('numAdultsError').textContent = '';
            document.getElementById('priceError').textContent = '';

            // Validate Room Class ID
            if (roomClassId === '') {
                errorMessages.roomClassId = 'Room Class ID không được để trống.';
                isValid = false;
            } else if (roomClassId.length > 15) {
                errorMessages.roomClassId = 'Room Class ID không được dài quá 15 ký tự.';
                isValid = false;
            }

            // Validate Room Class Name
            if (roomClassName === '') {
                errorMessages.roomClass = 'Room Class Name không được để trống.';
                isValid = false;
            } else if (roomClassName.length > 15) {
                errorMessages.roomClass = 'Room Class Name không được dài quá 15 ký tự.';
                isValid = false;
            }

            if (roomName === '') {
                errorMessages.roomName = 'Room Name không được để trống.';
                isValid = false;
            }

            // Validate Num Adults
            if (numAdults === '') {
                errorMessages.numAdults = 'Num Adults không được để trống.';
                isValid = false;
            } else {
                var parsedNumAdults = parseInt(numAdults);
                if (isNaN(parsedNumAdults) || parsedNumAdults <= 0) {
                    errorMessages.numAdults = 'Num Adults phải là số nguyên dương.';
                    isValid = false;
                }
            }

            // Validate Price
            if (price === '') {
                errorMessages.price = 'Price không được để trống.';
                isValid = false;
            } else {
                var parsedPrice = parseFloat(price);
                if (isNaN(parsedPrice) || parsedPrice <= 0) {
                    errorMessages.price = 'Price phải là số lớn hơn 0.';
                    isValid = false;
                }
            }

            // Display error messages if any
            document.getElementById('roomClassIdError').textContent = errorMessages.roomClassId || '';
            document.getElementById('roomClassError').textContent = errorMessages.roomClass || '';
            document.getElementById('numAdultsError').textContent = errorMessages.numAdults || '';
            document.getElementById('priceError').textContent = errorMessages.price || '';

            return isValid;
        }

        function previewImage(event1) {
            var input = event1.target;
            var reader = new FileReader();
            reader.onload = function () {
                var dataURL = reader.result;
                var output = document.getElementById('imagePreview');
                output.src = dataURL;
                output.style.display = 'block'; // Hiển thị ảnh mới
            };
            if (input.files && input.files[0]) {
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>

</head>
<body>
<%@include file="dashBoardStaff1.jsp"%>
<div class="main-content">
    <div class="container">
        <h1>Edit Room</h1>
        <form action="editRoom" method="post" onsubmit="return validateForm()" enctype="multipart/form-data">
            <div class="form-group">
                <label for="id">ID:</label>
                <input type="text" id="id" name="id" value="${room.id}" readonly />
            </div>
            <div class="form-group">
                <label for="roomClassId">Room Class ID:</label>
                <input type="text" id="roomClassId" name="roomClassId" value="${room.roomClassId}" required />
                <span id="roomClassIdError" class="error">${errorMessages.roomClassId}</span>
            </div>

            <div class="form-group">
                <label for="roomClass">Room Class Name:</label>
                <input type="text" id="roomClass" name="roomClass" value="${room.roomClassName}" required />
                <span id="roomClassError" class="error">${errorMessages.roomClass}</span>
            </div>
            <div class="form-group">
                <label for="roomClass">Room Name:</label>
                <input type="hidden" id="roomNameOld" name="roomNameOld" value="${room.roomName}" />
                <input type="text" id="roomName" name="roomName" value="${room.roomName}" required />
                <span id="roomNameError" class="error">${errorMessages.roomName}</span>
            </div>
            <div class="form-group">
                <label for="status">Status:</label>
                <select id="status" name="status" required>
                    <option value="Available" ${room.statusName == 'Available' ? 'selected' : ''}>Available</option>
                    <option value="Unavailable" ${room.statusName == 'Unavailable' ? 'selected' : ''}>Unavailable</option>
                </select>
            </div>
            <div class="form-group">
                <label for="numAdults">Num Adults:</label>
                <input type="number" id="numAdults" name="numAdults" value="${room.numAdults}" required />
                <span id="numAdultsError" class="error">${errorMessages.numAdults}</span>
            </div>
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="number"step="0.01" id="price" name="price" value="${room.basePrice}" required />
                <span id="priceError" class="error">${errorMessages.price}</span>
            </div>
            <div class="form-group">
                <label for="image">Image:</label>
                <input type="hidden" name="oldImage" value="${room.roomImg}">
                <input  id="image" type="file" name="image" accept="image/*" onchange="document.getElementById('imagePreview').src = window.URL.createObjectURL(this.files[0])" ><br><br>
                <img id="imagePreview" class="mt-3"  src="Assets1/img/rooms/${room.roomImg}" alt="image" width="30%">
            </div>
            <div class="form-group">
                <button type="submit">Update</button>
                <button type="button" onclick="window.location.href = 'roomManager'">Cancel</button>
            </div>
        </form>
    </div>
</div>
<script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<c:if test="${message != null}">
    <script type="text/javascript">
        toastr.success(`${message}`, 'Success', {timeOut: 1000});
    </script>
</c:if>
<c:if test="${error != null}">
    <script type="text/javascript">
        toastr.error(`${error}`, 'Error', {timeOut: 1000});
    </script>
</c:if>
</body>
</html>
