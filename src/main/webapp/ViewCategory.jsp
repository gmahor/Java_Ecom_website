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
	CategoryHandler ch = new CategoryHandler();

	request.setAttribute("catList", ch.fetchAllCategories());
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
	width: 23% !important;
	margin: 20px !important;
	display: inline-flex;
	background-color: rgba(0, 0, 0, 0.5) !important;
}

.card-body {
	padding: 0;
	margin: 0;
}

h1, h4 {
	color: white;
}
</style>

</head>
<body>

	<c:import url="header.jsp" />
	<br>
	<br>

	<h1 style="text-align: center;">
		<u><b>Current Categories</b></u>
	</h1>

	<br>
	<a class="btn btn-outline-warning text-light" href="AddCategory.jsp"
		style="color: black;">Add Category</a>

	<hr>
	<c:choose>

		<c:when test="${empty catList }">

			<h1 class="alert alert-danger">No Categories in DB</h1>

		</c:when>

		<c:otherwise>

			<c:forEach items="${catList}" var="cat">



				<div class="card bg-dark">
					<!-- 	<div class="card-header">Header</div>  -->
					<div class="card-body bg-warning"
						style="text-align: center; color: black;">CATEGORIES</div>
					<hr>
					<h4>
						 Id : ${cat.getId()}
					</h4>
					<br>
					<h4><i class="fas fa-smile-beam"></i>Name : ${cat.getName()}</h4>
					<br>
					<h4><i class="fas fa-book"></i>Description : ${cat.getDescription()}</h4>
					<br>
					<div class="card-footer bg-warning">
						<a href="DeleteCategoryFromDB?id=${cat.getId()} "
							class="btn btn-outline-danger">delete</a> <a
							href="EditCategory.jsp?id=${cat.getId()} "
							class="btn btn-outline-success">Edit</a>

					</div>
				</div>

			</c:forEach>




		</c:otherwise>

	</c:choose>
</body>
</html>