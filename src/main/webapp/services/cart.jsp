<%@ page import="model.Account" %>
<%@ page import="model.Cart" %>
<%@ page import="model.CartItem" %>
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
<%
    Account account = (Account) session.getAttribute("account");
    if (account == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<div class="container mt-5">
    <h1>Shopping Cart</h1>

    <c:choose>
        <c:when test="${cart != null && cart.cartItems.size() > 0}">
            <table class="table">
                <thead>
                <tr>
                    <th>Image</th>
                    <th>Service Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${cart.cartItems}">
                    <tr>
                        <td><img src="Assets/services/${item.service.image}" width="100" alt="${item.service.serviceName}"></td>
                        <td>${item.service.serviceName}</td>
                        <td>${item.service.description}</td>
                        <td>$${item.service.price}</td>
                        <td>
                            <input type="number" value="${item.quantity}" min="1" class="form-control quantity" data-id="${item.id}">
                        </td>
                        <td>$${item.quantity * item.service.price}</td>
                        <td>
                            <button class="btn btn-danger btn-remove" data-id="${item.id}">Remove</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <h3>Total: $${cart.totalAmount}</h3>
            <form action="paymentservicevnpay" method="post">
            <h2 style="margin-top: 16px">Select booking room: </h2>
            <select name="booking" class="form-control">
                <c:forEach var="b" items="${bookingList}">
                    <option value="${b.id}">${b.roomId}</option>
                </c:forEach>
            </select>

                <button style="margin-top: 16px" class="btn btn-success" type="submit" <c:if test="${bookingList.size() == 0}">disabled</c:if> >Checkout</button>
            </form>
        </c:when>
        <c:otherwise>
            <p>Your cart is empty.</p>
        </c:otherwise>
    </c:choose>
    <a href="services" style="margin-top: 16px" class="btn btn-success" >Go to Services</a>
</div>

<script>
    $(document).ready(function() {
        $('.quantity').change(function() {
            var cartItemId = $(this).data('id');
            var quantity = $(this).val();
            $.post('cart', {
                action: 'update',
                cartItemId: cartItemId,
                quantity: quantity
            }, function(response) {
                if (response.success) {
                    // location.reload();
                } else {
                    alert('An error occurred: ' + response.message);
                    // location.reload();
                }
                location.href="cart";
            }, 'json');
        });

        $('.btn-remove').click(function() {
            var cartItemId = $(this).data('id');
            $.post('cart', {
                action: 'delete',
                cartItemId: cartItemId
            }, function(response) {
                if (response.success) {
                    // location.reload();
                } else {
                    alert('An error occurred: ' + response.message);
                    // location.reload();
                }
                location.href="cart";
            }, 'json');
        });
    });
</script>
</body>
</html>
