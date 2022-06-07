<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- swiper css link  -->
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

    <!-- cusom css file link  -->
       <link rel="stylesheet" href="<c:url value='resources/css/stylelogin.css'/>">
       <base href="${pageContext.servletContext.contextPath}/">

</head>

<body>
<%@ include file="/resources/Shared/headerTHP.jsp"%>
    <%
	String uname="",pass="",reme="";
	Cookie[] cookies= request.getCookies();
	if(cookies != null){
		for (Cookie cook : cookies){
			if(cook.getName().equals("cookUname")){
				uname=cook.getValue();
			}else if(cook.getName().equals("cookPass")){
			
				pass=cook.getValue();
			}else if(cook.getName().equals("cookReme")){
				reme = cook.getValue();
			}
			}
	}
%>
<!-- header section starts  -->



<section class="login">

    <form action="login.htm" method="post">
        <h3>login now</h3>
        <input type="email" name="username" value="<%=uname %>" placeholder="enter your email" id="" class="box">
        <input type="password" name="password" value="<%=pass%>" placeholder="enter your password" id="" class="box">
        
        ${message}
        <div class="remember">
            <input type="checkbox" name="remember" id="remember" <%="on".equals(reme)?"checked='/checked'":"" %>/>
            <label for="remember-me"> remember me </label>
        </div>
        <input type="submit" value="login now" class="btn">
        <p><a href="checkAccount.htm">Forgot password?</a></p>
        <a href="insertCustomer.htm" class="btn link">register now</a>
    </form>

</section>

<!-- login form section ends  -->














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



<!-- footer section ends -->


</body>
</html>