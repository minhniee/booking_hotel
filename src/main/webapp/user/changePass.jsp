<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="url"
       value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password</title>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 20px;
        }
        .alert-info {
            background-color: #d9edf7;
            color: #31708f;
            border: 1px solid #bce8f1;
            border-radius: 4px;
            padding: 15px;
            margin-bottom: 20px;
        }
        .alert-error {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
            border-radius: 4px;
            padding: 15px;
            margin-bottom: 20px;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
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
            <c:if test="${not empty msgrr}">
                <div id="message-error" class="alert alert-error">
                        ${msgrr}
                </div>
            </c:if>
            <c:if test="${not empty msgss}">
                <div id="message-success" class="alert alert-info">
                        ${msgss}
                </div>
            </c:if>
            <form action="${pageContext.request.contextPath}/ChangePass" method="post" id="passwordForm">
                <input type="password" class="input-lg form-control" name="oldPass" id="password0" placeholder="Old Password" required>
                <br>
                <input type="password" class="input-lg form-control" name="password" id="password1" placeholder="New Password" required>
                <br>
                <input type="password" class="input-lg form-control" name="confirmPassword" id="password2" placeholder="Repeat Password" required>
                <br>
                <input type="submit" class="col-xs-4 btn btn-primary btn-load btn-lg" data-loading-text="Changing Password..." value="Change">
            </form>
        </div><!--/col-sm-6-->
    </div><!--/row-->
</div>

</body>
</html>
