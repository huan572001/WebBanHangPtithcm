<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>User Management</title>
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
		<div class="card">
			<div class="card-body">
				<h3>User Management</h3>
				<a href="admin/insertStaff.htm" style="text-decoration: none;"
					class="btn-submit">Add Staff</a>
				<div class="col-xl-4 search ">
					<form method="post" action="admin/SearchPhoneStaff.htm">
						<div class="input-group">
							<input type="text" class="form-control search-input"
								placeholder="Search " name="phone">
							<button type="submit" class="btn btn-light search-button">
								<i class="fas fa-search text-danger"></i>
							</button>
							<a href="admin/User.htm" class="btn btn-danger">ALL</a>
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
							<tr class="text-muted">
								<th>ID</th>
								<th>Name</th>
								<th>Phone</th>
								<th>Gender</th>
								<th>Status</th>
								<th>address</th>
								<th>birthday</th>
								<th>action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="u" items="${Staff}">
								<tr>
									<td>${u.staffId}</td>
									<td>${u.fullname}</td>
									<td>${u.phone}</td>
									<td>${u.gender}</td>
									<td>${u.status}</td>
									<td>${u.address}</td>
									<td>${u.birthday}</td>
									<td><a href="admin/update-${u.staffId}.htm"><i
											class="fas fa-edit fa-lg text-success mr-2"></i></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- pagination -->

			</div>
		</div>
	</div>


	<%@ include file="/resources/Shared/footer.jsp"%>
</body>
</html>