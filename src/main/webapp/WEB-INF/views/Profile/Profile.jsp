<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Thông Tin Cá Nhân</title>
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
							<h3>Thông Tin Cá Nhân</h3>
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
												<td>name</td>
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



										<%-- 									<c:forEach var="u" items="${Staff}"> --%>
										<!-- 										<tr> -->
										<%-- 											<td>${u.fullname}</td> --%>
										<%-- 											<td>${u.phone}</td> --%>
										<%-- 											<td>${u.address}</td> --%>
										<!-- 										</tr> -->
										<%-- 									</c:forEach> --%>
									</table>
									<a style="text-decoration: none;" class="btn btn-danger"
										href="updateCurrent-${u.staffId}.htm">Sửa Thông Tin</a>
									<a style="text-decoration: none;" class="btn btn-danger"
										href="changePassword.htm">Đổi Mật Khẩu</a>
<%-- 								</c:forEach> --%>
							</div>
							<!-- pagination -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- modol edit" -->
		<div class="modal fade" id="confirm">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">EDIT</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<table class="table table-striped bg-light text-center">
							<tr>
								<td>Name</td>
								<td></td>
							</tr>
							<tr>
								<td>New name</td>
								<td>
									<form action="">
										<input type="text" id="fname" name="fname" value="">

									</form>
								</td>
							</tr>
						</table>

					</div>
					<div class="modal-footer">
						<!-- <button type="button" class="btn btn-success"
                                data-dismiss="modal">
                                Save
                        </button> -->
						<input type="submit" value="Save">
						<button type="button" class="btn btn-light" data-dismiss="modal">
							Cancel</button>
					</div>
				</div>
			</div>
		</div>
		<!--end of modol edit" -->
	</section>
	<%@ include file="/resources/Shared/footer.jsp"%>
</body>
</html>