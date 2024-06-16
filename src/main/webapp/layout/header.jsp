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
    <!-- Theme Style -->
    <link rel="stylesheet" href="css/header.css">
<%--    <link rel="stylesheet" href="css/style.css">--%>
</head>

<body>
<div class="navbar">
    <div class="navContainer">
        <span class="logo">Futel</span>
        <div class="navIteams">
            <button class="navButton">Login</button>
            <button class="navButton">Register</button>
        </div>
    </div>
</div>
<div class="header">
    <div class="headerContainer">
        <div class="headerList">
            <div class="headerListItem active">
                <img src="fontawesome-free-6.5.2-desktop/fontawesome-free-6.5.2-desktop/svgs/solid/bed.svg " width="30" height="20" />
                <span>Stay</span>
            </div>
            <div class="headerListItem">
                <img src="fontawesome-free-6.5.2-desktop/fontawesome-free-6.5.2-desktop/svgs/solid/plane.svg" width="30" height="20" />
                <span>Flights</span>
            </div>
            <div class="headerListItem">
                <img src="fontawesome-free-6.5.2-desktop/fontawesome-free-6.5.2-desktop/svgs/solid/Car.svg " width="30" height="20" />
                <span>Car rentals</span>
            </div>
            <div class="headerListItem">
                <img src="fontawesome-free-6.5.2-desktop/fontawesome-free-6.5.2-desktop/svgs/solid/A.svg " width="30" height="20" />
                <span>Attraction</span>
            </div>
            <div class="headerListItem">
                <img src="fontawesome-free-6.5.2-desktop/fontawesome-free-6.5.2-desktop/svgs/solid/Taxi.svg " width="30" height="20" />
                <span>Taxi</span>
            </div>
        </div>
        <h1 class="headerTitle">Minh K17, kế tiếp bạn sẽ du lịch đến đâu?</h1>
        <p class="headerDesc">Lginnow</p>
        <button class="headerBtn">Sign on/ Register</button>
        <div class="headerSreach">
            <div class="headerSearchIteam">
                <img src="fontawesome-free-6.5.2-desktop/fontawesome-free-6.5.2-desktop/svgs/solid/bed.svg " width="30" height="20" />
                <input type="text" placeholder="Where are you going?" class="headerSearchInput"></input>
            </div>
            <div class="headerSearchIteam">
                <img src="fontawesome-free-6.5.2-desktop/fontawesome-free-6.5.2-desktop/svgs/solid/calendar-days.svg " width="30" height="20" />
                <span class="headerSearchText">date to date?</span>
            </div>
            <div class="headerSearchIteam">
                <img src="fontawesome-free-6.5.2-desktop/fontawesome-free-6.5.2-desktop/svgs/solid/person.svg " width="30" height="20" />
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