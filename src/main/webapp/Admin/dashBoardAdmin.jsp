<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="url"
       value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<!-- General CSS Files -->
<link rel="stylesheet" href="${url}/Assets/assets/css/app.min.css">
<!-- Template CSS -->
<link rel="stylesheet" href="${url}/Assets/assets/css/style.css">
<link rel="stylesheet" href="${url}/Assets/assets/css/components.css">
<!-- Custom style CSS -->
<link rel="stylesheet" href="${url}/Assets/assets/css/custom.css">
<link rel='shortcut icon' type='image/x-icon' href='${url}/Assets/assets/img/favicon.ico'/>
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">


<div id="app">
    <div class="main-wrapper main-wrapper-1">
        <div class="navbar-bg"></div>
        <nav class="navbar navbar-expand-lg main-navbar sticky">
            <div class="form-inline mr-auto">
                <ul class="navbar-nav mr-3">
                    <li>
                        <form class="form-inline mr-auto">
                            <div class="search-element">
                                <input class="form-control" type="search" placeholder="Search" aria-label="Search"
                                       data-width="200">
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
                        <div class="sidebar-user">
                            <div class="sidebar-user-picture">
                                <img alt="image" src="${url}/Assets/assets/img/admin.jpg">
                            </div>
                            <div class="sidebar-user-details">
                                <c:set value="${sessionScope.account}" var="account"/>
                                <div class="user-name">${account.userName}</div>
                                <div class="user-role">Administrator</div>
                            </div>
                        </div>
                    </aside>
                    <ul class="sidebar-menu">
                        <li class="menu-header">Profit</li>
                        <li><a class="nav-link" href=""><i class="fas fa-chart-bar"></i><span>Statistics</span></a></li>
                        <li><a class="nav-link" href="chartData"><i class="fas fa-tachometer-alt"></i><span>Dashboard</span></a></li>

                        <li class="menu-header">Booking</li>
                        <li><a class="nav-link" href="BookingStatus"><i class="fas fa-book"></i><span>Booking Status</span></a></li>
                        <li><a class="nav-link" href="listBooking"><i class="fas fa-list"></i><span>List Booking Status</span></a></li>
                        <li><a class="nav-link" href="HistoryBooking"><i class="fas fa-history"></i><span>History Booking</span></a></li>

                        <li class="menu-header">Room</li>
                        <li><a class="nav-link" href="listRoomManager"><i class="fas fa-door-open"></i><span>Manage Room</span></a></li>
                        <li><a class="nav-link" href="listRoomManager"><i class="fas fa-cogs"></i><span>Settings Rooms</span></a></li>
                        <li><a class="nav-link" href="ManageRoomClass"><i class="fas fa-layer-group"></i><span>Manage Room Class</span></a></li>
                        <li><a class="nav-link" href="ManageService"><i class="fas fa-concierge-bell"></i><span>Manage Service</span></a></li>

                        <li class="menu-header">Materials</li>
                        <li><a class="nav-link" href="ManageMaterial"><i class="fas fa-tools"></i><span>Manage Material</span></a></li>
                        <li><a class="nav-link" href="listAccount"><i class="fas fa-user-cog"></i><span>Accounts</span></a></li>
                        <li><a class="nav-link" href="${url}/profileAdmin.jsp"><i class="fas fa-user"></i><span>Profile</span></a></li>
                        <li><a class="nav-link" href="logout"><i class="fas fa-sign-out-alt"></i><span>Logout</span></a></li>
                    </ul>
                    </aside>
                </div>
            </ul>
        </nav>
    </div>
</div>

<!-- General JS Scripts -->
<script src="${url}/Assets/assets/js/app.min.js"></script>
<!-- JS Libraies -->
<script src="${url}/Assets/assets/bundles/jquery-ui/jquery-ui.min.js"></script>
<!-- Page Specific JS File -->
<script src="${url}/Assets/assets/js/page/advance-table.js"></script>
<!-- Template JS File -->
<script src="${url}/Assets/assets/js/scripts.js"></script>
<!-- Custom JS File -->
<script src="${url}/Assets/assets/js/custom.js"></script>
