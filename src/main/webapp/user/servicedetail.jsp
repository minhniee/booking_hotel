<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="url" value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="images/favicon.png" rel="icon" />
  <title>Hotel Booking History Detail</title>
  <meta name="author" content="harnishdesign.net">

  <!-- Web Fonts -->
  <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900' type='text/css'>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Barlow&amp;family=Barlow+Condensed&amp;family=Gilda+Display&amp;display=swap">
  <link rel="stylesheet" href="${url}/Assets1/css/plugins.css" />
  <link rel="stylesheet" href="${url}/Assets1/css/style.css" />
  <!-- Stylesheet -->
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
      <div class="col-sm-7 text-center text-sm-start">
        <img id="logo" src="${url}/Assets/image/Logo/logo_hotel.png" title="Booking detail" alt="Booking detail" style="width: 150px"/>
      </div>
      <div class="col-sm-5 text-center text-sm-end">
        <h4 class="mb-0">Service Detail</h4>
      </div>
    </div>
    <hr>
  </header>

  <!-- Main Content -->
  <main>
    <div class="row">
      <div class="col-sm-6 mb-3"> <strong>Full Name:</strong> <span>${account.fullName}</span> </div>
      <div class="col-sm-6 mb-3 text-sm-end"> <strong>Booking Date:</strong>
        <span><fmt:formatDate value="${data.bookingDate}" pattern="yyyy-MM-dd" /></span> </div>
    </div>
    <hr class="mt-0">
    <div class="row">
      <div class="col-sm-5"> <strong>Hotel Address:</strong>
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
            <p><fmt:formatDate value="${data.checkInDate}" pattern="yyyy-MM-dd" /></p>
          </div>
          <div class="col-sm-4"> <strong>Check Out:</strong>
            <p><fmt:formatDate value="${data.checkOutDate}" pattern="yyyy-MM-dd" /></p>
          </div>
          <div class="col-sm-4"> <strong>Rooms:</strong>
            <p>${data.roomId}</p>
          </div>
          <div class="col-sm-4"> <strong>Booking ID:</strong>
            <p>${data.id}</p>
          </div>
          <div class="col-sm-4"> <strong>Payment Mode:</strong>
            <p>Credit Card</p>
          </div>
        </div>
      </div>
    </div>
    <p><strong>Number of Adults:</strong> ${data.numAdults}</p>
    <p><strong>Number of Children:</strong> ${data.numChildren}</p>
    <div>
      <h5>Services detail</h5>
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
        <c:forEach var="item" items="${serviceList}">
          <tr>
            <td><img style="height: 100px" src="Assets/services/${item.image}" width="100" alt="${item.serviceName}"></td>
            <td>${item.serviceName}</td>
            <td>${item.description}</td>
            <td>$${item.price}</td>
            <td>
                ${item.quantity}
            </td>
            <td>$${item.quantity * item.price}</td>

          </tr>
        </c:forEach>
        </tbody>
      </table>
      <h3>Total: $${total}</h3>
    </div>

    <br>
    <p class="text-1 text-muted"><strong>Please Note:</strong> Amount payable is inclusive of central & state goods & services Tax act applicable slab rates. Please ask Hotel for invoice at the time of check-out.</p>
  </main>

  <!-- Footer -->
  <footer class="text-center">
    <hr>
    <p class="lh-base"><strong>Hotel.</strong><br>
      FU Hotel Hotel<br>
      Thach That, Ha Noi<br>
      Viet Nam.</p>
    <hr>
    <p class="text-1"><strong>NOTE :</strong> This is computer generated receipt and does not require physical signature.</p>
    <div class="btn-group btn-group-sm d-print-none">
      <a href="javascript:window.print()" class="btn btn-light border text-black-50 shadow-none">
        <i class="fa fa-print"></i> Print & Download
      </a>
    </div>
  </footer>
</div>
<!-- Back to My Account Link -->
<p class="text-center d-print-none"><a href="${url}/home">&laquo; Back to Home</a></p>
<!-- Footer -->
<jsp:include page="/homePage/footer.jsp"></jsp:include>
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
