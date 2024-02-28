<%@page import="com.USER.Contact"%>
<%@page import="com.DB.DbConnection"%>
<%@page import="com.DAO.NumberDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="AllComponent/allcomponent.jsp"%>
<%@include file="navbar/nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EDIT_CONTACT</title>
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
						<h1 class="text-center">EDIT CONTACT</h1>

						<div class="card-body">


							<form action="UpdateContactServlet" method="post">
								<%
								int cid = Integer.parseInt(request.getParameter("cid"));// contact id through url

								NumberDAO ned = new NumberDAO(DbConnection.getCon());
								
								
								Contact cedn=ned.getContact(cid);
								%>
								<div class="mb-3">
									<label for="exampleInputName" class="form-label">Enter
										ContactName </label> <input type="text" class="form-control"
										id="exampleInputName" aria-describedby="nameHelp"
										name="update_contact_name" required="required" value="<%=cedn.getContact_name()%>">

								</div>

								<input type="hidden" value="<%=cedn.getContact_id()%>"
									name="update_contact_id">



								<div class="mb-3">
									<label for="exampleInputName" class="form-label">Enter
										ContactNumber </label> <input type="text" class="form-control"
										id="exampleInputNumber" aria-describedby="numberHelp"
										name="update_contact_number" required="required" maxlength="10" value="<%=cedn.getContact_Phno()%>">

								</div>


								<div class="d-grid">
									<button type="submit" class="btn btn-primary btn-block">EDIT CONTACT
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