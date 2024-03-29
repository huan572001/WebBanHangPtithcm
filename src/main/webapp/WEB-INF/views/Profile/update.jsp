
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="/../resources/Shared/head.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chỉnh Sửa Thông Tin</title>
<style>
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
						<h3>Edit Personal Information</h3>

					</div>
				</div>
			</div>
			<div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
				<div class="card rounded">
					<div class="card-body">

						<div>
							${message}${messageError }
							<form:form action="staff/updateCurrent-{staffId}.htm"
								modelAttribute="profile">
								<div style="display: none"
									class="input-group board-create__item">
									<label class="desc-input">Staff Code:</label>
									<form:input placeholder="Nhập mã nhan viên" class="input-item"
										type="text" path="staffId" value="${staffId}" />
								</div>
								<div class="input-group board-create__item">
									<label class="desc-input">Full Name</label>
									<form:input placeholder="Nhập mã nhân viên" class="input-item "
										type="" path="fullname" />
								</div>
								<div class="input-group board-create__item">
									<label class="desc-input">Phone Number</label>
									<form:input placeholder="Enter your phone number"
										class="input-item " path="phone" />
								</div>
								<div class="input-group board-create__item">
									<label class="desc-input">Gender</label>
									<form:radiobutton path="gender" value="true" label="Male" />
									<form:radiobutton path="gender" value="false" label="Female" />
								</div>
								<div class="input-group board-create__item">
									<label class="desc-input">Address</label>
									<form:input placeholder="Enter address" class="input-item "
										path="address" />
								</div>
								<div class="input-group board-create__item">
									<label class="desc-input">Birthday</label> <input type="date"
										name="birthday1" />
									<%-- 									<form:input type="date" data-date="" data-date-format="MM/DD/YY" placeholder="Nhập ngày sinh" class="input-item " --%>
									<%-- 										path="birthday" /> --%>
								</div>
								<div class="input-group board-create__item">
									<label class="desc-input">Email</label>
									<form:input type="email" placeholder="EX: xxx@xxx.com"
										class="input-item " path="email" />
								</div>
								<div>
									<button name="btnCreate" type="submit" class="btn btn-dark">
										Save Changes</button>
									<a style="text-decoration: none;" class="btn btn-dark"
										href="staff/profile.htm">Come Back</a>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>