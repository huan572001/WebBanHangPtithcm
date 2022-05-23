<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
.btn-submit {
	color: #fff;
	background-color: #000;
	text-decoration: none;
	padding: 11px 16px;
	display: inline-block;
	margin-top: 15px;
	border: none;
	appearance: none;
	-webkit-appearance: none;
}

.btn-submit:hover {
	background-color: #ccc;
	color: #000;
}
</style>
<title>Hóa Đơn</title>
<%@ include file="/resources/Shared/head.jsp"%>
</head>
<body>
	<%@ include file="/resources/Shared/menu.jsp"%>
	<div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
		<div class="card rounded">
			<div class="card-body">
				<div class="col-xl-4 search ">
					<form>
						<div class="input-group">
							<input type="text" class="form-control search-input"
								placeholder="Search...">
							<button type="button" class="btn btn-light search-button">
								<i class="fas fa-search text-danger"></i>
							</button>
						</div>
					</form>
				</div>
				<div class="table-responsive">
					<table class="table table-striped bg-light text-center">
						<thead>
							<tr class="text-muted">
								<th>Mã Hóa Đơn</th>
								<th>Mã Khách Hàng</th>
								<th>Mã Nhân Viên</th>
								<th>Ngày Lập</th>
								<th>Tổng Tiền</th>
								<th>Chi Tiết</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="u" items="${purchaseOrder}">
								<tr>
									<td>${u.receiptId}</td>
									<td>${u.customerId}</td>
									<td>${u.staff.staffId}</td>
									<td>${u.date}</td>
									<td>${u.total}</td>
									<td><a href="detailsPurchaseOrder-${u.receiptId}.htm">Xem Chi Tiết</a></td>
							
								</tr>
							</c:forEach>
						</tbody>
					</table>
						<a href="Customer.htm" style="text-decoration: none;"
						class="btn-submit">Quay Lại</a>
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