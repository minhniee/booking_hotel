<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change image room</title>
    <link rel="stylesheet" href="Assets/css/setAccount.css">
    <script>
        function previewImage(event) {
            const reader = new FileReader();
            reader.onload = function() {
                const output = document.getElementById('imagePreview');
                output.src = reader.result;
            };
            reader.readAsDataURL(event.target.files[0]);
        }
    </script>
</head>
<body>
<%@include file="dashBoardAdmin.jsp"%>
<div class="edit-account-wrapper">
    <h2>Change image room</h2>
    <form class="edit-account-form" action="UpdateImageRoom" method="post"  enctype="multipart/form-data">
        <c:set var="room_id" value="${requestScope.room_id}" />
        <c:set var="room_image" value="${requestScope.room_image}" />


        <input type="text" id="username" name="room_id" value="${room_id}" required  hidden="hidden"/>
        <div class="form-group">
            <label for="username">ID</label>
            <input type="text" id="username" name="id" value="${room_image.id}" required readonly/>
        </div>
        <div class="form-group">
            <label for="username">Room Class</label>
            <input type="text" id="username" name="room_class_id" value="${room_image.room_class_id}" required readonly/>
        </div>
        <div class="form-group">
            <label for="email">Image</label>
            <input type="file"  name="image"   onchange="previewImage(event)"  />
            <img id="imagePreview" class="mt-3"  src="Assets/image/demoRoom/${room_image.image}" alt="image" width="30%">
            <input type="hidden" name="oldImage" value="${room_image.image}" />
        </div>

        <button type="submit" class="btn-submit">Save Changes</button>
    </form>
</div>

</body>
</html>
