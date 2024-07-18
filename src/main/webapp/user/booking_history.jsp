<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="url"
       value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<%@ page contentType="text/html; ISO-8859-1" language="java" %>
<!DOCTYPE html>
<html lang="zxx">


<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <title>The Cappa Luxury Hotel</title>
    <link rel="shortcut icon" href="${url}/Assets1/img/favicon.png"/>
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Barlow&amp;family=Barlow+Condensed&amp;family=Gilda+Display&amp;display=swap">
    <link rel="stylesheet" href="${url}/Assets1/css/plugins.css"/>
    <link rel="stylesheet" href="${url}/Assets1/css/style.css"/>
</head>

<body>

<!-- Preloader -->
<%--<div class="preloader-bg"></div>--%>
<%--<div id="preloader">--%>
<%--    <div id="preloader-status">--%>
<%--        <div class="preloader-position loader"> <span></span> </div>--%>
<%--    </div>--%>
<%--</div>--%>
<!-- Progress scroll totop -->
<div class="progress-wrap cursor-pointer">
    <svg class="progress-circle svg-content" width="100%" height="100%" viewBox="-1 -1 102 102">
        <path d="M50,1 a49,49 0 0,1 0,98 a49,49 0 0,1 0,-98"/>
    </svg>
</div>
<!-- Navbar -->
<%@include file="../homePage/navbar.jsp" %>
<div class="banner-header full-height section-padding valign bg-img bg-fixed" data-overlay-dark="4"
     data-background="${url}/Assets1/img/slider/3.jpg" style="height: 50%">
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
                    <div class="butn-light mt-30 mb-30"><a href="#" data-scroll-nav="2"><span>Rooms & Suites</span></a>
                    </div>
                </div>
            </div>
            <!-- Booking form -->
        </div>
    </div>
    <!-- arrow down -->

</div>
<div class="container-xxl py-5">
    <div class="container">
        <div class="text-center pb-4 wow fadeInUp" data-wow-delay="0.1s">
            <h6 class="section-title bg-white text-center text-primary px-3">Your Booking</h6>
        </div>
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
            }

            th, td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #f2f2f2;
            }

            tr:hover {
                background-color: #f5f5f5;
            }
        </style>
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Room</th>
                <th>Check-in Date</th>
                <th>Check-out Date</th>
                <th>State</th>
                <th>Detail</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="b" items="${requestScope.data}" varStatus="loop">
                <tr>
                    <td>${loop.index + 1}</td>
                    <td>${b.roomId}</td>
                    <td><fmt:formatDate value="${b.checkInDate}" pattern="dd-MM-yyyy" /></td>
                    <td><fmt:formatDate value="${b.checkOutDate}" pattern="dd-MM-yyyy" /></td>
                    <td>${b.bookingState}</td>
                    <td>
                        <form action="${pageContext.request.contextPath}/bookingdetailcus" method="post">
                            <input type="hidden" name="bookingID" value="${b.id}">
                            <button type="submit" class="btn btn-primary">Detail</button>
                        </form>
                    </td>
                    <td>
                        <form action="${pageContext.request.contextPath}/CancleBooking" method="get">
                            <input type="hidden" name="bookingID" value="${b.id}">
                            <input type="hidden" name="amount" value="${b.bookingPrice}">
                            <button type="submit" class="btn btn-primary">Cancel booking</button>
                        </form>
                    </td>

                </tr>
            </c:forEach>
<%--<<<<<<< HEAD--%>
<%--            <tr>--%>
<%--                <td>1</td>--%>
<%--                <td>2</td>--%>
<%--                <td>3</td>--%>
<%--                <td>4</td>--%>
<%--                <td>5</td>--%>
<%--            </tr>--%>
<%--=======--%>
<%-->>>>>>> 9042792de0aa8e9bc7c52c0db40bb9efb5b5dafd--%>
            </tbody>
        </table>


    </div>
</div>
<!-- Process Start -->


<%--<%@include file="Component/Footer.jsp" %>--%>

<!-- Back to Top -->
<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="lib/wow/wow.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/waypoints/waypoints.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>
<script src="lib/tempusdominus/js/moment.min.js"></script>
<script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
<script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
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
<!-- Template Javascript -->
<%--<script src="js/main.js"></script>--%>
<script>
    function submitForm(bookingID) {
        document.querySelector('input[name="bookingID"]').value = bookingID;
        document.getElementById('bookingForm').submit();
    }
</script>
</body>

</html>