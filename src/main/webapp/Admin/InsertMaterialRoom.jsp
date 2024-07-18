<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert material</title>
    <link rel="stylesheet" href="Assets/css/setAccount.css">

</head>
<body>
<%@include file="dashBoardAdmin.jsp"%>
<div class="edit-account-wrapper">
    <h2>Insert material</h2>
    <form class="edit-account-form" action="InsertMaterialRoom" method="post" >
        <c:set var="room_class_id" value="${requestScope.room_class_id}" />
        <c:set var="room_id" value="${requestScope.room_id}" />
        <div class="form-group">
            <label for="username">Room id</label>
            <input type="text" id="username" name="room_id" value="${room_id}" required readonly/>
        </div>
        <input type="text" id="username" name="room_class_id" value="${room_class_id}" required hidden="hidden"/>
        <div class="form-group">
            <label for="username">Material</label>
            <select name="type">
                <c:forEach items="${requestScope.list}" var="list">
                    <option value="${list.id}">${list.name}</option>
                </c:forEach>
            </select>
        </div>

        <button type="submit" class="btn-submit">Save Changes</button>
    </form>
</div>

</body>
</html>
