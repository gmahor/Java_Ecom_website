
<%@page import="product.ProductHandler"%>
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
	ProductHandler ph = new ProductHandler();

	request.setAttribute("productList", ph.fetchAllProducts());
%>

<style type="text/css">
html, body {
	background-image:
		url('http://getwallpapers.com/wallpaper/full/a/5/d/544750.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	font-family: 'Numans', sans-serif;
}

.card {
	height: 630px;
	width: 21% !important;
	margin: 30px !important;
	display: inline-flex;
	background-color: rgba(0, 0, 0, 0.4) !important;
}

.card-body {
	padding: 0;
	margin: 8%;
	height: 80px;
	width: 200px;
}

h1, h3, h6, p {
	color: white;
}
</style>

</head>
<body>

	<c:import url="header.jsp" />

	<br>
	<br>

	<h1 style="text-align: center;">
		<u><b>Current Products</b></u>
	</h1>

	<br>
	<c:if test="${sessionScope.currentUser.getRole() == 'admin'}">
		<a class="btn btn-outline-warning text-light" href="AddProduct.jsp"
			style="color: black;">Add Product</a>
	</c:if>

	<c:choose>

		<c:when test="${empty productList}">

			<h1 class="alert alert-danger">No Products in DB</h1>

		</c:when>

		<c:otherwise>


			<hr>

			<c:forEach items="${productList}" var="product">

				<div class="card">
					<!-- <div class="card-header">Header</div> -->
					<div class="card-body">

						<img style="width: 120%; margin: auto;"
							src="${product.getImageUrl()}"> <br> <br>

						<h1 style="font-size: 20px;">
							<i class="fas fa-box-open"></i> Product Name:${product.getName()}
						</h1>
						<br>

						<h3 class="badge badge-info" style="font-size: 15px">
							<i class="fas fa-book"></i> Category
							Name:${product.getCategory().getName()}
						</h3>
						<br>

						<h6>
							<i class="fas fa-money-bill-alt"></i> Price:
							Rs.${product.getPrice()}/-
						</h6>

						<br>

						<p>
							<i class="fas fa-book"></i> Product
							Description:${product.getDescription()}
						</p>

						<h6>
							<i class="fas fa-cubes"></i> In Stock: <span
								class="badge badge-warning" style="padding: 10px;">${product.getStockqty()}</span>
						</h6>

					</div>

					<div class="card-footer">

						<c:if test="${sessionScope.currentUser.getRole() == 'admin'}">
							<a href="EditProduct.jsp?id=${product.getId()}"
								class="btn btn-success">Edit</a>
							<a href="DeleteProductFromDB?id=${product.getId()}"
								class="btn btn-danger">Delete</a>
						</c:if>
						<hr>

						<c:if test="${sessionScope.currentUser.getRole() == 'user'}">

							<div class="card-footer">
								<form action="AddToCart" method="post">

									<div class="container">
										<div class="row">
											<div class="col-lg-12">
												<button class="btn btn-info" style="width: 100%;">Add Cart</button>
											</div>
											<br>
											<div class="col-lg-4">
												<input type="hidden" name="quantity" placeholder="Qty::::"
													class="form-control" style="width: 198%;" value="1">
											</div>v

										</div>

									</div>
									<input type="hidden" value="${product.getId()}" name="proid"
										class="form-control"> <input type="hidden"
										value="${sessionScope.currentUser.getId()}" name="userid">

								</form>


							</div>

						</c:if>



					</div>
				</div>

			</c:forEach>


		</c:otherwise>

	</c:choose>



</body>
</html>