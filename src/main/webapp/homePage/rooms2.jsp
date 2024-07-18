<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="url1"
       value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zxx">

<!-- Mirrored from duruthemes.com/demo/html/cappa/demo1-light/rooms2.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 25 Jun 2024 06:13:10 GMT -->
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
    <div class="banner-header section-padding valign bg-img bg-fixed" data-overlay-dark="4" data-background="${url1}/Assets1/img/slider/1.jpg">
        <div class="container">
            <div class="row">
				<div class="col-md-12 caption mt-90">
				    <span>
                        <i class="star-rating"></i>
                        <i class="star-rating"></i>
                        <i class="star-rating"></i>
                        <i class="star-rating"></i>
                        <i class="star-rating"></i>
                    </span>
					<h5>The Cappa Luxury Hotel</h5>
					<h1>Rooms & Suites</h1>
				</div>
			</div>
        </div>
    </div>
    <!-- Rooms -->
    <section class="section-padding">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <c:forEach items="${rooms}" var="r">

                    <div class="rooms2 mb-90 left animate-box" data-animate-effect="fadeInUp">
                        <figure><img src="${url1}/Assets1/img/slider/${r.roomImg}" alt="vc" class="img-fluid"></figure>
                        <div class="caption">
                            <h3>${r.basePrice * nights} $ <span>${r.basePrice}$ <span>/ night</span></span> </h3>
<%--                            <h6>${r.basePrice}$ <span>/ Night</span></h6>--%>
                            <h4><a href="${pageContext.request.contextPath}/RoomDetail?roomClassID=${r.roomClassId}&roomClassName=${r.roomClassName}">${r.roomClassName}</a></h4>
                            <p>Spacious, bright guestrooms with tasteful furnishing, wooden floor and panoramic windows from the ceiling to the floor.</p>
                            <div class="row room-facilities">
                                <div class="col-md-4">
                                    <ul>
                                        <li><i class="flaticon-group"></i> 1-2 Persons</li>
                                        <li><i class="flaticon-wifi"></i> Free Wifi</li>
                                    </ul>
                                </div>
                                <div class="col-md-4">
                                    <ul>
                                        <li><i class="flaticon-bed"></i> Twin Bed</li>
                                        <li><i class="flaticon-breakfast"></i> Breakfast</li>
                                    </ul>
                                </div>
                                <div class="col-md-4">
                                    <ul>
                                        <li><i class="flaticon-clock-1"></i> 200 sqft room</li>
                                        <li><i class="flaticon-swimming"></i> Swimming Pool</li>
                                    </ul>
                                </div>
                            </div>
                            <hr class="border-2">
                            <div class="info-wrapper">
                                <div class="more"><a href="${pageContext.request.contextPath}/RoomDetail?rooms=${r.roomClassId}&roomClassName=${r.roomClassName}" class="link-btn" tabindex="0">Details <i class="ti-arrow-right"></i></a></div>
                                <div class="butn-dark"> <a href="BookingDetail?&roomClassName=${r.roomClassName}&roomClassId=${r.roomClassId}&adults=${adults}&children=${children}&persons=${persons}&nights=${nights}&earlyBirdDays=${earlyBirdDays}&total=${r.basePrice * nights}&basePrice=${r.basePrice}" ><span>Book Now</span></a> </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>

                    <c:forEach items="${room}" var="r">

                        <div class="rooms2 mb-90 left animate-box" data-animate-effect="fadeInUp">
                            <figure><img src="${url1}/Assets1/img/slider/${r.roomImg}" alt="vc" class="img-fluid"></figure>
                            <div class="caption">
                                <h3>${r.basePrice}$ <span>/ night</span></> </h3>
                                    <%--                            <h6>${r.basePrice}$ <span>/ Night</span></h6>--%>
                                <h4><a href="${pageContext.request.contextPath}/RoomDetail?roomClassID=${r.roomClassId}&roomClassName=${r.roomClassName}">${r.roomClassName}</a></h4>
                                <p>Spacious, bright guestrooms with tasteful furnishing, wooden floor and panoramic windows from the ceiling to the floor.</p>
                                <div class="row room-facilities">
                                    <div class="col-md-4">
                                        <ul>
                                            <li><i class="flaticon-group"></i> 1-2 Persons</li>
                                            <li><i class="flaticon-wifi"></i> Free Wifi</li>
                                        </ul>
                                    </div>
                                    <div class="col-md-4">
                                        <ul>
                                            <li><i class="flaticon-bed"></i> Twin Bed</li>
                                            <li><i class="flaticon-breakfast"></i> Breakfast</li>
                                        </ul>
                                    </div>
                                    <div class="col-md-4">
                                        <ul>
                                            <li><i class="flaticon-clock-1"></i> 200 sqft room</li>
                                            <li><i class="flaticon-swimming"></i> Swimming Pool</li>
                                        </ul>
                                    </div>
                                </div>
                                <hr class="border-2">
                                <div class="info-wrapper">
                                    <div class="more"><a href="${pageContext.request.contextPath}/RoomDetail?rooms=${r.roomClassId}&roomClassName=${r.roomClassName}" class="link-btn" tabindex="0">Details <i class="ti-arrow-right"></i></a></div>
                                    <div class="butn-dark"> <a href="BookingDetail?&roomClassName=${r.roomClassName}&roomClassId=${r.roomClassId}&adults=${adults}&children=${children}&persons=${persons}&nights=${nights}&earlyBirdDays=${earlyBirdDays}&total=${r.basePrice * nights}&basePrice=${r.basePrice}" ><span>Book Now</span></a> </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                <%--                    <div class="rooms2 mb-90 left animate-box" data-animate-effect="fadeInUp">--%>
