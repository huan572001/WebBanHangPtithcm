
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plus Quantity</title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="/../resources/Shared/head.jsp"%>

<style >
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
						<h3>PLus Quantity</h3>
							
					</div>
				</div>
			</div>
			<div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
				<div class="card rounded">
					<div class="card-body">

						<div>
							${message}
							<form:form action="staff/{productId}.htm" modelAttribute="product">
								<div style="display: none" class="input-group board-create__item">

									<label style="display: none"  class="desc-input">Mã Sản Phẩm:</label>
									<form:input placeholder="Vui lòng nhập mã sản phẩm"
										class="input-item " type="text" value="${productId}" path="productId" />
								</div>

								<div style="display: none"  class="input-group board-create__item">

									<label class="desc-input">Tên sản phẩm:</label>
									<form:input placeholder="Vui lòng điền tên sản phẩm"
										class="input-item " type="text" value="${name}" path="name" />
								</div>

								<div style="display: none"  class="input-group board-create__item">

									<label class="desc-input">Giá Gốc:</label>
									<form:input placeholder="Nhập số tiền" class="input-item "
										type="number" value="${cost}" path="cost" />
								</div>

								<div style="display: none"  class="input-group board-create__item">

									<label class="desc-input">Giá Bán:</label>
									<form:input placeholder="Nhập số tiền" class="input-item "
										type="number" value="${price}" path="price" />
								</div>

								<div  class="input-group board-create__item">

									<label class="desc-input">Quantity:</label>
									<form:input placeholder="Nhập số lượng" class="input-item "
										type="number" min="0" path="quantity" />
								</div>

								<div style="display: none"  class="input-group board-create__item">

									<label class="desc-input">Trạng Thái:</label>
									<form:input placeholder="Nhập trạng thái" class="input-item "
										 value="${status}" path="status" />
								</div>
								<div style="display: none"  class="input-group board-create__item">

									<label class="desc-input">Hình Ảnh:</label>
									<form:input placeholder="Điền Ảnh" class="input-item "
										type="text" value="${image}" path="image" />
								</div>
								<button name="btnCreate" type="submit" class="btn-submit">SAVE</button>
								<a style="text-decoration: none;" class="btn-submit"
									href="staff/Product.htm">Come Back</a>
							</form:form>


						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>