<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&family=Montserrat:wght@400;600&display=swap">

    <title>Reset Password</title>
    <style>
        body {
            background-image: url('${pageContext.request.contextPath}/Assets/image/Logo/background_login.png');
            background-size: cover;
            background-position: center;
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Roboto', sans-serif;
        }

        .card {
            background: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            width: 100%;
            max-width: 400px;
        }

        .card-body {
            padding: 30px;
        }

        .card-title {
            font-size: 20px;
            font-weight: 700;
            margin-bottom: 20px;
            text-align: center;
            font-family: 'Montserrat', sans-serif;
        }

        .form-control {
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
            margin-bottom: 20px;
            padding: 10px;
            width: 100%;
        }

        .btn-primary {
            background-color: #ee7724;
            border: none;
            border-radius: 4px;
            color: white;
            cursor: pointer;
            font-size: 16px;
            padding: 12px 20px;
            width: 100%;
            font-family: 'Montserrat', sans-serif;
        }

        .btn-primary:hover {
            background-color: #d8363a;
        }

        .text-danger {
            color: red;
            font-size: 14px;
            margin-top: 10px;
            text-align: center;
        }

        .forgot-password {
            display: block;
            font-size: 14px;
            margin-top: 10px;
            text-align: center;
            text-decoration: none;
        }

        .create-account {
            font-size: 16px;
            text-align: center;
            margin-top: 20px;
            font-family: 'Montserrat', sans-serif;
        }

        .create-account a {
            color: #d8363a;
            text-decoration: none;
        }

        .create-account a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="card">
    <div class="card-body">
        <h2 class="card-title">Reset Password</h2>
        <p class="text-center">Enter your new password below to reset it.</p>
        <form action="changepass2" method="post" id="passwordForm" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="password1">New Password</label>
                <input type="password" id="password1" name="password" class="form-control" placeholder="Enter your new password" required>
            </div>
            <div class="form-group">
                <label for="password2">Confirm Password</label>
                <input type="password" id="password2" name="confirmPassword" class="form-control" placeholder="Repeat your new password" required>
            </div>
            <div id="errorMessage" class="text-danger" style="display: none;"></div>
            <button type="submit" class="btn btn-primary">Reset Password</button>
            <p class="text-danger">${msg}</p>
            <a href="login.jsp" class="forgot-password">Back to Login</a>
        </form>
    </div>
</div>

<script>
    function validateForm() {
        var newpass = document.getElementById("password1").value;
        var confirmpass = document.getElementById("password2").value;
        var errorMessage = document.getElementById("errorMessage");

        errorMessage.style.display = "none";
        errorMessage.innerHTML = "";

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
