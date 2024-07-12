<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE HTML>
<html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="layout/header-old.jsp" %>

<body>
<section class="section pt-5">
    <div class="container">
        <h1 class="pt-5">Type Room</h1>
        <div class="row">
            <c:forEach var="i" items="${listRoom}">
                <div class="col-md-6 col-lg-4 mb-5" data-aos="fade-up">
                    <a href="roomDetails?room_class_id=${i.roomClassId}" class="room" style="text-decoration: none">
                        <figure class="img-wrap">
                            <img src="${url}/Assets/image/room/${i.roomImg}" alt="Free website template" class="img-fluid mb-3"
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
</section>



<%@include file="layout/footer.jsp" %>


</body>
</html>