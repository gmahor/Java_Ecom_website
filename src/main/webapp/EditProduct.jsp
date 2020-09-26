<%@page import="product.Product"%>
<%@page import="product.ProductHandler"%>
<%@page import="imagebank.ImageBankHandler"%>
<%@page import="category.CategoryHandler"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<c:import url="shared.jsp" />

<%
	int id = Integer.parseInt(request.getParameter("id"));
	Product pr = new ProductHandler().fetchProduct(id);
	request.setAttribute("proList", pr);

	CategoryHandler ch = new CategoryHandler();
	request.setAttribute("catList", ch.fetchAllCategories());

	ImageBankHandler ibh = new ImageBankHandler();
	request.setAttribute("imageList", ibh.fetchAllImageInBank());
%>

<style type="text/css">
html, body {
	background-image:
		url('http://getwallpapers.com/wallpaper/full/a/5/d/544750.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	font-family: 'Numans', sans-serif;
}

.container {
	height: 100%;
	align-content: center;
}

.card {
	height: 600px;
	margin-top: auto;
	margin-bottom: auto;
	width: 450px;
	background-color: rgba(0, 0, 0, 0.5) !important;
}

.modal-body {
	height: 20%;
	width: 20%;
}

.social_icon span {
	font-size: 60px;
	margin-left: 10px;
	color: #FFC312;
}

.social_icon span:hover {
	color: white;
	cursor: pointer;
}

.card-header h3 {
	color: white;
	font-family: 'Playfair Display', serif;
	text-align: center;
}

.input-group-prepend span {
	width: 50px;
	background-color: #FFC312;
	color: black;
	border: 0 !important;
}

input:focus {
	outline: 0 0 0 0 !important;
	box-shadow: 0 0 0 0 !important;
}

.remember {
	color: white;
}

.remember input {
	width: 20px;
	height: 20px;
	margin-left: 15px;
	margin-right: 5px;
}

.login_btn {
	color: black;
	background-color: #FFC312;
	width: 100px;
}

.login_btn:hover {
	color: black;
	background-color: white;
}

.links {
	color: white;
}

.links a {
	margin-left: 4px;
}

.imageForDisplay {
	display: none;
	margin: auto;
	margin-top: 20px;
}
</style>


</head>
<body>


	<c:import url="header.jsp" />


	<script type="text/javascript">
     var setImage = function (id,url) {
	//	alert(id+","+url);
		
		$("#imageSelectionModel").modal("hide");
		
		$("input[name='productImageId']").val(id)
		
		$(".imageForDisplay").attr('src',url);
		$(".imageForDisplay").show("fast");
    	 
	}
</script>



	<!-- The Modal -->
	<div class="modal fade" id="imageSelectionModel">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Choose Image</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">

					<c:choose>

						<c:when test="${empty imageList}">

							<h1 class="alert alert-danger">No Images in Bank</h1>

						</c:when>

						<c:otherwise>


							<hr>

							<c:forEach items="${imageList}" var="image">

								<div class="abc">
									<!-- <div class="card-header">Header</div> -->
									<div class="abc-body">

										<img src="${image.getUrl()}"
											style="height: 150%; width: 150%;">

									</div>
									<div class="abc-footer">

										<a href="#"
											onclick="setImage(${image.getId()},'${image.getUrl()}')"
											class="btn btn-danger">Choose</a>

									</div>
								</div>

							</c:forEach>


						</c:otherwise>

					</c:choose>

				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>



	<br>
	<br>

	<div class="container">
		<div class="d-flex justify-content-center h-100">
			<div class="card">
				<div class="card-header">
					<h3>Edit Product</h3>

				</div>
				<div class="card-body">
					<form action="EditProductFromDB" method="post">
						<input type="hidden" name="Pid" value="${proList.getId()}">
						<input type="hidden" name="productImageId" >
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-box-open"></i></span>
							</div>
							<input name="productName" value="${proList.getName()}"
								class="form-control" placeholder="Enter Product Name">
						</div>


						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-book"></i></span>
							</div>
							<input type="text" name="productDescription"
								value="${proList.getDescription()}" class="form-control"
								placeholder="Enter Product Description">
						</div>


						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i
									class="fas fa-money-bill-alt"></i></span>
							</div>

							<input name="productPrice" value="${proList.getPrice()}"
								class="form-control" placeholder="Enter Product Price">
						</div>


						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i
									class="fas fa-layer-group"></i></span>
							</div>
							<input name="productStockQty" value="${proList.getStockqty()}"
								class="form-control" placeholder="Enter Product Stockqty">
						</div>

						<div class="input-group form-group">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#imageSelectionModel">Select Image</button>
							<br> <img class="img imageForDisplay"
								style="text-align: center; height: 100px; width: 80%;">
						</div>

						<c:if test="${not empty catList}">
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-cubes"></i></span>
								</div>
								<select class="form-control" name="productCategoryId">
									<c:forEach items="${catList}" var="c">
										<option value="${c.getId()}" title="${c.getDescription()}">${c.getName()}</option>
									</c:forEach>
								</select>
							</div>
						</c:if>

						<c:choose>

							<c:when test="${not empty catList}">

								<div class="form-group" style="text-align: center;">
									<input type="submit" value="Edit" class="btn login_btn">
								</div>

							</c:when>

							<c:otherwise>

								<div class="row">
									<h1 class="alert alert-danger">Please Add Categories into
										System to Add Products</h1>
								</div>
							</c:otherwise>

						</c:choose>

						<div class="d-flex justify-content-center links">
							View Product <a href="ViewProduct.jsp">View</a>
						</div>
					</form>
				</div>

			</div>
			<div class="card-footer"></div>
		</div>
	</div>


</body>
</html>