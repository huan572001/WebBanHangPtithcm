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
<%@ include file="/resources/Shared/headerTHP.jsp"%>
</head>
<section class="form-container">

   <form action="changeProfile.htm" method="post">
      <h3>update now</h3>
    
      <input type="text" name="profileName" required placeholder="enter your username" maxlength="20"  class="box" value="${proName}">
      <input type="email" name="profileEmail" required placeholder="enter your email" maxlength="50"  class="box" oninput="this.value = this.value.replace(/\s/g, '')" value="${proEmail}">
      <input type="text" name="profilePhone" required placeholder="enter your phone" maxlength="50"  class="box" oninput="this.value = this.value.replace(/\s/g, '')" value="${proPhone}">
      <input type="submit" value="update now" class="btn" name="submit">
   </form>

</section>

</html>