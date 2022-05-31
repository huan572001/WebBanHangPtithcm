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
<%@ include file="/resources/Shared/head.jsp"%>
</head>
<body>
	<%@ include file="/resources/Shared/menu.jsp"%>
	<div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
		<div class="card rounded">
			<div class="card-body">

				<div class="table-responsive">
					<table class="table table-striped bg-light text-center">
						<thead>
							<tr class="text-muted">

								<th>Mã Sản Phẩm</th>
								<th>Tên Sản Phẩm</th>
								<th>Số Lượng</th>
								<th>Đơn Giá</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach  items="${ReceiptDetails}" var="u">
								<tr>
									<td>${u.getProduct().getProductId()}</td>
									<td>${u.getProduct().getName()}</td>
									<td>${u.quantity}</td>
									<td>${u.getProduct().getPrice()}</td>
									
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<a href="staff/Receipt.htm" style="text-decoration: none;"
						class="btn-submit">Quay Lại</a>
				</div>
				<!-- pagination -->
				
			</div>
		</div>
	</div>


	<%@ include file="/resources/Shared/footer.jsp"%>
</body>
</html>