
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="url"
       value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="zxx">


<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <title>The Cappa Luxury Hotel</title>
    <link rel="shortcut icon" href="${url}/Assets1/img/favicon.png" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Barlow&amp;family=Barlow+Condensed&amp;family=Gilda+Display&amp;display=swap">
    <link rel="stylesheet" href="${url}/Assets1/css/plugins.css" />
    <link rel="stylesheet" href="${url}/Assets1/css/style.css" />
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
<!-- Parallax Image -->
<div class="banner-header full-height section-padding valign bg-img bg-fixed" data-overlay-dark="4" data-background="${url}/Assets1/img/slider/3.jpg">
    <div class="container">
        <div class="row">
            <div class="col-md-7">
                <div class="v-middle caption">
                        <span>
                            <i class="star-rating"></i>
                            <i class="star-rating"></i>
                            <i class="star-rating"></i>
                            <i class="star-rating"></i>
                            <i class="star-rating"></i>
                        </span>
                    <h4>Unique Place to Relax & Enjoy</h4>
                    <h3>The Perfect Base For You</h3>
                    <div class="butn-light mt-30 mb-30"> <a href="#" data-scroll-nav="2"><span>Rooms & Suites</span></a> </div>
                </div>
            </div>
            <!-- Booking form -->
                <%@include file="bookingForm.jsp"%>
        </div>
    </div>
    <!-- arrow down -->
    <div class="arrow bounce text-center">
        <a href="#" data-scroll-nav="1" class=""> <i class="ti-arrow-down"></i> </a>
    </div>
</div>
<!-- About -->
<section class="about section-padding" data-scroll-index="1">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mb-30 animate-box" data-animate-effect="fadeInUp"> <span>
                        <i class="star-rating"></i>
                        <i class="star-rating"></i>
                        <i class="star-rating"></i>
                        <i class="star-rating"></i>
                        <i class="star-rating"></i>
                    </span>
                <div class="section-subtitle">The Cappa Luxury Hotel</div>
                <div class="section-title">Enjoy a Luxury Experience</div>
                <p>Welcome to the best five-star deluxe hotel in New York. Hotel elementum sesue the aucan vestibulum aliquam justo in sapien rutrum volutpat. Donec in quis the pellentesque velit. Donec id velit ac arcu posuere blane.</p>
                <p>Hotel ut nisl quam nestibulum ac quam nec odio elementum sceisue the aucan ligula. Orci varius natoque penatibus et magnis dis parturient monte nascete ridiculus mus nellentesque habitant morbine.</p>
                <!-- call -->
                <div class="reservations">
                    <div class="icon"><span class="flaticon-call"></span></div>
                    <div class="text">
                        <p>Reservation</p> <a href="tel:855-100-4444">855 100 4444</a>
                    </div>
                </div>
            </div>
            <div class="col col-md-3 animate-box" data-animate-effect="fadeInUp"> <img src="${url}/Assets1/img/rooms/8.jpg" alt="" class="mt-90 mb-30"> </div>
            <div class="col col-md-3 animate-box" data-animate-effect="fadeInUp"> <img src="${url}/Assets1/img/rooms/2.jpg" alt=""> </div>
        </div>
    </div>
