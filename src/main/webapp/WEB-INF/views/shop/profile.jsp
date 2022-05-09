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
       <link rel="stylesheet" href="<c:url value='resources/css/style.css'/>">
       <base href="${pageContext.servletContext.contextPath}/">

</head>
<body>
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

<header class="header">

    <a href="login.htm" class="logo"> <i class="fas fa-store"></i> shopie </a>


    <div class="icons">
        <div id="login.htm" class="fas fa-bars"></div>
        <div id="login.htm" class="fas fa-search"></div>
        <a href="login.htm" class="fas fa-user"></a>
        <a href="login.htm" class="fas fa-heart"></a>
        <a href="login.htm" class="fas fa-shopping-cart"></a>
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
        <a href="login.htm"> <i class="fas fa-angle-right"></i> home </a>
        <a href="login.htm"> <i class="fas fa-angle-right"></i> about </a>
        <a href="login.htm"> <i class="fas fa-angle-right"></i> products </a>
        <a href="login.htm"> <i class="fas fa-angle-right"></i> contact </a>
        <a href="login.htm"> <i class="fas fa-angle-right"></i> login </a>
        <a href="login.htm"> <i class="fas fa-angle-right"></i> register </a>
        <a href="login.htm"> <i class="fas fa-angle-right"></i> cart </a>
    </nav>

</div>

<!-- side-bar section ends -->

<!-- login form section starts  -->

<section class="register">

    <form action="changeProfile.htm">
        <h3>Your Profile</h3>
        <input type="text" name="profileName" placeholder="enter your name" id="" class="box">
        <input type="email" name="proEmail" placeholder="enter your email" id="" class="box">
        <input type="password" name="proPassword" placeholder="enter your password" id="" class="box">
        <input type="submit" value="Save" class="btn">
    </form>

</section>
<!-- login form section ends  -->














<!-- footer section starts  -->

<section class="quick-links">

    <a href="login.htm" class="logo"> <i class="fas fa-store"></i> shopie </a>

    <div class="share">
        <a href="#" class="fab fa-facebook-f"></a>
        <a href="#" class="fab fa-twitter"></a>
        <a href="#" class="fab fa-instagram"></a>
        <a href="#" class="fab fa-linkedin"></a>
    </div>

</section>



<!-- footer section ends -->


</body>
</html>