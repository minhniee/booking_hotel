<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="url"
       value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
    <title>List Booking</title>
    <!-- General CSS Files -->
    <link rel="stylesheet" href="${url}/Assets/assets/css/app.min.css">
    <link rel="stylesheet" href="${url}/Assets/assets/bundles/datatables/datatables.min.css">
    <link rel="stylesheet" href="${url}/Assets/assets/bundles/datatables/DataTables-1.10.16/css/dataTables.bootstrap4.min.css">
    <!-- Template CSS -->
    <link rel="stylesheet" href="${url}/Assets/assets/css/style.css">
    <link rel="stylesheet" href="${url}/Assets/assets/css/components.css">
    <!-- Custom style CSS -->
    <link rel="stylesheet" href="${url}/Assets/assets/css/custom.css">
    <link rel='shortcut icon' type='image/x-icon' href='assets/img/favicon.ico' />
    <!-- jQuery UI CSS -->
    <link rel="stylesheet" href="${url}/Assets/assets/bundles/jquery-ui/jquery-ui.min.css">
</head>

<body>
<jsp:include page="dashBoardAdmin.jsp"/>
<!-- Main Content -->
<div class="main-content">
    <section class="section">
        <ul class="breadcrumb breadcrumb-style ">
            <li class="breadcrumb-item">
                <h4 class="page-title m-b-0">Data Tables</h4>
            </li>
            <li class="breadcrumb-item">
                <a href="index.html">
                    <i class="fas fa-home"></i></a>
            </li>
            <li class="breadcrumb-item">Tables</li>
            <li class="breadcrumb-item">Data Tables</li>
        </ul>
        <div class="section-body">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4>Basic DataTables</h4>
                            <!-- Date Picker Input -->
                            <input type="text" id="date-filter" class="form-control" placeholder="Select Date">
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped" id="table-1">
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
                                            <td> <fmt:formatDate pattern="dd-MM-yyyy" value="${l.bookingDate}"/></td>
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
    </section>

</div>
<footer class="main-footer">
    <div class="footer-left">
        Copyright &copy; 2019 <div class="bullet"></div> Design By <a href="#">Redstar</a>
    </div>
    <div class="footer-right">
    </div>
</footer>
</div>
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
<script>
    $(document).ready(function() {
        // Initialize the date picker
        $("#date-filter").datepicker({
            dateFormat: 'dd-mm-yy', // Set the date format to match your table's format
            onSelect: function(dateText) {
                filterTableByDate(dateText);
            }
        });

        function filterTableByDate(date) {
            // Convert the date to a format that matches the table's date format
            var formattedDate = $.datepicker.formatDate('dd-mm-yy', new Date(date));

            $('#table-1 tbody tr').each(function() {
                var rowDate = $(this).find('td').eq(3).text().trim(); // Adjust index based on your table
                if (rowDate === formattedDate || formattedDate === '') {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
        }
    });
</script>
</body>

</html>
