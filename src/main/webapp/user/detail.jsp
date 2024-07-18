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
  <!-- Stylesheet -->
  <link rel="stylesheet" type="text/css" href="${url}/Assets1/css/bootstrap.min.css"/>
  <link rel="stylesheet" type="text/css" href="${url}/Assets1/css/all.min.css"/>
  <link rel="stylesheet" type="text/css" href="${url}/Assets1/css/stylesheet.css"/>
</head>

<body>
<!-- Container -->
<div class="container-fluid invoice-container">
  <!-- Header -->
  <header>
    <div class="row align-items-center gy-3">
      <div class="col-sm-7 text-center text-sm-start">
        <img id="logo" src="${url}/Assets/image/Logo/logo_hotel.png" title="Booking detail" alt="Booking detail" />
      </div>
      <div class="col-sm-5 text-center text-sm-end">
        <h4 class="mb-0">Detail</h4>
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
      <h5>Room detail</h5>
      <div class="row">
        <c:forEach var="image" items="${dataimg}">
          <div class="col-sm-4">
            <img class="img-fluid" src="${url}/Assets/image/demoRoom/${image}" alt="Room Image">
          </div>
        </c:forEach>
      </div>
    </div>

    <div class="table-responsive">
      <table class="table border mb-0">
        <thead>
        <tr class="bg-light">
          <td class="col-6"><strong>Description</strong></td>
          <td class="col-4 text-end"><strong>Rate</strong></td>
          <td class="col-2 text-end"><strong>Amount</strong></td>
        </tr>
        </thead>
        <tbody>
        <c:set var="nights" value="${((data.checkOutDate.time - data.checkInDate.time) / (1000 * 60 * 60 * 24))}" />
        <tr>
          <td class="col-6">Room Charges</td>
          <td class="col-4 text-end">$${base_price} X ${nights} Night(s) X 1 Room</td>
          <td class="col-2 text-end"><fmt:formatNumber value="${base_price * nights}" type="currency" currencySymbol="$" maxFractionDigits="2" /></td>
        </tr>
        <tr>
          <td>Other Charges</td>
          <td class="text-end">0</td>
          <td class="text-end">0</td>
        </tr>
        </tbody>
      </table>
    </div>

    <div class="table-responsive">
      <table class="table border border-top-0 mb-0">
        <tr class="bg-light">
          <td colspan="2" class="text-end"><strong>Sub Total:</strong></td>
          <td class="col-sm-2 text-end"><fmt:formatNumber value="${base_price * nights}" type="currency" currencySymbol="$" maxFractionDigits="2" /></td>
        </tr>
        <tr class="bg-light">
          <td colspan="2" class="text-end"><strong>Tax (10%):</strong></td>
          <td class="col-sm-2 text-end"><fmt:formatNumber value="${base_price * nights * 0.1}" type="currency" currencySymbol="$" maxFractionDigits="2" /></td>
        </tr>
        <tr class="bg-light">
          <td colspan="2" class="text-end border-bottom-0"><strong>Total:</strong></td>
          <td class="col-sm-2 text-end border-bottom-0"><fmt:formatNumber value="${base_price * nights * 1.1}" type="currency" currencySymbol="$" maxFractionDigits="2" /></td>
        </tr>
      </table>
    </div>
    <br>
    <p class="text-1 text-muted"><strong>Please Note:</strong> Amount payable is inclusive of central & state goods & services Tax act applicable slab rates. Please ask Hotel for invoice at the time of check-out.</p>
  </main>

  <!-- Footer -->
  <footer class="text-center">
    <hr>
    <p class="lh-base"><strong>Hotel.</strong><br>
      The Orchid Hotel<br>
      Plot No.3, Nr. HDFC Bank, Ashram Road<br>
      Ahmedabad, Gujarat,<br />
      India.</p>
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
<p class="text-center d-print-none"><a href="${url}/Booking_Hotell/home">&laquo; Back to Home</a></p>
</body>
</html>
