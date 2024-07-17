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


    <h3 class="main--title">Setting room</h3>



    <div class="table-container">
        <div style="display: flex; justify-content: space-between">

            <form id="subjectForm" action="listRoomManager" method="post">

                List of class room
                <select name="type" id="subjectSelect">
                    <option value="-1">All room</option>
                    <c:set value="${requestScope.subjectId}" var="subjectId"/>
                    <c:forEach items="${requestScope.listRoomClass}" var="listRoomClass">

                        <option value="${listRoomClass.id}" ${subjectId == listRoomClass.id ?"selected=\"selected\"":""}>${listRoomClass.className}</option>
                    </c:forEach>

                </select>
            </form>
            <form action="SearchRoom">
                <input type="text" name="text" placeholder="Name"/>
                <button style="background: #00c6ff">Search</button>
            </form>


            <a href="InsertRoom"><button class="fas fa-plus" style="background: #00c6ff">Insert</button></a>

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
                <th>Room class</th>

                <th>Name</th>
                <th>Adult</th>
                <th>Status</th>
                <th>Action</th>

            </tr>
            <tbody>
            <c:forEach items="${requestScope.list}" var="list">
                <tr>
                    <td>${list.id}</td>
                    <td>${list.room_class}</td>
                    <td>${list.room_name}</td>
                    <td>${list.num_ad}</td>
                    <td>${list.status_name}</td>
                    <td>
                        <a href="UpdateRoom?id=${list.id}"><button class="fas fa-edit"></button></a>
                        <a href="detailRoomManager?id=${list.id}&rid=${list.room_class}"><button class="fas fa-info-circle"></button></a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
            </thead>
        </table>

    </div>

</div>
<script src="Assets/notification.js"></script>
</body>
</html>
