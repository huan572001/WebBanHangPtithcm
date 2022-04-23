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
								<th>ID</th>
								<th>Name</th>
								<th>Phone</th>
								<th>Email</th>
								<th>address</th>
								<th>birthday</th>
								<th>action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="u" items="${NhanVien}">
								<tr>
									<td>${u.maNV}</td>
									<td>${u.hoTen}</td>
									<td>${u.SDT}</td>
									<td>${u.phai}</td>
									<td>${u.diaChi}</td>
									<td>${u.ngaySinh}</td>
									<td class="order-edit"><p data-toggle="tooltip"
											title="edit" data-html="true" data-placement="top">
											<i class="fas fa-edit fa-lg text-success mr-2"
												data-toggle="modal" data-target="#confirm"></i>
										</p>
										<p data-toggle="tooltip" title="<h6>delete<h6>"
											data-html="true" data-placement="top">
											<i class="fas fa-trash-alt fa-lg text-danger"></i>
										</p></td>
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
	</div>
	</div>
	<!-- modol confirm" -->
	<div class="modal fade" id="confirm">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Confirm order</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<div class="d-grid gap-2">
						<p>Id:</p>
						<div class="alert alert-dark cofirm" role="alert">1</div>
						<p>Name:</p>
						<div class="alert alert-dark cofirm" role="alert">joni</div>
						<p>Phone:</p>
						<div class="alert alert-dark cofirm" role="alert">035465165</div>
						<p>Email:</p>
						<div class="alert alert-dark cofirm" role="alert">@gmail.com</div>
						<p>Address:</p>
						<div class="alert alert-dark cofirm" role="alert">H7/60 Man
							Thien Tang nhon Phu A TP.Thu Duc</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" data-dismiss="modal">
						Confirm</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">
						Detail</button>
				</div>
			</div>
		</div>
	</div>
	<!--end of modol confirm" -->
	<%@ include file="/resources/Shared/footer.jsp"%>
</body>
</html>