<%@ page import="model.Account" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="url1"
       value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title>Services</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <title>The Cappa Luxury Hotel</title>
    <link rel="shortcut icon" href="Assets/favicon.png" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Barlow&amp;family=Barlow+Condensed&amp;family=Gilda+Display&amp;display=swap">
    <link rel="stylesheet" href="${url1}/Assets1/css/plugins.css" />
    <link rel="stylesheet" href="${url1}/Assets1/css/style.css" />

</head>
<body>
<%
    Account account = (Account) session.getAttribute("account");
    if (account == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!-- Preloader -->
<%--<div class="preloader-bg"></div>--%>
<%--<div id="preloader">--%>
<%--    <div id="preloader-status">--%>
<%--        <div class="preloader-position loader"> <span></span> </div>--%>
<%--    </div>--%>
<%--</div>--%>
<!-- Progress scroll totop -->
<%--<div class="progress-wrap cursor-pointer">--%>
<%--    <svg class="progress-circle svg-content" width="100%" height="100%" viewBox="-1 -1 102 102">--%>
<%--        <path d="M50,1 a49,49 0 0,1 0,98 a49,49 0 0,1 0,-98" />--%>
<%--    </svg>--%>
<%--</div>--%>
<!-- Navbar -->
<jsp:include page="/homePage/navbar.jsp"></jsp:include>
<!-- Header Banner -->
<div class="banner-header section-padding valign bg-img bg-fixed" data-overlay-dark="4" data-background="${url1}/Assets1/img/slider/3.jpg">
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-left caption mt-90">
                <h5>Service</h5>
                <h1>Our Services</h1>
            </div>
        </div>
    </div>
</div>
<!-- News  -->
<section class="news section-padding" style="background-color: #ebd6d6">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <h2>Categories</h2>
                <ul class="list-group">
                    <c:forEach var="category" items="${categories}">
                        <li class="list-group-item">
                            <a href="services?categoryId=${category.id}">${category.categoryName}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>

            <div class="col-md-9">
                <form action="services" method="get" class="form-inline mb-4">
                    <input type="hidden" name="action" value="search"/>
                    <input style="background-color: #fff; margin: 0px" type="text" name="keyword" class="form-control mr-2" placeholder="Search services..."/>
                    <button type="submit" class="btn btn-primary">Search</button>
                </form>
                <div class="row">
                <c:forEach var="service" items="${services}">
            <div class="col-md-4 mb-30">
                <div class="item">
                    <div class="position-re o-hidden"> <img style="height: 300px" src="Assets/services/${service.image}" alt="${service.serviceName}">
                        <div class="date">
                            <a href="post.html"> <span>Dec</span> <i>02</i> </a>
                        </div>
                    </div>
                    <div class="con"> <span class="category">
                                    <a href="#">${service.serviceName}</a>
                                </span>
                        <p style="color: #000"><a href="#">${service.description}</a></p>

                        <p class="card-text" style="color: #000">$${service.price}</p>
                        <p class="card-text" style="color: #000">Quantity: ${service.quantity}</p>
                        <c:if test="${service.quantity > 0}">
                            <form action="cart" method="post">
                                <input type="hidden" name="action" value="add">
                                <input type="hidden" name="serviceId" value="${service.id}">
                                <input type="hidden" name="quantity" value="1">
                                <button type="submit" class="btn btn-primary">Add to Cart</button>
                            </form>
                        </c:if>
                        <c:if test="${service.quantity <= 0}">
                            <button class="btn btn-danger">Out Stock</button>
                        </c:if>
                    </div>
                </div>
            </div>

</c:forEach>
        </div>
        </div>
        </div>



        <div class="row">
            <div class="col-md-12 text-center">
                <!-- Pagination -->
                <ul class="news-pagination-wrap align-center mb-30 mt-30">
                    <li><a href="news.html#"><i class="ti-angle-left"></i></a></li>
                    <li><a href="news.html#">1</a></li>
                    <li><a href="news.html#" class="active">2</a></li>
                    <li><a href="news.html#">3</a></li>
                    <li><a href="news.html#"><i class="ti-angle-right"></i></a></li>
                </ul>
            </div>
        </div>
    </div>
</section>
<!-- Footer -->
<jsp:include page="/homePage/footer.jsp"></jsp:include>
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
</html>
