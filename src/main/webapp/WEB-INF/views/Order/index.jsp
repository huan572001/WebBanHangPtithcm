<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Đơn Đặt Hàng</title>
<%@ include file="/resources/Shared/head.jsp"%>
</head>
<body>
	<%@ include file="/resources/Shared/menu.jsp"%>
	<div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
		<div class="card rounded">
			<div class="card-body">
					<div class="col-xl-4 search ">
					<form method="post" action="SearchPhoneCustomerOrder.htm">
						<div class="input-group">
							<input type="text" class="form-control search-input"
								placeholder="Search " name="phone">
							<button type="submit" class="btn btn-light search-button">
								<i class="fas fa-search text-danger"></i>
							</button>
							<a href="Customer.htm" class="btn btn-danger">ALL</a>
						</div>
					</form>
				</div>
				<div class="table-responsive">
					<table class="table table-striped bg-light text-center">
						<thead>
						${message}
							<tr class="text-muted">
								<th>Mã Đơn Đặt Hàng</th>
								<th>Mã Khách Hàng</th>
								<th>Tên Khách Hàng</th>
								<th>SDT</th>
								<th>Email</th>
								<th>Trạng Thái</th>
								<th>Chi Tiết</th>
								<th>Xác Nhận/Hủy</th>
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
									<td><a href="detailsOrder-${u.orderId}.htm">Xem Chi
											Tiết</a></td>
									<td>
										<a href="closeOrder-${u.orderId}.htm"> <i
											class="fas fa-solid fa-check fa-lg text-success mr-2"></i>
										</a> 
										<a href="orderCancel-${u.orderId}.htm">
										<i class="fas fa-trash-alt fa-lg text-danger"></i> 
										</a>
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