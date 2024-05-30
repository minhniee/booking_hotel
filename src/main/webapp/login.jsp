<%--
  Created by IntelliJ IDEA.
  User: minhl
  Date: 5/16/2024
  Time: 8:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login page</title>
    <%@include file="layout/header.jsp" %>
    <style>
        .gradient-custom-2 {
            /* fallback for old browsers */
            background: #fccb90;

            /* Chrome 10-25, Safari 5.1-6 */
            background: -webkit-linear-gradient(to right, #ee7724, #d8363a, #dd3675, #b44593);

            /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
            background: linear-gradient(to right, #ee7724, #d8363a, #dd3675, #b44593);
        }

        @media (min-width: 768px) {
            .gradient-form {
                height: 100vh !important;
            }
        }
        @media (min-width: 769px) {
            .gradient-custom-2 {
                border-top-right-radius: .3rem;
                border-bottom-right-radius: .3rem;
            }
            img{
                width: 610px;
            }
        }
    </style>
</head>
<body>

<section class="h-100 gradient-form" style="background-color: #eee;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-xl-10">
                <div class="card rounded-3 text-black">
                    <div class="row g-0">
                        <div class="col-lg-6">
                            <div class="card-body p-md-5 mx-md-4">

                                <div class="text-center">
                                    <!--<img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/lotus.webp"-->
                                    <!--style="width: 185px;" alt="logo">-->
                                    <h4 class="mt-1 mb-5 pb-1">We are FBT</h4>
                                </div>

<%--                                <form>--%>
                                    <form action="${url}/login" method="post">
                                    <div data-mdb-input-init class="form-outline mt-2">
                                        <label class="form-label" for="form2Example11">Username</label>
                                        <input type="text" id="form2Example11" name="username" class="form-control"
                                               placeholder="Phone number or email address" />
                                    </div>

                                    <div data-mdb-input-init class="form-outline mb-2">
                                        <label class="form-label" for="form2Example22">Password</label>
                                        <input type="password" name="password" id="form2Example22" class="form-control" />
                                    </div>
                                    <div class="text-center pt-1 mb-5 pb-1">
                                        <button data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3" type="submit">Login</button>
                                        <p class="text-danger">${msg}</p>
                                        <p class="text-danger">${msg_ac}</p>
                                        <p class="text-danger">${msg_register}</p>
                                        <a class="text-muted" href="resetPass.jsp">Forgot password?</a>
                                    </div>
                                    </form>
                                    <div class="d-flex align-items-center justify-content-center pb-4">
                                        <p class="mb-0 me-2">Don't have an account?</p>
                                        <button type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-outline-danger" onclick="window.location.href='register.jsp'">Create new</button>
                                    </div>

<%--                                </form>--%>

                            </div>
                        </div>
                        <div class="col-lg-6 d-flex align-items-center gradient-custom-2">
<%--                            <img src="${url}/assest/room/img.png" alt="alt"/>--%>
                            <div class="text-white px-3 py-4 p-md-5 mx-md-4">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@include file="layout/footer.jsp" %>

</body>
</html>
