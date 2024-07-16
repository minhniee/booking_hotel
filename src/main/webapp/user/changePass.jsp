<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="url"
       value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Change password</title>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <h1>Change Password</h1>
            <div>
                <a href="${url}/home" class="btn btn-primary">Back to Home</a>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-6 col-sm-offset-3">
            <!-- Message div -->
            <c:if test="${not empty sessionScope.msg}">
                <div id="message" class="alert alert-info">
                        ${sessionScope.msg}
                </div>
            </c:if>
            <form action="${pageContext.request.contextPath}/ChangePass" method="post" id="passwordForm" onsubmit="return validateForm()">
                <input type="password" class="input-lg form-control" name="oldPass" id="password0" placeholder="Old Password" >
                <br>
                <input type="password" class="input-lg form-control" name="password" id="password1" placeholder="New Password" value="${password != null ? password : ''}">
                <br>
                <input type="password" class="input-lg form-control" name="confirmPassword" id="password2" placeholder="Repeat Password" value="${confirmPassword != null ? confirmPassword : ''}" >
                <br>
                <input type="submit" class="col-xs-4 btn btn-primary btn-load btn-lg" data-loading-text="Changing Password..." value="Change">

            </form>
        </div><!--/col-sm-6-->
    </div><!--/row-->
</div>

<script>
    function validateForm() {
        var oldpass = document.getElementById("password0").value;
        var newpass = document.getElementById("password1").value;
        var confirmpass = document.getElementById("password2").value;
        var errorMessage = document.getElementById("error-message");
        var successMessage = document.getElementById("success-message");

        errorMessage.style.display = "none";
        errorMessage.innerHTML = "";
        successMessage.style.display = "none";
        successMessage.innerHTML = "";

        if (oldpass === "" || newpass === "" || confirmpass === "") {
            errorMessage.innerHTML = "All fields are required.";
            errorMessage.style.display = "block";
            return false;
        }

        if (newpass.length < 6) {
            errorMessage.innerHTML = "New Password must be at least 6 characters long.";
            errorMessage.style.display = "block";
            return false;
        }

        if (newpass !== confirmpass) {
            errorMessage.innerHTML = "New Password and Repeat Password do not match.";
            errorMessage.style.display = "block";
            return false;
        }

        return true;
    }
</script>

</body>
</html>
