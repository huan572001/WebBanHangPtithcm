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
	dollars: before{ content:'$';
}
}
.abc{
	margin-left: 15px;
}
</style>
<title>Hóa Đơn</title>
<%@ include file="/resources/Shared/head.jsp"%>
<link rel='stylesheet prefetch'
	href='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css'>
</head>
<body>
	<%@ include file="/resources/Shared/menu.jsp"%>
	<div class="container-fluid">
		<div style class="row">
			<div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
				<div class="card">
					<div class="card-body">
						<h3>Receipt Management</h3>
						<div class="row">
							<div class="col-xl-4 search abc">
								<form method="post" action="staff/ReceiptSearchCustomer.htm">
									<div class="input-group">
										<input type="text" class="form-control search-input"
											placeholder="Customer Id ..." name="customer">
										<button type="submit" class="btn btn-light search-button">
											<i class="fas fa-search text-danger"></i>
										</button>
									</div>
								</form>
							</div>
							<div class="col-xl-7">
								<form method="post" action="staff/ReceiptSearchDate.htm">
									<div class="input-group">
										<label>From</label> <input type="date" class="form-control"
											name="sinceDay"> <label>To</label> <input type="date"
											class="form-control" name="toTheDay">
										<button type="submit" class="btn btn-light search-button">
											<i class="fas fa-search text-danger"></i>
										</button>
									</div>
								</form>
							</div>
							<div class="col-xl-0.5">
								<a href="staff/Receipt.htm" class="btn btn-danger">ALL</a>
							</div>
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
									<tr class="text-muted">
										<th>Receipt Id</th>
										<th>Customer Id</th>
										<th>Staff Id</th>
										<th>Date</th>
										<th>Total</th>
										<th>Details</th>
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
											<td><a href="staff/details-${u.receiptId}.htm">See
													Details</a></td>

										</tr>
									</c:forEach>
								</tbody>
							</table>
							<a href="staff/Turnover.htm" style="text-decoration: none;"
								class="btn-submit">Turnover</a>
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