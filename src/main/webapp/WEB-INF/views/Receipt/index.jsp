<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Hóa Đơn</title>
<%@ include file="/resources/Shared/head.jsp"%>
<link rel='stylesheet prefetch'
	href='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css'>
</head>
<body>
	<%@ include file="/resources/Shared/menu.jsp"%>
	<div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
		<div class="card rounded">
			<div class="card-body">
				<div class="row">
					<div class="col-xl-4 search ">
						<form method="post" action="ReceiptSearchCustomer.htm">
							<div class="input-group">
								<input type="text" class="form-control search-input"
									placeholder="nhap ma nhan khach hang" name="customer">
								<button type="submit" class="btn btn-light search-button">
									<i class="fas fa-search text-danger"></i>
								</button>
							</div>
						</form>
					</div>
					<div class="col-xl-7">
						<form method="post" action="ReceiptSearchDate.htm">
							<div class="input-group">
								<label>Tu ngay</label>
								<input type="date" class="form-control" name="sinceDay">
								<label>Den ngay</label>
								<input type="date" class="form-control" name="toTheDay">
								<button type="submit" class="btn btn-light search-button">
									<i class="fas fa-search text-danger"></i>
								</button>
							</div>
						</form>
					</div>
					<div class="col-xl-1">
						<a href="Receipt.htm" class="btn btn-danger">ALL</a>
					</div>
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
							<c:forEach var="u" items="${Receipt}">
								<tr>
									<td>${u.receiptId}</td>
									<td>${u.customerId}</td>
									<td>${u.staffId}</td>
									<td>${u.date}</td>
									<td>${u.total}</td>
									<td><a href="details-${u.receiptId}.htm">Xem Chi Tiết</a></td>

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