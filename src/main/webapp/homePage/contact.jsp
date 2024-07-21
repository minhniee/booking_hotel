<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="url1"
       value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zxx">

<!-- Mirrored from duruthemes.com/demo/html/cappa/demo1-light/contact.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 25 Jun 2024 06:13:22 GMT -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <title>The Cappa Luxury Hotel</title>
    <link rel="shortcut icon" href="${url1}/Assets1/img/favicon.png"/>
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Barlow&amp;family=Barlow+Condensed&amp;family=Gilda+Display&amp;display=swap">
    <link rel="stylesheet" href="${url1}/Assets1/css/plugins.css"/>
    <link rel="stylesheet" href="${url1}/Assets1/css/style.css"/>
</head>
<body>
<!-- Preloader -->
<div class="preloader-bg"></div>
<div id="preloader">
    <div id="preloader-status">
        <div class="preloader-position loader"> <span></span> </div>
    </div>
</div>
<!-- Progress scroll totop -->
<div class="progress-wrap cursor-pointer">
    <svg class="progress-circle svg-content" width="100%" height="100%" viewBox="-1 -1 102 102">
        <path d="M50,1 a49,49 0 0,1 0,98 a49,49 0 0,1 0,-98" />
    </svg>
</div>
<!-- Navbar -->
<%@include file="navbar.jsp"%>
<!-- Header Banner -->
<div class="banner-header section-padding valign bg-img bg-fixed" data-overlay-dark="3" data-background="${url1}/Assets1/img/slider/5.jpg">
  
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-left caption mt-90">
                <h5>Get in touch</h5>
                <h1>Contact Us</h1>
            </div>
        </div>
    </div>
</div>
<!-- Contact -->
<section class="contact section-padding">
    <div class="container">
        <div class="row mb-90">
            <div class="col-md-6 mb-60">
                <h3>The Cappa Luxury Hotel</h3>
                <p>Hotel ut nisl quam nestibulum ac quam nec odio elementum sceisue the aucan ligula. Orci varius natoque penatibus et magnis dis parturient monte nascete ridiculus mus nellentesque habitant morbine.</p>
                
                <div class="reservations mb-30">
                    <div class="icon"><span class="flaticon-call"></span></div>
                    <div class="text">
                        <p>Reservation</p> <a href="tel:855-100-4444">855 100 4444</a>
                    </div>
                </div>
                <div class="reservations mb-30">
                    <div class="icon"><span class="flaticon-envelope"></span></div>
                    <div class="text">
                        <p>Email Info</p> <a href="mailto:info@luxuryhotel.com">info@luxuryhotel.com</a>
                    </div>
                </div>
                <div class="reservations">
                    <div class="icon"><span class="flaticon-location-pin"></span></div>
                    <div class="text">
                        <p>Address</p> 1616 Broadway NY, New York 10001
                        <br>United States of America
                    </div>
                </div>
            </div>
            <div class="col-md-5 mb-30 offset-md-1">
                <h3>Get in touch ${message} ${alertClass}</h3>
                <form id="contactForm" method="post" class="contact__form" action="${url1}/contact">
                    <!-- form message -->
                    <div class="row">
                        <div class="col-12">
                            <c:if test="${not empty message}">
                                <div class="alert ${alertClass}" role="alert">${message}</div>
                            </c:if>

                        </div>
                    </div>
                    <!-- form elements -->
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <input name="name" id="name" type="text" placeholder="Your Name *" required>
                        </div>
                        <div class="col-md-6 form-group">
                            <input name="email" id="email" type="email" placeholder="Your Email *" required>
                        </div>
                        <div class="col-md-6 form-group">
                            <input name="phone" id="phone" type="text" placeholder="Your Number *" required>
                        </div>
                        <div class="col-md-6 form-group">
                            <input name="subject" id="subject" type="text" placeholder="Subject *" required>
                        </div>
                        <div class="col-md-12 form-group">
                            <textarea name="message" id="message" cols="30" rows="4" placeholder="Message *" required></textarea>
                        </div>
                        <div class="col-md-12">
                            <input type="submit" class="btn-dark" value="Send Message">
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- Map Section -->
        <div class="row">
            <div class="col-md-12 map animate-box" data-animate-effect="fadeInUp">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.5063419445323!2d105.52270891184536!3d21.01241668055203!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135abc60e7d3f19%3A0x2be9d7d0b5abcbf4!2sFPT%20University!5e0!3m2!1sen!2s!4v1721557575738!5m2!1sen!2s"
                        width="100%" height="600" style="border:0;" allowfullscreen="" loading="lazy"
                        referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
        </div>
    </div>
