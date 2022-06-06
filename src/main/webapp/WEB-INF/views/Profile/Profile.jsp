<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Profile</title>
<%@ include file="/resources/Shared/head.jsp"%>
<style>
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
	border-radius: 5px;
}

.btn-submit:hover {
	background-color: #ccc;
	color: #000;
}
</style>
</head>
<body>
	<%@ include file="/resources/Shared/menu.jsp"%>

	<section>
		<div class="container-fluid">
			<div class="row">
				<div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
					<div class="card">
						<div class="card-body">
							<h3>Personal Information</h3>
							${messageAD}

						</div>
					</div>
				</div>
				<div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
					<div class="card rounded">
						<div class="card-body">
							<div class="table-responsive">
<%-- 								<c:forEach var="u" items="${Staff}"> --%>
									<table class="table table-striped bg-light text-center">

										<tbody>
											<tr>
												<td>Name</td>
												<td>${Staff.fullname}</td>


											</tr>
										</tbody>

										<tbody>
											<tr>
												<td>Phone</td>
												<td>${Staff.phone}</td>

											</tr>
										</tbody>
										<tbody>
											<tr>
												<td>Email</td>
												<td>${Staff.email}</td>

											</tr>
										</tbody>
										<tr>
											<td>AddRess</td>
											<td>${Staff.address}</td>

										</tr>
										<tbody>
											<tr>
												<td>Date of birth</td>
												<td>${Staff.birthday}</td>

											</tr>
										</tbody>
										<tr>

										</tr>
									</table>
									<a style="text-decoration: none;" class="btn btn-danger"
										href="staff/updateCurrent-${u.staffId}.htm">Edit Information</a>
									<a style="text-decoration: none;" class="btn btn-danger"
										href="staff/changePassword.htm">Change Password</a>
<%-- 								</c:forEach> --%>
							</div>
							<!-- pagination -->
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>
	<%@ include file="/resources/Shared/footer.jsp"%>
</body>
</html>