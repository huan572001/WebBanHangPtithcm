<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>contact</title>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- swiper css link  -->
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

    <!-- cusom css file link  -->
   <link rel="stylesheet" href="<c:url value="/resource/css/style.css"/>">">

</head>
<body>
    
<!-- header section starts  -->

<header class="header">

    <a href="homeStore.htm" class="logo"> <i class="fas fa-store"></i>shopie </a>

    <form action="" class="search-form">
        <input type="search" id="search-box" placeholder="search here...">
        <label for="search-box" class="fas fa-search"></label>
    </form>

    <div class="icons">
        <div id="menu-btn" class="fas fa-bars"></div>
        <div id="search-btn" class="fas fa-search"></div>
        <a href="login.htm" class="fas fa-user"></a>
        <a href="shopProducts.htm" class="fas fa-store"></a>
        <a href="cart.htm" class="fas fa-shopping-cart"></a>
        <a href="logout.htm" class="fas fa-sign-out-alt"></a>
    </div>

</header>

<!-- header section ends -->

<!-- side-bar section starts -->

<div class="side-bar">

    <div id="close-side-bar" class="fas fa-times"></div>

    <div class="user">
        <img src="images/user-img.png" alt="">
        <h3>${sessionScope.fullname}</h3>
        <a href="#">log out</a>
    </div>

    <nav class="navbar">
        <a href="homeStore.htm"> <i class="fas fa-angle-right"></i> home </a>
        <a href="about.htm"> <i class="fas fa-angle-right"></i> about </a>
        <a href="shopProducts.htm"> <i class="fas fa-angle-right"></i> products </a>
        <a href="contact.htm"> <i class="fas fa-angle-right"></i> contact </a>
        <a href="login.htm"> <i class="fas fa-angle-right"></i> login </a>
        <a href="register.htm"> <i class="fas fa-angle-right"></i> register </a>
        <a href="cart.htm"> <i class="fas fa-angle-right"></i> cart </a>
    </nav>

</div>

<!-- side-bar section ends -->

<!-- contact info section starts  -->

<section class="info-container">

    <div class="box-container">

        <div class="box">
            <i class="fas fa-map"></i>
            <h3>address</h3>
            <p>mumbai, india - 400104</p>
        </div>

        <div class="box">
            <i class="fas fa-envelope"></i>
            <h3>email</h3>
            <p>shaikhanas@gmail.com</p>
            <p>anasbhai@gmail.com</p>
        </div>

        <div class="box">
            <i class="fas fa-phone"></i>
            <h3>number</h3>
            <p>+123-456-7890</p>
            <p>+111-222-3333</p>
        </div>

    </div>

</section>

<!-- contact info section ends -->

<!-- contact section starts  -->

<section class="contact">

    <form action="">
        <h3>get in touch</h3>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Saepe provident nihil non unde, quia magnam quibusdam ad obcaecati nam animi?</p>
        <div class="inputBox">
            <input type="text" placeholder="your name">
            <input type="email" placeholder="your email">
        </div>
        <div class="inputBox">
            <input type="number" placeholder="your number">
            <input type="text" placeholder="subject">
        </div>
        <textarea name="" placeholder="your message" id="" cols="30" rows="10"></textarea>
        <input type="submit" value="send message" class="btn">
    </form>

    <iframe class="map" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15076.89592087332!2d72.8319697277345!3d19.14167056419224!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be7b63aceef0c69%3A0x2aa80cf2287dfa3b!2sJogeshwari%20West%2C%20Mumbai%2C%20Maharashtra%20400047!5e0!3m2!1sen!2sin!4v1638365961619!5m2!1sen!2sin" allowfullscreen="" loading="lazy"></iframe>

</section>

<!-- contact section ends -->

<!-- newsletter section starts  -->

<section class="newsletter">

    <div class="content">
        <h3>newsletter</h3>
        <p>subscribe for weelky newsletter.</p>
    </div>

    <form action="">
        <input type="email" name="" placeholder="enter your email" id="" class="email">
        <input type="submit" value="subscribe" class="btn">
    </form>

</section>

<!-- newsletter section ends -->



 











<!-- footer section starts  -->

<section class="quick-links">

    <a href="home.htm" class="logo"> <i class="fas fa-store"></i> shopie </a>

    <div class="links">
        <a href="home.htm"> home </a>
        <a href="about.htm"> about </a>
        <a href="products.htm"> products </a>
        <a href="contact.htm"> contact </a>
        <a href="login.htm"> login </a>
        <a href="register.htm"> register </a>
        <a href="cart.htm"> cart </a>
    </div>

    <div class="share">
        <a href="#" class="fab fa-facebook-f"></a>
        <a href="#" class="fab fa-twitter"></a>
        <a href="#" class="fab fa-instagram"></a>
        <a href="#" class="fab fa-linkedin"></a>
    </div>

</section>

<section class="credit">

    <p> created by <span>mr. web designer</span> | all rights reserved! </p>

    <img src="images/card_img.png" alt="">

</section>

<!-- footer section ends -->




<!-- swiper js link      -->
<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>

<!-- custom js file link  -->
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

      var swiper = new Swiper(".home-slider", {
        loop: true,
        grabCursor: true,
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      });

      var swiper = new Swiper(".review-slider", {
        loop: true,
        grabCursor: true,
        spaceBetween: 20,
        breakpoints: {
          450: {
            slidesPerView: 1,
          },
          768: {
            slidesPerView: 2,
          },
          1024: {
            slidesPerView: 3,
          },
        },
      });
    </script>

</body>
</html>