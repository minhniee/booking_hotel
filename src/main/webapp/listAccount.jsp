<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/27/2024
  Time: 10:12 AM
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



    <h3 class="main--title">List accounts</h3>
    <form action="listAccount" method="post" style="display: flex; justify-content: left">
        <input type="text" name="text" placeholder=" Phone"/>
        <button style="background: #00c6ff">Search</button>
    </form>
    <div class="table-container">

        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>User name</th>

                <th>Full name</th>
                <th>Email</th>
                <th>Role</th>
                <th>Gender</th>
                <th>Phone</th>
                <th>DOB</th>
                <th>Address</th>
                <th>Active</th>
                <th></th>

            </tr>
            <tbody>
            <c:forEach items="${requestScope.listAccounts}" var="listAccounts">
                <tr>
                    <td>${listAccounts.id}</td>
                    <td>${listAccounts.userName}</td>

                    <td>${listAccounts.fullName}</td>
                    <td>${listAccounts.email}</td>
                    <td>${listAccounts.role}</td>
                    <td>${listAccounts.gender ? 'Male' : 'Female'}</td>
                    <td>${listAccounts.phone}</td>
                    <td>${listAccounts.dob}</td>
                    <td>${listAccounts.address}</td>
                    <td>
                    <c:if test="${!listAccounts.confirm}">
                        <a class="fas fa-user-lock"></a>
                    </c:if>
                    </td>
                    <td>
                        <a href="setAccount?id=${listAccounts.id}"><button class="fas fa-edit"></button></a>
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
