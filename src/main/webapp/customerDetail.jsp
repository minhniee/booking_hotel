<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <title>Customer Detail</title>
        <style>
            .container {
                width: 80%;
                margin: 0 auto;
            }
            .customer-container {
                margin-top: 20px;
                border: 1px solid #ddd;
                padding: 20px;
            }
            .customer-container h2 {
                margin-top: 0;
            }
            .customer-container p {
                margin-bottom: 10px;
            }
            .customer-container table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 10px;
            }
            .customer-container table th, .customer-container table td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }
            .customer-container table th {
                background-color: #f2f2f2;
            }
            .customer-container table tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            .customer-container table tr:hover {
                background-color: #ddd;
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
                        <th>Room ID</th>
                        <th>Checkin Date</th>
                        <th>Checkout Date</th>
                        <th>Adults</th>
                        <th>Children</th>
                        <th>Price</th>
                    </tr>
                    <c:forEach var="booking" items="${customer.bookings}">
                        <tr>
                            <td>${booking.id}</td>
                            <td>${booking.roomId}</td>
                            <td>${booking.checkInDate}</td>
                            <td>${booking.checkOutDate}</td>
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
