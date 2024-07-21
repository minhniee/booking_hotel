<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="url1"
       value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zxx">

<!-- Mirrored from duruthemes.com/demo/html/cappa/demo1-light/${url}/homePage/spa-wellness.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 25 Jun 2024 06:13:19 GMT -->
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
    <!-- Spa-Wellness Slider -->
    <header class="header slider">
        <div class="owl-carousel owl-theme">
            <!-- The opacity on the image is made with "data-overlay-dark="number". You can change it using the numbers 0-9. -->
            <div class="text-center item bg-img" data-overlay-dark="3" data-background="${url1}/Assets1/img/spa/3.jpg"></div>
            <div class="text-center item bg-img" data-overlay-dark="3" data-background="${url1}/Assets1/img/spa/1.jpg"></div>
            <div class="text-center item bg-img" data-overlay-dark="3" data-background="${url1}/Assets1/img/spa/2.jpg"></div>
        </div>
        <!-- arrow down -->
        <div class="arrow bounce text-center">
            <a href="#" data-scroll-nav="1" class=""> <i class="ti-arrow-down"></i> </a>
        </div>
    </header>
    <!-- Spa-Wellness Content -->
    <section class="rooms-page section-padding" data-scroll-index="1">
        <div class="container">
            <div class="row">
                <div class="col-md-12"> <span><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i></span>
                    <div class="section-subtitle">So Many Ways to Unwind</div>
                    <div class="section-title">Spa & Wellness</div>
                    <p class="mb-30">Interdum et malesuada fames ac ante ipsum primis in faucibus. Praesent volutpat nibh ac sodales sodales. Nunc tincidunt erat sed nisi faucibus, eget sagittis libero imperdiet. Nunc risus magna, imperdiet gravida ultricies in, aliquam a tortor. Vestibulum tristique posuere magna, quis elementum neque luctus non. Aenean sed arcu efficitur, commodo justo ut, accumsan massa. Vivamus ac risus in felis imperdiet mollis id sit amet odio. Vestibulum dignissim finibus diam a commodo. Nulla quis miss dururana egestas semper. In sit amet nunc sed felis lacinia tempus sed quis ipsum.</p>
                </div>
                <div class="col-md-12">
                    <div class="reservations">
                        <div class="icon"><span class="flaticon-call"></span></div>
                        <div class="text">
                            <p>Reservations</p> <a href="tel:855-100-4444">855 100 4444</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Services -->
    <section class="services section-padding2">
        <div class="container">
            <div class="row">
                <div class="col-md-6 p-0 animate-box" data-animate-effect="fadeInLeft">
                    <div class="img left">
                        <a href="post.jsp"><img src="${url1}/Assets1/img/spa/3.jpg" alt=""></a>
                    </div>
                </div>
                <div class="col-md-6 p-0 bg-cream valign animate-box" data-animate-effect="fadeInRight">
                    <div class="content">
                        <div class="cont text-left">
                            <div class="info">
                                <h6>Experiences</h6>
                            </div>
                            <h4>Spa Center</h4>
                            <p>Spa center inilla duiman at elit finibus viverra nec a lacus themo the drudea seneoice misuscipit non sagie the fermen. Viverra tristique jusio the ivite dianne onen nivami acsestion augue artine.</p>
                            <p><span class="flaticon-clock"></span> Daily: 7.00 am to 9.00 pm </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 bg-cream p-0 order2 valign animate-box" data-animate-effect="fadeInLeft">
                    <div class="content">
                        <div class="cont text-left">
                            <div class="info">
                                <h6>Modern</h6>
                            </div>
                            <h4>Fitness Center</h4>
                            <p>Fitness center duiman at elit finibus viverra nec a lacus themo the drudea seneoice misuscipit non sagie the fermen. Viverra tristique jusio the ivite dianne onen nivami acsestion augue artine.</p>
                            <p><span class="flaticon-clock"></span> Daily: 6.00 am to 9.00 pm </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 p-0 order1 animate-box" data-animate-effect="fadeInRight">
                    <div class="img">
                        <a href="post2.jsp"><img src="${url1}/Assets1/img/spa/2.jpg" alt=""></a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 p-0 animate-box" data-animate-effect="fadeInLeft">
                    <div class="img left">
                        <a href="post.jsp"><img src="${url1}/Assets1/img/spa/1.jpg" alt=""></a>
                    </div>
                </div>
                <div class="col-md-6 p-0 bg-cream valign animate-box" data-animate-effect="fadeInRight">
                    <div class="content">
                        <div class="cont text-left">
                            <div class="info">
                                <h6>Experiences</h6>
                            </div>
                            <h4>The Health Club & Pool</h4>
                            <p>Spa center inilla duiman at elit finibus viverra nec a lacus themo the drudea seneoice misuscipit non sagie the fermen. Viverra tristique jusio the ivite dianne onen nivami acsestion augue artine.</p>
                            <p><span class="flaticon-clock"></span> Daily: 10.00 am to 7.00 pm </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Faqs -->
    <section class="section-padding bg-cream">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-subtitle">F.A.Qs</div>
                    <div class="section-title">Spa Etiquette</div>
                </div>
                <div class="col-md-12">
                    <ul class="accordion-box clearfix">
                        <li class="accordion block">
                            <div class="acc-btn">Arriving at The Spa</div>
                            <div class="acc-content">
                                <div class="content">
                                    <div class="text">Please arrive at The Spa 15 minutes prior to your scheduled treatment and enjoy the calm and serenity of The Spa atmosphere. Arriving late makes it necessary to curtail the time for your treatment.</div>
                                </div>
                            </div>
                        </li>
                        <li class="accordion block">
                            <div class="acc-btn">Mobile Phones</div>
                            <div class="acc-content">
                                <div class="content">
                                    <div class="text">Kindly refrain from using your mobile phone in The Spa premises. Please keep your mobile phone on silent mode at all times.</div>
                                </div>
                            </div>
                        </li>
                        <li class="accordion block">
                            <div class="acc-btn">Valuables</div>
                            <div class="acc-content">
                                <div class="content">
                                    <div class="text">We provide a secure place for your personal items inside The Spa complex. However, we do not accept liability for loss or damage. We recommend valuable items are stored inside the safe located in your hotel room/suite.</div>
                                </div>
                            </div>
                        </li>
                        <li class="accordion block">
                            <div class="acc-btn">Health Matters</div>
                            <div class="acc-content">
                                <div class="content">
                                    <div class="text">Please communicate health conditions such as high blood pressure and allergies, as well as pregnancy or any health-related concerns you may have when making your appointment. We do not recommend the consumption of alcohol before or directly after spa treatments or before using any facilities in the Spa and Health Club.</div>
                                </div>
                            </div>
                        </li>
                        <li class="accordion block">
                            <div class="acc-btn">Children</div>
                            <div class="acc-content">
                                <div class="content">
                                    <div class="text">The minimum age for entry to The Spa, The Health Club and the hydrothermal facilities is 16 years of age. Children under the age of 16 may use the hotel pool if they are accompanied by a parent/adult.</div>
                                </div>
                            </div>
                        </li>
                        <li class="accordion block">
                            <div class="acc-btn">Safety</div>
                            <div class="acc-content">
                                <div class="content">
                                    <div class="text">The max depth of the pool is 1.60 m. There is no lifeguard at the pool. Children may only use the pool if accompanied by an adult or parent/guardian.</div>
                                </div>
                            </div>
                        </li>
                        <li class="accordion block">
                            <div class="acc-btn">Smoking</div>
                            <div class="acc-content">
                                <div class="content">
                                    <div class="text">Kindly note that you are not allowed to smoke in The Spa, The Health Club or sauna area.</div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
    <!-- Testiominals -->
