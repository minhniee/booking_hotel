<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/29/2024
  Time: 7:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detail Room Manager</title>
    <link rel="stylesheet" href="css/detailRoom.css">
</head>
<body>
<c:set value="${requestScope.detailRoom}" var="detail"/>
<table class="plain-table">
    <thead>
    <tr>
        <th>Room class</th>
        <th>Price</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>${detail.name}</td>
        <td>${detail.price}</td>
        <td>
            <a href=""><button class="fas fa-edit"></button></a>
            <a href=""><button class="fas fa-trash-alt"></button></a>
        </td>
    </tr>

    </tbody>
</table>
<table class="plain-table">

    <thead>
    <tr>
        <th>Material id</th>
        <th>Material name</th>
        <th>Quantity</th>
        <th>Price</th>
        <th>Image</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${requestScope.materials}" var="materials">


    <tr>
        <td>${materials.id}</td>
        <td>${materials.name}</td>
        <td>${materials.quantity}</td>
        <td>${materials.price}</td>
        <td><img src="images/${materials.image}"></td>
        <td>
            <a href=""><button class="fas fa-edit"></button></a>
            <a href=""><button class="fas fa-trash-alt"></button></a>
        </td>
    </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>
