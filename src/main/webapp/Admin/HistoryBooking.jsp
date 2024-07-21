<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/27/2024
  Time: 10:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="Assets/css/listAccount.css">
    <title>History Booking</title>
</head>
<body>
<div class="tabular--wrapper">
    <%@include file="dashBoardAdmin.jsp"%>

        <div class="main-content">
    <h3 class="main--title">History Bookings</h3>
    <form action="HistoryBooking" method="post">
        <input type="text" name="text" placeholder="Room id"/>
        <button style="background: #00c6ff">Search</button>
    </form>
    <div class="table-container">

        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Room id</th>

                <th> Check date  </th>
                <th>Checkout date</th>
                <th>Num child</th>
                <th>Num adults</th>
                <th>Booking price</th>
                <th> </th>

            </tr>
            <tbody>
            <c:forEach items="${requestScope.managerBookings}" var="managerBookings">
                <tr>
                    <td>${managerBookings.id}</td>
                    <td>${managerBookings.room_id}</td>

                    <td>${managerBookings.checkin_date}</td>
                    <td>${managerBookings.checkout_date}</td>
                    <td>${managerBookings.num_adults}</td>
                    <td>${managerBookings.num_child}</td>
                    <td>${managerBookings.booking_price}</td>


                    <td>
                        <a href="detailListBooking?id=${managerBookings.id}"><button class="fas fa-info-circle"></button></a>

                    </td>

                </tr>
            </c:forEach>
            </tbody>
            </thead>
        </table>
        <a href="chartData" style="display: flex; justify-content: end"><button class="fas fa-arrow-left" style="border-radius: 5px; background: #00c6ff">Back</button></a>

    </div>
        </div>
</div>
</body>
</html>
