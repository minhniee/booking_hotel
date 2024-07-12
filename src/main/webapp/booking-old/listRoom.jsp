<%--
  Created by IntelliJ IDEA.
  User: minhl
  Date: 5/25/2024
  Time: 1:39 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="url1"
       value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="en">
 <%@include file="/layout/header-old.jsp"%>


<body>

<div class="container">
<%--    <nav aria-label="breadcrumb">--%>
<%--        <ol class="breadcrumb">--%>
<%--            <li class="breadcrumb-item"><a href="${url1}/index">Home</a></li>--%>
<%--            <li class="breadcrumb-item active" aria-current="page">Select Room</li>--%>
<%--        </ol>--%>
<%--    </nav>--%>
    <div class="row">



        <jsp:useBean id="room" class="DAO.roomDAO"/>
        <c:forEach var="i" items="${room.roomByTypeValid}">
            <div class="col-12 col-md-8 mt-5">
                <div class="card">
                    <img src="${url}/Assets/image/room/${i.roomImg}" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">${i.roomClassName}</h5>
                        <p class="card-text"> ${persons} person</p>
                        <p class="card-text">${i.basePrice * nights} $ </p>

                        <a href="BookingDetail?checkinDate=${checkinDate}&location=${location}&checkoutDate=${checkoutDate}&roomType=${i.roomClassName}&adults=${adults}&children=${children}&persons=${persons}&nights=${nights}&earlyBirdDays=${earlyBirdDays}&total=${i.basePrice * nights}" class="btn btn-primary">Select</a>
                    </div>
                </div>
            </div>
        </c:forEach>
</div>
<%--<div class="fixed-bottom-div">FUTel</div>--%>
</div>
<%@include file="/layout/footer.jsp"%>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

</body>
</html>
