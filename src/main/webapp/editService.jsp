<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="Assets/css/styleDashboard.css">
    <title>Edit Service</title>
    <style>
        .container {
            max-width: 630px;
            margin: 0 auto;
            padding: 20px;
            font-family: Arial, sans-serif;
            border: 2px solid;
            border-radius: 20px;
            background-color: rgb(246, 231, 209);
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
<%@include file="dashBoardStaff1.jsp"%>
<div class="main-content">
<div class="container" style="border-radius: 20px;max-width: unset; margin: auto">
    <h1 style="text-align: center;">Edit Service</h1>
    <form action="editService" method="post" onsubmit="return validateForm()">
        <div class="form-group">
            <label for="id">Service ID:</label>
            <input type="text" id="id" name="id" value="${service.id}" readonly>
        </div>
        <div class="form-group">
            <label for="categoryId">Category ID:</label>
            <input type="number" id="categoryId" name="id" value="${service.categoryId}" readonly >
            <span id="categoryIdError" class="error">${errorMessages.categoryId}</span>
        </div>
        <div class="form-group">
            <label for="serviceName">Service Name:</label>
            <input type="text" id="serviceName" name="serviceName" value="${service.serviceName}" readonly >
            <span id="serviceNameError" class="error">${errorMessages.serviceName}</span>
        </div>
        <div class="form-group">
            <label for="description">Description:</label>
            <input type="text" id="description" name="description" value="${service.description}" readonly>
            <span id="descriptionError" class="error">${errorMessages.description}</span>
        </div>
        <div class="form-group">
            <label for="price">Price:</label>
            <input type="number" step="0.01" id="price" name="price" value="${service.price}" required>
            <span id="priceError" class="error">${errorMessages.price}</span>
        </div>
        <div class="form-group">
            <label for="quantity">Quantity:</label>
            <input type="number" id="quantity" name="quantity" value="${service.quantity}" required>
            <span id="quantityError" class="error">${errorMessages.quantity}</span>
        </div>

        <div class="form-group">
            <label for="image">Image:</label>
            <input type="hidden" name="oldImage" value="${service.image}" readonly>
            <input  id="image" type="file" name="image" accept="image/*" onchange="document.getElementById('imagePreview').src = window.URL.createObjectURL(this.files[0])" ><br><br>
            <img id="imagePreview" class="mt-3"  src="Assets/services/${service.image}" alt="image" width="30%">
        </div>
        <div class="form-group" style="text-align: center;">
            <button type="submit">Save</button>
            <button type="button" onclick="window.location.href = 'ViewService'">Cancel</button>
        </div>
    </form>
</div>
</body>
</html>
