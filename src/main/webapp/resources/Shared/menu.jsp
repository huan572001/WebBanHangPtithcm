<nav class="navbar navbar-expand-md navbar-light">
	<button class="navbar-toggler ml-auto mb-2 bg-light" type="button"
		data-toggle="collapse" data-target="#myNavbar"
		aria-controls="myNavbar" aria-expanded="false">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="myNavbar">
		<div class="container-fluid">
			<div class="row">
				<!--sidebar-->
				<div class="col-xl-2 col-lg-3 col-md-4 sidebar fixed-top ">
					<a href="#"
						class="navbar-brand text-white d-block
                        mx-auto text-center py-3 mb-4 bottom-border">StoreManager</a>
					<div class="bottom-border pb-3">
						<img src="/resources/images/admin.jpg" width="50"
							class="rounded-circle mr-3"> <a href="#" class="text-white">HUAN</a>
					</div>
					<ul class="navbar-nav flex-column mt-4">
						<li class="nav-item"><a href="#"
							class="nav-link
                                text-white p-3 mb-2 current">
								<i
								class="fas fa-home test-light
                                fa-lg mr-3"></i>Dashboard
						</a></li>
						<li class="nav-item"><a href="profile.htm"
							class="nav-link
                                    text-white p-3 mb-2 sidebar-link">
								<i
								class="far fa-id-card test-light
                                    fa-lg mr-3"></i>Profile
						</a></li>
						<li class="nav-item"><a href="Product.htm"
							class="nav-link
                                     text-white p-3 mb-2 sidebar-link">
								<i
								class="fab fa-product-hunt test-light
                                     fa-lg mr-3"></i>Product
						</a></li>
						<li class="nav-item"><a href="Order.htm"
							class="nav-link
                                     text-white p-3 mb-2 sidebar-link">
								<i
								class="fas fa-edit test-light
                                    fa-lg mr-3"></i>
								Order
						</a></li>
						<li class="nav-item"><a href="User.htm"
							class="nav-link
                                     text-white p-3 mb-2 sidebar-link">
								<i
								class="fas fa-user test-light
                                     fa-lg mr-3"></i>User
						</a></li>
						<li class="nav-item"><a href="Receipt.htm"
							class="nav-link
                                    text-white p-3 mb-2 sidebar-link">
								<i
								class="fas fa-receipt test-light
                                    fa-lg mr-3"></i>Receipt
						</a></li>
						<li class="nav-item"><a href="Customer.htm"
							class="nav-link
                                    text-white p-3 mb-2 sidebar-link">
								<i
								class="fas fa-users test-light
                                    fa-lg mr-3"></i>Customer
						</a></li>
					</ul>
				</div>
				<!--top-nav-->
				<div
					class="col-xl-10 col-lg-9 col-md-8 ml-auto bg-dark fixed-top py-2 top-navbar">
					<div class="row align-items-center">
						<div class="col-md-6">
							<h4
								class="text-light text-uppercase
                                mb-0">
								Dashboard</h4>
						</div>
						<div class="col-md-6">
							<ul class="navbar-nav">
								<li class="nav-item  ml-md-auto"><a href="#"
									class="nav-link" data-toggle="modal" data-target="#sign-out"><i
										class="fas fa-sign-out-alt text-danger fa-lg"></i></a></li>
							</ul>
						</div>
					</div>

				</div>
				<!--end of top-nav-->
			</div>
		</div>
	</div>
</nav>
<!-- modal-->
<div class="modal fade" id="sign-out">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">Want to leave?</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">Press logout to leave</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success" data-dismiss="modal">
					Stay Here</button>
				<a class="btn btn-danger" href="${pageContext.request.contextPath}/logout.htm">Logout</a>
			</div>
		</div>
	</div>
</div>
<!--end of modal-->

<!-- modal-->

<!--end of modal-->