<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit material</title>
    <link rel="stylesheet" href="Assets/css/setAccount.css">

</head>
<body>

<div class="edit-account-wrapper">
    <h2>Edit material</h2>
    <form class="edit-account-form" action="UpdateMaterial" method="post" >
        <c:set var="material" value="${requestScope.material}" />

        <div class="form-group">
            <label for="username">ID</label>
            <input type="text" id="username" name="id" value="${material.id}" required readonly/>
        </div>



        <div class="form-group">
            <label for="fullname">Material name</label>
            <input type="text" id="fullname" name="name" value="${material.name}" required />
        </div>

        <div class="form-group">
            <label for="email">Quantity</label>
            <input type="number" id="quantity" name="quantity" value="${material.quantity}" required min="0"/>
        </div>
        <div class="form-group">
            <label for="email">Price</label>
            <input type="text" id="email" name="price" value="${material.price}" required />
        </div>


        <div class="form-group">
            <label for="email">Image</label>
            <input type="text"  name="image"  value="${material.image}" required readonly/>
        </div>

        <button type="submit" class="btn-submit">Save Changes</button>
    </form>
</div>

</body>
</html>
