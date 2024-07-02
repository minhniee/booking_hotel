<%--
  Created by IntelliJ IDEA.
  User: minhl
  Date: 7/1/2024
  Time: 6:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<table >
    <tr>
        <th>#</th>
        <th>Booking Id</th>
        <th>Room Id</th>
        <th>Date </th>
        <th>Price</th>
        <th>Status</th>
        <th>Action</th>
        <th>Action</th>

    </tr>

    <c:forEach var="l" items="${listBooking}">
        <tr>
            <td>1</td>
            <td>${l.id}</td>
            <td>${l.roomId}</td>
            <td>${l.bookingDate}</td>
            <td>${l.bookingPrice}</td>
            <td>${l.bookingStatus}</td>



                <td>
                    <input type="hidden" name="bookingId" value="${l.id}">
                    <button type="submit" name="action" value="confirm" class="btn btn-success">Confirm</button>
                    <button type="submit" name="action" value="reject" class="btn btn-danger">Reject</button>
                </td>
            <td><a href="#" class="btn btn-primary">Detail</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
