<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&family=Montserrat:wght@400;600&display=swap">

    <title>Forgot Password</title>
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
            background: rgba(255, 255, 255, 0.9);
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            width: 100%;
            max-width: 400px;
            padding: 20px;
        }

        .card-body {
            padding: 20px;
        }

        .card-title {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 20px;
            text-align: center;
            font-family: 'Montserrat', sans-serif;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-control {
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 16px;
            padding: 12px;
            width: 100%;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 0 0.2rem rgba(38, 143, 255, 0.25);
        }

        .btn-primary {
            background-color: #f5c542; /* Màu vàng */
            border: none;
            border-radius: 8px;
            color: white;
            cursor: pointer;
            font-size: 16px;
            padding: 12px;
            width: 100%;
            font-family: 'Montserrat', sans-serif;
            transition: background-color 0.3s, transform 0.3s;
        }

        .btn-primary:hover {
            background-color: #e0b936; /* Vàng đậm hơn khi hover */
            transform: scale(1.02);
        }

        .text-danger {
            color: #dc3545;
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
            color: #007bff;
        }

        .forgot-password:hover {
            text-decoration: underline;
        }

        .create-account {
            font-size: 16px;
            text-align: center;
            margin-top: 20px;
            font-family: 'Montserrat', sans-serif;
        }

        .create-account a {
            color: #007bff;
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
        <h2 class="card-title">Forgot Password</h2>
        <p class="text-center">Enter your email address below to receive a password reset link.</p>
        <form action="resetPass" method="post">
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" class="form-control" placeholder="name@example.com" required>
            </div>
            <button type="submit" class="btn btn-primary">Send Reset Link</button>
            <p class="text-danger">${msg}</p>
            <a href="login.jsp" class="forgot-password">Back to Login</a>
        </form>
        <div class="create-account">
            Don't have an account? <a href="register.jsp">Create new</a>
        </div>
    </div>
</div>

</body>
</html>
