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

<%@ include file="/resources/Shared/headerTHP.jsp"%>

<!-- header section ends -->

<!-- side-bar section starts -->

<div class="side-bar">

    <div id="close-side-bar" class="fas fa-times"></div>

    <div class="user">
        <img src="images/user-img.png" alt="">
        <h3>shaikh anas</h3>
        <a >log out</a>
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

<%@ include file="/resources/Shared/footerTHP.jsp"%>



<!-- footer section ends -->


</body>
</html>