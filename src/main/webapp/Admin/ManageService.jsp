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
</head>
<body>
<div class="tabular--wrapper">



    <h3 class="main--title">Manage Service</h3>
    <div class="table-container">
        <form id="subjectForm" action="ManageService" method="post">
            List of category
            <select name="type" id="subjectSelect">
                <option value="-1">All category</option>
                <c:set value="${requestScope.subjectid}" var="subjectid"/>
                <c:forEach items="${requestScope.manageServiceCategory}" var="manageServiceCategory">

                    <option value="${manageServiceCategory.id}" ${subjectId == manageServiceCategory.id ?"selected=\"selected\"":""}>${manageServiceCategory.name}</option>
                </c:forEach>

            </select>
        </form>
        <script>
            document.getElementById('subjectSelect').addEventListener('change', function() {
                document.getElementById('subjectForm').submit();
            });
        </script>
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Category name</th>

                <th>Service name</th>
                <th>Description</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Image</th>
                <th></th>
            </tr>
            <tbody>
            <c:forEach items="${requestScope.manageServices}" var="manageServices">
                <tr>
                    <td>${manageServices.id}</td>

                        <td>
                            <c:forEach items="${requestScope.manageServiceCategory}" var="manageServiceCategory">
                            <c:if test="${manageServices.category_id == manageServiceCategory.id}">
                                ${manageServiceCategory.name}
                            </c:if>
                            </c:forEach>
                        </td>

                    <td>${manageServices.service_name}</td>
                    <td>${manageServices.description}</td>
                    <td>${manageServices.price}</td>
                    <td>${manageServices.quantity}</td>
                    <td><img src="Assets/services/${manageServices.image}" width="120px"></td>
                    <td>
                        <a href=""><button class="fas fa-edit"></button></a>
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
