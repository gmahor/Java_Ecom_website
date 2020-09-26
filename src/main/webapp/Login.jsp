<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<c:import url="shared.jsp" />
<c:import url="header.jsp" />

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
	height: 390px;
	margin-top: auto;
	margin-bottom: auto;
	width: 400px;
	background-color: rgba(0, 0, 0, 0.5) !important;
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
}

.social_icon {
	position: absolute;
	right: 20px;
	top: -45px;
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
	color: white;
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
</style>

</head>
<body>

	<br>
	<br>

	<c:if test="${not empty invalid}">
		<h1 class="alert alert-warning">Invalid LogIn</h1>
	</c:if>


	<div class="container">
		<div class="d-flex justify-content-center h-100">
			<div class="card">
				<div class="card-header">
					<h3><u><b>Sign In</b></u></h3>
					<div class="d-flex justify-content-end social_icon">
						<span><i class="fab fa-facebook-square"></i></span> <span><i
							class="fab fa-google-plus-square"></i></span> <span><i
							class="fab fa-twitter-square"></i></span>
					</div>
				</div>
				<div class="card-body">
					<form action="CheckLogin" method="post">
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
							</div>
							<input name="userEmail" type="text" class="form-control"
								placeholder="username">

						</div>
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input name="userPassword" type="password" class="form-control"
								placeholder="password">
						</div>
						<div class="row align-items-center remember">
							<input type="checkbox">Remember Me
						</div>
						<br>
						<div class="form-group" style="text-align: center;">
							<input type="submit" value="Login"
							class="btn float-center login_btn">
						</div>
					</form>
				</div>
				<div class="d-flex justify-content-center links">
					Don't have an account??<a href="UserLogin.jsp">Sign Up</a>
				</div>
			</div>
		</div>
	</div>

</body>
</html>