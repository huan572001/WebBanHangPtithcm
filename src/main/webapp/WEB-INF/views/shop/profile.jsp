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

<!-- login form section starts  -->

<section class="register">

    <form action="changeProfile.htm" method="post">
        <h3>Your Profile</h3>
        <input type="text" name="profileName" placeholder="enter your name" id="" class="box" value="${proName}">
        <input type="email" name="profileEmail" placeholder="enter your email" id="" value="${proEmail}" class="box">
        <input type="text" name="profilePhone" placeholder="enter your password" id="" value="${proPhone}" class="box">
        <input type="submit" value="Save" class="btn">
    </form>

</section>
<!-- login form section ends  -->














<!-- footer section starts  -->

<%@ include file="/resources/Shared/footerTHP.jsp"%>



<!-- footer section ends -->


</body>
</html>