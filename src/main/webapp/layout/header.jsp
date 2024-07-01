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
    <style>
        #dropdown{
            display: none;
            position: absolute;
            z-index: 1000;
            background: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border: 1px solid #ccc;
            top: 45px;
            right: -49px;
            border-radius: 5px;
        }

        #dropdown select {
            width: 300px;
            overflow: hidden;
        }

        .guest-dropdown {
            display: none;
            position: absolute;
            border: 1px solid #ddd;
            /*box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);*/
            z-index: 1;
            padding: 10px;
            margin-top: 10px;
            border-radius: 5px;
            background-color: #fff;
            width: 350px;
            top: 45px;
        }

        .guest-control {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 10px;
            color: black;
        }

        .guest-control label {
            flex: 1;
        }

        .guest-control button {
            padding: 5px 10px;
            border: 1px solid #ccc;
            background-color: #fff;
            cursor: pointer;
        }

        .guest-control input[type="number"] {
            width: 50px;
            text-align: center;
            border-radius: 3px;
            padding: 5px;
            border: none;
        }

        input:focus, input:active {
            outline: none; /* Loại bỏ border hoặc outline mặc định */
            border: none; /* Loại bỏ border */
        }
    </style>
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
                <a href="${url}/index" onclick="setActive(this)"><i class="fas fa-bed"></i> Stays</a>
            </div>
            <div class="headerListItem">
                <a href="${url}/Room" onclick="setActive(this)"><i class="fa-solid fa-door-open"></i> Rooms</a>

            </div>
            <div class="headerListItem">
                <a href="${url}/services" onclick="setActive(this)"><i class="fa-solid fa-door-open"></i> Services</a>

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
            <input type="hidden" name="location" value="${location}">
        <form method="get" action="BookingHandle">

            <div class="headerSreach">
                <div class="headerSearchIteam" style="position: relative">
                    <img src="${url}/fontawesome-free-6.5.2-web/svgs/solid/location-dot.svg" width="30" height="20"/>
                    <input type="text" placeholder="Where are you going?" readonly class="headerSearchInput" id="box"
                           value="${location}" onclick="showDropdown()"/>
                    <div id="dropdown" >
                        <select id="select" name="location" onchange="updateInput()" size="4">
                            <option value="HN" >Ha Noi</option>
                            <option value="DN">Da Nang</option>
                            <option value="QN">Quy Nhon</option>
                            <option value="HCM">Ho Chi Minh</option>
                        </select>
                    </div>
                </div>

                <div class="headerSearchIteam">
                    <img src="${url}/fontawesome-free-6.5.2-web/svgs/solid/calendar-day.svg" width="30" height="20"/>
                    <%--                <span id="datePicker">date to date?</span>--%>
                    <input type="text" id="datePicker" class="headerSearchIteam" name="date" value="${date}"
                           placeholder="Select Date Range">
                </div>
                <div class="headerSearchIteam">
                    <img src="${url}/fontawesome-free-6.5.2-web/svgs/solid/user.svg" width="30" height="20"/>
                    <span class="headerSearchText" id="guestText" onclick="toggleGuestDropdown()">2 adults 2 children 1 room</span>
                    <div class="guest-dropdown" id="guestDropdown">
                        <div class="guest-control">
                            <label>Adult</label>
                            <button type="button" onclick="decrement('adults')">-</button>
                            <input type="number" name="adults" id="adults" value="1" readonly oninput="updateGuestText()">
                            <button type="button" onclick="increment('adults')">+</button>
                        </div>
                        <div class="guest-control">
                            <label>Child</label>
                            <button type="button" onclick="decrement('children')">-</button>
                            <input type="number" name="children" id="children" value="0" readonly oninput="updateGuestText()">
                            <button type="button" onclick="increment('children')">+</button>
                        </div>
                    </div>
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


<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script>
    function toggleGuestDropdown() {
        const dropdown = document.getElementById('guestDropdown');
        // dropdown.style.display = dropdown.style.display === 'block' || dropdown.style.display === 'none' ? 'block' : 'none';
        dropdown.style.display = dropdown.style.display === "block"  ? "none" : "block";
    }

    function updateGuestText() {
        const adults = parseInt(document.getElementById('adults').value);
        const children = parseInt(document.getElementById('children').value);

        const guestText = document.getElementById('guestText');
        guestText.textContent = adults.toString() + ' adults'+ children.toString() +'children 1 room' ;
    }


    // function increment(field) {
    //     const input = document.getElementById(field);
    //     input.value = parseInt(input.value) + 1;
    // }
    //
    // function decrement(field) {
    //     const input = document.getElementById(field);
    //     if (parseInt(input.value) > 0) {
    //         input.value = parseInt(input.value) - 1;
    //     }
    // }

    function increment(inputId) {
        var input = document.getElementById(inputId);
        var value = parseInt(input.value, 10);
        input.value = value + 1;
    }

    function decrement(inputId) {
        var input = document.getElementById(inputId);
        var value = parseInt(input.value, 10);
        if (value > 0) {
            input.value = value - 1;
        }
    }

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
            defaultDate: "${date != null ? date : ''}".split(' to '),
            showMonths: 2,
            onChange: function (selectedDates, dateStr,instance) {
                console.log("Selected dates: ", dateStr);
            }
        });
    });

    // function showDropdown() {
    //     var dropdown = document.getElementById("dropdown");
    //     var input = document.getElementById("box");
    //
    //     dropdown.style.width = input.value+'px'; // Match the width of the input field
    //     dropdown.style.display = "block";
    //     // dropdown.style.marginTop = '10px'; // Corrected to camelCase
    //     // dropdown.style.marginLeft = '-29px'; // Corrected to camelCase
    //     // dropdown.style.borderRadius = '4px'; // Corrected to camelCase
    //     // dropdown.style.border = 'none';
    // }
    //
    //
    // function updateInput() {
    //     var select = document.getElementById("select");
    //     var input = document.getElementById("box");
    //
    //     input.value = select.value;
    //     select.style.overflow = 'hidden';
    //     document.getElementById("dropdown").style.display = "none";
    // }
    //
    //
    // // Hide the dropdown if clicked outside of it
    //     document.addEventListener('click', function(event) {
    //     var dropdown = document.getElementById("dropdown");
    //     var input = document.getElementById("box");
    //     if (!dropdown.contains(event.target) && event.target !== input) {
    //     dropdown.style.display = "none";
    // }
    // });

    function showDropdown() {
        var dropdown = document.getElementById("dropdown");
        // dropdown.style.display = "block";
        dropdown.style.display = dropdown.style.display === "block" ? "none" : "block";
    }

    function updateInput() {
        var select = document.getElementById("select");
        var input = document.getElementById("box");
        input.value = select.value;
        document.getElementById("dropdown").style.display = "none";
    }

    // Hide the dropdown if clicked outside of it
    document.addEventListener('click', function (event) {
        var dropdown = document.getElementById("dropdown");
        var input = document.getElementById("box");
        if (!dropdown.contains(event.target) && event.target !== input) {
            dropdown.style.display = "none";
        }
    });

</script>
</body>

