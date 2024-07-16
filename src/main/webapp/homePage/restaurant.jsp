
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="url1"
       value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zxx">

<!-- Mirrored from duruthemes.com/demo/html/cappa/demo1-light/restaurant.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 25 Jun 2024 06:13:13 GMT -->
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
    <!-- Restaurant Slider -->
    <header class="header slider">
        <div class="owl-carousel owl-theme">
            <!-- The opacity on the image is made with "data-overlay-dark="number". You can change it using the numbers 0-9. -->
            <div class="text-center item bg-img" data-overlay-dark="3" data-background="${url1}/Assets1/img/restaurant/1.jpg"></div>
            <div class="text-center item bg-img" data-overlay-dark="3" data-background="${url1}/Assets1/img/restaurant/2.jpg"></div>
            <div class="text-center item bg-img" data-overlay-dark="3" data-background="${url1}/Assets1/img/restaurant/3.jpg"></div>
        </div>
        <!-- arrow down -->
        <div class="arrow bounce text-center">
            <a href="#" data-scroll-nav="1" class=""> <i class="ti-arrow-down"></i> </a>
        </div>
    </header>
    <!-- Restaurant Content -->
    <section class="rooms-page section-padding" data-scroll-index="1">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-left"> 
                    <span>
                        <i class="star-rating"></i>
                        <i class="star-rating"></i>
                        <i class="star-rating"></i>
                        <i class="star-rating"></i>
                        <i class="star-rating"></i>
                    </span>
                    <div class="section-subtitle">An Experience for the Senses</div>
                    <div class="section-title">The Restaurant</div>
                </div>
                <div class="col-md-12">
                    <p class="mb-30">Led by Chef de Micheal Martin, The Restaurant is celebrated for its excellent cuisine and unique ambience. The gorgeous dining room features three open studio kitchens, allowing you to enjoy the sights and sounds of the culinary artistry on display. The menu showcases both Asian and European influences, with a tempting selection of classic favorites and creative dishes for you to sample. Cheese connoisseurs will be drawn to the The Wine and Cheese Cellar, housed in five-meter-high glass walls, where our knowledgeable staff can introduce you to some of New York's greatest culinary treasures.</p>
                    <h6>Hours</h6>
                    <ul class="list-unstyled page-list mb-30">
                        <li>
                            <div class="page-list-icon"> <span class="ti-time"></span> </div>
                            <div class="page-list-text">
                                <p>Breakfast: 7.00 am – 11.00 am (daily)</p>
                            </div>
                        </li>
                        <li>
                            <div class="page-list-icon"> <span class="ti-time"></span> </div>
                            <div class="page-list-text">
                                <p>Lunch: 12.00 noon – 2.00 pm (daily)</p>
                            </div>
                        </li>
                        <li>
                            <div class="page-list-icon"> <span class="ti-time"></span> </div>
                            <div class="page-list-text">
                                <p>Dinner: open from 6.30 pm, last order at 10.00 pm (daily)</p>
                            </div>
                        </li>
                    </ul>
                    <h6>Dress Code</h6>
                    <p>Smart casual (no shorts, hats, or sandals permitted)</p>
                    <h6>Terrace</h6>
                    <p>Open for drinks only</p>
                </div>
            </div>
        </div>
    </section>
    <!-- Restaurant Menu -->
    <section id="menu" class="restaurant-menu menu section-padding bg-blck">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <div class="section-subtitle"><span>Luxury Hotel</span></div>
                    <div class="section-title"><span>Restaurant Menu</span></div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        <div class="tabs-icon col-md-10 offset-md-1 text-center">
                            <div class="owl-carousel owl-theme">
                                <div id="tab-1" class="active item">
                                    <h6>Starters</h6>
                                </div>
                                <div id="tab-2" class="item">
                                    <h6>Mains</h6>
                                </div>
                                <div id="tab-3" class="item">
                                    <h6>Salads</h6>
                                </div>
                                <div id="tab-4" class="item">
                                    <h6>Wine</h6>
                                </div>
                                <div id="tab-5" class="item">
                                    <h6>Breakfast</h6>
                                </div>
                                <div id="tab-6" class="item">
                                    <h6>Dessert</h6>
                                </div>
                            </div>
                        </div>
                        <div class="restaurant-menu-content col-md-12">
                            <!-- Starters -->
                            <div id="tab-1-content" class="cont active">
                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="menu-info">
                                            <h5>Mozzarella Dippers <span class="price">27$</span></h5>
                                            <p>Fried mozzarella sticks, marinara sauce</p>
                                        </div>
                                        <div class="menu-info">
                                            <h5>Onion Rings <span class="price">32$</span></h5>
                                            <p>Fried onion rings, smoked aioli</p>
                                        </div>
                                        <div class="menu-info">
                                            <h5>Fried Jalapeno <span class="price">52$</span></h5>
                                            <p>Fried jalapeno pickles, cheddar sauce</p>
                                        </div>
                                    </div>
                                    <div class="col-md-5 offset-md-2">
                                        <div class="menu-info">
                                            <h5>Buffalo Wings <span class="price">37$</span></h5>
                                            <p>Spicy chicken wings, blue cheese sauce, carrot, celery</p>
                                        </div>
                                        <div class="menu-info">
                                            <h5>Chilli Con Carne <span class="price">32$</span></h5>
                                            <p>Spicy ground beef, bacon, kidney beans</p>
                                        </div>
                                        <div class="menu-info">
                                            <h5>Potato Skins <span class="price">42$</span></h5>
                                            <p>Crispy potato skins; bacon & cheddar or vegetables</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Mains -->
                            <div id="tab-2-content" class="cont">
                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="menu-info">
                                            <h5>Rusty’s Burger <span class="price">27$</span></h5>
                                            <p>Smoked pulled beef ribs, bbq sauce, cheddar, crispy onion</p>
                                        </div>
                                        <div class="menu-info">
                                            <h5>Cajun Fish Steak <span class="price">32$</span></h5>
                                            <p>Cajun spicied seabass, deep fried baby potatoes, side salad</p>
                                        </div>
                                        <div class="menu-info">
                                            <h5>Southern Fried Chicken <span class="price">52$</span></h5>
                                            <p>Cajun coated chicken breast, fries and honey mustard</p>
                                        </div>
                                    </div>
                                    <div class="col-md-5 offset-md-2">
                                        <div class="menu-info">
                                            <h5>Crab Cake <span class="price">37$</span></h5>
                                            <p>Breaded crab cakes, tartar sauce, apple and fennel salad</p>
                                        </div>
                                        <div class="menu-info">
                                            <h5>Baby Back Ribs <span class="price">32$</span></h5>
                                            <p>Bbq glazed baby pork ribs, coleslaw, fries</p>
                                        </div>
                                        <div class="menu-info">
                                            <h5>Smokehouse Combo <span class="price">42$</span></h5>
                                            <p>Smoked beef brisket, rib and sausage, coleslaw, cornbread</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Salads -->
                            <div id="tab-3-content" class="cont">
                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="menu-info">
                                            <h5>Ceaser Salad <span class="price">47$</span></h5>
                                            <p>Romaine lettuce, croutons, parmigiano, Ceaser dressing.</p>
                                        </div>
                                        <div class="menu-info">
                                            <h5>Waldorf Salad <span class="price">52$</span></h5>
                                            <p>Lettuce, celery, apple, grape, walnut, waldorf sauce</p>
                                        </div>
                                        <div class="menu-info">
                                            <h5>Quinoa & Avocado Salad <span class="price">52$</span></h5>
                                            <p>Quinoa, avocado, mixed greens. Nuts, dried and fresh fruits</p>
                                        </div>
                                    </div>
                                    <div class="col-md-5 offset-md-2">
                                        <div class="menu-info">
                                            <h5>Grilled Salmon Salad <span class="price">37$</span></h5>
                                            <p>Grilled salmon, mixed greens, capers, orange slices</p>
                                        </div>
                                        <div class="menu-info">
                                            <h5>Chicken Cobb Salad <span class="price">32$</span></h5>
                                            <p>Iceberg lettuce, cherry tomatoes, blue cheese, avocado, bacon</p>
                                        </div>
                                        <div class="menu-info">
                                            <h5>Salad Chicken <span class="price">42$</span></h5>
                                            <p> Ceaser dressing. Optional grilled chicken breast</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Wine -->
                            <div id="tab-4-content" class="cont">
                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="menu-info">
                                            <h5>Château d'Yquem 2011 <span class="price">400$</span></h5>
                                            <p>Dessert Wine, Bordeaux, Graves, Sauternes</p>
                                        </div>
                                        <div class="menu-info">
                                            <h5>Alvear Cream NV <span class="price">30$</span></h5>
                                            <p>Dessert, Fortified Wine, Andalucia</p>
                                        </div>
                                        <div class="menu-info">
                                            <h5>Chateau D'yquem 1990 <span class="price">900$</span></h5>
                                            <p>Dessert Wine, Bordeaux, Graves, Sauternes</p>
                                        </div>
                                    </div>
                                    <div class="col-md-5 offset-md-2">
                                        <div class="menu-info">
                                            <h5>La Grande Année 2007 <span class="price">400$</span></h5>
                                            <p>Rosé, Champagne</p>
                                        </div>
                                        <div class="menu-info">
                                            <h5>Sine Qua Non 2012 <span class="price">520$</span></h5>
                                            <p>Syrah, Shiraz & Blends, California</p>
                                        </div>
                                        <div class="menu-info">
                                            <h5>W.S. Keyes Winery 2006 <span class="price">240$</span></h5>
                                            <p>Merlot, California, Napa, Howell Mountain</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Breakfast -->
                            <div id="tab-5-content" class="cont">
                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="menu-info">
                                            <h5>Egg Benedict <span class="price">60$</span></h5>
                                            <p>English muffin, beef, hollandaise sauce, poached egg.</p>
                                        </div>
                                        <div class="menu-info">
                                            <h5>Texas Benedict <span class="price">30$</span></h5>
                                            <p>English muffin, short ribs, bbq sauce, poached egg.</p>
                                        </div>
                                        <div class="menu-info">
                                            <h5>Rusty’s Omlette <span class="price">22$</span></h5>
                                            <p>Mozzarella, cheddar, caramelized onion, black beans.</p>
                                        </div>
                                    </div>
                                    <div class="col-md-5 offset-md-2">
                                        <div class="menu-info">
                                            <h5>Salmon Bagel <span class="price">30$</span></h5>
                                            <p>Smoked salmon, cream cheese, dill, rocket, red onion.</p>
                                        </div>
                                        <div class="menu-info">
                                            <h5>Breakfast Bagel <span class="price">33$</span></h5>
                                            <p>Chocolate, marshmallow, biscuit bar</p>
                                        </div>
                                        <div class="menu-info">
                                            <h5>Rusty’s Pancake <span class="price">40$</span></h5>
                                            <p>Strawberry, white chocolate, dark chocolate, crispearls</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Dessert -->
                            <div id="tab-6-content" class="cont">
                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="menu-info">
                                            <h5>Bourbon Pecan Pie <span class="price">67$</span></h5>
                                            <p>Bourbon pecan stuffed pie, vanilla ice-cream</p>
                                        </div>
                                        <div class="menu-info">
                                            <h5>New York Cheesecake <span class="price">50$</span></h5>
                                            <p>Cheesecake, strawberry & lime salad</p>
                                        </div>
                                        <div class="menu-info">
                                            <h5>Rusty’s ice-cream <span class="price">32$</span></h5>
                                            <p>Vanilla, bourbon, cookie, chocolate ice-cream</p>
                                        </div>
                                    </div>
                                    <div class="col-md-5 offset-md-2">
                                        <div class="menu-info">
                                            <h5>S’mores <span class="price">40$</span></h5>
                                            <p>Chocolate chip cookies, marshmallow, chocolate</p>
                                        </div>
                                        <div class="menu-info">
                                            <h5>Rocky Road <span class="price">42$</span></h5>
                                            <p>Chocolate, marshmallow, biscuit bar</p>
                                        </div>
                                        <div class="menu-info">
                                            <h5>Apple & Pear Crumble <span class="price">42$</span></h5>
                                            <p>Caramelized pear and apple, oat crumble, vanilla ice-cream</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Testiominals -->
    <section class="testimonials">
        <div class="background bg-img bg-fixed section-padding pb-0"data-background="${url1}/Assets1/img/slider/2.jpg" data-overlay-dark="3">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 offset-md-2">
                        <div class="testimonials-box">
                            <div class="head-box">
                                <h6>Testimonials</h6>
                                <h4>What Client's Say?</h4>
                                <div class="line"></div>
                            </div>
                            <div class="owl-carousel owl-theme">
                                <div class="item"> <span class="quote"><img src="${url1}/Assets1/img/quot.png" alt=""></span>
                                    <p>Hotel dapibus asue metus the nec feusiate eraten miss hendreri net ve ante the lemon sanleo nectan feugiat erat hendrerit necuis ve ante otel inilla duiman at finibus viverra neca the sene on satien the miss drana inc fermen norttito sit space, mus nellentesque habitan.</p>
                                    <div class="info">
                                        <div class="author-img"> <img src="${url1}/Assets1/img/team/4.jpg" alt=""> </div>
                                        <div class="cont"> <span><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i></span>
                                            <h6>Emily Brown</h6> <span>Guest review</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="item"> <span class="quote"><img src="${url1}/Assets1/img/quot.png" alt=""></span>
                                    <p>Hotel dapibus asue metus the nec feusiate eraten miss hendreri net ve ante the lemon sanleo nectan feugiat erat hendrerit necuis ve ante otel inilla duiman at finibus viverra neca the sene on satien the miss drana inc fermen norttito sit space, mus nellentesque habitan.</p>
                                    <div class="info">
                                        <div class="author-img"> <img src="${url1}/Assets1/img/team/1.jpg" alt=""> </div>
                                        <div class="cont"> <span><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i></span>
                                            <h6>Nolan White</h6> <span>Guest review</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="item"> <span class="quote"><img src="${url1}/Assets1/img/quot.png" alt=""></span>
                                    <p>Hotel dapibus asue metus the nec feusiate eraten miss hendreri net ve ante the lemon sanleo nectan feugiat erat hendrerit necuis ve ante otel inilla duiman at finibus viverra neca the sene on satien the miss drana inc fermen norttito sit space, mus nellentesque habitan.</p>
                                    <div class="info">
                                        <div class="author-img"> <img src="${url1}/Assets1/img/team/5.jpg" alt=""> </div>
                                        <div class="cont"> <span><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i></span>
                                            <h6>Olivia Martin</h6> <span>Guest review</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
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

<!-- Mirrored from duruthemes.com/demo/html/cappa/demo1-light/restaurant.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 25 Jun 2024 06:13:19 GMT -->
</html>