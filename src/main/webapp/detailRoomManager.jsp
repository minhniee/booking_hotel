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
    <link rel="stylesheet" href="Assets/css/detailRoom.css">
    <link rel="stylesheet" href="Assets/css/notification.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
<c:set value="${requestScope.detailRoom}" var="detail"/>
<c:set value="${requestScope.room_id}" var="room_id"/>
<c:set value="${requestScope.room_class_id}" var="room_class_id"/>
<c:if test="${sessionScope.success != null}">
    <div class="message info">
        <div class="alert alert-success" show-alert data-time="4000"> ${sessionScope.success}  <span close-alert>x</span> </div>
    </div>
    ${sessionScope.remove("success")}
</c:if>
<table class="plain-table">
    <thead>
    <tr>
        <th>Room class</th>
        <th>Price</th>
        <th>Image</th>
        <th>Image detail</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>${detail.name}</td>
        <td>${detail.price}</td>
        <td><img src="Assets1/img/rooms/${detail.image}" height="200px" width="300px" "></td>
        <td>
            <c:forEach items="${requestScope.roomImages}" var="roomImages">
                <img src="Assets/image/demoRoom/${roomImages.image}" height="200px" width="300px">
                <a href="UpdateImageRoom?id=${roomImages.id}&room_id=${room_id}&room_class_id=${detail.id}"><button class="fas fa-edit"></button></a>

            </c:forEach>

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
        <th><a href="InsertMaterialRoom?room_id=${room_id}&room_class_id=${room_class_id}"><button style="background: #00c6ff; color: white; border-radius: 5px">Insert material</button></a></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${requestScope.materials}" var="materials">


    <tr>
        <td>${materials.id}</td>
        <td>${materials.name}</td>
        <td>${materials.quantity}</td>
        <td>${materials.price}</td>
        <td><img src="Assets/image/material/${materials.image}" width="70px"></td>

        <td>

            <a href="DeleteMaterialRoom?id=${materials.id}&room_id=${room_id}&room_class_id=${room_class_id}"><button class="fas fa-trash-alt"></button></a>
        </td>
    </tr>
    </c:forEach>
    </tbody>
</table>
<a href="chartData" style="display: flex; justify-content: end"><button class="fas fa-arrow-left" style="border-radius: 5px; background: #00c6ff">Back</button></a>
<script src="Assets/notification.js"></script>
</body>
</html>
