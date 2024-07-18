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
    <h2>Edit room</h2>
    <form class="edit-account-form" action="UpdateRoom" method="post">
        <c:set var="roomManager" value="${requestScope.roomManager}" />

        <div class="form-group">
            <label for="username">ID</label>
            <input type="text" id="username" name="id" value="${roomManager.id}" required readonly/>
        </div>

        <div class="form-group">
            <label for="username">Room class</label>
            <select name="type">
                <c:forEach items="${requestScope.listRoomClass}" var="listRoomClass">
                    <option value="${listRoomClass.id}" ${roomManager.room_class == listRoomClass.id ?"selected=\"selected\"":""}>${listRoomClass.className}</option>
                </c:forEach>
            </select>
        </div>


        <div class="form-group">
            <label for="fullname">Name</label>
            <input type="text" id="fullname" name="name" value="${roomManager.room_name}" required />
        </div>


        <div class="form-group">
            <label for="email">Adult</label>
            <input type="number" id="quantity" name="adult" value="${roomManager.num_ad}" required min="0"/>
        </div>

        <div class="form-group">
            <label for="email">Status room</label>
            <select name="status">
                <option value="Available" ${roomManager.status_name == 'Available' ? "selected=\"selected\"":""}>Available</option>
                <option value="Disable" ${roomManager.status_name != 'Available' ? "selected=\"selected\"":""}>Disable</option>
            </select>
        </div>

        <button type="submit" class="btn-submit">Save Changes</button>
    </form>
</div>

</body>
</html>
