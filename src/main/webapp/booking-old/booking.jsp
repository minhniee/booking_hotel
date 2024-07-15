<%--
  Created by IntelliJ IDEA.
  User: minhl
  Date: 5/27/2024
  Time: 11:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Booking Confirmation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
            integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
            crossorigin="anonymous"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .container {
            width: 80%;
            margin: auto;
        }

        .header, .footer {
            text-align: center;
        }

        .section {
            border-bottom: 1px solid #ccc;
            padding: 10px 0;
        }

        .total {
            font-weight: bold;
        }

        h1 {
            color: azure;
            height: 150px;
            text-align: center;
            font-family: Arial, Helvetica, sans-serif;
        }

        .header h1 {
            color: black;
        }

        .section-info {
            background-color: #C4C4C4;
        }

        .section-info h2 {
            background-color: black;
            color: white;
            padding: 15px;
        }

        .section-info p {
            margin: 10px;
        }
    </style>
</head>
<body>
<div class="container-fruid p-5  h-100 bg-dark text-white">
    <h1>FuTel</br><span style="font-size: 16px;">i hotel infomation</span></h1>
</div>

<div class="container">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="index">Home</a></li>
            <li class="breadcrumb-item"><a
                    href="BookingHandle?checkInDate=${checkInDate}&checkOutDate=${checkOutDate}&adults=${adults}&children=${children}">Select
                Room</a></li>
            <li class="breadcrumb-item active" aria-current="page">Booking</li>
        </ol>
    </nav>

    <div class="header">
        <h1>Finalize your stay</h1>
        <p>Book with confidence: you are on the hotel website.</p>
    </div>

    <div class="section-info">
        <h2>Your reservation - from <span id="check-in-date">${checkInDate}</span> to <span
                id="check-out-date">${checkOutDate}</span></h2>
        <p><strong id="hotel-name">FUTel</strong></p>
        <p>Address: <span id="hotel-address">Thach That</span></p>
        <p>Reception is open: 24 hours</p>
        <p>Check-in from: 14:00</p>
        <p>Check-out before: 12:00</p>
        <p>Spoken languages: <span id="languages">English, Vietnamese</span></p>
        <p>Contact: <span id="contact-number">012-345-678</span></p>
    </div>
    <hr>
    <div class="section">

        <h3>Room 1</h3>
<%--        <h4>Location: ${location}</h4>--%>
        <p><strong id="room1-type">${roomType}</strong></p>
        <p><span id="room1-adults">${persons}</span> adults</p>
        <p>Bedding options: <span id="room1-bedding">${roomType}</span></p>
        <p>Early Bird ${earlyBirdDays} Days</p>
        <p>Breakfast included: <span id="room1-breakfast">[Breakfast Details]</span></p>
        <p>Price: <span id="room1-price">${total}</span></p>
    </div>


    <div class="section total">
        <p>Total: <span id="total-price">${total}</span></p>
        <p>Not included: Service Charge <span id="service-charge">[Service Charge Amount]</span></p>
        <p>Not included: VAT / Consumption tax <span id="vat">[VAT Amount]</span></p>
    </div>
    <hr>

    <div class="section total">
        <p>The taxes which are not included are to be paid to the hotel. The total amount is:</p>
        <p><strong id="total-with-taxes">${total}</strong></p>
    </div>


    <div class="section">
