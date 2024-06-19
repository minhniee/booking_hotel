<%@ page import="model.RoomClass" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Bootstrap CSS -->
    <!-- Lightbox2 CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/css/lightbox.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
    <%@include file="layout/header.jsp" %>

    <style>
        .site-hero {
            height: 60vh;
            background-size: cover;
            background-position: center;
            position: relative;
            background-image: url('images/hero_4.jpg');
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            color: white;
        }

        .site-hero .mouse-icon {
            position: absolute;
            bottom: 20px;
            width: 25px;
            height: 50px;
            border: 2px solid #fff;
            border-radius: 25px;
            text-align: center;
        }

        .site-hero .mouse-icon .mouse-wheel {
            display: block;
            width: 5px;
            height: 5px;
            background: #fff;
            border-radius: 50%;
            margin: 10px auto 0;
            animation: moveWheel 1s infinite;
        }

        @keyframes moveWheel {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(5px); }
        }

        .room-details {
            background-color: #f8f9fa;
            padding: 30px;
            border-radius: 10px;
            margin-top: -60px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .room-details h2 {
            font-size: 2em;
            margin-bottom: 20px;
        }

        .room-info p {
            font-size: 1.2em;
            margin-bottom: 20px;
        }

        .room-images img {
            width: 150px;
            margin: 10px;
            border-radius: 5px;
        }

        .materials-table img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 5px;
        }

        .materials-table td {
            vertical-align: middle;
        }
    </style>
</head>
<body>
<%
    RoomClass roomClass = (RoomClass) request.getAttribute("roomClass");
%>
<%--<section class="site-hero overlay">--%>
<%--    <div class="container">--%>
<%--        <div class="row">--%>
<%--            <div class="col-md-10 mx-auto">--%>
<%--                <span class="custom-caption text-uppercase text-white d-block mb-3">Welcome To 5 <span class="fa fa-star text-primary"></span> Hotel</span>--%>
<%--                <h1 class="heading text-white">A Best Place To Stay</h1>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <a class="mouse smoothscroll" href="#next">--%>
<%--        <div class="mouse-icon">--%>
<%--            <span class="mouse-wheel"></span>--%>
<%--        </div>--%>
<%--    </a>--%>
<%--</section>--%>

<section id="next" class="section pt-5 mt-5">
    <div class="container">
        <div class="row">
            <div class="col-md-12" data-aos="fade-up">
                <div class="room-details">
                    <h2>${roomClass.className}</h2>
                    <figure class="img-wrap">
                        <a href="${url}/Assets/image/room/${roomClass.mainImage}" data-lightbox="room-images" data-title="Main Room Image">
                            <img src="${url}/Assets/image/room/${roomClass.mainImage}" alt="Room Image" class="img-fluid mb-3">
                        </a>
                    </figure>
                    <div class="room-info">
                        <p>Price: ${roomClass.basePrice} / per night</p>
                    </div>

                    <div>
                        <h2>Tiện ích: Phòng có view toàn cảnh tuyệt đẹp, mang lại trải nghiệm đẳng cấp. Giải trí: Phòng khách sang trọng với TV thông minh tích hợp Netflix, YouTube, FPT Play. Khu bếp: Đầy đủ dụng cụ hiện đại, giúp bạn dễ dàng chế biến món ăn. Phòng tắm: Được trang bị các thiết bị tiện nghi và sang trọng bậc nhất. Tiện nghi khác: Bể bơi 4 mùa, nhà hàng Á - Âu, trung tâm thương mại, cửa hàng tiện lợi, và quán cafe xinh đẹp.</h2>
                    </div>

                    <div class="room-images">
                        <h3>Room Images</h3>
                        <c:forEach var="imageUrl" items="${roomClass.imageUrls}">
                            <a href="${url}/Assets/demoRoom/${imageUrl}" data-lightbox="room-images" data-title="Room Image">
                                <img src="${url}/Assets/image/demoRoom/${imageUrl}" alt="Room Image" class="img-fluid mb-3">
                            </a>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="section py-5">
    <div class="container">
        <div class="row">
            <div class="col-md-12" data-aos="fade-up">
                <h3>Materials</h3>
                <table class="table table-bordered materials-table">
                    <thead>
                    <tr>
                        <th>Image</th>
                        <th>Name</th>
                        <th>Quantity</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="material" items="${materials}">
                        <tr>
                            <td>
                                <a href="${url}/Assets/image/material/${material.image}" data-lightbox="materials" data-title="${material.name}">
                                    <img src="${url}/Assets/image/material/${material.image}" alt="${material.name}">
                                </a>
                            </td>
                            <td>${material.name}</td>
                            <td>${material.quantity}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>

<%@include file="layout/footer.jsp"%>
</body>
</html>
