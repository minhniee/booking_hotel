<%--
  Created by IntelliJ IDEA.
  User: minhl
  Date: 7/17/2024
  Time: 8:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
  <title>Booking History</title>
</head>
<body>
<table>
  <thead>
  <tr>
    <th>ID</th>
    <th>Room</th>
    <th>Check-in Date</th>
    <th>Check-out Date</th>
    <th>State</th>
    <th>Detail</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="b" items="${requestScope.data}">
    <tr>
      <td>${b.id}</td>
      <td>${b.roomId}</td>
      <td><fmt:formatDate value="${b.checkInDate}" pattern="yyyy-MM-dd" /></td>
      <td><fmt:formatDate value="${b.checkOutDate}" pattern="yyyy-MM-dd" /></td>
      <td>${b.bookingState}</td>
      <td>
        <form action="${pageContext.request.contextPath}/bookingDetail" method="post">
          <input type="hidden" name="bookingID" value="${b.id}">
          <button type="submit" class="btn btn-primary">Detail</button>
        </form>
      </td>
    </tr>
  </c:forEach>
  </tbody>
</table>
</body>
</html>
