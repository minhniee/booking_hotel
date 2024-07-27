<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert service</title>
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
    <h2>Insert service</h2>
    <form class="edit-account-form" action="ManageInsertService" method="post" enctype="multipart/form-data">
    <c:set value="${requestScope.id}" var="error"/>
        <c:set value="${requestScope.errorImg}" var="errorImg"/>
        <div class="form-group">
            <label for="username">ID</label>
            <input type="text" id="username" name="id"  required />
        </div>
        <c:if test="${not empty error}">
            ${error}
        </c:if>

        <div class="form-group">
            <label for="username">Category</label>
            <select name="type">
                <c:forEach items="${requestScope.list}" var="item">
                    <option value="${item.id}">${item.name}</option>
                </c:forEach>
            </select>
        </div>


        <div class="form-group">
            <label for="fullname">Service name</label>
            <input type="text" id="fullname" name="name" required />
        </div>

        <div class="form-group">
            <label for="email">Description</label>
            <input type="text" id="email" name="description"  required />
        </div>
        <div class="form-group">
            <label for="email">Price</label>
            <input type="text" id="email" name="price"  required />
        </div>
        <div class="form-group">
            <label for="email">Quantity</label>
            <input type="number" id="quantity" name="quantity"  required min="0"/>
        </div>

        <div class="form-group">
            <label for="email">Image</label>
            <input type="file"  name="image" onchange="previewImage(event)" required />
            <img id="imagePreview" class="mt-3" alt="image" width="30%">
            <c:if test="${not empty errorImg}">
                ${errorImg}
            </c:if>

        </div>

        <button type="submit" class="btn-submit">Save Changes</button>
    </form>
</div>

</body>
</html>
