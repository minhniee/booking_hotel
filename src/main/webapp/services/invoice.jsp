<%--
  Created by IntelliJ IDEA.
  User: minhl
  Date: 7/14/2024
  Time: 3:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="url"
       value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="url1"
       value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="images/favicon.png" rel="icon" />
    <title>Service Invoice </title>
    <meta name="author" content="harnishdesign.net">

    <!-- Web Fonts
    ======================= -->
    <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900' type='text/css'>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Barlow&amp;family=Barlow+Condensed&amp;family=Gilda+Display&amp;display=swap">
    <link rel="stylesheet" href="${url1}/Assets1/css/plugins.css" />
    <link rel="stylesheet" href="${url1}/Assets1/css/style.css" />
    <!-- Stylesheet
    ======================= -->
    <link rel="stylesheet" type="text/css" href="${url}/Assets1/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${url}/Assets1/css/all.min.css"/>
    <link rel="stylesheet" type="text/css" href="${url}/Assets1/css/stylesheet.css"/>
    <style>
        body{
            background-color: #60636a;
        }
    </style>
</head>
<body>

<jsp:include page="/homePage/navbar.jsp"></jsp:include>

<!-- Container -->
<div class="container-fluid invoice-container">
    <!-- Header -->
    <header>
        <div class="row align-items-center gy-3">
            <div class="col-sm-7 text-center text-sm-start"> <img style="width: 180px" id="logo" src="Assets/image/Logo/logo_hotel.png" title="Koice" alt="Koice" /> </div>
            <div class="col-sm-5 text-center text-sm-end">
                <h4 class="mb-0">Invoice</h4>
                <p class="mb-0">Invoice Number - ${vnp_TxnRef}</p>
            </div>
        </div>
        <hr>
    </header>

    <!-- Main Content -->
    <main>
        <div class="row">
            <div class="col-sm-6 mb-3"> <strong>Full Name:</strong> <span>${account.fullName}</span> </div>
            <div class="col-sm-6 mb-3 text-sm-end"> <strong>Booking Date:</strong> <span>${currentDate}</span> </div>
        </div>
        <hr class="mt-0">
        <div class="row">
            <div class="col-sm-5"> <strong>Hotel Details:</strong>
                <address>
                    The Orchid Hotel<br />
                    Plot No.3, Nr. HDFC Bank, Ashram Road<br />
                    Ahmedabad, Gujarat,<br />
                    India.
                </address>
            </div>
            <div class="col-sm-7">
                <div class="row">
                    <div class="col-sm-4"> <strong>Check In:</strong>
                        <p>${b.checkInDate}</p>
                    </div>
                    <div class="col-sm-4"> <strong>Check Out:</strong>
                        <p>${b.checkOutDate}</p>
                    </div>
                    <div class="col-sm-4"> <strong>Rooms:</strong>
                        <p>${b.roomId}</p>
                    </div>
                    <div class="col-sm-4"> <strong>Booking ID:</strong>
                        <p>${b.id}</p>
                    </div>
                    <div class="col-sm-4"> <strong>Payment Mode:</strong>
                        <p>Credit Card</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr>
                    <th>Image</th>
                    <th>Service Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${cart.cartItems}">
                    <tr>
                        <td><img src="Assets/services/${item.service.image}" width="100" alt="${item.service.serviceName}"></td>
                        <td>${item.service.serviceName}</td>
                        <td>${item.service.description}</td>
                        <td>$${item.service.price}</td>
                        <td>
                           ${item.quantity}
                        </td>
                        <td>$${item.quantity * item.service.price}</td>

                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <h3>Total: $${cart.totalAmount}</h3>
        </div>
        <br>
        <p class="text-1 text-muted"><strong>Please Note:</strong> Amount payable is inclusive of central & state goods & services Tax act applicable slab rates. Please ask Hotel for invoice at the time of check-out.</p>
    </main>
    <!-- Footer -->
    <footer class="text-center">
        <hr>
        <p class="lh-base"><strong>Koice Inc.</strong><br>
            4th Floor, Plot No.22, Above Public Park, 145 Murphy Canyon Rd,<br>
            Suite 100-18, San Diego CA 2028. </p>
        <hr>
        <p class="text-1"><strong>NOTE :</strong> This is computer generated receipt and does not require physical signature.</p>
        <div class="btn-group btn-group-sm d-print-none"> <a href="javascript:window.print()" class="btn btn-light border text-black-50 shadow-none"><i class="fa fa-print"></i> Print & Download</a> </div>
    </footer>
</div>
<!-- Back to My Account Link -->
<p class="text-center d-print-none"><a href="${url}/bookingHistory">&laquo; Back to My Account</a></p>
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