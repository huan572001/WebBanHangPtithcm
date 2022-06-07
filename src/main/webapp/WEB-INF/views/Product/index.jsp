
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh Sách Sản Phẩm</title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/resources/Shared/head.jsp"%>
<link rel="stylesheet" href="<c:url value='resources/css/product.css'/>">
</head>
<style>
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	line-height: 25px;
	border: 1px solid black;
	padding: 5px;
}

th {
	background-color: gray;
}

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
<body>
	<%@ include file="/resources/Shared/menu.jsp"%>
	<%@ include file="/resources/Shared/footer.jsp"%>

	<section>
		<div class="container-fluid">
			<div class="row">
				<div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
					<div class="card">
						<div class="card-body">
							<h3>Danh Sách Sản Phẩm</h3>

							<a href="staff/insertProduct.htm" style="text-decoration: none;"
								class="btn-submit">Thêm Sản Phẩm</a> <a href="staff/Product.htm"
								style="text-decoration: none;" class="btn-submit">Tải Lại</a>
						</div>
						<div class="col-xl-4"></div>

						<div class="col-xl-4 search ">
							<form method="post" action="staff/SearchNameProduct.htm">
								<div class="input-group">
									<input type="text" class="form-control search-input"
										placeholder="Search name product " name="name">
									<button type="submit" class="btn btn-light search-button">
										<i class="fas fa-search text-danger"></i>
									</button>
									<a href="staff/Product.htm" class="btn btn-danger">ALL</a>
								</div>
							</form>
						</div>
						${message }
					</div>

				</div>
				<div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
					<div class="card rounded">
						<div class="card-body">

							<table class="table table-hover">
								<tr>
									<th>MaSP</th>
									<th>TenSP</th>
									<th>GiaGoc</th>
									<th>GiaBan</th>
									<th>SLTon</th>
									<th>TrangThai</th>
									<th>HinhAnh</th>
									<th>Sửa/Thêm SL</th>
								</tr>
								<c:forEach items="${products}" var="u">
									<tr>
										<td>${u.productId}</td>
										<td>${u.name}</td>
										<td>${u.cost}</td>
										<td>${u.price}</td>
										<td>${u.quantity}</td>
										<td>${u.status}</td>
										<td><img style="width: 48px; height: 48px;" alt="hinh ne"
											src="files/${u.image}">
										<td><a href="staff/${u.productId}.htm"><i
												class="fas fa-edit fa-lg text-success mr-2"></i></a> 
<!-- 												<a -->
<%-- 											href="delete-${u.productId}.htm" --%>
<!-- 											onclick="return confirm('Are you sure you want to delete this item?');"> -->
<!-- 												<i class="fas fa-trash-alt fa-lg text-danger"></i> -->
<!-- 										</a> -->
										<a href="staff/plus-${u.productId}.htm"><i
												class="fas fa-solid fa-plus fa-lg text-success mr-2"></i></a>
										</td>

									</tr>
								</c:forEach>
							</table>



						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>