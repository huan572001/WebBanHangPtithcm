<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Order management</title>
<%@ include file="/resources/Shared/head.jsp"%>
</head>
<body>
	<%@ include file="/resources/Shared/menu.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
				<div class="card">
					<div class="card-body">
						<h3>Order management</h3>
						<div class="col-xl-4 search ">
							<form method="post" action="staff/SearchPhoneCustomerOrder.htm">
								<div class="input-group">
									<input type="text" class="form-control search-input"
										placeholder="Search " name="phone">
									<button type="submit" class="btn btn-light search-button">
										<i class="fas fa-search text-danger"></i>
									</button>
									<a href="staff/Order.htm" class="btn btn-danger">ALL</a>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>
			<div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
				<div class="card rounded">
					<div class="card-body">

						<div class="table-responsive">
							<table class="table table-striped bg-light text-center">
								<thead>
									${message}
									<tr class="text-muted">
										<th>OrderId</th>
										<th>CustomerId</th>
										<th>Fullname</th>
										<th>Phone</th>
										<th>Email</th>
										<th>Status</th>
										<th>Detail</th>
										<th>Confirm/Cancel</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="u" items="${Order}">
										<tr>
											<td>${u.orderId}</td>
											<td>${u.getCustomer().getCustomerId()}</td>
											<td>${u.getCustomer().getFullname()}</td>
											<td>${u.getCustomer().getPhone()}</td>
											<td>${u.getCustomer().getEmail()}</td>
											<td>${u.status}</td>
											<td><a href="staff/detailsOrder-${u.orderId}.htm">
													See details</a></td>
											<td><a href="staff/closeOrder-${u.orderId}.htm"> <i
													class="fas fa-solid fa-check fa-lg text-success mr-2"></i>
											</a> <a href="staff/orderCancel-${u.orderId}.htm"> <i
													class="fas fa-trash-alt fa-lg text-danger"></i>
											</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- pagination -->

					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/resources/Shared/footer.jsp"%>
</body>
</html>