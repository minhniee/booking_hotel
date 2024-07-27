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
<%--                            <div class="search-element">--%>
<%--                                <input class="form-control" type="search" placeholder="Search" aria-label="Search"--%>
<%--                                       data-width="200">--%>
<%--                                <button class="btn" type="submit">--%>
<%--                                    <i class="fas fa-search"></i>--%>
<%--                                </button>--%>
<%--                            </div>--%>
                        </form>
                    </li>
                </ul>
            </div>
            <ul class="navbar-nav navbar-right">
                <div class="main-sidebar sidebar-style-2">
                    <aside id="sidebar-wrapper">
                        <div class="sidebar-user">
                            <div class="sidebar-user-picture">
                                <img alt="image" src="${url}/Assets/image/staff/Staff.jpg">
                            </div>
                            <div class="sidebar-user-details">
                                <c:set value="${sessionScope.account}" var="account"/>
                                <div class="user-name">${account.userName}</div>
                                <div class="user-role">Staff</div>
                            </div>
                        </div>
                    </aside>
                    <ul class="sidebar-menu">
                        <li><a class="nav-link" href="${url}/dashboardstaff.jsp"><i class="fas fa-tachometer-alt"></i><span>Dashboard</span></a></li>

                        <li class="menu-header">Booking</li>
                        <li><a class="nav-link" href="${url}/listBooking"><i class="fas fa-list"></i><span>List Booking Status</span></a></li>
                        <li><a class="nav-link" href="${url}/HistoryBooking1"><i class="fas fa-history"></i><span>History Booking</span></a></li>
                        <li><a class="nav-link" href="${url}/customerInfo"><i class="fas fa-history"></i><span>Customer</span></a></li>

                        <li class="menu-header">Room</li>
                        <li><a class="nav-link" href="${url}/RoomClasses"><i class="fas fa-layer-group"></i><span>Room Class</span></a></li>
                        <li><a class="nav-link" href="${url}/roomManager"><i class="fas fa-layer-group"></i><span>Manage Room </span></a></li>
                        <li><a class="nav-link" href="${url}/ViewService"><i class="fas fa-concierge-bell"></i><span>Manage Service</span></a></li>
                        <li><a class="nav-link" href="${url}/ViewMaterial"><i class="fas fa-tools"></i><span>Manage Material</span></a></li>

                        <li class="menu-header">Profile</li>
                        <li><a class="nav-link" href="${url}/profileStaff"><i class="fas fa-user"></i><span>Profile</span></a></li>
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
