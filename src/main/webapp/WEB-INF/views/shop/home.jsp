<%@page import="ptithcm.entity.Customer"%>
<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>home</title>

    <link
      rel="stylesheet"
      href="https://unpkg.com/swiper@8/swiper-bundle.min.css"
    />

    <!-- font awesome cdn link  -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
    />
        <link rel="stylesheet" href="<c:url value='resources/css/style.css'/>">
       <base href="${pageContext.servletContext.contextPath}/">
</head>
<%@ include file="/resources/Shared/headerTHP.jsp"%>
<body>
   

<div class="home-bg"style="background-image:url('files/home-bg.jpg') ;">

<section class="home">

   <div class="swiper home-slider">
   
   <div class="swiper-wrapper">
		
      <div class="swiper-slide slide">
         <div class="image">
            <img src="files/sh-removebg-preview.jpg" alt="">
         </div>
         <div class="content">
            <span>SH 350i</span>
            <h3> genuine spare parts</h3>
            <a href="shop.htm" class="btn">shop now</a>
         </div>
      </div>

      <div class="swiper-slide slide">
         <div class="image">
            <img src="files/winnerXBG.jpg" alt="">
         </div>
         <div class="content">
            <span>upto 50% off</span>
            <h3>genuine spare parts</h3>
            <a href="shop.htm" class="btn">shop now</a>
         </div>
      </div>

      <div class="swiper-slide slide">
         <div class="image">
            <img src="files/honda-vario.jpg" alt="">
         </div>
         <div class="content">
            <span>honda vario 150</span>
            <h3>new arrived</h3>
            <a href="shop.htm" class="btn">shop now</a>
         </div>
      </div>

   </div>

      <div class="swiper-pagination"></div>

   </div>

</section>

</div>


<section class="home-products">

   <h1 class="heading">trending now</h1>

   <div class="swiper products-slider">

   <div class="swiper-wrapper">

   <c:forEach var="p" items="${listProducts}">
        <form action="add/${p.productId}.htm"  class="swiper-slide slide">
          <input type="hidden" name="name" value="${p.name }" />
          <input type="hidden" name="price" value="${p.price}" />
          <input type="hidden" name="image" value="${p.image}" />

          <a href="quick_view/${p.productId}.htm" class="fas fa-eye"></a>
          <img src="files/${p.image}" alt="" />
          <div class="name">${p.name}</div>
          <div class="flex">
            <div class="price"><span>$</span>${p.price}<span></span></div>
   
          </div>
          <input
            type="submit"
            value="add to cart"
            class="btn"
            name="add_to_cart"
          />
        </form>
         </c:forEach>
  

   </div>

   <div class="swiper-pagination"></div>

   </div>

</section>

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
