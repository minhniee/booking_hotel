<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="url"
       value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Sogo Hotel by Colorlib.com</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <%@ include file="../layout/cdnpkg.jsp" %>
    <link rel="stylesheet" href="${url}/Assets/css/header.css">
    <link rel="stylesheet" href="${url}/Assets/css/footer.css">
</head>

<body>
<div class="navbar">

    <div class="navContainer">
        <span class="logo" onclick="window.location.href='${url}/index'" style="cursor: pointer">Futel</span>
        <c:if test="${ empty sessionScope.account }">
            <div class="navIteams">
                <button class="navButton" onclick="window.location.href='${url}/login.jsp'">Login</button>
                <button class="navButton" onclick="window.location.href='${url}/register.jsp'">Register</button>
            </div>
        </c:if>
        <c:if test="${not empty sessionScope.account }">
            <div class="navIteams">
                <div class="dropdown text-end">

                    <a href="#" class="d-block link-body-emphasis text-decoration-none " data-bs-toggle="dropdown"
                       aria-expanded="false">
                        <button class="btn btn-primary">Hello, ${account.userName}</button>
                    </a>
                    <ul class="dropdown-menu text-small" style="">
                        <li><a class="dropdown-item" href="#">New project...</a></li>
                        <li><a class="dropdown-item" href="#">Settings</a></li>
                        <li><a class="dropdown-item" href="#">Profile</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="logout">Sign out</a></li>
                    </ul>
                </div>
            </div>
        </c:if>
    </div>
</div>
<!-- Header content -->
<div class="header">
    <div class="headerContainer">
        <div class="headerList">
            <div class="headerListItem active ">
                <%--                    <img src="${url}/fontawesome-free-6.5.2-web/svgs/solid/bed.svg" width="30" height="20" alt=""/>--%>
                <a href="${url}/index" onclick="setActive(this)"><i class="fas fa-bed"></i> Stays</a>
            </div>
            <div class="headerListItem">
                <a href="${url}/Room" onclick="setActive(this)"><i class="fa-solid fa-door-open"></i> Rooms</a>

            </div>
            <div class="headerListItem">
                <a href="#car-rentals" onclick="setActive(this)"><i class="fas fa-car"></i> Car rentals</a>
            </div>
            <div class="headerListItem">
                <img src="${url}/fontawesome-free-6.5.2-web/svgs/solid/city.svg" width="30" height="20"/>
                <span>Attraction</span>
            </div>
            <div class="headerListItem">
                <a href="${url}/homePage/contact.jsp" onclick="setActive(this)"><i class="fa-regular fa-envelope"></i> Contact</a>
            </div>
        </div>

        <h1 class="headerTitle">${account.userName}, The next Where do you go to ?</h1>
        <c:if test="${ empty sessionScope.account }">
            <p class="headerDesc">Login Now</p>
            <button class="headerBtn">Sign on/ Register</button>
        </c:if>
        <div class="headerSreach">
            <div class="headerSearchIteam">
                <img src="${url}/fontawesome-free-6.5.2-web/svgs/solid/location-dot.svg" width="30" height="20"/>
                <input type="text" placeholder="Where are you going?" class="headerSearchInput"/>
            </div>
            <div class="headerSearchIteam">
                <img src="${url}/fontawesome-free-6.5.2-web/svgs/solid/calendar-day.svg" width="30" height="20"/>
                <span class="headerSearchText">date to date?</span>
            </div>
            <div class="headerSearchIteam">
                <img src="${url}/fontawesome-free-6.5.2-web/svgs/solid/user.svg" width="30" height="20"/>
                <span class="headerSearchText">2 adults 2 children 1 room</span>
            </div>
            <c:if test="${ empty sessionScope.account }">
                <div class="headerSearchIteam">
                    <button class="headerBtn" onclick="window.location.href='https://google.com'">Sign on/ Register
                    </button>
                </div>
            </c:if>
        </div>
    </div>
</div>

<script>
    function setActive(element) {
        // Remove active class from all links
        var links = document.querySelectorAll('.headerListItem a');
        links.forEach(function (link) {
            link.classList.add('active');

        });

        element.classList.add('active');
    }
</script>
</body>