</section>
<!-- Rooms -->
<section class="rooms1 section-padding bg-cream" data-scroll-index="2">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-subtitle">The Cappa Luxury Hotel</div>
                <div class="section-title">Rooms & Suites</div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="item">
                    <div class="position-re o-hidden"> <img src="${url}/Assets1/img/rooms/1.jpg" alt=""> </div> <span class="category"><a href="rooms2.jsp">Book</a></span>
                    <div class="con">
                        <h6><a href="room-details.jsp">150$ / Night</a></h6>
                        <h5><a href="room-details.jsp">Junior Suite</a> </h5>
                        <div class="line"></div>
                        <div class="row facilities">
                            <div class="col col-md-7">
                                <ul>
                                    <li><i class="flaticon-bed"></i></li>
                                    <li><i class="flaticon-bath"></i></li>
                                    <li><i class="flaticon-breakfast"></i></li>
                                    <li><i class="flaticon-towel"></i></li>
                                </ul>
                            </div>
                            <div class="col col-md-5 text-end">
                                <div class="permalink"><a href="room-details.jsp">Details <i class="ti-arrow-right"></i></a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="item">
                    <div class="position-re o-hidden"> <img src="${url}/Assets1/img/rooms/2.jpg" alt=""> </div> <span class="category"><a href="rooms2.jsp">Book</a></span>
                    <div class="con">
                        <h6><a href="room-details.jsp">200$ / Night</a></h6>
                        <h5><a href="room-details.jsp">Family Room</a></h5>
                        <div class="line"></div>
                        <div class="row facilities">
                            <div class="col col-md-7">
                                <ul>
                                    <li><i class="flaticon-bed"></i></li>
                                    <li><i class="flaticon-bath"></i></li>
                                    <li><i class="flaticon-breakfast"></i></li>
                                    <li><i class="flaticon-towel"></i></li>
                                </ul>
                            </div>
                            <div class="col col-md-5 text-end">
                                <div class="permalink"><a href="room-details.jsp">Details <i class="ti-arrow-right"></i></a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="item">
                    <div class="position-re o-hidden"> <img src="${url}/Assets1/img/rooms/3.jpg" alt=""> </div> <span class="category"><a href="rooms2.jsp">Book</a></span>
                    <div class="con">
                        <h6><a href="room-details.jsp">250$ / Night</a></h6>
                        <h5><a href="room-details.jsp">Double Room</a></h5>
                        <div class="line"></div>
                        <div class="row facilities">
                            <div class="col col-md-7">
                                <ul>
                                    <li><i class="flaticon-bed"></i></li>
                                    <li><i class="flaticon-bath"></i></li>
                                    <li><i class="flaticon-breakfast"></i></li>
                                    <li><i class="flaticon-towel"></i></li>
                                </ul>
                            </div>
                            <div class="col col-md-5 text-end">
                                <div class="permalink"><a href="room-details.jsp">Details <i class="ti-arrow-right"></i></a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="item">
                    <div class="position-re o-hidden"> <img src="${url}/Assets1/img/rooms/4.jpg" alt=""> </div> <span class="category"><a href="rooms2.jsp">Book</a></span>
                    <div class="con">
                        <h6><a href="room-details.jsp">300$ / Night</a></h6>
                        <h5><a href="room-details.jsp">Deluxe Room</a></h5>
                        <div class="line"></div>
                        <div class="row facilities">
                            <div class="col col-md-7">
                                <ul>
                                    <li><i class="flaticon-bed"></i></li>
                                    <li><i class="flaticon-bath"></i></li>
                                    <li><i class="flaticon-breakfast"></i></li>
                                    <li><i class="flaticon-towel"></i></li>
                                </ul>
                            </div>
                            <div class="col col-md-5 text-end">
                                <div class="permalink"><a href="room-details.jsp">Details <i class="ti-arrow-right"></i></a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="item">
                    <div class="position-re o-hidden"> <img src="${url}/Assets1/img/rooms/7.jpg" alt=""> </div> <span class="category"><a href="rooms2.jsp">Book</a></span>
                    <div class="con">
                        <h6><a href="room-details.jsp">150$ / Night</a></h6>
                        <h5><a href="room-details.jsp">Superior Room</a></h5>
                        <div class="line"></div>
                        <div class="row facilities">
                            <div class="col col-md-7">
                                <ul>
                                    <li><i class="flaticon-bed"></i></li>
                                    <li><i class="flaticon-bath"></i></li>
                                    <li><i class="flaticon-breakfast"></i></li>
                                    <li><i class="flaticon-towel"></i></li>
                                </ul>
                            </div>
                            <div class="col col-md-5 text-end">
                                <div class="permalink"><a href="room-details.jsp">Details <i class="ti-arrow-right"></i></a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Pricing -->
