<%--
  Created by IntelliJ IDEA.
  User: minhl
  Date: 5/25/2024
  Time: 10:20 AM
  To change this template use File | Settings | File Templates.
--%>

<%--<c:set var="url" value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" />--%>
<%--<section class="section bg-image overlay" style="background-image: url('${url}/images/hero_4.jpg');">--%>
<%--    <div class="container" >--%>
<%--        <div class="row align-items-center">--%>
<%--            <div class="col-12 col-md-6 text-center mb-4 mb-md-0 text-md-left" data-aos="fade-up">--%>
<%--                <h2 class="text-white font-weight-bold">A Best Place To Stay. Booking Now!</h2>--%>
<%--            </div>--%>
<%--            <div class="col-12 col-md-6 text-center text-md-right" data-aos="fade-up" data-aos-delay="200">--%>
<%--                <a href="reservation.jsp" class="btn btn-outline-white-primary py-3 text-white px-5">Booking Now</a>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>

<%--<footer class="section footer-section">--%>
<%--    <div class="container">--%>
<%--        <div class="row mb-4">--%>
<%--            <div class="col-md-3 mb-5">--%>
<%--                <ul class="list-unstyled link">--%>
<%--                    <li><a href="../homePage/about.jsp">About Us</a></li>--%>
<%--                    <li><a href="#">Terms &amp; Conditions</a></li>--%>
<%--                    <li><a href="#">Privacy Policy</a></li>--%>
<%--                    <li><a href="Room">Rooms</a></li>--%>
<%--                </ul>--%>
<%--            </div>--%>
<%--            <div class="col-md-3 mb-5">--%>
<%--                <ul class="list-unstyled link">--%>
<%--                    <li><a href="Room">The Rooms &amp; Suites</a></li>--%>
<%--                    <li><a href="../homePage/about.jsp">About Us</a></li>--%>
<%--                    <li><a href="../homePage/contact.jsp">Contact Us</a></li>--%>
<%--                    <li><a href="#">Restaurant</a></li>--%>
<%--                </ul>--%>
<%--            </div>--%>
<%--            <div class="col-md-3 mb-5 pr-md-5 contact-info">--%>
<%--                <!-- <li>198 West 21th Street, <br> Suite 721 New York NY 10016</li> -->--%>
<%--                <p><span class="d-block"><span class="ion-ios-location h5 mr-3 text-primary"></span>Address:</span> <span> 198 West 21th Street, <br> Suite 721 New York NY 10016</span></p>--%>
<%--                <p><span class="d-block"><span class="ion-ios-telephone h5 mr-3 text-primary"></span>Phone:</span> <span> (+1) 435 3533</span></p>--%>
<%--                <p><span class="d-block"><span class="ion-ios-email h5 mr-3 text-primary"></span>Email:</span> <span> info@domain.com</span></p>--%>
<%--            </div>--%>
<%--            <div class="col-md-3 mb-5">--%>
<%--                <p>Sign up for our newsletter</p>--%>
<%--                <form action="#" class="footer-newsletter">--%>
<%--                    <div class="form-group">--%>
<%--                        <input type="email" class="form-control" placeholder="Email...">--%>
<%--                        <button type="submit" class="btn"><span class="fa fa-paper-plane"></span></button>--%>
<%--                    </div>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="row pt-5">--%>
<%--            <p class="col-md-6 text-left">--%>
<%--                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->--%>
<%--                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >Colorlib</a>--%>
<%--                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->--%>
<%--            </p>--%>

<%--            <p class="col-md-6 text-right social">--%>
<%--                <a href="#"><span class="fa fa-tripadvisor"></span></a>--%>
<%--                <a href="#"><span class="fa fa-facebook"></span></a>--%>
<%--                <a href="#"><span class="fa fa-twitter"></span></a>--%>
<%--                <a href="#"><span class="fa fa-linkedin"></span></a>--%>
<%--                <a href="#"><span class="fa fa-vimeo"></span></a>--%>
<%--            </p>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</footer>--%>

    <div class="footer">
        <div class="mail">
            <h1  class="mailTitle">Save time, save money!</h1>
            <span class="mailDesc">Sign up and we'll send the best deal for you</span>
                        <form method="get" action="ContactServlet">
                    <div class="mailInputContainer">

                        <input type="text" name="email" placeholder="Your Email">
                        <button type="submit" >Subscribe</button>
                    </div>
                        </form>
        </div>
    </div>
