<%@ page import="model.RoomClass" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="layout/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Lightbox2 CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/css/lightbox.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">

    <style>
        body {
            font-family: 'Arial', sans-serif;
            line-height: 1.6;
            color: #333;
            background-color: #f4f4f4;
        }

        /* Header Styles */
        .site-hero {
            position: relative;
            background-size: cover;
            background-position: center;
            height: 100vh;
        }

        .site-hero-inner {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
        }

        .custom-caption {
            font-size: 1.5rem;
            margin-bottom: 2rem;
        }

        .heading {
            font-size: 2.5rem;
            color: #fff;
        }

        /* Mouse Scroll Icon */
        .mouse-icon {
            position: absolute;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            display: block;
            width: 30px;
            height: 50px;
            border: 2px solid #fff;
        }

        .mouse-wheel {
            width: 3px;
            height: 10px;
            background-color: #fff;
            margin-left: 13px;
            animation: scroll 1s infinite;
        }

        @keyframes scroll {
            0%, 100% {
                margin-top: 10px;
            }
            50% {
                margin-top: 15px;
            }
        }

        /* Room Details */
        .room-details h2 {
            font-size: 2rem;
            color: #444;
        }

        .img-wrap {
            margin: 20px 0;
        }

        .room-info {
            font-size: 1.2rem;
            color: #666;
        }

        /* Room Images Gallery using Lightbox */
        .room-images img {
            width: 100%;
            padding: 5px;
            border-radius: 5px;
            transition: transform 0.3s ease-in-out;
        }

        .room-images img:hover {
            transform: scale(1.05);
        }

        /* Materials Section */
        .materials ul {
            list-style-type: none;
            padding: 0;
        }

        .materials li {
            display: inline-block;
            margin: 10px;
            vertical-align: top;
        }

        .materials img {
            width: 100px;
            height: 100px;
            border-radius: 5px;
        }

        .materials span {
            display: block;
            text-align: center;
        }

        /* Responsive Design */
        @media only screen and (max-width: 768px) {
            .heading {
                font-size: 1.5rem;
            }

            .custom-caption {
                font-size: 1rem;
            }

            .materials img {
                width: 75px;
                height: 75px;
            }
        }
    </style>
</head>
<body>
<%
    RoomClass roomClass = (RoomClass) request.getAttribute("roomClass");
%>
<section class="site-hero overlay" style="background-image: url(images/hero_4.jpg)" data-stellar-background-ratio="0.5">
    <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
            <div class="col-md-10 text-center" data-aos="fade-up">
                <span class="custom-caption text-uppercase text-white d-block  mb-3">Welcome To 5 <span class="fa fa-star text-primary"></span> Hotel</span>
                <h1 class="heading">A Best Place To Stay</h1>
            </div>
        </div>
    </div>
    <a class="mouse smoothscroll" href="#next">
        <div class="mouse-icon">
            <span class="mouse-wheel"></span>
        </div>
    </a>
</section>

<section class="section">
    <div class="container">
        <div class="row">
            <div class="col-md-12" data-aos="fade-up">
                <div class="room-details">
                    <h2>${roomClass.className}</h2>
                    <figure class="img-wrap">
                        <a href="assest/room/${roomClass.mainImage}" data-lightbox="room-images" data-title="Main Room Image">
                            <img src="assest/room/${roomClass.mainImage}" alt="Room Image" class="img-fluid mb-3">
                        </a>
                    </figure>
                    <div class="room-info">
                        <p>Price: ${roomClass.basePrice} / per night</p>
                        <!-- Add other details as necessary -->
                    </div>
                    <div class="room-images">
                        <h3>Room Images</h3>
                        <c:forEach var="imageUrl" items="${roomClass.imageUrls}">
                            <a href="assest/demoRoom/${imageUrl}" data-lightbox="room-images" data-title="Room Image">
                                <img src="assest/demoRoom/${imageUrl}" alt="Room Image" class="img-fluid mb-3">
                            </a>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="row">
            <!-- Hiển thị thông tin phòng -->
            <div class="col-md-12" data-aos="fade-up">
                <h3>Materials</h3>
                <ul>
                    <c:forEach var="material" items="${materials}">
                        <li>
                            <a href="assest/material/${material.image}" data-lightbox="materials" data-title="${material.name}">
                                <img src="assest/material/${material.image}" alt="${material.name}">
                            </a>
                            <span>${material.name}</span>
                            <span>Quantity: ${material.quantity}</span>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</section>
<!-- Footer -->
<%@include file="layout/footer.jsp"%>

<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/jquery-migrate-3.0.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.stellar.min.js"></script>
<script src="js/jquery.fancybox.min.js"></script>


<script src="js/aos.js"></script>

<script src="js/bootstrap-datepicker.js"></script>
<script src="js/jquery.timepicker.min.js"></script>

<script src="js/main.js"></script>
<!-- Lightbox2 JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/js/lightbox.min.js"></script>
</body>
</html>
