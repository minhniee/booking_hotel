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
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
            integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
            crossorigin="anonymous"></script>
    <style>
        h1 {
            color: azure;
            height: 150px;
            text-align: center;
            font-family: Arial, Helvetica, sans-serif;
        }

        .fixed-bottom-div {
            position: fixed;
            bottom: 0;
            width: 100%;
            background-color: #f8f9fa;
            padding-top: 10px;
            color: grey;
            text-align: center;
            background-color: black;
            font-size: large;
            height: 40px;
        }

        .select-room {
            border: 1px solid gray;
        }
    </style>

</head>


<body>
<div class="container-fruid p-5  h-100 bg-dark text-white">
    <h1>FuTel</br><span style="font-size: 16px;">i hotel infomation</span></h1>
</div>

<div class="container">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="${url}/index.jsp">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">Select Room</li>
        </ol>
    </nav>
    <div class="row">


        <jsp:useBean id="room" class="DAO.roomDAO"/>
        <c:forEach var="i" items="${room.roomByTypeValid}">
            <div class="col-12 col-md-8 mt-5">
                <div class="card">
                    <img src="${url}/assest/room/${i.roomImg}" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">${i.roomClassName}</h5>
                        <p class="card-text"> ${persons} person</p>
                        <p class="card-text">${i.basePrice * nights} $ </p>
                        <a href="BookingDetailServlet?checkinDate=${checkinDate}&checkoutDate=${checkoutDate}&roomType=${i.roomClassName}&persons=${persons}&nights=${nights}&earlyBirdDays=${earlyBirdDays}&total=${i.basePrice * nights}" class="btn btn-primary">Select</a>
                    </div>
                </div>
            </div>
        </c:forEach>


</div>
<div class="fixed-bottom-div">FUTel</div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

</body>
</html>
