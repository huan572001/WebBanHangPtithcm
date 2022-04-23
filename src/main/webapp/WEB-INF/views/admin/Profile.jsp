<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="/resources/Shared/head.jsp"%>
</head>
<body>
	<%@ include file="/resources/Shared/menu.jsp"%>

	<section>
		<div class="container-fluid">
			<div class="row">
				<div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
					<div class="card">
						<div class="card-body">
							<h3>Profile</h3>
						</div>
					</div>
				</div>
				<div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
					<div class="card rounded">
						<div class="card-body">
							<div class="table-responsive">

								<table class="table table-striped bg-light text-center">
									<c:forEach var="u" items="${Staff}">
										<tbody>
											<tr>
												<td>name</td>
												<td>${u.fullname}</td>
												<td href="#" data-toggle="tooltip" title="edit"
													data-html="true" data-placement="top"> <i
														class="fas fa-edit fa-lg text-success mr-2"
														data-toggle="modal" data-target="#confirm"></i>
												</td>

											</tr>
										</tbody>

										<tbody>
											<tr>
												<td>Phone</td>
												<td>${u.phone}</td>
												<td><a href="#" data-toggle="tooltip" title="edit"
													data-html="true" data-placement="top"> <i
														class="fas fa-edit fa-lg text-success mr-2"
														data-toggle="modal" data-target="#confirm"></i>
												</a></td>
											</tr>
										</tbody>
										<tbody>
											<tr>
												<td>Email</td>
												<td>@gamil.com</td>
												<td><a href="#" data-toggle="tooltip" title="edit"
													data-html="true" data-placement="top"> <i
														class="fas fa-edit fa-lg text-success mr-2"
														data-toggle="modal" data-target="#confirm"></i>
												</a></td>
											</tr>
										</tbody>
										<tr>
											<td>AddRess</td>
											<td>${u.address}</td>
											<td><a href="#" data-toggle="tooltip" title="edit"
												data-html="true" data-placement="top"> <i
													class="fas fa-edit fa-lg text-success mr-2"
													data-toggle="modal" data-target="#confirm"></i>
											</a></td>
										</tr>
										<tbody>
											<tr>
												<td>Date of birth</td>
												<td>${u.birthday}</td>
												<td><a href="#" data-toggle="tooltip" title="edit"
													data-html="true" data-placement="top"> <i
														class="fas fa-edit fa-lg text-success mr-2"
														data-toggle="modal" data-target="#confirm"></i>
												</a></td>
											</tr>
										</tbody>
									</c:forEach>
									<%-- 									<c:forEach var="u" items="${Staff}"> --%>
									<!-- 										<tr> -->
									<%-- 											<td>${u.fullname}</td> --%>
									<%-- 											<td>${u.phone}</td> --%>
									<%-- 											<td>${u.address}</td> --%>
									<!-- 										</tr> -->
									<%-- 									</c:forEach> --%>
								</table>

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