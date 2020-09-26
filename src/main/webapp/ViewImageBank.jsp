<%@page import="imagebank.ImageBankHandler"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<c:import url="shared.jsp" />

<%
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

.card {
	width: 33% !important;
	margin: 20px!improtant;
	display: inline-flex;
	background-color: rgba(0, 0, 0, 0.5) !important;
}

img {
	width: 15%!improtant;
	margin: 0;
	height: 131px;
}

.card-body {
	padding: 0;
}

u {
	color: white;
}

h1 {
	color: white;
}
</style>
</head>
<body>
	<c:import url="header.jsp" />
	<br>
	<br>

	<h1 style="text-align: center; font-size: 50px;">
		<u>Current Image Bank</u>
	</h1>


	<c:if test="${not empty msg}">
		<h5 class="alert alert-danger">"can't delete"</h5>
	</c:if>
	<%-- <c:if test="${empty msg}">
		<h5 class="alert alert-success">"successfully removed</h5>
	</c:if> --%>
	<br>
	<a class="btn btn-outline-warning text-light" href="AddImageToBank.jsp"
		style="color: black;">Add Image</a>
	<hr>
	<c:choose>

		<c:when test="${empty imageList}">

			<h1 class="alert alert-danger">No Image in Bank</h1>

		</c:when>

		<c:otherwise>


			<c:forEach items="${imageList}" var="image">



				<div class="card">
					<!-- 	<div class="card-header">Header</div> -->
					<div style="text-align: center; font-size: 30px;" class="card-body">
						<u>Image</u> <br> <br> <img src=" ${image.getUrl()}">

					</div>

					<div class="card-footer" style="text-align: center;">

						<a href="DeleteImageFromBank?id=${image.getId()}"
							class="btn btn-danger">Delete</a>


					</div>

				</div>
			</c:forEach>




		</c:otherwise>

	</c:choose>

</body>
</html>