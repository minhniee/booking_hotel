<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Material</title>
    <style>
        .container {
            max-width: 650px;
            margin: 0 auto;
            padding: 20px;
            font-family: Arial, sans-serif;
            border: 2px solid;
            background-color: rgba(236, 231, 231, 0.29);
        }

        h1 {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
        }

        .form-group input[type="text"],
        .form-group input[type="number"],
        .form-group input[type="file"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }

        .form-group button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        .form-group button:hover {
            background-color: #45a049;
        }

        .error {
            color: red;
            font-size: 0.9em;
        }
    </style>
    <script>
        function validateForm() {
            let quantity = document.getElementById("quantity").value;
            let price = document.getElementById("price").value;
            let isValid = true;

            document.getElementById("quantityError").innerText = "";
            document.getElementById("priceError").innerText = "";

            if (quantity === "" || isNaN(quantity) || parseInt(quantity) <= 0) {
                document.getElementById("quantityError").innerText = "Please enter a positive integer for quantity.";
                isValid = false;
            }

            if (price === "" || isNaN(price) || parseFloat(price) <= 0) {
                document.getElementById("priceError").innerText = "Please enter a positive number for price.";
                isValid = false;
            }

            return isValid;
        }

        <%--function previewImage(event) {--%>
        <%--    const reader = new FileReader();--%>
        <%--    reader.onload = function() {--%>
        <%--        const output = document.getElementById('imagePreview');--%>
        <%--        output.innerHTML = `<img src="${reader.result}" alt="Image Preview" width="100%">`;--%>
        <%--        output.style.display = 'block';--%>
        <%--    }--%>
        <%--    reader.readAsDataURL(event.target.files[0]);--%>
        <%--}--%>
        function previewImage(event) {
            var input = event.target;
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
<div class="container">
    <h1>Edit Material</h1>
    <form action="editMaterial" method="post" onsubmit="return validateForm()">
        <div class="form-group">
            <label for="roomId">Room ID:</label>
            <input type="text" id="roomId" name="roomId" value="${material.room_id}" readonly>
        </div>
        <div class="form-group">
            <label for="id">ID:</label>
            <input type="text" id="id" name="id" value="${material.id}" readonly>
        </div>
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="${material.name}" readonly>
        </div>
        <div class="form-group">
            <label for="quantity">Quantity:</label>
            <input type="number" id="quantity" name="quantity" value="${material.quantity}">
            <span id="quantityError" class="error">${errorMessages.quantity}</span>
        </div>
        <div class="form-group">
            <label for="price">Price:</label>
            <input type="number" step="0.01" id="price" name="price" value="${material.price}">
            <span id="priceError" class="error">${errorMessages.price}</span>
        </div>
        <div class="form-group">
<%--            <label for="image">Image:</label>--%>
<%--            <input type="text" id="image" name="image" value="${material.image}" readonly>--%>
<%--            <img id="currentImage" src="Assets/image/material/${material.image}" alt="Không thể tải ảnh" class="img-fluid d-block mx-auto">--%>
<%--            <input id="image" name="image" type="file" style="display:none;" onchange="previewImage(event);" />--%>
<%--            <input type="button" class="btn btn-primary btn-block mx-auto text-uppercase" value="Chọn ảnh" onclick="document.getElementById('image').click();" />--%>
<%--            <div id="imagePreview" class="mt-3"></div>--%>
            <label for="image">Image:</label>
            <img id="currentImage" src="Assets/image/material/${material.image}" alt="Current Image" width="30%">
            <input id="image" name="image" type="file" style="display:none;" onchange="previewImage(event);" />
            <input type="button" class="btn btn-primary btn-block mx-auto text-uppercase" value="Choose Image" onclick="document.getElementById('image').click();" />
            <div id="imagePreview" class="mt-3"></div>

        </div>
        <div class="form-group">
            <button type="submit">Save</button>
            <button type="button" onclick="window.location.href = 'ViewMaterial'">Cancel</button>
        </div>
    </form>
</div>
</body>
</html>