<%--        <c:set var="user" value="${sessionScope.account}"/>--%>
        <p>Infomation</p>

        <input type="text" value="${user.fullName}" readonly>
        <input type="text" value="${user.email}" readonly>
        <input type="text" value="${user.dob}" readonly>
        <input type="text" value="${user.gender?"Male":"Female"}" readonly>
        <input type="text" value="${user.phone}" readonly>
        <input type="text" value="${user.address}" readonly>
    </div>

    <%--<form action="BookingDetail" method="post">
    <div class="section">
        <p><strong>Payment method</strong></p>

        <div class="form-check">
            <input class="form-check-input" type="radio" name="paymentMethod" value="banking" id="flexRadioDefault1" checked>
            <label class="form-check-label" for="flexRadioDefault1">
                Banking
            </label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="paymentMethod" value="banktransfer" id="flexRadioDefault2">
            <label class="form-check-label" for="flexRadioDefault2">
                Bank Transfer
            </label>
        </div>
    </div> --%>

    <div class="section">
        <p><strong>Cancellable, modifiable</strong></p>
        <p>This offer can be cancelled or modified free of charge before <span id="cancellation-deadline">[Cancellation Deadline]</span>.
        </p>
    </div>

    <%--        <form action="BookingDetail" method="POST">--%>
    <div class="section">
        <form action="paymentvnpay" method="POST">
            <p>This offer can be cancelled or modified free of charge before 11 June 2024, 00:00 (UTC+07:00).In case of
                cancellation after this date, a penalty of 100% of first night will apply (₫1,914,063).In case of
                no-show, a
                penalty of 100% will apply.
                By choosing to book, I acknowledge having read and agreed to the terms and conditions.</p>
<%--            <input type="hidden" value="${location}" name="location">--%>
          <input type="hidden" value="${user.id}" name="accountid">
            <input type="hidden" value="${checkInDate}" name="checkInDate">
            <input type="hidden" value="${checkOutDate}" name="checkOutDate">
            <input type="hidden" value="${children}" name="children">
            <input type="hidden" value="${adults}" name="adults">
            <input type="hidden" value="${total}" name="price">
            <input type="hidden" name="roomId" value="L2001">

            <button class="btn btn-primary" id="book-button" type="submit">booking</button>
        </form>

        <%--            <button class="btn btn-primary" id="book-button" type="submit">booking</button>--%>
    </div>
    <%--        </form>--%>
    <%--        <button id="submitButton" type="button"   >Submit</button>--%>
    <%--        <div id="qrPayment" style="display: none">--%>
    <%--            <div class="countdown-container">--%>
    <%--                <h3>QR have valid in: </h3>--%>
    <%--                <div id="countdown">--%>
    <%--                    <span id="minutes"></span> minutes--%>
    <%--                    <span id="seconds"></span> seconds--%>
    <%--                </div>--%>
    <%--            </div>--%>
    <%--            <img src="https://qr.sepay.vn/img?acc=0000291930123&bank=MBBank&amount=${total}&des=test" alt=""/>--%>

    <%--        </div>--%>
</div>
<div class="footer">
    <p>Thank you for booking with us!</p>
</div>
</div>

<script>
    // const bankingRadio = document.getElementById('flexRadioDefault1');
    // const bankingTransferRadio = document.getElementById('flexRadioDefault2');
    // const qrPayment = document.getElementById('qrPayment');
    // const submitButton = document.getElementById('submitButton');
    //
    // submitButton.addEventListener('click', function () {
    //     if (bankingRadio.checked) {
    //         qrPayment.style.display = 'block';
    //         countDownValidQr();
    //     } else if (bankingTransferRadio.checked) {
    //         window.location.href = 'https://google.com'
    //     }
    // })
    //
    // function countDownValidQr() {
    //     const countdownDate = new Date(new Date().getTime() + 5 * 60 * 1000).getTime();
    //
    //     // Update the count down every 1 second
    //     const countdownFunction = setInterval(function () {
    //         // Get today's date and time
    //         const now = new Date().getTime();
    //
    //         // Find the distance between now and the countdown date
    //         const distance = countdownDate - now;
    //
    //         // Time calculations for days, hours, minutes and seconds
    //         // const days = Math.floor(distance / (1000 * 60 * 60 * 24));
    //         // const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    //         const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    //         const seconds = Math.floor((distance % (1000 * 60)) / 1000);
    //
    //         // Output the result in an element with id="countdown"
    //
    //         document.getElementById("minutes").innerHTML = minutes;
    //         document.getElementById("seconds").innerHTML = seconds;
    //
    //         // If the countdown is over, write some text
    //         if (distance < 0) {
    //             clearInterval(countdownFunction);
    //             document.getElementById("countdown").innerHTML = "SALE ENDED";
    //         }
    //     }, 1000);
    // }
</script>
</body>
</html>

