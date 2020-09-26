<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="user.User"%>
<%@page import="product.Product"%>
<%@page import="cart.Cart"%>
<%@page import="cart.CartHandler"%>
<%@page import="product.ProductHandler"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<c:import url="shared.jsp" />

<%
	User us = (User) request.getSession().getAttribute("currentUser");
	CartHandler cth = new CartHandler();
	request.setAttribute("CList", cth.fetchAllCart());

	ProductHandler ph = new ProductHandler();

	double grandTotal = 0.0f;

	if (us == null) {
		response.sendRedirect("Login.jsp");
	} else {
		request.setAttribute("CList", cth.fetchAllCart());

	}
%>

</head>




<body>
	<c:import url="header.jsp" />
	<br>
	<br>

	<h1 style="text-align: center;" class="alert alert-primary">Cart</h1>
	<br>
	<a href="ViewProduct.jsp" class="btn-btn-Link">More Items</a>

	<c:choose>

		<c:when test="${empty CList }">
			<h1 class="alert alert-danger">Cart is empty please shop
				something from products</h1>
		</c:when>

		<c:otherwise>

			<hr>




			<c:forEach items="${CList}" var="cart">
				<tr>
					<td>
						<!--  --> <%
 	Cart ct = (Cart) (pageContext.getAttribute("cart"));
 				Product pr = ph.fetchProduct((short) (ct.getProductid()));
 				//pageContext.setAttribute("pro",p);
 %> <%-- <%=p%> --%>
						<div class="card">
							<div class="card-body">
								<img class="img" style="height: 200px; margin-left: 155px;"
									src="<%=pr.getImageUrl()%>"> <br> <br>
								<div class="container">
									<h2><%=pr.getName()%></h2>
									<br>
									<c:if test="${sessionScope.currentUser.getRole() =='admin'}">
										<h3 class="badge badge-pill badge-danger"><%=pr.getCategory().getName()%></h3>
									</c:if>
									<br>

									<h6 style="font-weight: bold;">
										Price:<i id="R" class="fas-sign"></i><%=pr.getPrice()%></h6>
									<br>


									<h5>
										Description :
										<%=pr.getDescription()%></p>
									</h5>

									<c:if test="${sessionScope.currentUser.getRole() =='admin'}">
In Stock: <span class="badge badge-warning" style="padding: 10px;">${pro.getStockqty()}</span>
									</c:if>

									<h5>
										Quantity : <span>${cart.getQty()}</span>
									</h5>
									<form action="EditCart" method="post">
									<input type="hidden" name="id" value="${cart.getId()}">
									
									<input type="hidden" name="pid" value="${cart.getProductid()}"> 
									
									<input name="qty" type="number" class="form-control" >
									<button class="btn btn-primary"> edit</button>
									
									</form>

									<h5>
										Sub-Total : <span><%=pr.getPrice() * ct.getQty()%></span>
									</h5>

									<a href="DeleteCartFromDB?id=${cart.getId()}"
										class="btn btn-danger">Delete Cart</a>
								</div>

							</div>
						</div> <br> <br> <%
 	grandTotal += pr.getPrice() * ct.getQty();
 %>
					
			</c:forEach>



			<h1 class="text text-success">
				Grand Total:
				<%=grandTotal%></h1>

			<br>
			<hr>
			<a href="DestroyUserCart?id=${sessionScope.currentUser.getId()}"
				class="btn btn-primary" style="width: 530px; height: 50px;">Place
				Order and Buy The Product</a>
			<br>
			<br>
			<br>

		</c:otherwise>
	</c:choose>

</body>
</html>