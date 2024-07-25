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
    <style>
        /* Modal container */
        .modal {
            display: none; /* Hide modal by default */
            position: fixed; /* Fixed position */
            z-index: 1; /* Ensure it's on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Add scroll if needed */
            background-color: rgba(0, 0, 0, 0.4); /* Black background with opacity */
            display: flex; /* Flexbox to center content */
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
        }

        /* Modal content */
        .modal-content {
            background-color: #fefefe;
            padding: 20px;
            border: 1px solid #888;
            width: 80%; /* Modal width */
            max-width: 600px; /* Maximum width */
            text-align: center; /* Center text */
        }

        /* Close button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
        }
    </style>
</head>

<body>
<%--<div class="loader"></div>--%>

<%@include file="dashBoardAdmin.jsp" %>
<!-- Main Content -->
<div class="main-content">
    <section class="section">
        <ul class="breadcrumb breadcrumb-style ">
            <li class="breadcrumb-item">
                <h4 class="page-title m-b-0">List Booking Status</h4>
            </li>
            <li class="breadcrumb-item">
                <a href="chartData">
                    <i class="fas fa-home"></i></a>
            </li>
            <li class="breadcrumb-item active">List Booking Status</li>
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
                                <th>Booking Date</th>
                                <th>Price</th>
                                <th>Status</th>
                                <th>Action</th>
                                <th>Action</th>
                                <th>Action</th>

                            </tr>

                            <c:set value="0" var="i"/>
                            <c:forEach var="l" items="${requestScope.listBooking}">
                                <tr>
                                    <td>${i + 1}</td>
                                    <td>${l.id}</td>
                                    <td>${l.roomId}</td>
                                    <td><fmt:formatDate pattern="dd-MM-yyyy" value="${l.bookingDate}"/></td>
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
                                        <form action="paymentvnpay" method="post">
                                            <input type="hidden" name="bookingid" value="${l.id}">
                                            <input type="hidden" name="accountid" value="${l.accountId}">
                                            <input type="hidden" name="total" value="${l.bookingPrice}">
                                            <input type="hidden" name="bookingdate" value="${l.bookingDate}">
                                            <button type="submit" name="action" value="confirm" class="btn btn-success">
                                                Approve
                                            </button>
                                        </form>
                                    </td>
                                    <td>
                                        <form action="BookingStatus" method="post">
                                            <input type="hidden" name="bookingid" value="${l.id}"> <!-- booking id -->
                                            <input type="hidden" name="acid" value="${l.accountId}">
                                            <input type="hidden" name="total" value="${l.bookingPrice}">
                                            <input type="hidden" name="bookingdate" value="${l.bookingDate}">
                                            <button type="submit" name="action" value="reject" class="btn btn-danger">
                                                Reject
                                            </button>
                                        </form>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-primary"
                                                onclick="showDetails('${l.id}', '${l.roomId}', '${l.bookingDate}', '${l.bookingPrice}','${l.bookingState}', '${l.accountId}', '${l.checkInDate}', '${l.checkOutDate}', '${l.numChildren}', '${l.numAdults}')">
                                            Detail
                                        </button>
                                    </td>
                                </tr>
                                <c:set var="i" value="${i + 1}"/>
                            </c:forEach>
                        </table>
                    </div>
                    <!-- Modal -->

                </div>
                <script>
                    function showDetails(id, roomId, bookingDate, bookingPrice, bookingState, accountId, checkInDate, checkOutDate, numChildren, numAdults) {
                        // Define color based on booking state
                        let stateColor;
                        switch (bookingState.toLowerCase()) {
                            case 'pending':
                                stateColor = 'yellow';
                                break;
                            case 'in process':
                                stateColor = 'blue';
                                break;
                            case 'confirmed':
                                stateColor = 'green';
                                break;
                            case 'cancelled':
                                stateColor = 'red';
                                break;
                            default:
                                stateColor = 'white'; // Default color if state is unknown
                        }

                        // Create the booking details as a table with color coding for the booking state cell
                        const bookingDetails =
                            '<table style="width: 100%; border-collapse: collapse;">' +
                            '<tr>' +
                            '<td style="border: 1px solid #ddd; padding: 8px;">ID</td>' +
                            '<td style="border: 1px solid #ddd; padding: 8px;">' + id + '</td>' +
                            '</tr>' +
                            '<tr>' +
                            '<td style="border: 1px solid #ddd; padding: 8px;">Room ID</td>' +
                            '<td style="border: 1px solid #ddd; padding: 8px;">' + roomId + '</td>' +
                            '</tr>' +
                            '<tr>' +
                            '<td style="border: 1px solid #ddd; padding: 8px;">Booking Date</td>' +
                            '<td style="border: 1px solid #ddd; padding: 8px;">' + bookingDate + '</td>' +
                            '</tr>' +
                            '<tr>' +
                            '<td style="border: 1px solid #ddd; padding: 8px;">Booking Price</td>' +
                            '<td style="border: 1px solid #ddd; padding: 8px;">' + bookingPrice + '</td>' +
                            '</tr>' +
                            '<tr>' +
                            '<td style="border: 1px solid #ddd; padding: 8px;">Account ID</td>' +
                            '<td style="border: 1px solid #ddd; padding: 8px;">' + accountId + '</td>' +
                            '</tr>' +
                            '<tr>' +
                            '<td style="border: 1px solid #ddd; padding: 8px;">Check-In Date</td>' +
                            '<td style="border: 1px solid #ddd; padding: 8px;">' + checkInDate + '</td>' +
                            '</tr>' +
                            '<tr>' +
                            '<td style="border: 1px solid #ddd; padding: 8px;">Check-Out Date</td>' +
                            '<td style="border: 1px solid #ddd; padding: 8px;">' + checkOutDate + '</td>' +
                            '</tr>' +
                            '<tr>' +
                            '<td style="border: 1px solid #ddd; padding: 8px;">Number of Children</td>' +
                            '<td style="border: 1px solid #ddd; padding: 8px;">' + numChildren + '</td>' +
                            '</tr>' +
                            '<tr>' +
                            '<td style="border: 1px solid #ddd; padding: 8px;">Number of Adults</td>' +
                            '<td style="border: 1px solid #ddd; padding: 8px;">' + numAdults + '</td>' +
                            '</tr>' +
                            '<tr>' +
                            '<td style="border: 1px solid #ddd; padding: 8px;">Booking State</td>' +
                            '<td style="border: 1px solid #ddd; padding: 8px; color: ' + stateColor + ';">' + bookingState + '</td>' +
                            '</tr>' +
                            '</table>';

                        // Update the innerHTML of the element with ID 'bookingDetails'
                        document.getElementById('bookingDetails').innerHTML = bookingDetails;

                        // Show the modal with ID 'modal1'
                        document.getElementById('modal1').style.display = 'flex'; // Use 'flex' to center modal content
                    }



                    function closeModal() {
                        document.getElementById('modal1').style.display = 'none';
                    }

                    window.onclick = function (event) {
                        const modal = document.getElementById('modal1');
                        if (event.target == modal) {
                            modal.style.display = 'none';
                        }
                    };
                </script>
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
<div class="container d-flex align-items-center justify-content-center">
    <div id="modal1" class="modal ">
        <div class="modal-content">
            <span class="close" style="all: unset" onclick="closeModal()"></span>
            <h2 style= "text-align: center" >Booking Details</h2>
            <p  style= "text-align: center" id="bookingDetails"></p>
        </div>
    </div>
</div>