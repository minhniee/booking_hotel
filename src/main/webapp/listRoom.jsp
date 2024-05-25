<%--
  Created by IntelliJ IDEA.
  User: minhl
  Date: 5/25/2024
  Time: 1:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="url1" value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<html>

    <%@include file="layout/header.jsp"%>
<body>
<h1>${noti}</h1>
</body>
    <%@include file="layout/footer.jsp"%>

</html>
