<%@page import="com.USER.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@include file="AllComponent/allcomponent.jsp"%>
<%@include file="navbar/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADD_NUMBER</title>
</head>
<body>
	<%
	User homeuser2 = (User) session.getAttribute("HomePageAccess");

	if (homeuser2 == null) {
		session.setAttribute("LoginFirstMsg", "Please Login !");
		response.sendRedirect("login.jsp");
	} else {
	%>
	<div class="container-fluid mt-5">
		<div class="row">
			<div class="col-md-3 offset-md-4">
				<div class="card">
					<div class="card-header">
						<h1 class="text-center">ADD CONTACT</h1>


						<!--===========================================================================  -->
						<%
						String msg1 = (String) session.getAttribute("SavedContactMsg");
						if (msg1 != null) {
						%>

						<div class="alert alert-success"><%=msg1%></div>
						<%
						}
						session.removeAttribute("SavedContactMsg");
						%>
						<!--===========================================================================  -->




						<!--===========================================================================  -->
						<%
						String msg2 = (String) session.getAttribute("FailedContactMsg");
						if (msg2 != null) {
						%>

						<div class="alert alert-danger"><%=msg2%></div>
						<%
						}
						session.removeAttribute("FailedContactMsg");
						%>
						<!--===========================================================================  -->


						<div class="card-body">


							<form action="AddNumberServlet" method="post">
								<div class="mb-3">
									<label for="exampleInputName" class="form-label">Enter
										ContactName </label> <input type="text" class="form-control"
										id="exampleInputName" aria-describedby="nameHelp"
										name="user_contact_name" required="required">

								</div>

								<input type="hidden" value="<%=homeuser2.getUser_Id()%>"
									name="user_loggined_id">



								<div class="mb-3">
									<label for="exampleInputName" class="form-label">Enter
										ContactNumber </label> <input type="text" class="form-control"
										id="exampleInputNumber" aria-describedby="numberHelp"
										name="user_contact_number" required="required" maxlength="10">

								</div>


								<div class="d-grid">
									<button type="submit" class="btn btn-primary btn-block">ADD
									</button>
								</div>

							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
		<%
		}
		%>
	
</body>
</html>