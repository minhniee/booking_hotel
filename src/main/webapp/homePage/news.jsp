
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="url1"
       value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>

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
    <!-- Header Banner -->
    <div class="banner-header section-padding valign bg-img bg-fixed" data-overlay-dark="4" data-background="${url1}/Assets1/img/slider/5.jpg">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-left caption mt-90">
                    <h5>Hotel Blog</h5>
                    <h1>Our News</h1>
                </div>
            </div>
        </div>
    </div>
    <!-- News  -->
    <section class="news section-padding bg-blck">
        <div class="container">
            <div class="row">
                <div class="col-md-4 mb-30">
                    <div class="item">
                            <div class="position-re o-hidden"> <img src="${url1}/Assets1/img/news/1.jpg" alt="">
                                <div class="date">
                                    <a href="post.jsp"> <span>Dec</span> <i>02</i> </a>
                                </div>
                            </div>
                            <div class="con"> <span class="category">
                                    <a href="news.jsp">Restaurant</a>
                                </span>
                                <h5><a href="post.jsp">Historic restaurant renovated</a></h5>
                            </div>
                        </div>
                </div>
                <div class="col-md-4 mb-30">
                    <div class="item">
                            <div class="position-re o-hidden"> <img src="${url1}/Assets1/img/news/2.jpg" alt="">
                                <div class="date">
                                    <a href="post.jsp"> <span>Dec</span> <i>04</i> </a>
                                </div>
                            </div>
                            <div class="con"> <span class="category">
                                    <a href="news.jsp">Spa</a>
                                </span>
                                <h5><a href="post.jsp">Benefits of Spa Treatments</a></h5>
                            </div>
                        </div>
                </div>
                <div class="col-md-4 mb-30">
                    <div class="item">
                            <div class="position-re o-hidden"> <img src="${url1}/Assets1/img/news/3.jpg" alt="">
                                <div class="date">
                                    <a href="post.jsp"> <span>Dec</span> <i>06</i> </a>
                                </div>
                            </div>
                            <div class="con"> <span class="category">
                                    <a href="news.jsp">Bathrooms</a>
                                </span>
                                <h5><a href="post.jsp">Hotel Bathroom Collections</a></h5>
                            </div>
                        </div>
                </div>
                <div class="col-md-4 mb-30">
                    <div class="item">
                            <div class="position-re o-hidden"> <img src="${url1}/Assets1/img/news/4.jpg" alt="">
                                <div class="date">
                                    <a href="post.jsp"> <span>Dec</span> <i>08</i> </a>
                                </div>
                            </div>
                            <div class="con"> 
                                <span class="category">
                                    <a href="news.jsp">Health</a>
                                </span>
                                <h5><a href="post.jsp">Weight Loss with Fitness Health Club</a></h5>
                            </div>
                        </div>
                </div>
                <div class="col-md-4 mb-30">
                    <div class="item">
                            <div class="position-re o-hidden"> <img src="${url1}/Assets1/img/news/6.jpg" alt="">
                                <div class="date">
                                    <a href="post.jsp"> <span>Dec</span> <i>08</i> </a>
                                </div>
                            </div>
                            <div class="con"> <span class="category">
                                    <a href="news.jsp">Design</a>
                                </span>
                                <h5><a href="post.jsp">Retro Lighting Design in The Hotels</a></h5>
                            </div>
                        </div>
                </div>
                <div class="col-md-4 mb-30">
                    <div class="item">
                            <div class="position-re o-hidden"> <img src="${url1}/Assets1/img/news/5.jpg" alt="">
                                <div class="date">
                                    <a href="post.jsp"> <span>Dec</span> <i>08</i> </a>
                                </div>
                            </div>
                            <div class="con"> <span class="category">
                                    <a href="news.jsp">Health</a>
                                </span>
                                <h5><a href="post.jsp">Benefits of Swimming for Your Health</a></h5>
                            </div>
                        </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 text-center">
                    <!-- Pagination -->
                    <ul class="news-pagination-wrap align-center mb-30 mt-30">
                        <li><a href="news.jsp#"><i class="ti-angle-left"></i></a></li>
                        <li><a href="news.jsp#">1</a></li>
                        <li><a href="news.jsp#" class="active">2</a></li>
                        <li><a href="news.jsp#">3</a></li>
                        <li><a href="news.jsp#"><i class="ti-angle-right"></i></a></li>
                    </ul>
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
    <%@include file="footer.jsp"%>
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

<!-- Mirrored from duruthemes.com/demo/html/cappa/demo1-light/news.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 25 Jun 2024 06:13:21 GMT -->
</html>