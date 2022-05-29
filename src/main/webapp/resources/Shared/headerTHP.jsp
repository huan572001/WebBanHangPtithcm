<header class="header">

	<a href="homeStore.htm" class="logo"> <i class="fas fa-store"></i>THP-STORE
	</a>
	<form action="" class="search-form">
		<input type="search" id="search-box" name="search"
			placeholder="search here..."> <a class="fas fa-search"
			href="shopProducts.htm"></a>
	</form>
	<div class="icons">
		<div id="menu-btn" class="fas fa-bars"></div>
		<div id="search-btn" class="fas fa-search"></div>
		<a href="login.htm" class="fas fa-user"></a> <a
			href="shopProducts.htm" class="fas fa-store"></a> <a href="cart.htm"
			class="fas fa-shopping-cart"></a> <span>
			${sessionScope.myCartNum}</span> <a href="logout.htm"
			class="fas fa-sign-out-alt"></a>
	</div>

</header>
