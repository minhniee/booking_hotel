<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="url"
       value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<%--
  Created by IntelliJ IDEA.
  User: minhl
  Date: 7/1/2024
  Time: 9:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <head>
        <meta charset="UTF-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
        <title>List Booking</title>
        <!-- General CSS Files -->
        <link rel="stylesheet" href="${url}/Assets/assets/css/app.min.css">
        <!-- Template CSS -->
        <link rel="stylesheet" href="${url}/Assets/assets/css/style.css">
        <link rel="stylesheet" href="${url}/Assets/assets/css/components.css">
        <!-- Custom style CSS -->
        <link rel="stylesheet" href="${url}/Assets/assets/css/custom.css">
        <link rel='shortcut icon' type='image/x-icon' href='${url}/Assets/assets/img/favicon.ico'/>
    </head>
</head>
<body>


<div class="row">
    <div class="col-2">
        d
<%--        <jsp:include page="dashBoardAdmin.jsp"/>--%>
    </div>
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h4>Basic DataTables</h4>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <div id="table-1_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
                        <div class="row">
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <table class="table table-striped dataTable no-footer" id="table-1" role="grid"
                                       aria-describedby="table-1_info">
                                    <thead>
                                    <tr role="row">
                                        <th class="text-center sorting_asc" tabindex="0" aria-controls="table-1"
                                            rowspan="1" colspan="1" aria-sort="ascending" aria-label="
                  #
                : activate to sort column descending" style="width: 61.6562px;">
                                            #
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="table-1" rowspan="1" colspan="1"
                                            aria-label="Task Name: activate to sort column ascending"
                                            style="width: 256.125px;">Booking ID
                                        </th>
                                        <th class="sorting_disabled" rowspan="1" colspan="1" aria-label="Progress"
                                            style="width: 136.281px;"> Room ID
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="table-1" rowspan="1" colspan="1"
                                            aria-label="Due Date: activate to sort column ascending"
                                            style="width: 162.531px;">Date
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="table-1" rowspan="1" colspan="1"
                                            aria-label="Status: activate to sort column ascending"
                                            style="width: 192.453px;">Total
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="table-1" rowspan="1" colspan="1"
                                            aria-label="Status: activate to sort column ascending"
                                            style="width: 192.453px;">State
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="table-1" rowspan="1" colspan="1"
                                            aria-label="Action: activate to sort column ascending"
                                            style="width: 137.672px;">Action
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:set var="i" value="0"/>
                                    <c:forEach var="l" items="${listBooking}">

                                        <tr role="row" class="odd">
                                            <td class="sorting_1">
                                                    ${i+1}
                                            </td>
                                            <td>${l.id}</td>
                                            <td>${l.roomId}</td>
                                            <td>${l.bookingDate}</td>
                                            <td>${l.bookingPrice}</td>

                                            <c:choose>
                                                <c:when test="${l.bookingState eq 'pending' }">
                                                    <td>
                                                        <div class="badge badge-warning badge-shadow">Pending</div>
                                                    </td>
                                                </c:when>
                                                <c:when test="${l.bookingState eq 'confirmed' }">
                                                    <td>
                                                        <div class="badge badge-success badge-shadow">Confirmed</div>
                                                    </td>
                                                </c:when>
                                                <c:when test="${l.bookingState eq 'cancelled' }">
                                                    <td>
                                                        <div class="badge badge-danger badge-shadow">Cancelled</div>
                                                    </td>
                                                </c:when>
                                            </c:choose>

                                                <%--                                        <c:choose>--%>
                                                <%--                                            <c:when test="${l.bookingState == 'pending'}">--%>
                                                <%--                                                <c:set var="stateClass" value="badge badge-warning badge-shadow" />--%>
                                                <%--                                            </c:when>--%>
                                                <%--                                            <c:when test="${l.bookingState == 'confirmed'}">--%>
                                                <%--                                                <c:set var="stateClass" value="badge badge-warning badge-shadow" />--%>
                                                <%--                                            </c:when>--%>
                                                <%--                                            <c:when test="${l.bookingState == 'cancelled'}">--%>
                                                <%--                                                <c:set var="stateClass" value="badge badge-warning badge-shadow" />--%>
                                                <%--                                            </c:when>--%>
                                                <%--                                        </c:choose>--%>
                                                <%--                                        <td>--%>
                                                <%--                                            <div class="${stateClass}">${l.bookingState}</div>--%>
                                                <%--                                        </td>--%>

                                            <td><a href="#" class="btn btn-primary">Detail</a></td>
                                            <c:set var="i" value="${i+1}"/>

                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<!-- General JS Scripts -->
<script src="${url}/Assets/assets/js/app.min.js"></script>
<!-- JS Libraies -->
<script src="${url}/Assets/assets/bundles/datatables/datatables.min.js"></script>
<script src="${url}/Assets/assets/bundles/datatables/DataTables-1.10.16/js/dataTables.bootstrap4.min.js"></script>
<script src="${url}/Assets/assets/bundles/jquery-ui/jquery-ui.min.js"></script>
<!-- Page Specific JS File -->
<script src="${url}/Assets/assets/js/page/datatables.js"></script>
<!-- Template JS File -->
<script src="${url}/Assets/assets/js/scripts.js"></script>
<!-- Custom JS File -->
<script src="${url}/Assets/assets/js/custom.js"></script>
</body>
</html>
