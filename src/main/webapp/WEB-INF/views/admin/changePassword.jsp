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

	<div class="container-fluid">
		<div class="row">
			<div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
				<div class="card">
					<div class="card-body">
						<h3>Change Password</h3>
					</div>
				</div>
			</div>
			<div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
				<div class="card">
					<div class="card-body">
						<form role="form" action="" method="post" enctype="">
							<div>${message }</div>
							<div class="form-group">
								<label>Old password</label> <input class="form-control"
									type="password" value="" name="oldpassword"
									placeholder="enter old password" />
							</div>
							<div class="form-group">
								<label>New password</label> <input
									pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"
									class="form-control"
									title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters"
									value="" type="password" name="NewPassword"
									placeholder="Enter your new password" />
							</div>
							<div class="form-group">
								<br> <label >Confirm new password</label> <input
									class="form-control" value="" type="password"
									name="Reppassword" placeholder="Confirm your new password" />
								<br>
								<button type="submit" class="btn btn-primary btn-default"
									style="padding: 7px 32px 7px; font-size: medium;">Save</button>
								<a class="btn btn-primary btn-default"
									style="padding: 7px 32px 7px; font-size: medium;"
									href="staff/profile.htm">Come back</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<%@ include file="/resources/Shared/footer.jsp"%>
</body>
</html>