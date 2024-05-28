<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Account</title>
    <link rel="stylesheet" href="css/setAccount.css">
</head>
<body>

<div class="edit-account-wrapper">
    <h2>Edit Account</h2>
    <form class="edit-account-form" action="setAccount" method="post">
        <c:set var="account" value="${requestScope.account}" />
        <input type="hidden" name="id" value="${account.id}"/>
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" value="${account.userName}" required />
        </div>

        <div class="form-group">

            <input type="hidden" id="password" name="password" value="${account.password}" required />
        </div>

        <div class="form-group">
            <label for="fullname">Fullname</label>
            <input type="text" id="fullname" name="fullname" value="${account.fullName}" required />
        </div>

        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" value="${account.email}" required />
        </div>

        <div class="form-group">
            <label for="role">Role</label>
            <input type="text" id="role" name="role" value="${account.role}" required />
        </div>

        <div class="form-group">
            <label for="gender">Gender</label>
            <select id="gender" name="gender" required>
                <option value="Male" <c:if test="${account.gender}">selected</c:if>>Male</option>
                <option value="Female" <c:if test="${!account.gender}">selected</c:if>>Female</option>
            </select>
        </div>


        <div class="form-group">
            <label for="phone">Phone</label>
            <input type="text" id="phone" name="phone" value="${account.phone}" required />
        </div>

        <div class="form-group">
            <label for="dob">DOB</label>
            <input type="date" id="dob" name="dob" value="${account.dob}" required />
        </div>

        <div class="form-group">
            <label for="address">Address</label>
            <input type="text" id="address" name="address" value="${account.address}" required />
        </div>

        <button type="submit" class="btn-submit">Save Changes</button>
    </form>
</div>

</body>
</html>
