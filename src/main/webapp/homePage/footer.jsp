<style>
    .footer-subscribe {
        text-align: center;
        margin-top: 20px;
    }
    .footer-subscribe form {
        display: inline-block;
    }
    .footer-subscribe input[type="email"] {
        padding: 10px;
        margin-right: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    .footer-subscribe button {
        padding: 10px 20px;
        background-color: #333;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    .error {
        color: red;
        display: none;
        margin-top: 10px;
    }
</style>

<footer class="footer">
    <div class="footer-top">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="footer-column footer-about">
                        <h3 class="footer-title">About Hotel</h3>
                        <p class="footer-about-text">Welcome to the best five-star deluxe hotel in Hoa Lac, Viet Nam. Hotel elementum sesue the aucan vestibulum aliquam justo in sapien rutrum volutpat.</p>

                        <div class="footer-language">
                            <i class="lni ti-world"></i>
                            <select onchange="location = this.value;">
                                <option value="#0">English</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 offset-md-1">
<%--                    <div class="footer-column footer-explore clearfix">--%>
<%--                        <h3 class="footer-title">Explore</h3>--%>
<%--                        <ul class="footer-explore-list list-unstyled">--%>
<%--                            <li><a href="home">Home</a></li>--%>
<%--                            <li><a href="Room">Rooms & Suites</a></li>--%>
<%--                            <li><a href="restaurant.jsp">Restaurant</a></li>--%>
<%--                            <li><a href="${url}/homePage/spa-wellness.jsp">Spa & Wellness</a></li>--%>
<%--                            <li><a href="about.jsp">About Hotel</a></li>--%>
<%--                            <li><a href="contact.jsp">Contact</a></li>--%>
<%--                        </ul>--%>
<%--                    </div>--%>
                </div>
                <div class="col-md-4">
                    <div class="footer-column footer-contact">
                        <h3 class="footer-title">Contact</h3>
                        <p class="footer-contact-text">Khu Cong Nghe Cao, Hoa Lac, Thach That<br>Viet Nam</p>
                        <div class="footer-contact-info">
                            <p class="footer-contact-phone"><span class="flaticon-call"></span> 0312345678</p>
                            <p class="footer-contact-mail">renager.hotel@gmail.com</p>
                        </div>

                        <div class="footer-subscribe">
                            <h3 class="footer-title">Subscribe to Our Newsletter</h3>
                            <form method="get" action="${pageContext.request.contextPath}/contact" onsubmit="return validateEmail()">
                                <input type="email" style="color: white" id="email" name="email" placeholder="Enter your email" required>
                                <button type="submit">Subscribe</button>
                                <div id="error-message" class="error">Please enter a valid email address.</div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="footer-bottom-inner">
<%--                        <p class="footer-bottom-copy-right">© Copyright 2024 by <a href="#">DuruThemes.com</a></p>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>

<script>
    function validateEmail() {
        var email = document.getElementById('email').value;
        var errorMessage = document.getElementById('error-message');
        var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;

        if (emailPattern.test(email)) {
            errorMessage.style.display = 'none';
            return true;
        } else {
            errorMessage.style.display = 'block';
            return false;
        }
    }

    document.getElementById('email').addEventListener('input', function() {
        document.getElementById('error-message').style.display = 'none';
    });
</script>
