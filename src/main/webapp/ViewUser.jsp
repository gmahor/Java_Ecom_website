<%@page import="user.UserHandler"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<c:import url="shared.jsp" />


<%
	UserHandler ush = new UserHandler();

	request.setAttribute("UList", ush.fetchAllUser());
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
	background-color: rgba(0,0,0,0.5) !important;
}

.card-body {
	padding: 0;
	margin: 0;
}
h1,h3,h4,h6,h5{

color: white;
}
</style>

</head>
<body>

	<c:import url="header.jsp" />
	<br>
	<br>

	<h1 style="text-align: center; font-size: 50px;">
		<u>Current User</u>
	</h1>

	<br>
	<a class="btn btn-outline-warning text-light" href="UserLogin.jsp"
		style="color: black;">Add User</a>

	<c:choose>

		<c:when test="${empty UList}">

			<h1 class="alert alert-danger">No User in DB</h1>

		</c:when>

		<c:otherwise>


			<hr>

			<c:forEach items="${UList}" var="user">

				<div class="card">
					<!-- <div class="card-header">Header</div> -->
					<div class="card-body">



						<h5 class="badge badge-success" >
							 UserID:
							<span class="badge badge-warning" style="padding: 10px;">${user.getId()}</span>
						</h5>
						<br>

						<h1 ><i class="fas fa-user"></i> Name: ${user.getName()}</h1>
						<br>
						<h3><i class="fas fa-phone-alt"></i>  Phone no :${user.getPhone()}</h3>

						<h4><i class="fas fa-envelope"></i>  Email :${user.getEmail()}</h4>
						<br>
						<h6>
							<i class="fas fa-key"></i>  Password: <span class="btn btn-danger" style="padding: 10px;">${user.getPassword()}</span>
						</h6>
					</div>
					<div class="card-footer">



						<a href="SetUserToInactive?id=${user.getId()}"
							class="btn btn-link"> Set Inactive </a> <a class="btn btn-link"
							href="SetUserToActive?id=${user.getId()}"> Set Active </a> <a
							href="DeleteUserFromDB?id=${user.getId()} "
							class="btn btn-outline-danger">delete</a>

					</div>
				</div>

			</c:forEach>


		</c:otherwise>

	</c:choose>

</body>
</html>