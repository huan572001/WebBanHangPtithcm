
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>login</title>

<!-- font awesome cdn link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- swiper css link  -->
<link rel="stylesheet"
	href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

<!-- cusom css file link  -->
<link rel="stylesheet" href="<c:url value='resources/css/style.css'/>">
<base href="${pageContext.servletContext.contextPath}/">

</head>
<body>

	<!-- header section starts  -->

	<header class="header">

		<a href="home.jsp" class="logo"> <i class="fas fa-store"></i>
			THP-STORE
		</a>

		<form action="" class="search-form">
			<input type="search" id="search-box" placeholder="search here...">
			<label for="search-box" class="fas fa-search"></label>
		</form>

		<div class="icons">
			<div id="menu-btn" class="fas fa-bars"></div>
			<div id="search-btn" class="fas fa-search"></div>
			<a href="login.htm" class="fas fa-user"></a> <a href="#"
				class="fas fa-heart"></a> <a href="cart.htm"
				class="fas fa-shopping-cart"></a>
		</div>

	</header>

	<!-- header section ends -->

	<!-- side-bar section starts -->

	<div class="side-bar">

		<div id="close-side-bar" class="fas fa-times"></div>

		<div class="user">
			<img src="images/user-img.png" alt="">
			<h3>shaikh anas</h3>
			<a href="#">log out</a>
		</div>

		<nav class="navbar">
			<a href="home.htm"> <i class="fas fa-angle-right"></i> home
			</a> <a href="about.htm"> <i class="fas fa-angle-right"></i> about
			</a> <a href="products.htm"> <i class="fas fa-angle-right"></i>
				products
			</a> <a href="contact.htm"> <i class="fas fa-angle-right"></i>
				contact
			</a> <a href="login.htm"> <i class="fas fa-angle-right"></i> login
			</a> <a href="register.htm"> <i class="fas fa-angle-right"></i>
				register
			</a> <a href="cart.htm"> <i class="fas fa-angle-right"></i> cart
			</a>
		</nav>

	</div>

	<!-- side-bar section ends -->

	<!-- side-bar section ends -->

	<!-- register form section starts  -->

	<section class="register">

		<!--         <input type="text" name="" placeholder="enter your name" id="" class="box"> -->
		<!--         <input type="email" name="" placeholder="enter your email" id="" class="box"> -->
		<!--         <input type="password" name="" placeholder="enter your password" id="" class="box"> -->
		<!--         <input type="password" name="" placeholder="re-enter your password" id="" class="box"> -->
		<!--         <input type="submit" value="register now" class="btn"> -->
		
		<form action="checkAccount.htm" method="post">
		<h3>Search your account</h3>
			<h3>${message}</h3>
			<div>
				<input type="text" name="account" placeholder="nhap account"
					class="box"/>
			</div>
			<button  class="btn">Send</button>
		</form>


	</section>

	<!-- register form section ends  -->















	<!-- footer section starts  -->

	<section class="quick-links">

		<a href="home.htm" class="logo"> <i class="fas fa-store"></i>
			THP-STORE
		</a>

		<div class="links">
			<a href="home.htm"> home </a> <a href="about.htm"> about </a> <a
				href="products.htm"> products </a> <a href="contact.htm">
				contact </a> <a href="login.htm"> login </a> <a href="register.htm">
				register </a> <a href="cart.htm"> cart </a>
		</div>

		<div class="share">
			<a href="#" class="fab fa-facebook-f"></a> <a href="#"
				class="fab fa-twitter"></a> <a href="#" class="fab fa-instagram"></a>
			<a href="#" class="fab fa-linkedin"></a>
		</div>

	</section>

	<section class="credit">

		<p>
			created by <span>THP</span> | all rights reserved!
		</p>

		<img src="images/card_img.png" alt="">

	</section>

	<!-- footer section ends -->




	<!-- swiper js link      -->
	<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>

	<!-- custom js file link  -->
	<script src="js/script.js"></script>

</body>
</html>