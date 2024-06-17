<%--
  Created by IntelliJ IDEA.
  User: minhl
  Date: 5/25/2024
  Time: 10:35 AM
  To change this template use File | Settings | File Templates.
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="url" value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" />
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Sogo Hotel by Colorlib.com</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <%@include file="cdnpkg.jsp"%>
    <link rel="stylesheet" href="css/header.css">
</head>

<body>
<div class="navbar">
    <div class="navContainer">
        <span class="logo" onclick="window.location.href= 'index'" style="cursor: pointer">Futel</span>
        <div class="navIteams">
            <button class="navButton" onclick="window.location.href= 'login.jsp'"  >Login</button>
            <button class="navButton" onclick="window.location.href= 'register.jsp'">Register</button>
        </div>
    </div>
</div>
<div class="header">
    <div class="headerContainer">
        <div class="headerList">
            <div class="headerListItem active">
                <img src="fontawesome-free-6.5.2-web/svgs/solid/bed.svg" width="30" height="20" />
                <span>Stay</span>
            </div>
            <div class="headerListItem">
                <img src="fontawesome-free-6.5.2-web/svgs/solid/plane.svg" width="30" height="20" />
                <span>Flights</span>
            </div>
            <div class="headerListItem">
                <img src="fontawesome-free-6.5.2-web/svgs/solid/car.svg" style="color: white" width="30" height="20" />
                <span>Car rentals</span>
            </div>
            <div class="headerListItem">
                <img src="fontawesome-free-6.5.2-web/svgs/solid/bed.svg" width="30" height="20" />
                <span>Attraction</span>
            </div>
            <div class="headerListItem">
                <img src="fontawesome-free-6.5.2-web/svgs/solid/taxi.svg" width="30" height="20" />
                <span>Taxi</span>
            </div>
        </div>
        <h1 class="headerTitle">Minh K17, The next Where do you goto ?</h1>
        <p class="headerDesc">Login Now</p>
        <button class="headerBtn">Sign on/ Register</button>

        <div class="headerSreach">
            <div class="headerSearchIteam">
                <img src="fontawesome-free-6.5.2-web/svgs/solid/location-dot.svg" width="30" height="20" />
                <input type="text" placeholder="Where are you going?" class="headerSearchInput"></input>
            </div>
            <div class="headerSearchIteam">
                <img src="fontawesome-free-6.5.2-web/svgs/solid/calendar-day.svg" width="30" height="20" />
                <span class="headerSearchText">date to date?</span>
            </div>
            <div class="headerSearchIteam">
                <img src="fontawesome-free-6.5.2-web/svgs/solid/user.svg" width="30" height="20" />
                <span class="headerSearchText">2 adults 2 children 1 room</span>
            </div>
            <div class="headerSearchIteam">
                <button class="headerBtn">Sign on/ Register</button>
            </div>
        </div>
    </div>
</div>
</div>
</body>