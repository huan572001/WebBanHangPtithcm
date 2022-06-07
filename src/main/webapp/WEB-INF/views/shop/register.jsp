<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>register</title>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- swiper css link  -->
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

    <!-- cusom css file link  -->
       <link rel="stylesheet" href="<c:url value='resources/css/stylelogin.css'/>">
       <base href="${pageContext.servletContext.contextPath}/">

</head>
<%@ include file="/resources/Shared/headerTHP.jsp"%>
<body>
    
<!-- header section starts  -->


<!-- header section ends -->

<!-- side-bar section starts -->

<div class="side-bar">

    <div id="close-side-bar" class="fas fa-times"></div>

    <div class="user">
        <img src="images/user-img.png" alt="">
        <h3>shaikh anas</h3>
        <a  >log out</a>
    </div>

    <nav class="navbar">
        <a href="login.htm"> <i class="fas fa-angle-right"></i> home </a>
        <a href="login.htm"> <i class="fas fa-angle-right"></i> about </a>
        <a href="login.htm"> <i class="fas fa-angle-right"></i> products </a>
        <a href="login.htm"> <i class="fas fa-angle-right"></i> contact </a>
        <a href="login.htm"> <i class="fas fa-angle-right"></i> login </a>
        <a href="register.htm"> <i class="fas fa-angle-right"></i> register </a>
        <a href="login.htm"> <i class="fas fa-angle-right"></i> cart </a>
    </nav>

</div>

<!-- side-bar section ends -->

<!-- side-bar section ends -->

<!-- register form section starts  -->

<section class="register">

    <form action="">
        <h3>register now</h3>
        <input type="text" name="" placeholder="enter your name" id="" class="box">
        <input type="email" name="" placeholder="enter your email" id="" class="box">
        <input type="password" name="" placeholder="enter your password" id="" class="box">
        <input type="password" name="" placeholder="re-enter your password" id="" class="box">
        <input type="submit" value="register now" class="btn">
        <p>already have an account?</p>
        <a href="login.htm" class="btn link">login now</a>
    </form>

</section>

<!-- register form section ends  -->















<!-- footer section starts  -->

<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

<script src="js/script.js"></script>

<script>

var swiper = new Swiper(".home-slider", {
	   loop:true,
	   spaceBetween: 20,
	   pagination: {
	      el: ".swiper-pagination",
	      clickable:true,
	    },
	});

	 var swiper = new Swiper(".category-slider", {
	   loop:true,
	   spaceBetween: 20,
	   pagination: {
	      el: ".swiper-pagination",
	      clickable:true,
	   },
	   breakpoints: {
	      0: {
	         slidesPerView: 2,
	       },
	      650: {
	        slidesPerView: 3,
	      },
	      768: {
	        slidesPerView: 4,
	      },
	      1024: {
	        slidesPerView: 5,
	      },
	   },
	});

	var swiper = new Swiper(".products-slider", {
	   loop:true,
	   spaceBetween: 20,
	   pagination: {
	      el: ".swiper-pagination",
	      clickable:true,
	   },
	   breakpoints: {
	      550: {
	        slidesPerView: 2,
	      },
	      768: {
	        slidesPerView: 2,
	      },
	      1024: {
	        slidesPerView: 3,
	      },
	   },
	});

	let navbar = document.querySelector('.header .flex .navbar');
	let profile = document.querySelector('.header .flex .profile');

	document.querySelector('#menu-btn').onclick = () =>{
	   navbar.classList.toggle('active');
	   profile.classList.remove('active');
	}

	document.querySelector('#user-btn').onclick = () =>{
	   profile.classList.toggle('active');
	   navbar.classList.remove('active');
	}

	window.onscroll = () =>{
	   navbar.classList.remove('active');
	   profile.classList.remove('active');
	}

	let mainImage = document.querySelector('.quick-view .box .row .image-container .main-image img');
	let subImages = document.querySelectorAll('.quick-view .box .row .image-container .sub-image img');

	subImages.forEach(images =>{
	   images.onclick = () =>{
	      src = images.getAttribute('src');
	      mainImage.src = src;
	   }
	});
</script>
</body>
</html>