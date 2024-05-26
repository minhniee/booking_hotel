<%--
  Created by IntelliJ IDEA.
  User: minhl
  Date: 5/25/2024
  Time: 1:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="url"
       value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<!DOCTYPE HTML>
<html>
<head>
    <title>FuTell</title>
</head>

<body>
<h1>Choose your roomBook with confidence:</br> you are on the hotel website.</h1>

<jsp:useBean id="room" class="DAO.roomDAO"/>
    <div class="container">
        <div class="row">
            <c:forEach var="i" items="${room.roomByType}">
                <div class="col-md-6 col-lg-4 mb-5" data-aos="fade-up">
                    <a href="#" class="room">
                        <figure class="img-wrap">
                            <img src="${url}/assest/room/${i.roomImg}" alt="Free website template"
                                 class="img-fluid mb-3"
                                 style="width: 350px; height:250px">
                        </figure>
                        <div class="p-3 text-center room-info">
                            <h2>${i.roomClassName}</h2>
                            <span class="text-uppercase letter-spacing-1">${i.basePrice} / per night</span>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>



<h1>${noti}</h1>
</body>
<%@include file="layout/footer.jsp" %>

</html>
