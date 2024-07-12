<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="url"
       value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>



<nav class="navbar navbar-expand-lg">
    <div class="container">
        <!-- Logo -->
        <div class="logo-wrapper">
            <a class="logo" href="home"> <img src="${url}/Assets1/img/logo.png" class="logo-img" alt="???"> </a>
        </div>
        <!-- Button -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"><i class="ti-menu"></i></span> </button>
        <!-- Menu -->
        <div class="collapse navbar-collapse" id="navbar">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="home">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="${url}/homePage/about.jsp">About</a></li>
                <li class="nav-item"><a class="nav-link" href="Room">Rooms & Suites</a></li>
                <li class="nav-item"><a class="nav-link" href="${url}/homePage/restaurant.jsp">Restaurant</a></li>
                <li class="nav-item"><a class="nav-link" href="${url}/homePage/spa-wellness.jsp">Spa</a></li>

                <li class="nav-item dropdown"> <a class="nav-link dropdown-toggle" href="${url}/homePage/#" role="button" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">Pages <i class="ti-angle-down"></i></a>
                    <ul class="dropdown-menu">
                        <li><a href="${url}/homePage/services.jsp" class="dropdown-item"><span>Services</span></a></li>
                        <li><a href="${url}/homePage/facilities.jsp" class="dropdown-item"><span>Facilities</span></a></li>
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
            </ul>
        </div>
    </div>
</nav>