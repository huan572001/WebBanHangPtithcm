

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
   


<section class="search-form">
   <form action="search.htm" method="get">
      <input type="text" name="search_box" placeholder="search here..." maxlength="100" class="box" required>
      <button type="submit" class="fas fa-search" name="search_btn"></button>
   </form>
</section>

<section class="products" style="padding-top: 0; min-height:100vh;">

   <div class="box-container">

   
   <c:forEach var="p" items="${listProducts}">
        <form action="add/${p.productId}.htm"  class="box">
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

</section>














<script src="js/script.js"></script>

</body>
</html>