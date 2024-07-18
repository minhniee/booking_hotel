<%--
  Created by IntelliJ IDEA.
  User: minhl
  Date: 7/1/2024
  Time: 4:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>--%>
<c:set var="url"
       value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
    <title>Check Booking</title>
    <!-- General CSS Files -->
    <link rel="stylesheet" href="${url}/Assets/assets/css/app.min.css">
    <!-- Template CSS -->
    <link rel="stylesheet" href="${url}/Assets/assets/css/style.css">
    <link rel="stylesheet" href="${url}/Assets/assets/css/components.css">
    <!-- Custom style CSS -->
    <link rel="stylesheet" href="${url}/Assets/assets/css/custom.css">
    <link rel='shortcut icon' type='image/x-icon' href='${url}/Assets/assets/img/favicon.ico' />
</head>

<body>
<%--<div class="loader"></div>--%>

<%@include file="dashBoardAdmin.jsp"%>
        <!-- Main Content -->
        <div class="main-content">
            <section class="section">
                <ul class="breadcrumb breadcrumb-style ">
                    <li class="breadcrumb-item">
                        <h4 class="page-title m-b-0">Advance Table</h4>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="index.html">
                            <i class="fas fa-home"></i></a>
                    </li>
                    <li class="breadcrumb-item active">Table</li>
                    <li class="breadcrumb-item active">Advance</li>
                </ul>


                <div class="col-12 col-md-12 col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <h4>Full Width</h4>
                        </div>
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-striped table-md">
                                    <tr>
                                        <th>#</th>
                                        <th>Booking Id</th>
                                        <th>Room Id</th>
                                        <th>Booking Date </th>
                                        <th>Price</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                        <th>Action</th>

                                    </tr>

                                        <c:set value="0" var="i"/>
                                    <c:forEach var="l" items="${requestScope.listBooking}">
                                    <tr>
                                        <td>${i + 1}</td>
                                        <td>${l.id}</td>
                                        <td>${l.roomId}</td>
                                        <td> <fmt:formatDate pattern="dd-MM-yyyy" value="${l.bookingDate}"/></td>
<%--                                        <td>${l.bookingDate}</td>--%>
                                        <td>${l.bookingPrice}</td>
                                        <td>
                                            <div class="badge badge-warning badge-shadow">${l.bookingState}</div>
                                        </td>
<%--                                        <c:choose>--%>
<%--                                            <c:when test="${l.bookingStatus eq true}">--%>
<%--                                                <td><button  class="btn btn-success">Success</button></td>--%>
<%--                                            </c:when>--%>

<%--                                            <c:when test="${l.bookingStatus eq false}">--%>
<%--                                                <td><button  class="btn btn-info">In process</button></td>--%>
<%--                                            </c:when>--%>
<%--                                        </c:choose>--%>
<%--                                            <td>${i + 1}</td>--%>
<%--                                            <td>${l.id}</td>--%>
<%--                                            <td>${l.roomId}</td>--%>
<%--                                            <td><fmt:formatDate pattern="dd-MM-yyyy" value="${l.bookingDate}" /></td>--%>
<%--                                            <td>${l.bookingPrice}</td>--%>
<%--                                            <td>--%>
<%--                                                <div class="badge badge-warning badge-shadow">${l.bookingState}</div>--%>
<%--                                            </td>--%>


                                            <td>
                                        <form action="BookingStatus" method="post">
                                            <input type="hidden" name="bookingid" value="${l.id}">
                                            <input type="hidden" name="accountid" value="${l.accountId}">
                                            <input type="hidden" name="price" value="${l.bookingPrice}">
                                            <input type="hidden" name="bookingdate" value="${l.bookingDate}">
                                            <button type="submit" name="action" value="confirm" class="btn btn-success">Confirm</button>
                                        </form>
                                        <form action="vnpayRefund" method="post">
                                            <input type="hidden" name="order_id" value="${l.id}"> <!-- booking id -->
                                            <input type="hidden" name="amount" value="${l.bookingPrice}"> <!-- amount-->
                                            <input type="hidden" name="trantype" value="02"> <!-- account id -->
                                            <input type="hidden" name="trans_date" value='<fmt:formatDate pattern="yyyyMMddHHmmss" value="${l.bookingDate}"/>' />
                                            <!-- account id -->
                                        <button type="submit" name="action" value="reject" class="btn btn-danger">Reject</button>
                                        </form>
                                        </td>
                                        <td><a href="#" class="btn btn-primary">Detail</a></td>
                                    </tr>
                                        <c:set var="i" value="${i + 1}"/>
                                    </c:forEach>
                                </table>
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
                    </div>
                </div>
            </section>
        </div>
</div>
</body>

</html>