<section class="pricing section-padding bg-blck">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="section-subtitle"><span>Best Prices</span></div>
                <div class="section-title"><span>Extra Services</span></div>
                <p class="color-2">The best prices for your relaxing vacation. The utanislen quam nestibulum ac quame odion elementum sceisue the aucan.</p>
                <p class="color-2">Orci varius natoque penatibus et magnis disney parturient monte nascete ridiculus mus nellen etesque habitant morbine.</p>
                <div class="reservations mb-30">
                    <div class="icon"><span class="flaticon-call"></span></div>
                    <div class="text">
                        <p class="color-2">For information</p> <a href="tel:855-100-4444">855 100 4444</a>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="owl-carousel owl-theme">
                    <div class="pricing-card"> <img src="${url}/Assets1/img/pricing/1.jpg" alt="">
                        <div class="desc">
                            <div class="name">Room cleaning</div>
                            <div class="amount">$50<span>/ month</span></div>
                            <ul class="list-unstyled list">
                                <li><i class="ti-check"></i> Hotel ut nisan the duru</li>
                                <li><i class="ti-check"></i> Orci miss natoque vasa ince</li>
                                <li><i class="ti-close unavailable"></i>Clean sorem ipsum morbin</li>
                            </ul>
                        </div>
                    </div>
                    <div class="pricing-card"> <img src="${url}/Assets1/img/pricing/2.jpg" alt="">
                        <div class="desc">
                            <div class="name">Drinks included</div>
                            <div class="amount">$30<span>/ daily</span></div>
                            <ul class="list-unstyled list">
                                <li><i class="ti-check"></i> Hotel ut nisan the duru</li>
                                <li><i class="ti-check"></i> Orci miss natoque vasa ince</li>
                                <li><i class="ti-close unavailable"></i>Clean sorem ipsum morbin</li>
                            </ul>
                        </div>
                    </div>
                    <div class="pricing-card"> <img src="${url}/Assets1/img/pricing/3.jpg" alt="">
                        <div class="desc">
                            <div class="name">Room Breakfast</div>
                            <div class="amount">$30<span>/ daily</span></div>
                            <ul class="list-unstyled list">
                                <li><i class="ti-check"></i> Hotel ut nisan the duru</li>
                                <li><i class="ti-check"></i> Orci miss natoque vasa ince</li>
                                <li><i class="ti-close unavailable"></i>Clean sorem ipsum morbin</li>
                            </ul>
                        </div>
                    </div>
                    <div class="pricing-card"> <img src="${url}/Assets1/img/pricing/4.jpg" alt="">
                        <div class="desc">
                            <div class="name">Safe & Secure</div>
                            <div class="amount">$15<span>/ daily</span></div>
                            <ul class="list-unstyled list">
                                <li><i class="ti-check"></i> Hotel ut nisan the duru</li>
                                <li><i class="ti-check"></i> Orci miss natoque vasa ince</li>
                                <li><i class="ti-close unavailable"></i>Clean sorem ipsum morbin</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Promo Video -->
