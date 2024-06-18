<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<%@ include file="../layout/header.jsp"%>
<body>
<section class="pt-5 section">
    <div class="container">
        <div>
            <h2>Campus of us hotel</h2>
        </div>
        <div class="row g-3"> <!-- Added g-3 for spacing between columns and rows -->
            <div class="col-md-3">
            <a href="${url}/homePage/test.html" >
                <img src="${url}/Assets/image/address/hanoi.jpg" class="rounded" height="280px" width="300px" alt="">
                <h3 class="title-campus">Ha Noi</h3>
            </a>
            </div>
            <div class="col-md-3">
                <img src="${url}/Assets/image/address/dangnang1.jpg" class="rounded" height="280px" width="300px" alt="">
                <h3 class="title-campus">Da Nang</h3>
            </div>
            <div class="col-md-3">
                <img src="${url}/Assets/image/address/quynhon.jpeg" class="rounded" height="280px" width="300px" alt="">
                <h3 class="title-campus">Quy Nhon</h3>
            </div>
            <div class="col-md-3 campus ">
                <img src="${url}/Assets/image/address/hcm.jpg" class="rounded  " height="280px" width="300px" alt="">
                <h3 >Ho Chi Minh</h3>
            </div>



        </div>
    </div>
</section>

<section class="pt-5 section">
    <div class="container">
        <div class="row">
            <div class="col-md-7">
                <h2 class="heading" data-aos="fade-up">Rooms &amp; Suites</h2>
            </div>
        </div>
        <div class="row">
            <c:forEach var="i" items="${listRoom}">
                <div class="col-md-6 col-lg-4 mb-5" data-aos="fade-up">
                    <a style="text-decoration: none" href="roomDetails?room_class_id=${i.roomClassId}" class="room">
                        <figure class="img-wrap">
                            <img src="${url}/Assets/image/room/${i.roomImg}" alt="Room Image"
                                 class="img-fluid mb-3 rounded"
                                 style="width: 450px; height: 250px;">
                        </figure>
                        <div class="p-3 text-center room-info">
                            <h2>${i.roomClassName}</h2>
                            <span style="text-decoration: none" class="text-uppercase letter-spacing-1">${i.basePrice} / per night</span>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
</section>

<section class="pt-5 section">
    <div class="container">
        <div>
            <h2>Dia diem vui <choi></choi></h2>
        </div>
        <div class="row g-3">
            <div class="col-md-3">
                <img src="${url}/Assets/image/address/address-play/mall.jpg" class="rounded" height="280px" width="300px" alt="">
                <h3>Vincom</h3>
            </div>
            <div class="col-md-3">
                <img src="${url}/Assets/image/address/address-play/van-mieu-quoc-tu-giam-1.jpg" class="rounded" height="280px" width="300px" alt="">
                <h3>Du lich sinh thai</h3>
            </div>
            <div class="col-md-3">
                <img src="${url}/Assets/image/address/address-play/play.jpg" class="rounded" height="280px" width="300px" alt="">
                <h3>Bong da</h3>
            </div>
            <div class="col-md-3">
                <img src="${url}/Assets/image/address/address-play/coffe.jpg" class="rounded" height="280px" width="300px" alt="">
                <h3>Cafe</h3>
            </div>
        </div>
    </div>
</section>
<%@include file="/layout/footer.jsp"%>
</body>
</html>
