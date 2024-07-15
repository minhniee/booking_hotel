<%@ page import="model.Account" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Services</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
    <div class="">
        <a href="services" >

            <h1>Services</h1>
        </a>
    </div>


    <div class="row">
        <div class="col-md-3">
            <h2>Categories</h2>
            <ul class="list-group">
                <c:forEach var="category" items="${categories}">
                    <li class="list-group-item">
                        <a href="services?categoryId=${category.id}">${category.categoryName}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>

        <div class="col-md-9">
            <form action="services" method="get" class="form-inline mb-4">
                <input type="hidden" name="action" value="search"/>
                <input type="text" name="keyword" class="form-control mr-2" placeholder="Search services..."/>
                <button type="submit" class="btn btn-primary">Search</button>
            </form>
            <div class="row">
                <c:forEach var="service" items="${services}">
                    <div class="col-md-4 mb-4">
                        <div class="card">
                            <img src="Assets/services/${service.image}" class="card-img-top" alt="${service.serviceName}">
                            <div class="card-body">
                                <h5 class="card-title">${service.serviceName}</h5>
                                <p class="card-text">${service.description}</p>
                                <p class="card-text">$${service.price}</p>
                                <p class="card-text">Quantity: ${service.quantity}</p>
                                <c:if test="${service.quantity > 0}">
                                    <form action="cart" method="post">
                                        <input type="hidden" name="action" value="add">
                                        <input type="hidden" name="serviceId" value="${service.id}">
                                        <input type="hidden" name="quantity" value="1">
                                        <button type="submit" class="btn btn-primary">Add to Cart</button>
                                    </form>
                                </c:if>
                                <c:if test="${service.quantity <= 0}">
                                    <button class="btn btn-danger">Out Stock</button>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <a href="cart" class="btn btn-outline-dark btn-floating position-fixed" style="top: 20px; right: 20px;">
        <h1>Cart</h1>
    </a>
</div>
</body>
</html>
