<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/27/2024
  Time: 2:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="Assets/css/listAccount.css">
</head>
<body>
<div class="tabular--wrapper">



    <h3 class="main--title">Detail Booking</h3>
    <div class="table-container">

        <table>
            <thead>
            <tr>
                <th>Full Name</th>
                <th>Phone</th>

                <th>Email</th>
                <th>Material</th>
                <th>Payment Date</th>
                <th>Billing Date</th>
                <th>Payment Name</th>
                <th>Total Amount</th>

            </tr>
            <tbody>
           <c:set value="${requestScope.detailListBooking}" var="detailListBooking"/>
                <tr>
                    <td>${detailListBooking.name}</td>
                    <td>${detailListBooking.phone}</td>
                    <td>${detailListBooking.email}</td>
                    <td>${detailListBooking.material}</td>
                    <td>${detailListBooking.payment_date}</td>
                    <td>${detailListBooking.billing_date}</td>
                    <td>${detailListBooking.payment_name}</td>
                    <td>${detailListBooking.total_amount}</td>

                </tr>

            </tbody>
            </thead>
        </table>

    </div>

</div>
</body>
</html>
