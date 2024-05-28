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
    <link rel="stylesheet" href="css/listAccount.css">
</head>
<body>
<div class="tabular--wrapper">



    <h3 class="main--title">List accounts</h3>
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
                <th>Action</th>
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
                        <a href="setAccount?id=${listAccounts.id}"><button class="fas fa-edit"></button></a>
                        <a href="removeAccount?id=${listAccounts.id}"><button class="fas fa-trash-alt"></button></a>

                    </td>

                </tr>
            </c:forEach>
            </tbody>
            </thead>
        </table>

    </div>

</div>
</body>
</html>
