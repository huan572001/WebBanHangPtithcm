
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
<link rel="stylesheet" href="<c:url value='resources/css/stylelogin.css'/>">
<base href="${pageContext.servletContext.contextPath}/">

</head>
<body>

	<section class="register">
	
			<!--         <input type="text" name="" placeholder="enter your name" id="" class="box"> -->
			<!--         <input type="email" name="" placeholder="enter your email" id="" class="box"> -->
			<!--         <input type="password" name="" placeholder="enter your password" id="" class="box"> -->
			<!--         <input type="password" name="" placeholder="re-enter your password" id="" class="box"> -->
			<!--         <input type="submit" value="register now" class="btn"> -->
			<form:form action="insertCustomer.htm" modelAttribute="customer">
			<h3>${message}</h3>
				
			<h3>register now</h3>
				<h3>${message1}</h3>
				<div>
					<form:input type="text" name="" placeholder="enter your Username" id="" class="box" path="account.username" />
				</div>
				<div>
					<form:input type="password" placeholder="enter your password" class="box" path="account.password" />
				</div>
				<div>
					<form:input type="text" placeholder="enter your fullname" id="" class="box" path="fullname" />
				</div>
				<div>
					<form:input type="text" placeholder="enter your Phone" id="" class="box" path="phone" />
				</div>
				<div>
					<h3>${Email}</h3>
					<form:input type="text" placeholder="enter your email" id="" class="box" path="email" />
				</div>
					<button  class="btn">register now</button>
								<p>already have an account?</p>
			<a href="login.htm" class="btn link">login now</a>
			</form:form>


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
			<a  class="fab fa-facebook-f"></a> <a 
				class="fab fa-twitter"></a> <a  class="fab fa-instagram"></a>
			<a  class="fab fa-linkedin"></a>
		</div>

	</section>

	<section class="credit">

		<p>
			created by <span>mr. web designer</span> | all rights reserved!
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