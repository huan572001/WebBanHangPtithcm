
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
						<h3>Update Product</h3>
							
					</div>
				</div>
			</div>
			<div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
				<div class="card rounded">
					<div class="card-body">

						<div>
							${message}
							<form:form action="{productId}.htm" modelAttribute="product">
								<div style="display: none" class="input-group board-create__item">

									<label class="desc-input">Mã Sản Phẩm:</label>
									<form:input placeholder="Vui lòng nhập mã sản phẩm"
										class="input-item " type="text" path="productId" />
								</div>

								<div class="input-group board-create__item">

									<label class="desc-input">Tên sản phẩm:</label>
									<form:input placeholder="Vui lòng điền tên sản phẩm"
										class="input-item " type="text" path="name" />
								</div>

								<div class="input-group board-create__item">

									<label class="desc-input">Giá Gốc:</label>
									<form:input placeholder="Nhập số tiền" class="input-item "
										type="number" min="0" path="cost" />
								</div>

								<div class="input-group board-create__item">

									<label class="desc-input">Giá Bán:</label>
									<form:input placeholder="Nhập số tiền" class="input-item "
										type="number" min="0" path="price" />
								</div>

								<div class="input-group board-create__item">

									<label class="desc-input">Số Lượng Tồn:</label>
									<form:input placeholder="Nhập số lượng" class="input-item "
										type="number" min="0" path="quantity" />
								</div>

								<div class="input-group board-create__item">

									<label class="desc-input">Trạng Thái:</label>
										<form:radiobutton path="status" value="true" label="Kích hoạt" />
									<form:radiobutton path="status" value="false"
										label="Huy kích hoạt" />
								</div>
								<div class="input-group board-create__item">

									<label class="desc-input">Hình Ảnh:</label>
									<input class="input-item "
										type="file" name="photo" />
								</div>
								<div class="input-group board-create__item">

									<label class="desc-input">Mo ta</label>
									<form:input placeholder="Vui lòng điền mo ta san pham"
										class="input-item " type="text" path="description" />
								</div>
								<button name="btnCreate" type="submit" class="btn-submit">Lưu Thay Đổi</button>
								<a style="text-decoration: none;" class="btn-submit"
									href="Product.htm">Danh Sách Sản Phẩm</a>
							</form:form>


						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>