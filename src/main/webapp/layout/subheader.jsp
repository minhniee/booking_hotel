<%--
  Created by IntelliJ IDEA.
  User: minhl
  Date: 6/16/2024
  Time: 9:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="url" value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" />

<link rel="stylesheet" href="${url}/Assets/css/header.css">
<div class="navbar">
    <div class="navContainer">
        <span class="logo">Futel</span>
    </div>
</div>

