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
					<div class="col-xl-5.5">
						<form method="post" action="staff/turnoverSearchDate.htm">
							<div class="input-group">
								<label>From</label> <input type="date" class="form-control"
									name="sinceDay"> <label>To</label> <input
									type="date" class="form-control" name="toTheDay">
								<button type="submit" class="btn btn-light search-button">
									<i class="fas fa-search text-danger"></i>
								</button>
							</div>
						</form>
					</div>
					<div class="col-xl-0.5">
						<form method="post" action="staff/turnoverSearchMonth.htm">
							<input style="display: none" type="text" class="form-control"
									name="timePattern" value="1">
							<button type="submit" class="btn btn-light search-button">
									DAY
								</button>
						</form>
					</div>
					<div class="col-xl-1">
						<form method="post" action="staff/turnoverSearchMonth.htm">
							<input style="display: none" type="text" class="form-control"
									name="timePattern" value="7">
							<button type="submit" class="btn btn-light search-button">
									WEEK
								</button>
						</form>
					</div>
					<div class="col-xl-0.5">
						<form method="post" action="staff/turnoverSearchMonth.htm">
							<input style="display: none" type="text" class="form-control"
									name="timePattern" value="30">
							<button type="submit" class="btn btn-light search-button">
									MONTH
								</button>
						</form>
					</div>
					<div class="col-xl-1">
						<form method="post" action="staff/turnoverSearchMonth.htm">
							<input style="display: none" type="text" class="form-control"
									name="timePattern" value="365">
							<button type="submit" class="btn btn-light search-button">
									YEAR
								</button>
						</form>
					</div>
					<div class="col-xl-1">
						<a href="staff/Turnover.htm" class="btn btn-danger">ALL</a>
					</div>
				</div>
				<div class="table-responsive">
					<table class="table table-striped bg-light text-center">
						<thead>
							<tr class="text-muted">
								<th>Turnove</th>
								<th>Profit</th>
							</tr>
						</thead>
						<tbody>

							<tr>
								<td>${turnover}</td>
								<td>${profit}</td>


							</tr>

						</tbody>
					</table>
					<table class="table table-striped bg-light text-center">
						<thead>
							<tr class="text-muted">
								<th>Staff Id</th>
								<th>Customer Id</th>
								<th>Turnover</th>
								<th>Profit</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach var="u" items="${staffTurnover}">
								<tr>
									<td>${u.staffId}</td>
									<td>${u.staffName}</td>
									<td>${u.turnover}</td>
									<td>${u.profit}</td>

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