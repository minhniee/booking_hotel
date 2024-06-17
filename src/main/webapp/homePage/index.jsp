<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE HTML>
<html>


<%@include file="../layout/header.jsp" %>
<link rel="stylesheet" href="${url}/css/footer.css">

<section class="pt-5 section">
    <div class="container">
        <div>
            <h2>Campus of us hotel</h2>
        </div>
        <div class="row g-3"> <!-- Added g-3 for spacing between columns and rows -->
            <div class="col-md-3  ">
                <img src="${url}/assest/address/hanoi.jpg" class="rounded "  height="280px" width="300px" alt="">
                <h3>Ha Noi</h3>
            </div>
            <div class="col-md-3 ">
                <img src="${url}/assest/address/dangnang1.jpg" class="rounded"    height="280px" width="300px" alt="">
                <h3>Da Nang</h3>
            </div>
            <div class="col-md-3 ">
                <img src="${url}/assest/address/quynhon.jpeg" class="rounded" height="280px" width="300px" alt="">
                <h3>Quy Nhon</h3>
            </div>
            <div class="col-md-3 ">
                <img src="${url}/assest/address/hcm.jpg" class="rounded"  height="280px" width="300px" alt="">
                <h3>Ho Chi Minh</h3>
            </div>
        </div>
    </div>
</section>


<section class="pt-5 section">
    <div class="container">
        <div class="row ">
            <div class="col-md-7">
                <h2 class="heading" data-aos="fade-up">Rooms &amp; Suites</h2>
<%--                <p data-aos="fade-up" data-aos-delay="100">Far far away, behind the word mountains, far from the--%>
<%--                    countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove--%>
<%--                    right at the coast of the Semantics, a large language ocean.</p>--%>
            </div>
        </div>
        <div class="row">
            <c:forEach var="i" items="${listRoom}">
                <div class="col-md-6 col-lg-4 mb-5" data-aos="fade-up">
                    <a style="text-decoration: none" href="roomDetails?room_class_id=${i.roomClassId}" class="room">
                        <figure class="img-wrap">
                            <img  src="${url}/assest/room/${i.roomImg}" alt="Free website template"
                                 class="img-fluid mb-3 rounded"
                                 style="width: 450px; height:250px">
                        </figure>
                        <div class="p-3 text-center room-info">
                            <h2 > ${i.roomClassName} </h2>
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
        <div class="row g-3"> <!-- Added g-3 for spacing between columns and rows -->
            <div class="col-md-3  ">
                <img src="${url}/assest/address/address-play/mall.jpg" class="rounded "  height="280px" width="300px" alt="">
                <h3>mall</h3>
            </div>
            <div class="col-md-3 ">
                <img src="${url}/assest/address/address-play/coffe.jpg" class="rounded"    height="280px" width="300px" alt="">
                <h3>coffe</h3>
            </div>
            <div class="col-md-3 ">
                <img src="${url}/assest/address/address-play/van-mieu-quoc-tu-giam-1.jpg" class="rounded"   height="280px" width="300px" alt="">
                <h3>culture</h3>
            </div>
            <div class="col-md-3 ">
                <img src="${url}/assest/address/address-play/play.jpg" class="rounded"   height="280px" width="300px" alt="">
                <h3>playground</h3>
            </div>
        </div>
    </div>
</section>


<!-- Footer -->
<%@include file="../layout/footer.jsp" %>

</body>
</html>