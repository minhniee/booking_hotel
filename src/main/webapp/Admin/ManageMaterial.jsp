<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/27/2024
  Time: 2:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="Assets/css/listAccount.css">
    <link rel="stylesheet" href="Assets/css/notification.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
<div class="tabular--wrapper">

    <c:if test="${sessionScope.success != null}">
        <div class="message info">
            <div class="alert alert-success" show-alert data-time="4000"> ${sessionScope.success}  <span close-alert>x</span> </div>
        </div>
        ${sessionScope.remove("success")}
    </c:if>

    <h3 class="main--title">Manage material</h3>
    <div class="table-container">
        <div style="display: flex; justify-content: space-between">


            <form action="SearchMaterial">
                <input type="text" name="text" placeholder="Material name"/>
                <button style="background: #00c6ff">Search</button>
            </form>


            <a href="InsertMaterial"><button class="fas fa-plus" style="background: #00c6ff">Insert</button></a>

        </div>
        <script>
            document.getElementById('subjectSelect').addEventListener('change', function() {
                document.getElementById('subjectForm').submit();
            });
        </script>
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Material name</th>

                <th>Quantity</th>
                <th>Price</th>

                <th>Image</th>
                <th></th>
            </tr>
            <tbody>
            <c:forEach items="${requestScope.materials}" var="materials">
                <tr>
                    <td>${materials.id}</td>
                    <td>${materials.name}</td>
                    <td>${materials.quantity}</td>
                    <td>${materials.price}</td>

                    <td><img src="Assets/image/material/${materials.image}" width="120px"></td>
                    <td>
                        <a href="UpdateMaterial?id=${materials.id}"><button class="fas fa-edit"></button></a>
                        <a href="UpdateImageMaterial?id=${materials.id}"><button class="fas fa-file-image" style="background: #00c6ff"></button></a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
            </thead>
        </table>
        <a href="chartData" style="display: flex; justify-content: end"><button class="fas fa-arrow-left" style="border-radius: 5px; background: #00c6ff">Back</button></a>

    </div>

</div>
<script src="Assets/notification.js"></script>
</body>

</html>