<%--<section class="video-wrapper video section-padding bg-img bg-fixed" data-overlay-dark="3" data-background="${url}/Assets1/img/slider/2.jpg">--%>
<%--    <div class="container">--%>
<%--        <div class="row">--%>
<%--            <div class="col-md-8 offset-md-2 text-center"> <span><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i></span>--%>
<%--                <div class="section-subtitle"><span>The Cappa Luxury Hotel</span></div>--%>
<%--                <div class="section-title"><span>Promotional Video</span></div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="row">--%>
<%--            <div class="text-center col-md-12">--%>
<%--                <a class="vid" href="https://youtu.be/7BGNAGahig8">--%>
<%--                    <div class="vid-butn"> <span class="icon">--%>
<%--                                <i class="ti-control-play"></i>--%>
<%--                            </span> </div>--%>
<%--                </a>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>
<!-- Facilties -->
<section class="facilties section-padding">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-subtitle">Our Services</div>
                <div class="section-title">Hotel Facilities</div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="single-facility animate-box" data-animate-effect="fadeInUp"> <span class="flaticon-world"></span>
                    <h5>Pick Up & Drop</h5>
                    <p>We’ll pick up from airport while you comfy on your ride, mus nellentesque habitant.</p>
                    <div class="facility-shape"> <span class="flaticon-world"></span> </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="single-facility animate-box" data-animate-effect="fadeInUp"> <span class="flaticon-car"></span>
                    <h5>Parking Space</h5>
                    <p>Fusce tincidunt nis ace park norttito sit amet space, mus nellentesque habitant.</p>
                    <div class="facility-shape"> <span class="flaticon-car"></span> </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="single-facility animate-box" data-animate-effect="fadeInUp"> <span class="flaticon-bed"></span>
                    <h5>Room Service</h5>
                    <p>Room tincidunt nis ace park norttito sit amet space, mus nellentesque habitant.</p>
                    <div class="facility-shape"> <span class="flaticon-bed"></span> </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="single-facility animate-box" data-animate-effect="fadeInUp"> <span class="flaticon-swimming"></span>
                    <h5>Swimming Pool</h5>
                    <p>Swimming pool tincidunt nise ace park norttito sit space, mus nellentesque habitant.</p>
                    <div class="facility-shape"> <span class="flaticon-swimming"></span> </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="single-facility animate-box" data-animate-effect="fadeInUp"> <span class="flaticon-wifi"></span>
                    <h5>Fibre Internet</h5>
                    <p>Wifi tincidunt nis ace park norttito sit amet space, mus nellentesque habitant.</p>
                    <div class="facility-shape"> <span class="flaticon-wifi"></span> </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="single-facility animate-box" data-animate-effect="fadeInUp"> <span class="flaticon-breakfast"></span>
                    <h5>Breakfast</h5>
                    <p>Eat tincidunt nisa ace park norttito sit amet space, mus nellentesque habitant</p>
                    <div class="facility-shape"> <span class="flaticon-breakfast"></span> </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Testiominals -->
