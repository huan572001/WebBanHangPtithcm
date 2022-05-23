
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

<%@ include file="/resources/Shared/headerTHP.jsp"%>

<!-- header section ends -->

<!-- side-bar section starts -->

    <div class="side-bar">
      <div id="close-side-bar" class="fas fa-times"></div>

    <div class="user">
        <img src="images/user-img.png" alt="">
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

<%@ include file="/resources/Shared/footerTHP.jsp"%>

<section class="credit">

    <p> created by <span>THP</span> | all rights reserved! </p>

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