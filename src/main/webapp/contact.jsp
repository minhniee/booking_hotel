<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<%@include file="layout/header.jsp"%>
<!-- END head -->

<section class="site-hero inner-page overlay" style="background-image: url(images/hero_4.jpg)" data-stellar-background-ratio="0.5">
  <div class="container">
    <div class="row site-hero-inner justify-content-center align-items-center">
      <div class="col-md-10 text-center" data-aos="fade">
        <h1 class="heading mb-3">Contact</h1>
        <ul class="custom-breadcrumbs mb-4">
          <li><a href="index.jsp">Home</a></li>
          <li>&bullet;</li>
          <li>Contact</li>
        </ul>
      </div>
    </div>
  </div>
  <a class="mouse smoothscroll" href="#next">
    <div class="mouse-icon">
      <span class="mouse-wheel"></span>
    </div>
  </a>
</section>
<!-- END section -->

<section class="section contact-section" id="next">
  <div class="container">
    <div class="row">
      <div class="col-md-7" data-aos="fade-up" data-aos-delay="100">

        <c:if test="${not empty message}">
          <div class="alert alert-success">
              ${message}
          </div>
        </c:if>

        <form action="ContactServlet" method="post" class="bg-white p-md-5 p-4 mb-5 border">
          <div class="row">
            <div class="col-md-6 form-group">
              <label for="name">Name</label>
              <input type="text" id="name" name="name" class="form-control" value="${not empty param.name ? param.name : ''}" required>
            </div>
            <div class="col-md-6 form-group">
              <label for="phone">Phone</label>
              <input type="text" id="phone" name="phone" class="form-control" value="${not empty param.phone ? param.phone : ''}" required>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12 form-group">
              <label for="email">Email</label>
              <input type="email" id="email" name="email" class="form-control" value="${not empty param.email ? param.email : ''}" required>
            </div>
          </div>
          <div class="row mb-4">
            <div class="col-md-12 form-group">
              <label for="message">Write Message</label>
              <textarea name="message" id="message" class="form-control" cols="30" rows="8" required>${not empty param.message ? param.message : ''}</textarea>
            </div>
          </div>
          <div class="row">
            <div class="col-md-6 form-group">
              <input type="submit" value="Send Message" class="btn btn-primary text-white font-weight-bold">
            </div>
          </div>
        </form>
      </div>
      <div class="col-md-5" data-aos="fade-up" data-aos-delay="200">
        <div class="row">
          <div class="col-md-10 ml-auto contact-info">
            <p><span class="d-block">Address:</span> <span> 98 West 21th Street, Suite 721 New York NY 10016</span></p>
            <p><span class="d-block">Phone:</span> <span> (+1) 234 4567 8910</span></p>
            <p><span class="d-block">Email:</span> <span> info@domain.com</span></p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="section testimonial-section bg-light">
  <div class="container">
    <div class="row justify-content-center text-center mb-5">
      <div class="col-md-7">
        <h2 class="heading" data-aos="fade-up">People Says</h2>
      </div>
    </div>
    <div class="row">
      <div class="js-carousel-2 owl-carousel mb-5" data-aos="fade-up" data-aos-delay="200">

        <!-- Testimonials Here -->

      </div>
      <!-- END slider -->
    </div>
  </div>
</section>

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
</body>
</html>
