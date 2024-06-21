<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/25/2024
  Time: 3:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <link rel="stylesheet" href="Assets/css/styleDashboard.css">
    <title>Dashboard</title>
</head>
<body>
<div class="sidebar">
    <div class="logo"></div>
    <ul class="menu">
        <li class="active">
            <a href="#" >
                <i class="fas fa-tachometer-alt"></i>
                <span>Dashboard</span>
            </a>
        </li>
        <li>
            <a href="#">
                <i class="fas fa-user"></i>
                <span>Profile</span>
            </a>
        </li>
        <li>
            <a href="#">
                <i class="fas fa-chart-bar"></i>
                <span>Statistics</span>
            </a>
        </li>
        <li>
            <a href="#">
                <i class="fas fa-briefcase"></i>
                <span>Careers</span>
            </a>
        </li>
        <li>
            <a href="#">
                <i class="fas fa-question-circle"></i>
                <span>FAQ</span>
            </a>
        </li>
        <li>
            <a href="listAccount">
                <i class="fas fa-star"></i>
                <span>Accounts</span>
            </a>
        </li>
        <li>
            <a href="listRoomManager">
                <i class="fas fa-cog"></i>
                <span>Settings</span>
            </a>
        </li>
        <li class="logout">
            <a href="logout">
                <i class="fas fa-sign-out-alt"></i>
                <span>Logout</span>
            </a>
        </li>
    </ul>
</div>

<div class="main--content">
    <div class="header--wrapper">
        <div class="header--title">
            <span>Primary</span>
            <h2>Dashboard</h2>
        </div>
        <div class="user--info">
            <div class="search--box">
                <i class="fas fa-search"></i>
                <input type="text" placeholder="Search"/>
            </div>
            <img src="images/img.png" alt="">
        </div>
    </div>
    <div class="card--container">
        <h3 class="main--title">Today's data</h3>
     <div class="card--wrapper">
       <div class="payment--card light-red">
             <div class="card--header">
                 <div class="amount">
                    <span class="title">
                        Payment amount
                    </span>
                    <span class="amount-value">$500.00
                    </span>
                 </div>
                 <i class="fas fa-dollar-sign icon"></i>
             </div>
           <span class="card-detail">
                       **** **** **** 3484
           </span>
       </div>
         <div class="payment--card light-purple">
             <div class="card--header">
                 <div class="amount">
                    <span class="title">
                        Payment order
                    </span>
                     <span class="amount-value">$500.00
                    </span>
                 </div>
                 <i class="fas fa-list icon dark-purple"></i>
             </div>
             <span class="card-detail">
                       **** **** **** 3484
           </span>
         </div>
         <div class="payment--card light-blue">
             <div class="card--header ">
                 <div class="amount">
                    <span class="title">
                        Payment customer
                    </span>
                     <span class="amount-value">$500.00
                    </span>
                 </div>
                 <i class="fas fa-users icon dark-blue"></i>
             </div>
             <span class="card-detail">
                       **** **** **** 3484
           </span>
         </div>
         <div class="payment--card light-green">
             <div class="card--header">
                 <div class="amount">
                    <span class="title">
                        Payment process
                    </span>
                     <span class="amount-value">$500.00
                    </span>
                 </div>
                 <i class="fas fa-check icon dark-green"></i>
             </div>
             <span class="card-detail">
                       **** **** **** 3484
           </span>
         </div>
     </div>
    </div>
    <div class="tabular--wrapper">



<c:choose>
    <c:when test="${requestScope.status == 'History Lists Room Booking'}">
        <h3 class="main--title">${requestScope.status}</h3>

        <div class="table-container">

            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Room ID</th>
                    <th>Customer ID</th>
                    <th>Check Date</th>
                    <th>Checkout Date</th>
                    <th>Num Child</th>
                    <th>Num Adults</th>
                    <th>Booking price</th>
                    <th>Details</th>
                </tr>
                <tbody>
                <c:forEach items="${requestScope.bookingLists}" var="list">
                    <tr>
                        <td>${list.id}</td>
                        <td>${list.room_id}</td>
                        <td>${list.customer_id}</td>
                        <td>${list.checkin_date}</td>
                        <td>${list.checkout_date}</td>
                        <td>${list.num_child}</td>
                        <td>${list.num_adults}</td>
                        <td>${list.booking_price}</td>
                        <td>

                            <a href="detailListBooking?id=${list.id}"><button class="fas fa-info-circle"></button></a>
                        </td>

                    </tr>
                </c:forEach>
                </tbody>
                </thead>
            </table>

        </div>
    </c:when>
</c:choose>



    </div>
</div>

</body>
</html>
