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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
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
                        <li><a class="dropdown-item" href="${url}/user/user_profile.jsp">Profile</a></li>
                            <%--                        <li><a class="dropdown-item" href="#">Settings</a></li>--%>
                            <%--                        <li><a class="dropdown-item" href="#">Profile</a></li>--%>
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
                <a href="${url}/homePage/contact.jsp" onclick="setActive(this)"><i class="fa-regular fa-envelope"></i>
                    Contact</a>
            </div>
        </div>

        <h1 class="headerTitle">${account.userName}, The next Where do you go to ?</h1>
        <c:if test="${ empty sessionScope.account }">
            <p class="headerDesc">Login Now</p>
            <button class="headerBtn">Sign on/ Register</button>
        </c:if>
        <form method="get" action="BookingHandle">
            <div class="headerSreach">

                <div class="headerSearchIteam" style="position: relative">
                    <img src="${url}/fontawesome-free-6.5.2-web/svgs/solid/location-dot.svg" width="30" height="20"/>
                    <input type="text" placeholder="Where are you going?" readonly class="headerSearchInput" id="box" onclick="showDropdown()"/>
                    <div id="dropdown">
                        <select id="select" name="location" onchange="updateInput()" size="4">
                            <option value="Ha Noi" >Ha Noi</option>
                            <option value="Da Nang">Da Nang</option>
                            <option value="Quy Nhon">Quy Nhon</option>
                            <option value="Ho Chi Minh">Ho Chi Minh</option>
                        </select>
                    </div>
                </div>

                <div class="headerSearchIteam">
                    <img src="${url}/fontawesome-free-6.5.2-web/svgs/solid/calendar-day.svg" width="30" height="20"/>
                    <%--                <span id="datePicker">date to date?</span>--%>
                    <input type="text" id="datePicker" class="headerSearchIteam" name="date"
                           placeholder="Select Date Range">
                </div>
                <div class="headerSearchIteam">
                    <img src="${url}/fontawesome-free-6.5.2-web/svgs/solid/user.svg" width="30" height="20"/>
                    <span class="headerSearchText">2 adults 2 children 1 room</span>
                </div>
                <c:if test="${ not empty sessionScope.account }">
                    <div class="headerSearchIteam">
                        <button class="headerBtn" type="submit">Search
                        </button>
                    </div>
                </c:if>

                <c:if test="${  empty sessionScope.account }">
                    <div class="headerSearchIteam">
                        <button class="headerBtn" type="button" onclick="window.location.href='login.jsp'">
                            Login/Register
                        </button>
                    </div>
                </c:if>
            </div>
        </form>
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

    document.addEventListener('DOMContentLoaded', function () {
        flatpickr("#datePicker", {
            mode: "range",
            dateFormat: "d-m-Y",
            minDate: "today",
            defaultDate: ["19-06-2024", "22-06-2024"],
            showMonths: 2,
            onChange: function (selectedDates, dateStr, instance) {
                // Handle date change event here if needed
                console.log("Selected dates: ", dateStr);
            }
        });
    });
        function showDropdown() {
        var dropdown = document.getElementById("dropdown");
        var input = document.getElementById("box");
        dropdown.style.width = input.offsetWidth + 'px'; // Match the width of the input field
        dropdown.style.display = "block";
    }

        function updateInput() {
        var select = document.getElementById("select");
        var input = document.getElementById("box");
        input.value = select.value;
        document.getElementById("dropdown").style.display = "none"; // Hide dropdown after selection
    }

        // Hide the dropdown if clicked outside of it
        document.addEventListener('click', function(event) {
        var dropdown = document.getElementById("dropdown");
        var input = document.getElementById("box");
        if (!dropdown.contains(event.target) && event.target !== input) {
        dropdown.style.display = "none";
    }
    });
</script>
</body>

