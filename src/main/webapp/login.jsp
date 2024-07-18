<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&family=Montserrat:wght@400;600&display=swap">

    <title>Login Page</title>
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
            font-size: 20px; /* Adjust the font size here */
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
        <h2 class="card-title">Login to Your Account</h2>
        <form action="login" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" class="form-control" placeholder="Enter your username">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password">
            </div>
            <button type="submit" class="btn btn-primary">Login</button>
            <p class="text-danger">${msg_register}</p>
            <p class="text-danger">${msg}</p>
            <a href="resetPass.jsp" class="forgot-password">Forgot password?</a>
        </form>
        <div class="create-account">
            Don't have an account? <a href="register.jsp">Create new</a>
        </div>
    </div>
</div>

</body>
</html>
