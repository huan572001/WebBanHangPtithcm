
<!DOCTYPE html>
<html lang="en">
<head>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>




    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>products</title>

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

<header class="header">

    <a href="homeStore.htm" class="logo"> <i class="fas fa-store"></i> shopie </a>

    <form action="" class="search-form">
        <input type="search" id="search-box" name="search" placeholder="search here...">
        <a  class="fas fa-search" href="shopProducts.htm"></a>
    </form>

    <div class="icons">
        <div id="menu-btn" class="fas fa-bars"></div>
        <div id="search-btn" class="fas fa-search"></div>
        <a href="login.htm" class="fas fa-user"></a>
        <a href="shopProducts.htm" class="fas fa-store"></a>
        <a href="cart.htm" class="fas fa-shopping-cart"></a>
        <a href="logout.htm" class="fas fa-sign-out-alt"></a>
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

<!-- products section starts  -->

<section class="products">

    <h1 class="heading"> featured <span>products</span> </h1>

    
	<div class="box-container">
	<c:forEach var="p" items="${listProducts}">
	 <div class="box">
            <div class="image">
                <img src="files/${p.image}" class="main-img" alt="">
                
                <div class="hover-img desc">${p.description }</div>
                <div class="icons">
                    <a href="add/${p.productId}.htm" class="fas fa-shopping-cart"></a>
               
                </div>
            </div>
            <div class="content" name=""> 	
                <h3>${p.name }</h3>
                <div class="price">${p.price }</div>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
            </div>
        </div>
        </c:forEach>
    </div>

       
<div  class="btn" id="load-more"> load more </div>
</section>

<!-- products section ends -->

<!-- product banner section starts  -->

<section class="product-banner">

    <h1 class="heading"> <span>deal</span> of the day </h1>

    <div class="box-container">

        <div class="box">
            <img src="images/product-banner-1.jpg" alt="">
            <div class="content">
                <span>special offer</span>
                <h3>upto 50% off</h3>
                <a href="#" class="btn">shop now</a>
            </div>
        </div>

        <div class="box">
            <img src="images/product-banner-2.jpg" alt="">
            <div id="menu-btn" class="content">
                <span>special offer</span>
                <h3>upto 50% off</h3>
                <a href="#" class="btn">shop now</a>
            </div>
        </div>

    </div>
    
</section>

<!-- product banner section ends -->















<!-- footer section starts  -->

<section class="quick-links">

    <a href="home.htm" class="logo"> <i class="fas fa-store"></i> shopie </a>

    <div class="links">
        <a href="home.htm"> home </a>
        <a href="about.htm"> about </a>
        <a href="products.htm"> products </a>
        <a href="contact.htm"> contact </a>
        <a href="login.htm"> login </a>
        <a href="register.htm"> register </a>
        <a href="cart.htm"> cart </a>
    </div>

    <div class="share">
        <a href="#" class="fab fa-facebook-f"></a>
        <a href="#" class="fab fa-twitter"></a>
        <a href="#" class="fab fa-instagram"></a>
        <a href="#" class="fab fa-linkedin"></a>
    </div>

</section>

<section class="credit">

    <p> created by <span>mr. web designer</span> | all rights reserved! </p>

    <img src="images/card_img.png" alt="">

</section>

<!-- footer section ends -->




 <script type="text/javascript">
 let loadMoreBtn = document.querySelector('#load-more');
 let currentItem = 3;

 loadMoreBtn.onclick = () =>{
    let boxes = [...document.querySelectorAll('.products .box-container .box')];
    for (var i = currentItem; i < currentItem + 3; i++){
       boxes[i].style.display = 'inline-block';
    }
    currentItem += 3;

    if(currentItem >= boxes.length){
       loadMoreBtn.style.display = 'none';
    }
 }		
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