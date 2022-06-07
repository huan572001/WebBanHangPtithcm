<%@page import="ptithcm.entity.Customer"%>
<%@page import="org.springframework.web.context.request.SessionScope"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="<c:url value='resources/css/style.css'/>">
       <base href="${pageContext.servletContext.contextPath}/">
<header class="header">
  <section class="flex">
    <a href="homeStore.htm" class="logo">HTP Store<span>.</span></a>
	
    <nav class="navbar">
      <a href="homeStore.htm">home</a>
      <a href="shop.htm">shop</a>
      <a href="cart.htm">cart</a>
      <a href="orders.htm" <%if(session.getAttribute("currentUser")==null){ %>onclick="return confirm('please login first!');"<%} %>>orders</a>
      
      <a href="about.htm">about</a>
     
    </nav>

    <div class="icons">

      <div id="menu-btn" class="fas fa-bars"></div>
      <a href="search_page.htm"><i class="fas fa-search"></i></a>
    
      <a href="cart.htm"><i class="fas fa-shopping-cart"></i><span>(${sessionScope.myCartNum})</span></a>
      <div id="user-btn" class="fas fa-user"></div>
    </div>

    <div class="profile">
  		<%if(session.getAttribute("currentUser")!=null){ %>
      <a href="profileCustomer.htm" class="btn">update profile</a>
      <div class="flex-btn">
        <a href="insertCustomer.htm" class="option-btn">register</a>
        <a href="login.htm" class="option-btn">login</a>
      </div>
      <a
        href="logout.htm"
        class="delete-btn"
        onclick="return confirm('logout from the website?');"
        >logout</a
      >
		<%}else{ %>
      <p>please login or register first!</p>
      <div class="flex-btn">
        <a href="insertCustomer.htm" class="option-btn">register</a>
        <a href="login.htm" class="option-btn">login</a>
      </div>
      <%} %>
    </div>
  </section>

</header>

