<%@page import="user.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<c:import url="shared.jsp" />

<%
	User u = (User) request.getSession().getAttribute("currentUser");
%>

<style type="text/css">
.wrapper {
	background: #497dd0;
	padding: 100px;
}

.toggle_radio {
	position: relative;
	background: rgba(255, 255, 255, .1);
	margin: 4px auto;
	overflow: hidden;
	padding: 0 !important;
	-webkit-border-radius: 50px;
	-moz-border-radius: 50px;
	border-radius: 50px;
	position: relative;
	height: 26px;
	width: 318px;
}

.toggle_radio>* {
	float: left;
}

.toggle_radio input[type=radio] {
	display: none;
	/*position: fixed;*/
}

.toggle_radio label {
	font: 90%/1.618 "Source Sans Pro";
	color: rgba(255, 255, 255, .9);
	z-index: 0;
	display: block;
	width: 100px;
	height: 20px;
	margin: 3px 3px;
	-webkit-border-radius: 50px;
	-moz-border-radius: 50px;
	border-radius: 50px;
	cursor: pointer;
	z-index: 1;
	/*background: rgba(0,0,0,.1);*/
	text-align: center;
	/*margin: 0 2px;*/
	/*background: blue;*/ /*make it blue*/
}

.toggle_option_slider {
	/*display: none;*/
	/*background: red;*/
	width: 100px;
	height: 20px;
	position: absolute;
	top: 3px;
	-webkit-border-radius: 50px;
	-moz-border-radius: 50px;
	border-radius: 50px;
	-webkit-transition: all .4s ease;
	-moz-transition: all .4s ease;
	-o-transition: all .4s ease;
	-ms-transition: all .4s ease;
	transition: all .4s ease;
}

#first_toggle:checked ~ .toggle_option_slider {
	background: rgba(255, 255, 255, .3);
	left: 3px;
}

#second_toggle:checked ~ .toggle_option_slider {
	background: rgba(255, 255, 255, .3);
	left: 109px;
}

#third_toggle:checked ~ .toggle_option_slider {
	background: rgba(255, 255, 255, .3);
	left: 215px;
}
</style>
</head>
<body>


	<c:import url="header.jsp" />
	<br>

	<div class="row">
		<div class="col-md-4 col-md-offset-4">
			<form class="form-horizontal" role="form" action="locationFormDb"
				method="post">
				<input type="hidden" name="userid"
					value="${sessionScope.currentUser.getId()}">
				<fieldset>


					<legend style="text-align: center;">Address Details</legend>


					<div class="form-group">
						<label class="col-sm-2 control-label" for="textinput">Name
						</label>
						<div class="col-sm-10">
							<input type="text" name="name" placeholder="Enter your Name "
								class="form-control">
						</div>
					</div>


					<div class="form-group">
						<label class="col-sm-2 control-label" for="textinput">Phone
						</label>
						<div class="col-sm-10">
							<input name="Phone" type="tel" class="form-control"
								placeholder="Enter Phone Number">
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label" for="textinput">Address</label>
						<div class="col-sm-10">
							<input name="address" type="text"
								placeholder="Enter your Address" class="form-control">
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label" for="textinput">Pincode</label>
						<div class="col-sm-10">
							<input name="pincode" type="text" placeholder="Post Code"
								class="form-control">
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label" for="textinput">City</label>
						<div class="col-sm-10">
							<input name="city" type="text" placeholder="City"
								class="form-control">
						</div>
					</div>


					<div class="form-group">
						<label class="col-sm-2 control-label" for="textinput">State</label>
						<div class="col-sm-4">
							<select name="state">
								<option>select your State</option>
								<option>Delhi</option>
								<option>Mumbai</option>
								<option>Simla</option>
								<option>hyderabad</option>
							</select>
						</div>
					</div>


					<div class="form-group">
						<label class="col-sm-4 control-label">Alternate Number </label>
						<div class="col-sm-10">
							<input name="alterphone" type="tel" class="form-control"
								placeholder="Enter Alternate Number">
						</div>
					</div>


					<div class="form-group">
						<label class="col-sm-4 control-label" for="textinput">Address
							Type </label>
						<div class="col-sm-6">

							<input type="radio" name="addresstype" value="Home"> Home<br>
							<input type="radio" name="addresstype" value="Work"> Work<br>

						</div>

					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<div class="pull-right">
								<button  type="reset" class="btn btn-default">Cancel</button>
								<button type="submit" class="btn btn-primary">Save</button>
							</div>
						</div>
					</div>

				</fieldset>
			</form>
		</div>

	</div>

</body>
</html>