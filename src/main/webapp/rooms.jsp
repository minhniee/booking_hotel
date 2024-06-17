<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE HTML>
<html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="layout/header.jsp" %>
<!-- Header -->

<section class="site-hero inner-page overlay" style="background-image: url(images/hero_4.jpg)"
         data-stellar-background-ratio="0.5">
    <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
            <div class="col-md-10 text-center" data-aos="fade">
                <h1 class="heading mb-3">Rooms</h1>
                <ul class="custom-breadcrumbs mb-4">
                    <li><a href="WebPage/index.jsp">Home</a></li>
                    <li>&bullet;</li>
                    <li>Rooms</li>
                </ul>
            </div>
        </div>
    </div>

    <a class="mouse smoothscroll" href="#next">
        <div class="mouse-icon">
            <span class="mouse-wheel"></span>
        </div>
    </a>
</section>
<!-- END section -->

<%@include file="layout/DatePicker.jsp"%>



<section class="section">
    <div class="container">
        <div class="row">
            <c:forEach var="i" items="${listRoom}">
                <div class="col-md-6 col-lg-4 mb-5" data-aos="fade-up">
                    <a href="roomDetails?room_class_id=${i.roomClassId}" class="room">
                        <figure class="img-wrap">
                            <img src="assest/room/${i.roomImg}" alt="Free website template" class="img-fluid mb-3"
                                 style="width: 350px; height:250px">
                        </figure>
                        <div class="p-3 text-center room-info">
                            <h2>${i.roomClassName}</h2>
                            <span class="text-uppercase letter-spacing-1">${i.basePrice} / per night</span>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
</section>



<%@include file="layout/footer.jsp" %>


<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/jquery-migrate-3.0.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.stellar.min.js"></script>
<script src="js/jquery.fancybox.min.js"></script>


<script src="js/aos.js"></script>

<script src="js/bootstrap-datepicker.js"></script>
<script src="js/jquery.timepicker.min.js"></script>


<script src="js/main.js"></script>
</body>
</html>