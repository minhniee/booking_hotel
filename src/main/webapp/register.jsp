<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link href="${url}/Assets/css/register.css" rel="stylesheet">
    <style>
        body {
            background-image: url('${pageContext.request.contextPath}/Assets/image/Logo/background_login.png');
            background-size: cover;
            background-repeat: no-repeat;
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
        }

        .register {
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            width: 100%;
        }

        .register-left {
            text-align: center;
            margin-bottom: 20px;
        }

        .register-left img {
            max-width: 100px;
            margin-bottom: 20px;
        }

        .register-left h3 {
            margin-top: 0;
            font-size: 24px;
            color: #333;
        }

        .register-left p {
            font-size: 14px;
            color: #666;
        }

        .register-left input[type="submit"] {
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s;
        }

        .register-left input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .register-heading {
            font-size: 28px;
            color: #333;
            margin-bottom: 20px;
            text-align: center;
            font-weight: bold;
        }

        .register-form .form-control {
            height: 40px;
            font-size: 14px;
            border-radius: 4px;
            margin-bottom: 15px;
        }

        .maxl {
            margin-bottom: 20px;
        }

        .maxl label {
            margin-right: 15px;
            font-size: 14px;
        }

        .text-danger {
            font-size: 14px;
            color: red;
        }

        input[type="date"] {
            height: 40px;
            font-size: 14px;
            border-radius: 4px;
            padding: 8px;
            margin-bottom: 15px;
        }

        .btnRegister {
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            background-color: #28a745;
            color: #fff;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s;
        }

        .btnRegister:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<div class="container register">
    <div class="row">
        <div class="col-md-3 register-left">
            <h3>Welcome to hotel</h3>
            <p>Fill out form to create account</p>
            <input type="submit" name="" value="Login" onclick="redirectToLogin(event)"/><br/>
        </div>
        <div class="col-md-9 register-right">
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                    <h3 class="register-heading">Create account</h3>
                    <form name="registerForm" action="register" method="post" onsubmit="return validateForm(event)">
                        <div class="row register-form">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="text" class="form-control" name="fullName" placeholder="Full Name *" value="${fullName != null ? fullName : ''}" />
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="address" placeholder="Your Address *" value="${address != null ? address : ''}" />
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="userName" placeholder="User Name *" value="${userName != null ? userName : ''}" />
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" name="password" placeholder="Password *" value="${password != null ? password : ''}" />
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" name="confirmPassword" placeholder="Confirm Password *" value="${confirmPassword != null ? confirmPassword : ''}" />
                                </div>
                                <div class="form-group">
                                    <div class="maxl">
                                        <label class="radio inline">
                                            <input type="radio" name="gender" value="male" ${gender != null && gender.equals("male") ? "checked" : ""}>
                                            <span> Male </span>
                                        </label>
                                        <label class="radio inline">
                                            <input type="radio" name="gender" value="female" ${gender != null && gender.equals("female") ? "checked" : ""}>
                                            <span>Female </span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="email" class="form-control" name="email" placeholder="Your Email *" value="${email != null ? email : ''}" />
                                </div>
                                <div class="form-group">
                                    <input type="text" minlength="10" maxlength="10" name="phone" class="form-control" placeholder="Your Phone *" value="${phone != null ? phone : ''}" />
                                </div>
                                <div class="form-group">
                                    <label for="birthdate">Date of birth:</label>
                                    <input type="date" class="form-control" name="birthdate" id="birthdate" value="${birthdate != null ? birthdate : ''}">
                                </div>
                                <p class="text-danger" id="validationError"></p>
                                <p class="text-danger">${msg_Username != null ? msg_Username : ''}</p>

                                <input type="submit" class="btnRegister" value="Register"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function validateForm(event) {
        var errorMsg = "";

        // Validate fullName
        var fullName = document.forms["registerForm"]["fullName"].value;
        var fullNameRegex = /^[a-zA-Z\s]+$/;
        if (fullName.trim() === "") {
            errorMsg = "Full name cannot be left blank.";
        } else if (!fullNameRegex.test(fullName)) {
            errorMsg = "Full name cannot contain special characters or numbers.";
        } else {
            // Validate address
            var address = document.forms["registerForm"]["address"].value;
            if (address.trim() === "") {
                errorMsg = "Address cannot be left blank.";
            } else {
                // Validate gender
                var gender = document.forms["registerForm"]["gender"].value;
                if (!gender) {
                    errorMsg = "Gender must be selected.";
                } else {
                    // Validate password
                    var password = document.forms["registerForm"]["password"].value;
                    if (password.trim() === "") {
                        errorMsg = "Password cannot be blank.";
                    } else if (password.length < 6) {
                        errorMsg = "Password must have at least 6 characters.";
                    } else {
                        // Validate confirmPassword
                        var confirmPassword = document.forms["registerForm"]["confirmPassword"].value;
                        if (confirmPassword !== password) {
                            errorMsg = "Confirm Password does not match Password.";
                        } else {
                            // Validate email
                            var email = document.forms["registerForm"]["email"].value;
                            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                            if (!emailRegex.test(email)) {
                                errorMsg = "Invalid email.";
                            } else {
                                // Validate phone
                                var phone = document.forms["registerForm"]["phone"].value;
                                var phoneRegex = /^\d{10}$/;
                                if (!phoneRegex.test(phone)) {
                                    errorMsg = "Invalid phone number.";
                                } else {
                                    // Validate birthdate
                                    var birthdate = document.forms["registerForm"]["birthdate"].value;
                                    if (birthdate === "") {
                                        errorMsg = "Date of birth cannot be left blank.";
                                    } else {
                                        var today = new Date();
                                        var selectedDate = new Date(birthdate);
                                        var age = today.getFullYear() - selectedDate.getFullYear();
                                        var monthDiff = today.getMonth() - selectedDate.getMonth();
                                        if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < selectedDate.getDate())) {
                                            age--;
                                        }
                                        if (age < 12) {
                                            errorMsg = "You must be at least 12 years old to register.";
                                        } else if (selectedDate > today) {
                                            errorMsg = "Date of birth cannot be a future date.";
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        // Display error message if any
        if (errorMsg) {
            document.getElementById("validationError").innerText = errorMsg;
            event.preventDefault(); // Prevent form submission
            return false;
        }

        // Clear error message
        document.getElementById("validationError").innerText = "";
        return true;
    }

    function redirectToLogin(event) {
        event.preventDefault(); // Prevent default form submission
        window.location.href = 'login'; // Redirect to login page
    }
</script>
</body>
</html>
