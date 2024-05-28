<%--
  Created by IntelliJ IDEA.
  User: Sang
  Date: 5/27/2024
  Time: 6:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="css/register.css" rel="stylesheet">
</head>
<body>

<div class="container register">
    <div class="row">
        <div class="col-md-3 register-left">
            <img src="https://logos-download.com/wp-content/uploads/2019/01/Hotel_International_Sinaia_Logo_old.png"
                 alt=""/>
            <h3>Welcome to Taget10 hotel</h3>
            <p>Exceptional Service, Unmatched Experience</p>
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
                                    <input type="text" class="form-control" name="fullName" placeholder="Full Name *"
                                           value=""/>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="address" placeholder="Your Address *"
                                           value=""/>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="userName" placeholder="User Name *"
                                           value=""/>
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" name="password" placeholder="Password *"
                                           value=""/>
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" name="confirmPassword"
                                           placeholder="Confirm Password *" value=""/>
                                </div>
                                <div class="form-group">
                                    <div class="maxl">
                                        <label class="radio inline">
                                            <input type="radio" name="gender" value="male" checked>
                                            <span> Male </span>
                                        </label>
                                        <label class="radio inline">
                                            <input type="radio" name="gender" value="female">
                                            <span>Female </span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="email" class="form-control" name="email" placeholder="Your Email *"
                                           value=""/>
                                </div>
                                <div class="form-group">
                                    <input type="text" minlength="10" maxlength="10" name="phone" class="form-control"
                                           placeholder="Your Phone *" value=""/>
                                </div>
                                <div class="form-group">
                                    <label for="birthdate">Date of birth:</label>
                                    <input type="date" class="form-control" name="birthdate" id="birthdate">
                                </div>
                                <p class="text-danger" id="validationError"></p>
                                <p class="text-danger">${msg_Username}</p>
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
        var fullName = document.forms["registerForm"]["fullName"].value;
        var password = document.forms["registerForm"]["password"].value;
        var confirmPassword = document.forms["registerForm"]["confirmPassword"].value;
        var email = document.forms["registerForm"]["email"].value;
        var phone = document.forms["registerForm"]["phone"].value;
        var birthdate = document.forms["registerForm"]["birthdate"].value;
        var errorMsg = "";

        // Kiểm tra fullname không được để trống
        if (fullName.trim() === "") {
            errorMsg = "Fullname không được để trống.";
        }

        // Kiểm tra password không được để trống và phải có ít nhất 6 ký tự
        if (password.trim() === "") {
            errorMsg = "Password không được để trống.";
        } else if (password.length < 6) {
            errorMsg = "Password phải có ít nhất 6 ký tự.";
        }

        // Kiểm tra confirmPassword phải trùng với password
        if (confirmPassword !== password) {
            errorMsg = "Confirm Password không khớp với Password.";
        }

        // Kiểm tra email
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            errorMsg = "Email không hợp lệ.";
        }

        // Kiểm tra số điện thoại
        var phoneRegex = /^\d{10}$/;
        if (!phoneRegex.test(phone)) {
            errorMsg = "Số điện thoại không hợp lệ.";
        }

        // Kiểm tra birthdate
        if (birthdate === "") {
            errorMsg = "Vui lòng chọn ngày sinh.";
        } else {
            var today = new Date();
            var selectedDate = new Date(birthdate);
            // Tính tuổi từ ngày sinh
            var age = today.getFullYear() - selectedDate.getFullYear();
            var monthDiff = today.getMonth() - selectedDate.getMonth();
            if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < selectedDate.getDate())) {
                age--;
            }
            // Kiểm tra tuổi phải lớn hơn hoặc bằng 12
            if (age < 12) {
                errorMsg = "Bạn phải ít nhất 12 tuổi để đăng ký.";
            }
            // So sánh ngày sinh với ngày hiện tại
            if (selectedDate > today) {
                errorMsg = "Ngày sinh không thể là ngày trong tương lai.";
            }
        }

        // Hiển thị thông báo lỗi nếu có
        if (errorMsg) {
            document.getElementById("validationError").innerText = errorMsg;
            event.preventDefault(); // Ngăn chặn việc submit form
            return false;
        }

        // Clear error message
        document.getElementById("validationError").innerText = "";
        return true;
    }

    function redirectToLogin(event) {
        event.preventDefault(); // Ngăn chặn việc submit form mặc định
        window.location.href = 'login'; // Thay đổi URL tới trang login
    }
</script>
</body>
</html>