<%--<section class="testimonials">--%>
<%--    <div class="background bg-img bg-fixed section-padding pb-0" data-background="${url}/Assets1/img/slider/2.jpg" data-overlay-dark="3">--%>
<%--        <div class="container">--%>
<%--            <div class="row">--%>
<%--                <div class="col-md-8 offset-md-2">--%>
<%--                    <div class="testimonials-box">--%>
<%--                        <div class="head-box">--%>
<%--                            <h6>Testimonials</h6>--%>
<%--                            <h4>What Client's Say?</h4>--%>
<%--                            <div class="line"></div>--%>
<%--                        </div>--%>
<%--                        <div class="owl-carousel owl-theme">--%>
<%--                            <div class="item"> <span class="quote"><img src="${url}/Assets1/img/quot.png" alt=""></span>--%>
<%--                                <p>Hotel dapibus asue metus the nec feusiate eraten miss hendreri net ve ante the lemon sanleo nectan feugiat erat hendrerit necuis ve ante otel inilla duiman at finibus viverra neca the sene on satien the miss drana inc fermen norttito sit space, mus nellentesque habitan.</p>--%>
<%--                                <div class="info">--%>
<%--                                    <div class="author-img"> <img src="${url}/Assets1/img/team/4.jpg" alt=""> </div>--%>
<%--                                    <div class="cont"> <span><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i></span>--%>
<%--                                        <h6>Emily Brown</h6> <span>Guest review</span>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="item"> <span class="quote"><img src="${url}/Assets1/img/quot.png" alt=""></span>--%>
<%--                                <p>Hotel dapibus asue metus the nec feusiate eraten miss hendreri net ve ante the lemon sanleo nectan feugiat erat hendrerit necuis ve ante otel inilla duiman at finibus viverra neca the sene on satien the miss drana inc fermen norttito sit space, mus nellentesque habitan.</p>--%>
<%--                                <div class="info">--%>
<%--                                    <div class="author-img"> <img src="${url}/Assets1/img/team/1.jpg" alt=""> </div>--%>
<%--                                    <div class="cont"> <span><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i></span>--%>
<%--                                        <h6>Nolan White</h6> <span>Guest review</span>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="item"> <span class="quote"><img src="${url}/Assets1/img/quot.png" alt=""></span>--%>
<%--                                <p>Hotel dapibus asue metus the nec feusiate eraten miss hendreri net ve ante the lemon sanleo nectan feugiat erat hendrerit necuis ve ante otel inilla duiman at finibus viverra neca the sene on satien the miss drana inc fermen norttito sit space, mus nellentesque habitan.</p>--%>
<%--                                <div class="info">--%>
<%--                                    <div class="author-img"> <img src="${url}/Assets1/img/team/5.jpg" alt=""> </div>--%>
<%--                                    <div class="cont"> <span><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i></span>--%>
<%--                                        <h6>Olivia Martin</h6> <span>Guest review</span>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>
<!-- Services -->
<section class="services section-padding">
    <div class="container">
        <div class="row">
            <div class="col-md-6 p-0 animate-box" data-animate-effect="fadeInLeft">
                <div class="img left">
                    <a href="restaurant.jsp"><img src="${url}/Assets1/img/restaurant/1.jpg" alt=""></a>
                </div>
            </div>
            <div class="col-md-6 p-0 bg-cream valign animate-box" data-animate-effect="fadeInRight">
                <div class="content">
                    <div class="cont text-left">
                        <div class="info">
                            <h6>Discover</h6>
                        </div>
                        <h4>The Restaurant</h4>
                        <p>Restaurant inilla duiman at elit finibus viverra nec a lacus themo the nesudea seneoice misuscipit non sagie the fermen ziverra tristiue duru the ivite dianne onen nivami acsestion augue artine.</p>
                        <div class="butn-dark"> <a href="restaurant.jsp"><span>Learn More</span></a> </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 bg-cream p-0 order2 valign animate-box" data-animate-effect="fadeInLeft">
                <div class="content">
                    <div class="cont text-left">
                        <div class="info">
                            <h6>Experiences</h6>
                        </div>
                        <h4>Spa Center</h4>
                        <p>Spa center inilla duiman at elit finibus viverra nec a lacus themo the nesudea seneoice misuscipit non sagie the fermen ziverra tristiue duru the ivite dianne onen nivami acsestion augue artine.</p>
                        <div class="butn-dark"> <a href="${url}/homePage/spa-wellness.jsp"><span>Learn More</span></a> </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 p-0 order1 animate-box" data-animate-effect="fadeInRight">
                <div class="img">
                    <a href="${url}/homePage/spa-wellness.jsp"><img src="${url}/Assets1/img/spa/3.jpg" alt=""></a>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 p-0 animate-box" data-animate-effect="fadeInLeft">
                <div class="img left">
                    <a href="${url}/homePage/spa-wellness.jsp"><img src="${url}/Assets1/img/spa/2.jpg" alt=""></a>
                </div>
            </div>
            <div class="col-md-6 p-0 bg-cream valign animate-box" data-animate-effect="fadeInRight">
                <div class="content">
                    <div class="cont text-left">
                        <div class="info">
                            <h6>Modern</h6>
                        </div>
                        <h4>Fitness Center</h4>
                        <p>Restaurant inilla duiman at elit finibus viverra nec a lacus themo the nesudea seneoice misuscipit non sagie the fermen ziverra tristiue duru the ivite dianne onen nivami acsestion augue artine.</p>
                        <div class="butn-dark"> <a href="${url}/homePage/spa-wellness.jsp"><span>Learn More</span></a> </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 bg-cream p-0 order2 valign animate-box" data-animate-effect="fadeInLeft">
                <div class="content">
                    <div class="cont text-left">
                        <div class="info">
                            <h6>Experiences</h6>
                        </div>
                        <h4>The Health Club & Pool</h4>
                        <p>The health club & pool at elit finibus viverra nec a lacus themo the nesudea seneoice misuscipit non sagie the fermen ziverra tristiue duru the ivite dianne onen nivami acsestion augue artine.</p>
                        <div class="butn-dark"> <a href="${url}/homePage/spa-wellness.jsp"><span>Learn More</span></a> </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 p-0 order1 animate-box" data-animate-effect="fadeInRight">
                <div class="img">
                    <a href="${url}/homePage/spa-wellness.jsp"><img src="${url}/Assets1/img/spa/1.jpg" alt=""></a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- News -->
