<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Shopping Cart</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
<div class="container mt-5">
    <h1>Shopping Cart</h1>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>Service</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Total</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${cart.items}">
            <tr>
                <td>${item.service.serviceName}</td>
                <td>${item.service.price}</td>
                <td>
                    <input type="number" class="form-control quantity" data-service-id="${item.service.id}" value="${item.quantity}" min="1">
                </td>
                <td>${item.service.price * item.quantity}</td>
                <td>
                    <a href="cart?action=remove&serviceId=${item.service.id}" class="btn btn-danger">Remove</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <h3>Total Amount: $${cart.totalAmount}</h3>
    <a href="checkout.jsp" class="btn btn-success">Proceed to Checkout</a>
</div>
<script>
    $(document).ready(function () {
        $('.quantity').change(function () {
            var serviceId = $(this).data('service-id');
            var quantity = $(this).val();
            window.location.href = 'cart?action=update&serviceId=' + serviceId + '&quantity=' + quantity;
        });
    });
</script>
</body>
</html>
