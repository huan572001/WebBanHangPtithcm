<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>cart</title>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- swiper css link  -->
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

    <!-- cusom css file link  -->       
    <link rel="stylesheet" href="<c:url value='resources/css/checkout.css'/>">
       <base href="${pageContext.servletContext.contextPath}/">
<body>
    
<!-- header section starts  -->
<div class="container">
  <div class="title">
      <h2>Product Order Form</h2>
  </div>
<div class="d-flex">
  <form action="purchase.htm" method="POST">
    <label>
      <span class="fname">Name <span class="required">*</span></span>
      <input type="text" class="fname" name="fname" value="${nameCustomer}">
    </label>
    <label>
      <span>Address <span class="required">*</span></span>
      <input type="text" name="houseadd" placeholder="House number and street name" required>
    </label>
    <label>
      <span>Phone <span class="required">*</span></span>
      <input type="tel" name="phone" value="${phoneCustomer}"> 
    </label>
    <label>
      <span>Email Address <span class="required">*</span></span>
      <input type="email" name="city"> 
    </label>
    <button type="submit">Place Order</button>
  </form>
  <div class="Yorder">
    <table>
      <tr>
        <th colspan="2">Your order</th>
      </tr>
      <tr>
        <td>Subtotal</td>
        <td>${sessionScope.myCartTotal}$</td>
      </tr>
      <tr>
        <td>Shipping</td>
        <td>Free shipping</td>
      </tr>
    </table><br>
     <button  >Place Order</button>
  </div><!-- Yorder -->
 </div>
</div>