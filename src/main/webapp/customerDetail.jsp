<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Detail</title>
    <style>
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            font-family: Arial, sans-serif;
        }

        h1 {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
        }

        .customer-container {
            background-color: #f9f9f9;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 20px;
            margin-top: 20px;
        }

        .customer-container p {
            margin: 10px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Customer Detail</h1>
        <div class="customer-container">
            <p>ID: ${customer.id}</p>
            <p>Full Name: ${customer.fullName}</p>
            <p>Email: ${customer.email}</p>
            <p>Phone: ${customer.phone}</p>
            <p>Gender: ${customer.gender ? "Male" : "Female"}</p>
            <p>Date of Birth: ${customer.dob}</p>
            <p>Address: ${customer.address}</p>

            <h2>Bookings</h2>
            <table>
                <tr>
                    <th>Booking ID</th>
                    <th>Checkin Date</th>
                    <th>Checkout Date</th>
                    <th>Adults</th>
                    <th>Children</th>
                    <th>Price</th>
                </tr>
                <c:forEach var="booking" items="${customer.bookings}">
                    <tr>
                        <td>${booking.id}</td>
                        <td>${booking.checkinDate}</td>
                        <td>${booking.checkoutDate}</td>
                        <td>${booking.numAdults}</td>
                        <td>${booking.numChildren}</td>
                        <td>${booking.bookingPrice}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</body>
</html>
