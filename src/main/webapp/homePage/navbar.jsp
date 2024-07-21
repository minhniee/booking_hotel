<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="url"
       value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>


<nav class="navbar navbar-expand-lg">
    <div class="container">
        <!-- Logo -->
<%--        <div class="logo-wrapper">--%>
<%--            <a class="logo" href="${url}/home"> <img src="../Assets1/img/logo.png" class="logo-img" alt="???"> </a>--%>
<%--        </div>--%>
        <!-- Button -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbar"
                aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation"><span
                class="navbar-toggler-icon"><i class="ti-menu"></i></span></button>
        <!-- Menu -->
        <div class="collapse navbar-collapse" id="navbar">
            <ul class="navbar-nav ms-auto" style="margin-left: 140px !important;">
                <li class="nav-item"><a class="nav-link" href="${url}/home">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="${url}/homePage/about.jsp">About</a></li>
                <li class="nav-item"><a class="nav-link" href="Room">Rooms & Suites</a></li>
                <li class="nav-item"><a class="nav-link" href="${url}/homePage/restaurant.jsp">Restaurant</a></li>
                <li class="nav-item"><a class="nav-link" href="${url}/homePage/spa-wellness.jsp">Spa</a></li>

                <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="${url}/homePage/#" role="button"
                                                 data-bs-toggle="dropdown" data-bs-auto-close="outside"
                                                 aria-expanded="false">Pages <i class="ti-angle-down"></i></a>
                    <ul class="dropdown-menu">
                        <li><a href="${url}/homePage/services.jsp" class="dropdown-item"><span>Services1</span></a></li>
                        <li><a href="${url}/services" class="dropdown-item"><span>Services2</span></a></li>
                        <li><a href="${url}/cart" class="dropdown-item"><span>Cart</span></a></li>
                        <li><a href="${url}/homePage/facilities.jsp" class="dropdown-item"><span>Facilities</span></a>
                        </li>
                        <li><a href="${url}/homePage/gallery.jsp" class="dropdown-item"><span>Gallery</span></a></li>
                        <%--                        <li><a href="${url}}/homePage/team.jsp" class="dropdown-item"><span>Team</span></a></li>--%>
                        <li><a href="${url}/homePage/pricing.jsp" class="dropdown-item"><span>Pricing</span></a></li>
                        <%--                        <li><a href="${url}}/homePage/careers.jsp" class="dropdown-item"><span>Careers</span></a></li>--%>
                        <%--                        <li><a href="${url}}/homePage/faq.jsp" class="dropdown-item"><span>F.A.Qs</span></a></li>--%>
                        <%--                        <li class="dropdown-submenu dropdown"> <a class="dropdown-item dropdown-toggle" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false" href="${url}}/homePage/#"><span>Other Pages <i class="ti-angle-right"></i></span></a>--%>
                        <%--                            <ul class="dropdown-menu">--%>
                        <%--                                <li><a href="${url}}/homePage/404.jsp" class="dropdown-item"><span>404 Page</span></a></li>--%>
                        <%--                            </ul>--%>
                        <%--                        </li>--%>
                    </ul>
                </li>
                <%--                <li class="nav-item dropdown"> <a class="nav-link dropdown-toggle" href="${url}}/homePage/#" role="button" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">News <i class="ti-angle-down"></i></a>--%>
                <%--                    <ul class="dropdown-menu">--%>
                <%--                        <li><a href="${url}}/homePage/news.jsp" class="dropdown-item"><span>News 1</span></a></li>--%>
                <%--                    </ul>--%>
                <%--                </li>--%>
                <li class="nav-item"><a class="nav-link" href="${url}/homePage/news.jsp">New</a></li>

                <li class="nav-item"><a class="nav-link" href="${url}/homePage/contact.jsp">Contact</a></li>
                <c:if test="${ empty sessionScope.account }">
                    <li class="nav-item"><a class="nav-link" href="${url}/login.jsp">Login</a></li>
                    <%--                <li class="nav-item"><a class="nav-link" href="${url}/register.jsp">Re</a></li>--%>
                </c:if>

                <c:if test="${ not empty sessionScope.account }">
                    <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="${url}/homePage/#"
                                                     role="button" data-bs-toggle="dropdown"
                                                     data-bs-auto-close="outside"
                                                     aria-expanded="false">Hello, ${account.fullName} <i
                            class="ti-angle-down"></i></a>
                        <ul class="dropdown-menu">
                                <%--                            <li><a href="${url}/user/user_profile.jsp" class="dropdown-item"><img src="${url}/Assets1/img/icon/user.ico" style="width:30px;height:30px;" alt=""><span>Profile</span></a></li>--%>
                                <%--                            <li><a href="logout" class="dropdown-item"><img src="${url}/Assets1/img/icon/signout.ico" style="width:30px;height:30px;" alt=""><span>Logout</span></a></li>--%>
                                <%--                            <li><a href="${url}/homePage/facilities.jsp" class="dropdown-item"><span>Facilities</span></a></li>--%>
                                <%--                            <li><a href="${url}/homePage/facilities.jsp" class="dropdown-item"><span>Facilities</span></a></li>--%>
                            <li>
                                <a href="${url}/user/user_profile.jsp" class="dropdown-item">
                                    <span><img src="${url}/Assets1/img/icon/user.ico" style="width:15px;height:15px;"
                                               alt="">Profile</span>
                                </a>
                                <a href="bookingHistory" class="dropdown-item">
                                    <span><img src="${url}/Assets1/img/icon/user.ico" style="width:15px;height:15px;"
                                               alt="">Booking history</span>
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/logout" class="dropdown-item">
                                    <span><img src="${url}/Assets1/img/icon/signout.ico" style="width:15px;height:15px;"
                                               alt="">Logout</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>