</section>
<!-- Reservation & Booking Form -->
<%@include file="ReservationAndBookingForm.jsp"%>
<!-- Clients -->
<section class="clients">
    <div class="container">
        <div class="row">
            <div class="col-md-7">
                <div class="owl-carousel owl-theme">
                    <div class="clients-logo">
                        <a href="#0"><img src="${url1}/Assets1/img/clients/1.png" alt=""></a>
                    </div>
                    <div class="clients-logo">
                        <a href="#0"><img src="${url1}/Assets1/img/clients/2.png" alt=""></a>
                    </div>
                    <div class="clients-logo">
                        <a href="#0"><img src="${url1}/Assets1/img/clients/3.png" alt=""></a>
                    </div>
                    <div class="clients-logo">
                        <a href="#0"><img src="${url1}/Assets1/img/clients/4.png" alt=""></a>
                    </div>
                    <div class="clients-logo">
                        <a href="#0"><img src="${url1}/Assets1/img/clients/5.png" alt=""></a>
                    </div>
                    <div class="clients-logo">
                        <a href="#0"><img src="${url1}/Assets1/img/clients/6.png" alt=""></a>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>
<!-- Footer -->
<%@include file="footer.jsp" %>
<!-- jQuery -->
<script src="${url1}/Assets1/js/jquery-3.6.3.min.js"></script>
<script src="${url1}/Assets1/js/jquery-migrate-3.0.0.min.js"></script>
<script src="${url1}/Assets1/js/modernizr-2.6.2.min.js"></script>
<script src="${url1}/Assets1/js/imagesloaded.pkgd.min.js"></script>
<script src="${url1}/Assets1/js/jquery.isotope.v3.0.2.js"></script>
<script src="${url1}/Assets1/js/pace.js"></script>
<script src="${url1}/Assets1/js/popper.min.js"></script>
<script src="${url1}/Assets1/js/bootstrap.min.js"></script>
<script src="${url1}/Assets1/js/scrollIt.min.js"></script>
<script src="${url1}/Assets1/js/jquery.waypoints.min.js"></script>
<script src="${url1}/Assets1/js/owl.carousel.min.js"></script>
<script src="${url1}/Assets1/js/jquery.stellar.min.js"></script>
<script src="${url1}/Assets1/js/jquery.magnific-popup.js"></script>
<script src="${url1}/Assets1/js/YouTubePopUp.js"></script>
<script src="${url1}/Assets1/js/select2.js"></script>
<script src="${url1}/Assets1/js/datepicker.js"></script>
<script src="${url1}/Assets1/js/smooth-scroll.min.js"></script>
<script src="${url1}/Assets1/js/custom.js"></script>
<script>
    // JavaScript for enhanced UI and form validation
    document.getElementById('contactForm').addEventListener('submit', function(event) {
        var isValid = true;
        var inputs = document.querySelectorAll('#contactForm input, #contactForm textarea');

        inputs.forEach(function(input) {
            if (!input.value) {
                isValid = false;
                input.classList.add('is-invalid');
            } else {
                input.classList.remove('is-invalid');
            }
        });

        // Validate email format
        var email = document.getElementById('email').value;
        var emailRegex = /^[A-Za-z0-9+_.-]+@(.+)$/;
        if (!emailRegex.test(email)) {
            isValid = false;
            document.getElementById('email').classList.add('is-invalid');
        } else {
            document.getElementById('email').classList.remove('is-invalid');
        }

        // Validate phone format (10 digits)
        var phone = document.getElementById('phone').value;
        var phoneRegex = /^[0-9]{10}$/;
        if (!phoneRegex.test(phone)) {
            isValid = false;
            document.getElementById('phone').classList.add('is-invalid');
        } else {
            document.getElementById('phone').classList.remove('is-invalid');
        }

        // Capitalize the first letter of each word in the name field
        var name = document.getElementById('name').value;
        var capitalized = name.split(' ').map(function(word) {
            return word.charAt(0).toUpperCase() + word.slice(1).toLowerCase();
        }).join(' ');
        document.getElementById('name').value = capitalized;

        if (!isValid) {
            event.preventDefault();
        }
    });
</script>
</body>

<!-- Mirrored from duruthemes.com/demo/html/cappa/demo1-light/contact.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 25 Jun 2024 06:13:22 GMT -->
</html>