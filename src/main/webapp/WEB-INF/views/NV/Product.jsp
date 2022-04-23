
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link  href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='resources/css/admin.css'/>">
    <link rel="stylesheet" href="<c:url value='resources/css/product.css'/>">
    <!-- <link rel="stylesheet" href="Profile.html"> -->
    <title>Document</title>
</head>
<body>
    <%@ include file="/resources/Shared/menu.jsp"%>
    <!-- Receipt  -->
    <!-- end of Receipt -->
    <!-- footer -->
    <!-- <footer>
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
                    <div class="row border-top pt-3">
                        <div class="col-lg-6 text-center">
                            <ul class="list-inline">
                                <li class="list-inline-item mr-2">
                                    <a href="#" class="text-dark">CodeAndCreate</a>
                                </li>
                                <li class="list-inline-item mr-2">
                                    <a href="#" class="text-dark">About</a>
                                </li>
                                <li class="list-inline-item mr-2">
                                    <a href="#" class="text-dark">Support</a>
                                </li>

                                <li class="list-inline-item mr-2">
                                    <a href="#" class="text-dark">Blog</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-lg-6 text-center">
                            <p>
                                &copy; 2018 Copyright. Made With <i class="fas fa-heart text-danger"></i><span class="text-success">CodeAndCreate</span>
                            </p>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </footer> -->
    <!-- end of footer -->
    <section>
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
                    <div class="card">
                        <div class="card-body">
                          <h3>Product Create</h3>
                        </div>
                    </div>
                </div>
                <div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
                    <div class="card rounded">
                        <div class="card-body">
                            

                                

                                <div>
                                    <div class="input-group board-create__item">
                                        <i class="desc-input">Tên sản phẩm</i>
                                        <input type="text" class=" input-item " placeholder="vui lòng điền tên sản phẩm">
                                       
                                    </div>
                                    <div class="input-group board-create__item">
                                        <i class="desc-input">Giá</i>
                                        <input type="text" class=" input-item " placeholder="Nhập số tiền">
                                       
                                    </div>
                                    <div class="input-group board-create__item">
                                        <i class="desc-input">Giảm giá</i>
                                        <input type="text" class=" input-item " placeholder="Nhập số tiền">
                                       
                                    </div>
                                    <div class="input-group board-create__item">
                                        <i class="desc-input">Mô tả</i>
                                        <input type="text" class=" input-item " placeholder="Nhập mô tả">
                                       
                                    </div>
                                    <div class="input-group board-create__item">
                                        <i class="desc-input">Số lượng tồn</i>
                                        <input type="text" class=" input-item " placeholder="Nhập số lượng">
                                       
                                    </div>
                                    <div class="input-group board-create__item">
                                        <i class="desc-input">Hình ảnh</i>
                                        <input type="text" class=" input-item " placeholder="Tải ảnh lên">
                                       
                                    </div> 
                                    <div class="input-group board-create__item">
                                        <input type="submit" value="Save Product"class="btn-submit">
                                </div>
                            
                            
                            
                        </div>
                    </div>
                </div>
            </div>
        </div> 
    </section>
   <!--  <section>
        <div class="container-fluid">
                <div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
                    <div class="card">
                        <div class="card-body">
                          <h3>Product Create</h3>
                        </div>
                    </div>
                </div>
                <div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
                    <div class="col-xl-4 search ">
                        <div>
                            <div class="input-group board-create__item">
                                <i class="desc-input">Tên sản phẩm</i>
                                <input type="text" class="form-control " placeholder="Điền tên sản phẩm">
                                       
                            </div>
                            <div class="input-group board-create__item">
                                <i class="desc-input">Giá</i>
                                <input type="text" class="form-control " placeholder="Nhập số tiền">
                                       
                            </div>
                            <div class="input-group board-create__item">
                                <i class="desc-input">Giảm giá</i>
                                <input type="text" class="form-control " placeholder="Nhập số tiền">
                                       
                            </div>
                                <div class="input-group board-create__item">
                                <i class="desc-input">Mô tả</i>
                                <input type="text" class="form-control " placeholder="Nhập mô tả">
                                       
                            </div>
                            <div class="input-group board-create__item">
                                <i class="desc-input">Số lượng tồn</i>
                                <input type="text" class="form-control " placeholder="Nhập số lượng">
                                       
                            </div>
                            <div class="input-group board-create__item">
                                <i class="desc-input">Hình ảnh</i>
                                <input type="text" class="form-control " placeholder="Tải ảnh lên">
                                       
                            </div> 
                        </div>
                    </div>
                </div>
        </div> 
    </section> -->


    
</body>
</html>