<%--    <section class="testimonials">--%>
<%--        <div class="background bg-img bg-fixed section-padding pb-0" data-background="${url1}/Assets1/img/spa/4.jpg" data-overlay-dark="3">--%>
<%--            <div class="container">--%>
<%--                <div class="row">--%>
<%--                    <div class="col-md-8 offset-md-2">--%>
<%--                        <div class="testimonials-box">--%>
<%--                            <div class="head-box">--%>
<%--                                <h6>Testimonials</h6>--%>
<%--                                <h4>What Client's Say?</h4>--%>
<%--                                <div class="line"></div>--%>
<%--                            </div>--%>
<%--                            <div class="owl-carousel owl-theme">--%>
<%--                                <div class="item"> <span class="quote"><img src="${url1}/Assets1/img/quot.png" alt=""></span>--%>
<%--                                    <p>Hotel dapibus asue metus the nec feusiate eraten miss hendreri net ve ante the lemon sanleo nectan feugiat erat hendrerit necuis ve ante otel inilla duiman at finibus viverra neca the sene on satien the miss drana inc fermen norttito sit space, mus nellentesque habitan.</p>--%>
<%--                                    <div class="info">--%>
<%--                                        <div class="author-img"> <img src="${url1}/Assets1/img/team/4.jpg" alt=""> </div>--%>
<%--                                        <div class="cont"> <span><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i></span>--%>
<%--                                            <h6>Emily Brown</h6> <span>Guest review</span>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="item"> <span class="quote"><img src="${url1}/Assets1/img/quot.png" alt=""></span>--%>
<%--                                    <p>Hotel dapibus asue metus the nec feusiate eraten miss hendreri net ve ante the lemon sanleo nectan feugiat erat hendrerit necuis ve ante otel inilla duiman at finibus viverra neca the sene on satien the miss drana inc fermen norttito sit space, mus nellentesque habitan.</p>--%>
<%--                                    <div class="info">--%>
<%--                                        <div class="author-img"> <img src="${url1}/Assets1/img/team/1.jpg" alt=""> </div>--%>
<%--                                        <div class="cont"> <span><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i></span>--%>
<%--                                            <h6>Nolan White</h6> <span>Guest review</span>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="item"> <span class="quote"><img src="${url1}/Assets1/img/quot.png" alt=""></span>--%>
<%--                                    <p>Hotel dapibus asue metus the nec feusiate eraten miss hendreri net ve ante the lemon sanleo nectan feugiat erat hendrerit necuis ve ante otel inilla duiman at finibus viverra neca the sene on satien the miss drana inc fermen norttito sit space, mus nellentesque habitan.</p>--%>
<%--                                    <div class="info">--%>
<%--                                        <div class="author-img"> <img src="${url1}/Assets1/img/team/5.jpg" alt=""> </div>--%>
<%--                                        <div class="cont"> <span><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i></span>--%>
<%--                                            <h6>Olivia Martin</h6> <span>Guest review</span>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </section>--%>
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

<!-- Mirrored from duruthemes.com/demo/html/cappa/demo1-light/spa-wellness.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 25 Jun 2024 06:13:19 GMT -->
</html>