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


<section class="checkout-orders">

   <form action="purchase.htm" method="POST">

   <h3>your orders</h3>

      <div class="display-orders">
      <%if(session.getAttribute("myCartItems")!=null){%>
      <c:forEach var="map" items="${sessionScope.myCartItems}">
      	 <p>${map.value.product.name}<span>(${map.value.product.price}/x ${map.value.quantity})</span> </p>
       </c:forEach>
     <%}else{ %>
     	<p class="empty">your cart is empty!</p>
     	<%} %>
        
      
         <input type="hidden" name="total_products" value="${sessionScope.myProductTotal}">
         <input type="hidden" name="total_price" value="${sessionScope.myCartTotal}">
         <div class="grand-total">grand total : <span>${sessionScope.myCartTotal}</span></div>
      </div>

      <h3>place your orders</h3>

      <div class="flex">
         <div class="inputBox">
            <span>your name :</span>
            <p class="box">${sessionScope.currentUser.fullname}</p>
         </div>
         <div class="inputBox">
            <span>your number :</span>
            <p class="box">${sessionScope.currentUser.phone}</p>
         </div>
         <div class="inputBox">
            <span>your email :</span>
            <p class="box">${sessionScope.currentUser.email}</p>
         </div>
         <div class="inputBox">
            <span>address :</span>
           <input type="text" name="name" placeholder="enter your address" class="box" maxlength="20" required>
         </div>
       

      <input type="submit" name="order" class="btn <%if(session.getAttribute("myCartItems")==null){%>disabled<%}else {%><%} %>" value="place order">

   </form>

</section>


<script src="js/script.js"></script>

</body>