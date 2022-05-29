<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
.dollars:before { content:'$'; }
}
</style>
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
						<form method="post" action="staff/ReceiptSearchCustomer.htm">
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
						<form method="post" action="staff/ReceiptSearchDate.htm">
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
						<a href="staff/Receipt.htm" class="btn btn-danger">ALL</a>
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
									<td>${u.getStaff().staffId}</td>
									<td>${u.date}</td>
									<td class="dollars">${u.total}</td>
									<td><a href="staff/details-${u.receiptId}.htm">Xem Chi Tiết</a></td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
					<a href="staff/Turnover.htm" style="text-decoration: none;"
								class="btn-submit">Doanh Thu</a>
				</div>
				<!-- pagination -->
			
			</div>
		</div>
	</div>


	<%@ include file="/resources/Shared/footer.jsp"%>
</body>
</html>