<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert room class</title>
    <link rel="stylesheet" href="Assets/css/setAccount.css">

</head>
<body>
<%@include file="dashBoardAdmin.jsp"%>
<div class="edit-account-wrapper">
    <h2>Insert room class</h2>
    <form class="edit-account-form" action="InsertRoomClass" method="post"  enctype="multipart/form-data">
        <c:set var="error" value="${requestScope.error}" />

        <div class="form-group">
            <label for="username">ID</label>
            <input type="text" id="username" name="id"  required />
            <c:if test="${not empty error}">
                ${error}
            </c:if>
        </div>



        <div class="form-group">
            <label for="fullname">Class name</label>
            <input type="text" id="fullname" name="name"  required />
        </div>


        <div class="form-group">
            <label for="email">Price</label>
            <input type="text" id="email" name="price"  required />
        </div>


        <div class="form-group">
            <label for="email">Image</label>
            <input type="file"  name="image"   required readonly/>
        </div>

        <button type="submit" class="btn-submit">Save Changes</button>
    </form>
</div>

</body>
</html>
