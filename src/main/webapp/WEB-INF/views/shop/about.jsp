<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>about</title>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- swiper css link  -->
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

    <link rel="stylesheet" href="<c:url value='resources/css/style.css'/>">
       <base href="${pageContext.servletContext.contextPath}/">

</head>
<%@ include file="/resources/Shared/headerTHP.jsp"%>
<body>
    <section class="about">
      <div class="row">
        <div class="image">
          <img src="images/about-img.svg" alt="" />
        </div>

        <div class="content">
          <h3>why choose us?</h3>
          <p>
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsam
            veritatis minus et similique doloribus? Harum molestias tenetur
            eaque illum quas? Obcaecati nulla in itaque modi magnam ipsa
            molestiae ullam consequuntur.
          </p>
          <a href="contact.htm" class="btn">contact us</a>
        </div>
      </div>
    </section>

    <section class="reviews">
      <h1 class="heading">client's reviews</h1>

      <div class="swiper reviews-slider">
        <div class="swiper-wrapper">
          <div class="swiper-slide slide">
            <img src="files/admin.jpg" alt="" />
            <p>
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Quia
              tempore distinctio hic, iusto adipisci a rerum nemo perspiciatis
              fugiat sapiente.
            </p>
            <div class="stars">
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star-half-alt"></i>
            </div>
            <h3>john deo</h3>
          </div>

          <div class="swiper-slide slide">
            <img src="files/admin.jpg" alt="" />
            <p>
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Quia
              tempore distinctio hic, iusto adipisci a rerum nemo perspiciatis
              fugiat sapiente.
            </p>
            <div class="stars">
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star-half-alt"></i>
            </div>
            <h3>john deo</h3>
          </div>

          <div class="swiper-slide slide">
            <img src="files/admin.jpg" alt="" />
            <p>
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Quia
              tempore distinctio hic, iusto adipisci a rerum nemo perspiciatis
              fugiat sapiente.
            </p>
            <div class="stars">
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star-half-alt"></i>
            </div>
            <h3>john deo</h3>
          </div>

          <div class="swiper-slide slide">
            <img src="files/admin.jpg" alt="" />
            <p>
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Quia
              tempore distinctio hic, iusto adipisci a rerum nemo perspiciatis
              fugiat sapiente.
            </p>
            <div class="stars">
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star-half-alt"></i>
            </div>
            <h3>john deo</h3>
          </div>

          <div class="swiper-slide slide">
            <img src="files/admin.jpg" alt="" />
            <p>
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Quia
              tempore distinctio hic, iusto adipisci a rerum nemo perspiciatis
              fugiat sapiente.
            </p>
            <div class="stars">
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star-half-alt"></i>
            </div>
            <h3>john deo</h3>
          </div>

          <div class="swiper-slide slide">
            <img src="files/admin.jpg" alt="" />
            <p>
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Quia
              tempore distinctio hic, iusto adipisci a rerum nemo perspiciatis
              fugiat sapiente.
            </p>
            <div class="stars">
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star-half-alt"></i>
            </div>
            <h3>john deo</h3>
          </div>
        </div>

        <div class="swiper-pagination"></div>
      </div>
    </section>

    <?php include 'components/footer.php'; ?>

    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

    <script src="js/script.js"></script>

    <script>
      var swiper = new Swiper(".reviews-slider", {
        loop: true,
        spaceBetween: 20,
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
        breakpoints: {
          0: {
            slidesPerView: 1,
          },
          768: {
            slidesPerView: 2,
          },
          991: {
            slidesPerView: 3,
          },
        },
      });
    </script>
  </body>
</html>