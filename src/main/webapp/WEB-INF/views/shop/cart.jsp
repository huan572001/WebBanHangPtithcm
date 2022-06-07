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
    <section class="products shopping-cart">
      <h3 class="heading">shopping cart</h3>
		
      <div class="box-container">
       <c:forEach var="map" items="${sessionScope.myCartItems}">
        <form action="remove/${map.value.product.productId}.htm"  class="box">
          <input type="hidden" name="cart_id" value="" />
          <a href="quick_view/${map.value.product.productId}.htm" class="fas fa-eye"></a>
          <img src="files/${map.value.product.image}" alt="" />
          <div class="name">${map.value.product.name}</div>
          <div class="flex">
            <div class="price">${map.value.product.price}</div>
             <div class="name">quantity: ${map.value.quantity}</div>
    
          </div>
          <div class="sub-total">sub total : <span>${map.value.quantity*map.value.product.price}</span></div>
          <input
            type="submit"
            value="delete item"
            onclick="return confirm('delete ${map.value.product.name} from cart?');"
            class="delete-btn"
            name="delete"
          />
        </form>
        </c:forEach>
      </div>

      <div class="cart-total">
        <p>grand total : <span>${sessionScope.myCartTotal}</span></p>
        <a href="shop.htm" class="option-btn">continue shopping</a>
        <a
          href="delete-all.htm"
          class="delete-btn"
          onclick="return confirm('delete all from cart?');"
          >delete all item</a
        >
        <a href="checkout.htm" class="btn" <%if(session.getAttribute("currentUser")==null){ %>onclick="return confirm('please login before checkout!');"<%} %>>proceed to checkout</a>
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