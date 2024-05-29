<%--
  Created by IntelliJ IDEA.
  User: minhl
  Date: 5/27/2024
  Time: 11:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        .header h1{
            color: black;
        }
        .section-info{
            background-color: #C4C4C4;
        }
        .section-info h2{
            background-color: black;
            color: white;
            padding: 15px;
        }
        .section-info p{
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
            <li class="breadcrumb-item"><a href="../index.jsp">Home</a></li>
            <li class="breadcrumb-item"><a href="BookingHandle?checkinDate=${checkinDate}&checkoutDate=${checkinDate}&adults=2&children=1">Select Room</a></li>
            <li class="breadcrumb-item active" aria-current="page">Booking</li>
        </ol>
    </nav>

    <div class="header">
        <h1>Finalize your stay</h1>
        <p>Book with confidence: you are on the hotel website.</p>
    </div>

    <div class="section-info">
        <h2>Your reservation - from <span id="check-in-date">${checkinDate}</span> to <span id="check-out-date">${checkoutDate}</span></h2>
        <p><strong id="hotel-name">FUTel</strong></p>
        <p>Address: <span id="hotel-address">Thach That</span></p>
        <p>Reception is open: 24 hours</p>
        <p>Check-in from: 14:00</p>
        <p>Check-out before: 12:00</p>
        <p>Spoken languages: <span id="languages">English, Vietnamese</span></p>
        <p>Contact: <span id="contact-number" >012-345-678</span> </p>
    </div>
<hr>
    <div class="section">
        <h3>Room 1</h3>
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
        <p>Infomation</p>

        <input type="text" value="info" readonly>
        <input type="text" value="info" readonly>
        <input type="text" value="info" readonly>
        <input type="text" value="info" readonly>
        <input type="text" value="info" readonly>
        <input type="text" value="info" readonly>
    </div>

    <div class="section">
        <p><strong>Payment method</strong></p>

        <div class="form-check">
            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" checked>
            <label class="form-check-label" for="flexRadioDefault1">
                Cash
            </label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" >
            <label class="form-check-label" for="flexRadioDefault2">
                Banking
            </label>
        </div>
    </div>

    <div class="section">
        <p><strong>Cancellable, modifiable</strong></p>
        <p>This offer can be cancelled or modified free of charge before <span id="cancellation-deadline">[Cancellation Deadline]</span>.</p>
    </div>

    <div lass="section">
        <p>This offer can be cancelled or modified free of charge before 11 June 2024, 00:00 (UTC+07:00).In case of cancellation after this date, a penalty of 100% of first night will apply (₫1,914,063).In case of no-show, a penalty of 100% will apply.
            By choosing to book, I acknowledge having read and agreed to the terms and conditions.</p>
        <button style="display: flex; align-items: center; justify-content: center;">Booking now </button>
    </div>

    <div class="footer">
        <p>Thank you for booking with us!</p>
    </div>
</div>
</body>
</html>
