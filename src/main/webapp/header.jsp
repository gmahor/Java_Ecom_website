
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="navbar navbar-expand-sm bg-warning navbar-light">
	<!-- Brand -->
	<a class="navbar-brand" href="#"> <img
		src="https://image.flaticon.com/icons/svg/871/871493.svg" alt="Logo"
		style="width: 50px; height: 50px;">
	</a>
	<c:if test="${not empty sessionScope.currentUser}">
		<a class="navbar-brand" href="#"><u>Welcome</u>
			${sessionScope.currentUser.getEmail()}</a>
		<!-- <a class=navbar-brand href="Logout">Logout</a> -->
	</c:if>



	<!-- Links -->
	<ul class="navbar-nav">
		<li class="nav-item"><a class="nav-link" href="#">About Us</a></li>
		<c:if test="${sessionScope.currentUser.getRole() == 'admin'}">
			<li class="nav-item"><a class="nav-link"
				href="AddImageToBank.jsp">Add Image To Bank</a></li>
		</c:if>
		
		<c:if test="${sessionScope.currentUser.getRole() == 'admin'}">
			<li class="nav-item"><a class="nav-link"
				href="ViewImageBank.jsp">View Image Bank</a></li>
		</c:if>

		<!-- Dropdown -->
		<c:if test="${sessionScope.currentUser.getRole() == 'admin'}">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbardrop"
				data-toggle="dropdown"> Category </a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="AddCategory.jsp">Add Category</a> <a
						class="dropdown-item" href="ViewCategory.jsp">View Categories</a>
				</div></li>
		</c:if>

		<!-- Dropdown -->
		<c:if test="${sessionScope.currentUser.getRole() == 'admin'}">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbardrop"
				data-toggle="dropdown"> Product </a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="AddProduct.jsp">Add Product</a> <a
						class="dropdown-item" href="ViewProduct.jsp">View Products</a>
				</div>
		</c:if>
		

		<c:if test="${sessionScope.currentUser.getRole() == 'user'}">
			<li class="nav-item"><a class="nav-link" href="ViewProduct.jsp">Products</a></li>
		</c:if>
		<c:if test="${sessionScope.currentUser.getRole() == 'admin'}">
			<li class="nav-item"><a class="nav-link" href="ViewUser.jsp">View User
					In</a>
		</c:if>


		</li>
		<c:if test="${not empty sessionScope.currentUser}">
			<li class="nav-item"><a class="nav-link" href="Logout"><i class="fas fa-sign-out-alt"></i>  Logout</a></li>
		</c:if>
	</ul>
	<c:if test="${sessionScope.currentUser.getRole() == 'user'}">
		<a class="navbar-brand" href="ViewCart.jsp"><i
			class="fas fa-shopping-cart"></i> </a>
	</c:if>
</nav>
<br>