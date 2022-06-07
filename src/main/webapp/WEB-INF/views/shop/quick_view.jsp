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
        <link rel="stylesheet" href="<c:url value='../resources/css/style.css'/>">
       <base href="${pageContext.servletContext.contextPath}/">
</head>
<%@ include file="/resources/Shared/headerTHP.jsp"%>
<body>
<section class="quick-view">

   <h1 class="heading">quick view</h1>
   <form action="add/${product.productId}.htm" class="box">
      <input type="hidden" name="pid" value="">
      <input type="hidden" name="name" value="">
      <input type="hidden" name="price" value="">
      <input type="hidden" name="image" value="">
      <div class="row">
         <div class="image-container">
            <div class="main-image">
               <img src="files/${product.image}" alt="">
            </div>
            <div class="sub-image">
               <img src="files/${product.image}" alt="">
            </div>
         </div>
         <div class="content">
            <div class="name">${product.name}</div>
            <div class="flex">
               <div class="price"><span>$</span>${product.price}<span>/-</span></div>
            </div>
            <div class="details">${product.description }</div>
            <div class="flex-btn">
               <input type="submit" value="add to cart" class="btn" name="add_to_cart">
               <input class="option-btn" type="submit" name="add_to_wishlist" value="add to wishlist">
            </div>
         </div>
      </div>
   </form>

</section>
<script src="js/script.js"></script>

</body>
</html>