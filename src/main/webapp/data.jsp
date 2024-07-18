<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Booking Details</title>
</head>
<body>
<h1>Booking Details</h1>
<c:if test="${not empty data}">
    <p><strong>Booking ID:</strong> ${data.id}</p>
    <p><strong>Room ID:</strong> ${data.roomId}</p>
    <p><strong>Check-In Date:</strong> <fmt:formatDate value="${data.checkInDate}" pattern="yyyy-MM-dd" /></p>
    <p><strong>Check-Out Date:</strong> <fmt:formatDate value="${data.checkOutDate}" pattern="yyyy-MM-dd" /></p>
    <p><strong>Number of Adults:</strong> ${data.numAdults}</p>
    <p><strong>Number of Children:</strong> ${data.numChildren}</p>
    <p><strong>Booking Price:</strong> ${data.bookingPrice}</p>
    <p><strong>Payment ID:</strong> ${data.paymentId}</p>
    <p><strong>Account ID:</strong> ${data.accountId}</p>
    <p><strong>Booking Date:</strong> <fmt:formatDate value="${data.bookingDate}" pattern="yyyy-MM-dd" /></p>
    <p><strong>Booking State:</strong> ${data.bookingState}</p>

    <!-- Display Room Images -->
    <h2>Room Images</h2>
    <div class="row">
        <c:forEach var="image" items="${dataimg}">
            <div class="col-sm-4">
                <img src="${url}/${image}" alt="Room Image">
            </div>
        </c:forEach>
    </div>
</c:if>
<c:if test="${empty data}">
    <p>No booking details available.</p>
</c:if>
</body>
</html>