<section class="news section-padding bg-blck">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-subtitle"><span>Hotel Blog</span></div>
                <div class="section-title"><span>Our News</span></div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="owl-carousel owl-theme">
                    <div class="item">
                        <div class="position-re o-hidden"> <img src="${url}/Assets1/img/news/1.jpg" alt="">
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
                    <div class="item">
                        <div class="position-re o-hidden"> <img src="${url}/Assets1/img/news/2.jpg" alt="">
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
                    <div class="item">
                        <div class="position-re o-hidden"> <img src="${url}/Assets1/img/news/3.jpg" alt="">
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
                    <div class="item">
                        <div class="position-re o-hidden"> <img src="${url}/Assets1/img/news/4.jpg" alt="">
                            <div class="date">
                                <a href="post.jsp"> <span>Dec</span> <i>08</i> </a>
                            </div>
                        </div>
                        <div class="con"> <span class="category">
                                    <a href="news.jsp">Health</a>
                                </span>
                            <h5><a href="post.jsp">Weight Loss with Fitness Health Club</a></h5>
                        </div>
                    </div>
                    <div class="item">
                        <div class="position-re o-hidden"> <img src="${url}/Assets1/img/news/6.jpg" alt="">
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
                    <div class="item">
                        <div class="position-re o-hidden"> <img src="${url}/Assets1/img/news/5.jpg" alt="">
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
        </div>
    </div>
</section>
<!-- Reservation & Booking Form -->
<%@include file="ReservationAndBookingForm.jsp"%>
<!-- Clients -->
<%--<section class="clients">--%>
<%--    <div class="container">--%>
<%--        <div class="row">--%>
<%--            <div class="col-md-7">--%>
<%--                <div class="owl-carousel owl-theme">--%>
<%--                    <div class="clients-logo">--%>
<%--                        <a href="#0"><img src="${url}/Assets1/img/clients/1.png" alt=""></a>--%>
<%--                    </div>--%>
<%--                    <div class="clients-logo">--%>
<%--                        <a href="#0"><img src="${url}/Assets1/img/clients/2.png" alt=""></a>--%>
<%--                    </div>--%>
<%--                    <div class="clients-logo">--%>
<%--                        <a href="#0"><img src="${url}/Assets1/img/clients/3.png" alt=""></a>--%>
<%--                    </div>--%>
<%--                    <div class="clients-logo">--%>
<%--                        <a href="#0"><img src="${url}/Assets1/img/clients/4.png" alt=""></a>--%>
<%--                    </div>--%>
<%--                    <div class="clients-logo">--%>
<%--                        <a href="#0"><img src="${url}/Assets1/img/clients/5.png" alt=""></a>--%>
<%--                    </div>--%>
<%--                    <div class="clients-logo">--%>
<%--                        <a href="#0"><img src="${url}/Assets1/img/clients/6.png" alt=""></a>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>
<!-- Footer -->
<%@include file="footer.jsp"%>
<!-- jQuery -->
<script src="${url}/Assets1/js/jquery-3.6.3.min.js"></script>
<script src="${url}/Assets1/js/jquery-migrate-3.0.0.min.js"></script>
<script src="${url}/Assets1/js/modernizr-2.6.2.min.js"></script>
<script src="${url}/Assets1/js/imagesloaded.pkgd.min.js"></script>
<script src="${url}/Assets1/js/jquery.isotope.v3.0.2.js"></script>
<script src="${url}/Assets1/js/pace.js"></script>
<script src="${url}/Assets1/js/popper.min.js"></script>
<script src="${url}/Assets1/js/bootstrap.min.js"></script>
<script src="${url}/Assets1/js/scrollIt.min.js"></script>
<script src="${url}/Assets1/js/jquery.waypoints.min.js"></script>
<script src="${url}/Assets1/js/owl.carousel.min.js"></script>
<script src="${url}/Assets1/js/jquery.stellar.min.js"></script>
<script src="${url}/Assets1/js/jquery.magnific-popup.js"></script>
<script src="${url}/Assets1/js/YouTubePopUp.js"></script>
<script src="${url}/Assets1/js/select2.js"></script>
<script src="${url}/Assets1/js/datepicker.js"></script>
<script src="${url}/Assets1/js/smooth-scroll.min.js"></script>
<script src="${url}/Assets1/js/custom.js"></script>
</body>

</html>