<%--                        <figure><img src="${url1}/Assets1/img/slider/3.jpg" alt="" class="img-fluid"></figure>--%>
<%--                        <div class="caption">--%>
<%--                            <h3>200$ <span>/ Night</span></h3>--%>
<%--                            <h4><a href="room-details.jsp">Family Room</a></h4>--%>
<%--                            <p>Spacious, bright guestrooms with tasteful furnishing, wooden floor and panoramic windows from the ceiling to the floor.</p>--%>
<%--                            <div class="row room-facilities">--%>
<%--                                <div class="col-md-4">--%>
<%--                                    <ul>--%>
<%--                                        <li><i class="flaticon-group"></i> 1-2 Persons</li>--%>
<%--                                        <li><i class="flaticon-wifi"></i> Free Wifi</li>--%>
<%--                                    </ul>--%>
<%--                                </div>--%>
<%--                                <div class="col-md-4">--%>
<%--                                    <ul>--%>
<%--                                        <li><i class="flaticon-bed"></i> Twin Bed</li>--%>
<%--                                        <li><i class="flaticon-breakfast"></i> Breakfast</li>--%>
<%--                                    </ul>--%>
<%--                                </div>--%>
<%--                                <div class="col-md-4">--%>
<%--                                    <ul>--%>
<%--                                        <li><i class="flaticon-clock-1"></i> 200 sqft Room</li>--%>
<%--                                        <li><i class="flaticon-swimming"></i> Swimming Pool</li>--%>
<%--                                    </ul>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <hr class="border-2">--%>
<%--                            <div class="info-wrapper">--%>
<%--                                <div class="more"><a href="room-details.jsp" class="link-btn" tabindex="0">Details <i class="ti-arrow-right"></i></a></div>--%>
<%--                                <div class="butn-dark"> <a href="#" data-scroll-nav="1"><span>Book Now</span></a> </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                    <div class="rooms2 mb-90 animate-box" data-animate-effect="fadeInUp">--%>
<%--                        <figure><img src="${url1}/Assets1/img/slider/3.jpg" alt="" class="img-fluid"></figure>--%>
<%--                        <div class="caption">--%>
<%--                            <h3>250$ <span>/ Night</span></h3>--%>
<%--                            <h4><a href="room-details.jsp">Double Room</a></h4>--%>
<%--                            <p>Spacious, bright guestrooms with tasteful furnishing, wooden floor and panoramic windows from the ceiling to the floor.</p>--%>
<%--                            <div class="row room-facilities">--%>
<%--                                <div class="col-md-4">--%>
<%--                                    <ul>--%>
<%--                                        <li><i class="flaticon-group"></i> 2-3 Persons</li>--%>
<%--                                        <li><i class="flaticon-wifi"></i> Free Wifi</li>--%>
<%--                                    </ul>--%>
<%--                                </div>--%>
<%--                                <div class="col-md-4">--%>
<%--                                    <ul>--%>
<%--                                        <li><i class="flaticon-bed"></i> Twin Bed</li>--%>
<%--                                        <li><i class="flaticon-breakfast"></i> Breakfast</li>--%>
<%--                                    </ul>--%>
<%--                                </div>--%>
<%--                                <div class="col-md-4">--%>
<%--                                    <ul>--%>
<%--                                        <li><i class="flaticon-clock-1"></i> 200 sqft room</li>--%>
<%--                                        <li><i class="flaticon-swimming"></i> Swimming Pool</li>--%>
<%--                                    </ul>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <hr class="border-2">--%>
<%--                            <div class="info-wrapper">--%>
<%--                                <div class="more"><a href="room-details.jsp" class="link-btn" tabindex="0">Details <i class="ti-arrow-right"></i></a></div>--%>
<%--                                <div class="butn-dark"> <a href="#" data-scroll-nav="1"><span>Book Now</span></a> </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                    <div class="rooms2 left animate-box" data-animate-effect="fadeInUp">--%>
<%--                        <figure><img src="${url1}/Assets1/img/slider/2.jpg" alt="" class="img-fluid"></figure>--%>
<%--                        <div class="caption">--%>
<%--                            <h3>300$ <span>/ Night</span></h3>--%>
<%--                            <h4><a href="room-details.jsp">Deluxe Room</a></h4>--%>
<%--                            <p>Spacious, bright guestrooms with tasteful furnishing, wooden floor and panoramic windows from the ceiling to the floor.</p>--%>
<%--                            <div class="row room-facilities">--%>
<%--                                <div class="col-md-4">--%>
<%--                                    <ul>--%>
<%--                                        <li><i class="flaticon-group"></i> 2-4 Persons</li>--%>
<%--                                        <li><i class="flaticon-wifi"></i> Free Wifi</li>--%>
<%--                                    </ul>--%>
<%--                                </div>--%>
<%--                                <div class="col-md-4">--%>
<%--                                    <ul>--%>
<%--                                        <li><i class="flaticon-bed"></i> Twin Bed</li>--%>
<%--                                        <li><i class="flaticon-breakfast"></i> Breakfast</li>--%>
<%--                                    </ul>--%>
<%--                                </div>--%>
<%--                                <div class="col-md-4">--%>
<%--                                    <ul>--%>
<%--                                        <li><i class="flaticon-clock-1"></i> 200 sqft Room</li>--%>
<%--                                        <li><i class="flaticon-swimming"></i> Swimming Pool</li>--%>
<%--                                    </ul>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <hr class="border-2">--%>
<%--                            <div class="info-wrapper">--%>
<%--                                <div class="more"><a href="room-details.jsp" class="link-btn" tabindex="0">Details <i class="ti-arrow-right"></i></a></div>--%>
<%--                                <div class="butn-dark"> <a href="#" data-scroll-nav="1"><span>Book Now</span></a> </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>

                </div>
            </div>
        </div>
    </section>
    <!-- Booking Search -->
    <section class="section-padding bg-cream" data-scroll-index="1">
        <div class="container">
                <div class="section-subtitle">Availabilitiy</div>
                <div class="section-title">Search Rooms</div>
                <div class="booking-inner clearfix">
                    <form class="form1 clearfix">
                        <div class="col1 c1">
                            <div class="input1_wrapper">
                                <label>Check in</label>
                                <div class="input1_inner">
                                    <input type="text" value="${checkInDate}" class="form-control input datepicker"  name="checkInDate" placeholder="Check in">
                                </div>
                            </div>
                        </div>
                        <div class="col1 c2">
                            <div class="input1_wrapper">
                                <label>Check out</label>
                                <div class="input1_inner">
                                    <input type="text" value="${checkOutDate}" class="form-control input datepicker"  name="checkOutDate" placeholder="Check out">
                                </div>
                            </div>
                        </div>
                        <div class="col2 c3">
                            <div class="select1_wrapper">
                                <label>Adults</label>
                                <div class="select1_inner">
                                    <select class="select2 select" name="adults" style="width: 100%">
                                        <option value="1">1 Adult</option>
                                        <option value="2">2 Adults</option>
                                        <option value="3">3 Adults</option>
                                        <option value="4">4 Adults</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col2 c4">
                            <div class="select1_wrapper">
                                <label>Children</label>
                                <div class="select1_inner">
                                    <select class="select2 select" name="children" style="width: 100%">
                                        <option value="1">Children</option>
                                        <option value="1">1 Child</option>
                                        <option value="2">2 Children</option>
                                        <option value="3">3 Children</option>
                                        <option value="4">4 Children</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col2 c5">
                            <div class="select1_wrapper">
                                <label>Rooms</label>
                                <div class="select1_inner">
                                    <select class="select2 select" name ="roomNum"  style="width: 100%">
                                        <option value="1">1 Room</option>
                                        <option value="2">2 Rooms</option>
                                        <option value="3">3 Rooms</option>
                                        <option value="4">4 Rooms</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col3 c6">
                            <button type="submit" class="btn-form1-submit">Check Now</button>
                        </div>
                    </form>
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
                        <div class="pricing-card">
                            <img src="${url1}/Assets1/img/pricing/1.jpg" alt="">
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
                        <div class="pricing-card">
                            <img src="${url1}/Assets1/img/pricing/2.jpg" alt="">
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
                        <div class="pricing-card">
                            <img src="${url1}/Assets1/img/pricing/3.jpg" alt="">
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
                        <div class="pricing-card">
                            <img src="${url1}/Assets1/img/pricing/4.jpg" alt="">
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
    <!-- Reservation & Booking Form -->
