<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="/resources/Shared/head.jsp"%>
</head>
<body>
	<%@ include file="/resources/Shared/menu.jsp"%>
	<div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
		<div class="card rounded">
			<div class="card-body">
					<div class="col-xl-4 search ">
					<form method="post" action="admin/SearchPhoneCustomer.htm">
						<div class="input-group">
							<input type="text" class="form-control search-input"
								placeholder="Search " name="phone">
							<button type="submit" class="btn btn-light search-button">
								<i class="fas fa-search text-danger"></i>
							</button>
							<a href="admin/Customer.htm" class="btn btn-danger">ALL</a>
						</div>
					</form>
				</div>
				<div class="table-responsive">
					<table class="table table-striped bg-light text-center">
						<thead>
							<tr class="text-muted">
								<th>ID</th>
								<th>Fullname</th>
								<th>Phone</th>
								<th>Username</th>
								<th>Email</th>
								<th>Purchase Order</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="u" items="${Customer}">
								<tr>
									<td>${u.customerId}</td>
									<td>${u.fullname}</td>
									<td>${u.phone}</td>
									<td>${u.account.username}</td>
									<td>${u.email}</td>
									<td>
										<a href="admin/purchaseOrder-${u.customerId}.htm">Details</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- pagination -->
				<nav>
					<ul class="pagination justify-content-center">
						<li class="page-item"><a href="#" class="page-link py-2 px-3">
								<span>&laquo;</span>
						</a></li>

						<li class="page-item active"><a href="#"
							class="page-link py-2 px-3"> 1 </a></li>
						<li class="page-item"><a href="#" class="page-link py-2 px-3">
								2 </a></li>
						<li class="page-item"><a href="#" class="page-link py-2 px-3">
								3 </a></li>
						<li class="page-item"><a href="#" class="page-link py-2 px-3">
								<span>&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>

	
	<%@ include file="/resources/Shared/footer.jsp"%>
</body>
</html>