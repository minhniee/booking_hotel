<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit room</title>
    <link rel="stylesheet" href="Assets/css/setAccount.css">

</head>
<body>

<div class="edit-account-wrapper">
    <h2>Edit service</h2>
    <form class="edit-account-form" action="InsertRoom" method="post">
        <c:set var="roomManager" value="${requestScope.roomManager}" />
        <c:set var="error" value="${requestScope.error}" />
        <c:set var="errorName" value="${requestScope.errorName}" />
        <div class="form-group">
            <label for="username">ID</label>
            <input type="text" id="username" name="id"required />
            <c:if test="${not empty error}">
                ${error}
            </c:if>
        </div>

        <div class="form-group">
            <label for="username">Room class</label>
            <select name="type">
                <c:forEach items="${requestScope.list}" var="list">
                    <option value="${list.id}">${list.className}</option>
                </c:forEach>
            </select>
        </div>


        <div class="form-group">
            <label for="fullname">Name</label>
            <input type="text" id="fullname" name="name"  required />
            <c:if test="${not empty errorName}">
                ${errorName}
            </c:if>
        </div>


        <div class="form-group">
            <label for="email">Adult</label>
            <input type="number" id="quantity" name="adult"  required min="0"/>
        </div>

        <div class="form-group">
            <label for="email">Status name</label>
            <input type="text" id="quantity" name="status" value="Available" required min="0"/>
        </div>

        <button type="submit" class="btn-submit">Save Changes</button>
    </form>
</div>

</body>
</html>
