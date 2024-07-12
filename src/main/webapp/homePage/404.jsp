<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="url1"
       value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zxx">

<!-- Mirrored from duruthemes.com/demo/html/cappa/demo1-light/404.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 25 Jun 2024 06:13:21 GMT -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <title>The Cappa Luxury Hotel</title>
    <link rel="shortcut icon" href="${url1}/Assets1/img/favicon.png" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Barlow&amp;family=Barlow+Condensed&amp;family=Gilda+Display&amp;display=swap">
    <link rel="stylesheet" href="${url1}/Assets1/css/plugins.css" />
    <link rel="stylesheet" href="${url1}/Assets1/css/style.css" />
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
    <!-- 404 Page -->
    <section class="comming section-padding">
        <div class="v-middle">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 text-center">
                        <h1>404</h1>
                        <h2>Not Found 404</h2>
                    </div>
                </div>
                <div class="row text-center">
                    <div class="col-md-6 offset-md-3 text-center">
                        <p>The page you are looking for was moved, removed, renamed or never existed.</p>
                        <form>
                            <input type="text" name="search" placeholder="Search" required>
                            <button>Search</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
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
</body>

<!-- Mirrored from duruthemes.com/demo/html/cappa/demo1-light/404.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 25 Jun 2024 06:13:21 GMT -->
</html>
