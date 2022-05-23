<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>home</title>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- swiper css link  -->
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

    <!-- cusom css file link  -->
        <link rel="stylesheet" href="<c:url value='resources/css/style.css'/>">
       <base href="${pageContext.servletContext.contextPath}/">
</head>
<body>
<!-- header section starts  -->

<%@ include file="/resources/Shared/headerTHP.jsp"%>
<!-- header section ends -->

<!-- side-bar section starts -->

    <div class="side-bar">
      <div id="close-side-bar" class="fas fa-times"></div>

    <div class="user">
        <img src="files/IMG_8200.JPG" alt="">
        <h3>${sessionScope.currentUser.fullname}</h3>
        <a href="logout.htm">log out</a>
    </div>


      <nav class="navbar">
        <a href="profileCustomer.htm"> <i class="fas fa-angle-right"></i> Profile </a>
        <a href="about.htm"> <i class="fas fa-angle-right"></i> Your Order </a>
        <a href="shopProducts.htm">
          <i class="fas fa-angle-right"></i> Your Receipt
        </a>
        <a href="cart.htm"> <i class="fas fa-angle-right"></i> Cart </a>
      </nav>
    </div>

    <!-- side-bar section ends -->

    <!-- home section starts  -->

    <section class="home">
      <div class="swiper home-slider">
        <div class="swiper-wrapper">
          <div class="swiper-slide slide">
            <div class="image">
              <img src="files/BG.jpg" alt="" />
            </div>
            <div class="content">
              <span>new arrival</span>
              <h3>${lastProduct.name}</h3>
              <a href="shopProducts.htm" class="btn">shop now</a>
            </div>
          </div>

          <div class="swiper-slide slide">
            <div class="image">
              <img src="files/SP10.jpg" alt="" />
            </div>
            <div class="content">
              <span>upto 50% off</span>
              <h3>smartwatch</h3>
              <a   class="btn">shop now</a>
            </div>
          </div>

          
        </div>

        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
      </div>
    </section>

    <!-- home section ends -->

    <!-- banner section starts  -->

    <section class="banner">
      <div class="box-container">
        <a href="shopProducts.htm" class="box">
          <img src="files/SP1.jpg" alt="" />
          <div class="content">
            <span>special offer</span>
            <h3>upto 50% off</h3>
          </div>
        </a>

        <a href="shopProducts.htm" class="box">
          <img src="files/SP2.jpg" alt="" />
          <div class="content">
            <span>special offer</span>
            <h3>upto 50% off</h3>
          </div>
        </a>

        <a href="shopProducts.htm" class="box">
          <img src="files/SP3.jpg" alt="" />
          <div class="content">
            <span>special offer</span>
            <h3>upto 50% off</h3>
          </div>
        </a>
      </div>
    </section>

    <!-- banner section ends -->
<!-- arrivals section starts  -->



<!-- arrivals section ends -->
















<!-- footer section starts  -->

<%@ include file="/resources/Shared/footerTHP.jsp"%>

<section class="credit">

    <p> created by <span>THP</span> | all rights reserved! </p>

    <img src="images/card_img.png" alt="">

</section>

<!-- footer section ends -->

 <script type="text/javascript">
      let sideBar = document.querySelector(".side-bar");

      document.querySelector("#menu-btn").onclick = () => {
        sideBar.classList.toggle("active");
      };

      document.querySelector("#close-side-bar").onclick = () => {
        sideBar.classList.remove("active");
      };

      let searchForm = document.querySelector(".search-form");

      document.querySelector("#search-btn").onclick = () => {
        searchForm.classList.toggle("active");
      };

      window.onscroll = () => {
        sideBar.classList.remove("active");
        searchForm.classList.remove("active");
      };

      document
        .querySelectorAll(".accordion-container .accordion")
        .forEach((accordion) => {
          accordion.onclick = () => {
            accordion.classList.toggle("active");
          };
        });

      

  
     
    </script>



</body>
</html>