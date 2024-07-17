<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="url"
       value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>

<div id="app">
    <div class="main-wrapper main-wrapper-1">
        <div class="navbar-bg"></div>
        <nav class="navbar navbar-expand-lg main-navbar sticky">
            <div class="form-inline mr-auto">
                <ul class="navbar-nav mr-3">
<%--                    <li><a href="#" data-toggle="sidebar" class="nav-link nav-link-lg--%>
<%--									collapse-btn"> <i data-feather="align-justify"></i></a></li>--%>
<%--                    <li><a href="#" class="nav-link nav-link-lg fullscreen-btn">--%>
<%--                        <i data-feather="maximize"></i>--%>
<%--                    </a></li>--%>
                    <li>
                        <form class="form-inline mr-auto">
                            <div class="search-element">
                                <input class="form-control" type="search" placeholder="Search" aria-label="Search" data-width="200">
                                <button class="btn" type="submit">
                                    <i class="fas fa-search"></i>
                                </button>
                            </div>
                        </form>
                    </li>
                </ul>
            </div>
            <ul class="navbar-nav navbar-right">




                <div class="main-sidebar sidebar-style-2">
                    <aside id="sidebar-wrapper">
                        <div class="sidebar-brand">
                            <a href="index.html"> <img alt="image" src="${url}/Assets/assets/img/logo.png" class="header-logo" />
                                <span class="logo-name">Zivi</span>
                            </a>
                        </div>
                        <div class="sidebar-user">
                            <div class="sidebar-user-picture">
                                <img alt="image" src="${url}/Assets/assets/img/user.png">
                            </div>
                            <div class="sidebar-user-details">
                                <div class="user-name">Sarah Smith</div>
                                <div class="user-role">Administrator</div>
                            </div>
                        </div>

                        <ul class="sidebar-menu">

                            <li class="menu-header">Profit</li>
                            <li><a class="nav-link" href=""><i data-feather="file"></i><span>Profile</span></a></li>
                            <li><a class="nav-link" href=""><i data-feather="file"></i><span>Statistics</span></a></li>
                            <li><a class="nav-link" href=""><i data-feather="file"></i><span>Careers</span></a></li>
                            <li><a class="nav-link" href=""><i data-feather="file"></i><span>Dashboard</span></a></li>

                            <li class="menu-header">Booking</li>
                            <li><a class="nav-link" href="BookingStatus"><i data-feather="file"></i><span>Booking Status</span></a></li>
                            <li><a class="nav-link" href="listBooking"><i data-feather="file"></i><span>List Booking Status</span></a></li>
                            <li><a class="nav-link" href="HistoryBooking"><i data-feather="file"></i><span>History booking</span></a></li>

                            <li class="menu-header">Room</li>
                            <li><a class="nav-link" href="listRoomManager"><i data-feather="file"></i><span>Manage room</span></a></li>
                            <li><a class="nav-link" href="listRoomManager"><i data-feather="file"></i><span>Settings Rooms</span></a></li>
                            <li><a class="nav-link" href="ManageRoomClass"><i data-feather="file"></i><span>Manage room class</span></a></li>
                            <li><a class="nav-link" href="ManageService"><i data-feather="file"></i><span>Manage service</span></a></li>

                            <li class="menu-header">Room</li>
                            <li><a class="nav-link" href="ManageMaterial"><i data-feather="file"></i><span>Manage material </span></a></li>
                            <li><a class="nav-link" href="listAccount"><i data-feather="file"></i><span>Accounts</span></a></li>
                            <li><a class="nav-link" href="logout"><i data-feather="file"></i><span>Logout</span></a></li>

                            <%--                    <li class="dropdown">--%>
                            <%--                        <a href="#" class="menu-toggle nav-link has-dropdown"><i data-feather="anchor"></i><span>Other--%>
                            <%--                  Pages</span></a>--%>
                            <%--                        <ul class="dropdown-menu">--%>
                            <%--                            <li><a class="nav-link" href="create-post.html">Create Post</a></li>--%>
                            <%--                            <li><a class="nav-link" href="posts.html">Posts</a></li>--%>
                            <%--                            <li><a class="nav-link" href="profile.html">Profile</a></li>--%>
                            <%--                            <li><a class="nav-link" href="contact.html">Contact</a></li>--%>
                            <%--                            <li><a class="nav-link" href="invoice.html">Invoice</a></li>--%>
                            <%--                        </ul>--%>
                            <%--                    </li>--%>
                            <%--                    <li class="dropdown">--%>
                            <%--                        <a href="#" class="menu-toggle nav-link has-dropdown"><i--%>
                            <%--                                data-feather="chevrons-down"></i><span>Multilevel</span></a>--%>
                            <%--                        <ul class="dropdown-menu">--%>
                            <%--                            <li><a href="#">Menu 1</a></li>--%>
                            <%--                            <li class="dropdown">--%>
                            <%--                                <a href="#" class="has-dropdown">Menu 2</a>--%>
                            <%--                                <ul class="dropdown-menu">--%>
                            <%--                                    <li><a href="#">Child Menu 1</a></li>--%>
                            <%--                                    <li class="dropdown">--%>
                            <%--                                        <a href="#" class="has-dropdown">Child Menu 2</a>--%>
                            <%--                                        <ul class="dropdown-menu">--%>
                            <%--                                            <li><a href="#">Child Menu 1</a></li>--%>
                            <%--                                            <li><a href="#">Child Menu 2</a></li>--%>
                            <%--                                        </ul>--%>
                            <%--                                    </li>--%>
                            <%--                                    <li><a href="#"> Child Menu 3</a></li>--%>
                            <%--                                </ul>--%>
                            <%--                            </li>--%>
                            <%--                        </ul>--%>
                            <%--                    </li>--%>
                            <%--                </ul>--%>
                        </ul>
                    </aside>
                </div>
            </ul>
        </nav>
    </div>
</div>