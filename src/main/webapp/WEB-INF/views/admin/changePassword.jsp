<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.Random,java.text.*"%>
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
				
					<form role="form" action="" method="post" enctype="">
					<div>${message }</div>
						<div class="form-group">
							<label>Mật khẩu cũ</label> <input class="form-control"
								type="password" value="" name="oldpassword"
								placeholder="enter old password" />
						</div>
						<div class="form-group">
							<label>Mật khẩu mới</label> <input
								pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"
								class="form-control"
								title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters"
								value="" type="password" name="NewPassword"
								placeholder="Enter your new password" />
						</div>
						<div class="form-group">
							<br> <label>Xác nhận mật khẩu mới</label> <input
								class="form-control" value="" type="password" name="Reppassword"
								placeholder="Confirm your new password" /> <br>
							<button type="submit" class="btn btn-primary btn-default"
								style="padding: 7px 32px 7px; font-size: medium;">Save</button>
					</form>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/resources/Shared/footer.jsp"%>
</body>
</html>