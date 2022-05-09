<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>cart</title>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- swiper css link  -->
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

    <!-- cusom css file link  -->       
    <link rel="stylesheet" href="<c:url value='resources/css/style.css'/>">
       <base href="${pageContext.servletContext.contextPath}/">
<body>
    <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v13.0" nonce="CaqHF5Bb"></script>
<!-- header section starts  -->

<header class="header">
   <a href="homeStore.htm" class="logo"> <i class="fas fa-store"></i> shopie </a>

    <form action="shopProducts.htm" class="search-form">
        <input type="search" id="search-box" name="search" placeholder="search here...">
        <a  class="fas fa-search" href="shopProducts.htm"></a>
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
        <a href="logout.htm">log out</a>
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

<!-- shopping cart section starts  -->
<%


%>

<section class="shopping-cart">

    <h1 class="heading">your <span>products</span></h1>

    <div class="box-container">
     <c:forEach var="map" items="${sessionScope.myCartItems}">
        <div class="box">
            <a class="fas fa-times" href="remove/${map.value.product.productId}.htm"></a>
            <img src="" alt="">
            <div class="content">
                <h3>${map.value.product.name}</h3>
                <form action="">
                    <span>quantity: ${map.value.quantity}</span>
                </form>
                <h3>${map.value.product.price}</h3>
            </div>
        </div>
 	</c:forEach>
    </div>
    <div class="cart-total">
        <h3> subtotal : <span>${sessionScope.myCartTotal}</span> </h3>
         <form action="checkout.htm" method="post">
        <input type="submit" value="proceed to checkout" class="btn">
         
         </form>
       
    </div>

</section>

<!-- shopping cart section ends -->
















<!-- footer section starts  -->

<section class="quick-links">

    <a href="home.jsp" class="logo"> <i class="fas fa-store"></i> shopie </a>

    <div class="links">
        <a href="home.jsp"> home </a>
        <a href="about.jsp"> about </a>
        <a href="products.jsp"> products </a>
        <a href="contact.jsp"> contact </a>
        <a href="login.jsp"> login </a>
        <a href="register.jsp"> register </a>
        <a href="cart.jsp"> cart </a>
    </div>

    <div class="share">
        <a href="https://www.facebook.com/Ph%E1%BB%A5-ki%E1%BB%87n-247-103958515647665" class="fab fa-facebook-f"></a>
         <a href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fwww.facebook.com%2FPh%25E1%25BB%25A5-ki%25E1%25BB%2587n-247-103958515647665&amp;src=sdkpreparse" class="fas fa-share"></a>
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
 var counter=0;

 $(document).ready(function() {
   $('.content .product .add-to-cart').click(function() {
     $('.helper').addClass('added');
     counter++;
     
     var buttonCount = setTimeout(function(){
     $('.cart').attr('data-count', counter);
   }, 1000);
     
     var removeClass = setTimeout(function(){
     $('.helper, .cart').removeClass('added');
   }, 1500);
   })
   
 });
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