<%--    <section class="testimonials">--%>
<%--        <div class="background bg-img bg-fixed section-padding pb-0" data-background="${url1}/Assets1/img/slider/2.jpg" data-overlay-dark="2">--%>
<%--            <div class="container">--%>
<%--                <div class="row">--%>
<%--                    <!-- Reservation -->--%>
<%--                    <div class="col-md-5 mb-30 mt-30">--%>
<%--                        <p><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i></p>--%>
<%--                        <h5>Each of our guest rooms feature a private bath, wi-fi, cable television and include full breakfast.</h5>--%>
<%--                        <div class="reservations mb-30">--%>
<%--                            <div class="icon color-1"><span class="flaticon-call"></span></div>--%>
<%--                            <div class="text">--%>
<%--                                <p class="color-1">Reservation</p> <a class="color-1" href="tel:855-100-4444">855 100 4444</a>--%>
<%--                            </div>--%>
<%--                        </div> --%>
<%--                        <p><i class="ti-check"></i><small>Call us, it's toll-free.</small></p>--%>
<%--                    </div>--%>
<%--                    <!-- Booking From -->--%>
<%--                    <div class="col-md-5 offset-md-2">--%>
<%--                        <div class="booking-box">--%>
<%--                            <div class="head-box">--%>
<%--                                <h6>Rooms & Suites</h6>--%>
<%--                                <h4>Hotel Booking Form</h4>--%>
<%--                            </div>--%>
<%--                            <div class="booking-inner clearfix">--%>
<%--                                <form action="https://duruthemes.com/demo/html/cappa/demo1-light/rooms2.jsp" class="form1 clearfix">--%>
<%--                                    <div class="row">--%>
<%--                                        <div class="col-md-12">--%>
<%--                                            <div class="input1_wrapper">--%>
<%--                                                <label>Check in</label>--%>
<%--                                                <div class="input1_inner">--%>
<%--                                                    <input type="text" class="form-control input datepicker" placeholder="Check in">--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="col-md-12">--%>
<%--                                            <div class="input1_wrapper">--%>
<%--                                                <label>Check out</label>--%>
<%--                                                <div class="input1_inner">--%>
<%--                                                    <input type="text" class="form-control input datepicker" placeholder="Check out">--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="col-md-6">--%>
<%--                                            <div class="select1_wrapper">--%>
<%--                                                <label>Adults</label>--%>
<%--                                                <div class="select1_inner">--%>
<%--                                                    <select class="select2 select" style="width: 100%">--%>
<%--                                                        <option value="0">Adults</option>--%>
<%--                                                        <option value="1">1</option>--%>
<%--                                                        <option value="2">2</option>--%>
<%--                                                        <option value="3">3</option>--%>
<%--                                                        <option value="4">4</option>--%>
<%--                                                    </select>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="col-md-6">--%>
<%--                                            <div class="select1_wrapper">--%>
<%--                                                <label>Children</label>--%>
<%--                                                <div class="select1_inner">--%>
<%--                                                    <select class="select2 select" style="width: 100%">--%>
<%--                                                        <option value="0">Children</option>--%>
<%--                                                        <option value="1">1</option>--%>
<%--                                                        <option value="2">2</option>--%>
<%--                                                        <option value="3">3</option>--%>
<%--                                                        <option value="4">4</option>--%>
<%--                                                    </select>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="col-md-12">--%>
<%--                                            <button type="submit" class="btn-form1-submit mt-15">Check Availability</button>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </form>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </section>--%>
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
    <footer class="footer">
        <div class="footer-top">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="footer-column footer-about">
                            <h3 class="footer-title">About Hotel</h3>
                            <p class="footer-about-text">Welcome to the best five-star deluxe hotel in New York. Hotel elementum sesue the aucan vestibulum aliquam justo in sapien rutrum volutpat.</p>

                            <div class="footer-language"> <i class="lni ti-world"></i>
                                <select onchange="location = this.value;">
                                    <option value="#0">English</option>
                                    <option value="#0">German</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 offset-md-1">
                        <div class="footer-column footer-explore clearfix">
                            <h3 class="footer-title">Explore</h3>
                            <ul class="footer-explore-list list-unstyled">
                                <li><a href="index.jsp">Home</a></li>
                                <li><a href="rooms2.jsp">Rooms & Suites</a></li>
                                <li><a href="restaurant.jsp">Restaurant</a></li>
                                <li><a href="${url}/homePage/spa-wellness.jsp">Spa & Wellness</a></li>
                                <li><a href="about.jsp">About Hotel</a></li>
                                <li><a href="contact.jsp">Contact</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="footer-column footer-contact">
                            <h3 class="footer-title">Contact</h3>
                            <p class="footer-contact-text">1616 Broadway NY, New York 10001<br>United States of America</p>
                            <div class="footer-contact-info">
                                <p class="footer-contact-phone"><span class="flaticon-call"></span> 855 100 4444</p>
                                <p class="footer-contact-mail">info@luxuryhotel.com</p>
                            </div>
                            <div class="footer-about-social-list">
                                <a href="#"><i class="ti-instagram"></i></a>
                                <a href="#"><i class="ti-twitter"></i></a>
                                <a href="#"><i class="ti-youtube"></i></a>
                                <a href="#"><i class="ti-facebook"></i></a>
                                <a href="#"><i class="ti-pinterest"></i></a>
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
                            <p class="footer-bottom-copy-right">© Copyright 2024 by <a href="#">DuruThemes.com</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>

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

<!-- Mirrored from duruthemes.com/demo/html/cappa/demo1-light/rooms2.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 25 Jun 2024 06:13:10 GMT -->
</html>