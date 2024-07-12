<%--
  Created by IntelliJ IDEA.
  User: minhl
  Date: 7/4/2024
  Time: 6:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>heheh</h1>--%>
<%--<h1>${noti}</h1>--%>
<%--<p>bk ${bookingID}</p>--%>
<%--<p>ac ${accountid}</p>--%>
<%--<p>ck d${checkinDate}</p>--%>
<%--<p> co d${checkoutDate}</p>--%>
<%--<p>cd${children}</p>--%>
<%--<p> ad${adults}</p>--%>
<%--<p> r${roomId}</p>--%>
<%--</body>--%>
<%--</html>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Confirmation</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f4f8;
            color: #333;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }
        .header {
            text-align: center;
            border-bottom: 2px solid #3498db;
            padding-bottom: 20px;
            margin-bottom: 30px;
        }
        .header h1 {
            margin: 0;
            font-size: 28px;
            color: #2c3e50;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        .details, .bill, .additional-info {
            margin-bottom: 30px;
        }
        h2 {
            font-size: 22px;
            color: #3498db;
            margin-bottom: 15px;
            border-bottom: 1px solid #e0e0e0;
            padding-bottom: 10px;
        }
        p {
            margin: 10px 0;
            line-height: 1.6;
        }
        .label {
            font-weight: bold;
            color: #2c3e50;
        }
        .bill .total {
            font-size: 20px;
            font-weight: bold;
            color: #e74c3c;
            margin-top: 15px;
            border-top: 1px solid #e0e0e0;
            padding-top: 15px;
        }
        .additional-info ul {
            padding-left: 20px;
        }
        .additional-info li {
            margin-bottom: 10px;
        }
        .footer {
            text-align: center;
            margin-top: 30px;
            color: #7f8c8d;
            font-size: 14px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1>Booking Confirmation</h1>
    </div>
    <div class="details">
        <h2>Booking Details</h2>
        <p><span class="label">Booking ID:</span> ${bookingID}</p>
        <p><span class="label">Name:</span> ${account.userName}</p>
        <p><span class="label">Email:</span> ${account.email}</p>
        <p><span class="label">Phone:</span> ${account.phone}</p>
        <p><span class="label">Check-in Date:</span> ${checkinDate}</p>
        <p><span class="label">Check-out Date:</span> ${checkoutDate}</p>
        <p><span class="label">Room Type:</span> ${roomType}</p>
        <p><span class="label">Number of Guests:</span> 2 Adults</p>
    </div>
    <div class="bill">
        <h2>Bill Summary</h2>
        <p><span class="label">Room Charges:</span> ${amount}</p>
        <p><span class="label">Service Charges:</span> $50</p>
        <p><span class="label">Taxes:</span> $30</p>
        <p class="total"><span class="label">Total Amount:</span> ${amount+50+30}$</p>
    </div>
    <div class="additional-info">
        <h2>Additional Information</h2>
        <ul>
            <li>Check-in time is 3:00 PM and check-out time is 11:00 AM.</li>
            <li>Free Wi-Fi is available throughout the property.</li>
            <li>Breakfast is included in your stay.</li>
            <li>Parking is available for an additional fee of $10 per night.</li>
            <li>For any changes or cancellations, please contact us at least 48 hours before your check-in date.</li>
        </ul>
    </div>
    <div class="footer">
        <p>Thank you for choosing our hotel. We look forward to welcoming you!</p>
        <p>If you have any questions, please contact us at support@hotel.com or +1 800 123 4567.</p>
    </div>
</div>
</body>
</html>