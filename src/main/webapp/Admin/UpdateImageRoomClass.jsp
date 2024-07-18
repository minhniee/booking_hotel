<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit room class</title>
    <link rel="stylesheet" href="Assets/css/setAccount.css">

</head>
<body>
<%@include file="dashBoardAdmin.jsp"%>
<div class="edit-account-wrapper">
    <h2>Edit room class</h2>
    <form class="edit-account-form" action="UpdateImageRoomClass" method="post"  enctype="multipart/form-data">
        <c:set var="roomClass" value="${requestScope.roomClass}" />

        <div class="form-group">
            <label for="username">ID</label>
            <input type="text" id="username" name="id" value="${roomClass.id}" required readonly/>
        </div>



        <div class="form-group">
            <label for="fullname">Class name</label>
            <input type="text" id="fullname" name="name" value="${roomClass.className}" required />
        </div>


        <div class="form-group">
            <label for="email">Price</label>
            <input type="text" id="email" name="price" value="${roomClass.basePrice}" required />
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
