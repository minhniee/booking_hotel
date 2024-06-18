<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Account</title>
    <link rel="stylesheet" href="Assets/css/setAccount.css">
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

            <input type="hidden" id="password" name="password" value="${account.password}" required readonly />
        </div>

        <div class="form-group">
            <label for="fullname">Fullname</label>
            <input type="text" id="fullname" name="fullname" value="${account.fullName}" required readonly/>
        </div>

        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" value="${account.email}" required readonly/>
        </div>

        <div class="form-group">
            <label for="role">Role</label>
            <select id="role" name="role" required>
                <option value="staff" ${account.role == 'staff' ? 'selected' : ''}>Staff</option>
                <option value="customer" ${account.role == 'customer' ? 'selected' : ''}>Customer</option>
            </select>
        </div>

        <div class="form-group">
            <label for="gender">Gender</label>
            <input type="text" id="gender" name="gender" value="${account.gender}" required readonly/>

        </div>


        <div class="form-group">
            <label for="phone">Phone</label>
            <input type="text" id="phone" name="phone" value="${account.phone}" required readonly/>
        </div>

        <div class="form-group">
            <label for="dob">DOB</label>
            <input type="date" id="dob" name="dob" value="${account.dob}" required readonly/>
        </div>

        <div class="form-group">
            <label for="address">Address</label>
            <input type="text" id="address" name="address" value="${account.address}" required readonly/>
        </div>

        <button type="submit" class="btn-submit">Save Changes</button>
    </form>
</div>

</body>
</html>
