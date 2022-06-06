
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm Nhân Viên</title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="/../resources/Shared/head.jsp"%>

<link rel="stylesheet" href="<c:url value='resources/css/product.css'/>">
<style type="text/css">
.container {
	list-style: none;
	left: 500px;
}

.product-role {
	list-style: none;
}

.desc-input {
	margin-right: 10px;
	background-color: #ccc;
	padding-top: 4px;
	margin-right: 30px;
	letter-spacing: 1px;
	font-weight: 500;
	min-width: 200px;
	text-align: center;
	font-style: normal;
	box-shadow: 0 0 2px rgba(0, 0, 0, 0.6);
	border-radius: 4px;
}

.board-create__item {
	margin: 5px;
	display: flex;
	margin: 20px 0;
}

.input-item {
	flex: 1;
	font-style: italic;
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
</head>

<body>
	<%@ include file="/../resources/Shared/menu.jsp"%>
	<%@ include file="/../resources/Shared/footer.jsp"%>

	<section>
		<div class="container-fluid"></div>
		<div class="row">
			<div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
				<div class="card">
					<div class="card-body">
						<h3>Add Staff</h3>
					</div>
				</div>
			</div>
			<div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
				<div class="card rounded">
					<div class="card-body">
						${message} ${message1 } ${messageError}
						<form:form action="admin/insertStaff.htm" modelAttribute="staff">
							<div class="input-group board-create__item">
								<label class="desc-input">Fullname</label>
								<form:input 
									class="input-item " type="text" pattern="[A-Za-z]{2-50}"
									title="chỉ nhận các ký tự a-z" path="fullname" />
							</div>
							<div class="input-group board-create__item">
								<label class="desc-input">Phone Number</label>
								<form:input  class="input-item "
									type="text" pattern="[0]{1}[0-9]{9}" title="0xxx xxx xxx"
									path="phone" />
							</div>
							<div class="input-group board-create__item">
								<label class="desc-input">Gender</label>
								<form:radiobutton path="gender" value="true" label="Nam"/>
								<form:radiobutton path="gender" value="false" label="nu"/>
							</div>
							<div class="input-group board-create__item">
								<label class="desc-input">Address</label>
								<form:input  class="input-item "
									path="address" />
							</div>
							<div class="input-group board-create__item">
								<label class="desc-input">Date of Birth</label> <input type="date"
									name="birthday1" />
							</div>
							<div class="input-group board-create__item">
								<label class="desc-input">Email</label>
								<form:input type="email" placeholder="EX: xxx@gamil.com"
									class="input-item " path="email" />
							</div>
							<div>
								<button name="btnCreate" type="submit" class="btn-submit">Save</button>
								<a style="text-decoration: none;" class="btn-submit"
									href="admin/User.htm">List Staff</a>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>