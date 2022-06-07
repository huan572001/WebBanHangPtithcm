 <%@page import="ptithcm.entity.TheOrder"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
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
    <section class="orders">
      <h1 class="heading">placed orders</h1>

      <div class="box-container">
      <c:forEach var="o" items="${sessionScope.yourOrders}">
        <div class="box">
    
          <p>
            name : <span>${o.customer.fullname}</span>
          </p>
          <p>
            email : <span> ${o.customer.email}</span>
          </p>
          <p>
            phone number : <span> ${o.customer.phone}</span>
          </p>
          <p>
            address : <span> ${o.address}</span>
          </p>
          <p>
            payment status :
            <span style="">${o.status}</span>
          </p>
        </div>
         </c:forEach>
      </div>
    </section>



    <script src="js/script.js"></script>
  </body>