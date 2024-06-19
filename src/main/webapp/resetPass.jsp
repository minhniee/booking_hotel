<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Reset Password</title>
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <style>
        .error-message {
            color: red; /* Màu chữ đỏ */
            background-color: #ffe6e6; /* Màu nền hồng nhạt */
            padding: 10px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<section class="bg-light p-3 p-md-4 p-xl-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-xxl-11">
                <div class="card border-light-subtle shadow-sm">
                    <div class="row g-0">
                        <div class="col-12 col-md-6">
                            <img class="img-fluid rounded-start w-100 h-100 object-fit-cover" loading="lazy" src="Assets/image/room/img.png" alt="Welcome back you've been missed!">
                        </div>
                        <div class="col-12 col-md-6 d-flex align-items-center justify-content-center">
                            <div class="col-12 col-lg-11 col-xl-10">
                                <div class="card-body p-3 p-md-4 p-xl-5">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="mb-5">
                                                <div class="text-center mb-4">
                                                    <a href="#!">
                                                        <img src="./Assets/image/Logo/logo_hotel.png" alt="logo hotel" width="175" height="57">
                                                    </a>
                                                </div>
                                                <h2 class="h4 text-center">Password Reset</h2>
                                                <h3 class="fs-6 fw-normal text-secondary text-center m-0">Provide the email address associated with your account to recover your password.</h3>
                                            </div>
                                        </div>
                                    </div>
                                    <form action="resetPass" method="post">
                                        <div class="row gy-3 overflow-hidden">
                                            <div class="col-12">
                                                <div class="form-floating mb-3">
                                                    <input type="email" class="form-control" name="email" id="email" placeholder="name@example.com" required>
                                                    <label for="email" class="form-label">Email</label>
                                                    <div class="invalid-feedback" id="emailError"></div>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="d-grid">
                                                    <button class="btn btn-dark btn-lg" type="submit">Reset Password</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="d-flex gap-2 gap-md-4 flex-column flex-md-row justify-content-md-center mt-5">
                                                <a href="login.jsp" class="link-secondary text-decoration-none">Login</a>
                                                <a href="register.jsp" class="link-secondary text-decoration-none">Register</a>
                                            </div>
                                        </div>
                                    </div>
                                    <%-- Print message from servlet --%>
                                    <% String msg = (String) request.getAttribute("msg"); %>
                                    <% if (msg != null && !msg.isEmpty()) { %>
                                    <p class="text-center mt-4 error-message"><%= msg %></p>
                                    <% } %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        var emailInput = document.getElementById("email");
        var emailError = document.getElementById("emailError");

        emailInput.addEventListener("input", function() {
            validateEmail();
        });

        function validateEmail() {
            var email = emailInput.value;
            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                emailInput.classList.add("is-invalid");
                emailError.textContent = "Invalid email format.";
            } else {
                emailInput.classList.remove("is-invalid");
                emailError.textContent = "";
            }
        }
    });
</script>

</body>
</html>
