<%@ page import="model.Account" %>
<%@ page import="model.Cart" %>
<%@ page import="model.CartItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="url1"
       value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title>Shopping Cart</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="shortcut icon" href="Assets/favicon.png" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Barlow&amp;family=Barlow+Condensed&amp;family=Gilda+Display&amp;display=swap">
    <link rel="stylesheet" href="${url1}/Assets1/css/plugins.css" />
    <link rel="stylesheet" href="${url1}/Assets1/css/style.css" />
</head>
<body>
<%
    Account account = (Account) session.getAttribute("account");
    if (account == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<jsp:include page="/homePage/navbar.jsp"></jsp:include>
<!-- Header Banner -->
<div class="banner-header section-padding valign bg-img bg-fixed" data-overlay-dark="4" data-background="${url1}/Assets1/img/slider/3.jpg">
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-left caption mt-90">
                <h5>Shopping Cart</h5>
                <h1>Your cart</h1>
            </div>
        </div>
    </div>
</div>
<section class="news section-padding" style="background-color: #ebd6d6;padding: 10px 0px">
<div class="container mt-5">
    <c:choose>
        <c:when test="${cart != null && cart.cartItems.size() > 0}">
            <table class="table">
                <thead style="background-color: #98a3ad">
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
                        <td><img style="height: 100px" src="Assets/services/${item.service.image}" width="100" alt="${item.service.serviceName}"></td>
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
</section>
<!-- Footer -->
<jsp:include page="/homePage/footer.jsp"></jsp:include>
<!-- jQuery -->
<script src="${url1}/Assets1/js/jquery-3.6.3.min.js"></script>
<script src="${url1}/Assets1/js/jquery-migrate-3.0.0.min.js"></script>
<script src="${url1}/Assets1/js/modernizr-2.6.2.min.js"></script>
<script src="${url1}/Assets1/js/imagesloaded.pkgd.min.js"></script>
<script src="${url1}/Assets1/js/jquery.isotope.v3.0.2.js"></script>
<script src="${url1}/Assets1/js/pace.js"></script>
<script src="${url1}/Assets1/js/popper.min.js"></script>
<script src="${url1}/Assets1/js/bootstrap.min.js"></script>
<script src="${url1}/Assets1/js/scrollIt.min.js"></script>
<script src="${url1}/Assets1/js/jquery.waypoints.min.js"></script>
<script src="${url1}/Assets1/js/owl.carousel.min.js"></script>
<script src="${url1}/Assets1/js/jquery.stellar.min.js"></script>
<script src="${url1}/Assets1/js/jquery.magnific-popup.js"></script>
<script src="${url1}/Assets1/js/YouTubePopUp.js"></script>
<script src="${url1}/Assets1/js/select2.js"></script>
<script src="${url1}/Assets1/js/datepicker.js"></script>
<script src="${url1}/Assets1/js/smooth-scroll.min.js"></script>
<script src="${url1}/Assets1/js/custom.js"></script>
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
