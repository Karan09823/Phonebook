<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@include file="AllComponent/allcomponent.jsp"%>
<%@include file="navbar/nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>REGISTER</title>
</head>
<body>
	<div class="container-fluid mt-5">
		<div class="row">
			<div class="col-md-3 offset-md-4">
				<div class="card">
					<div class="card-header">
						<h1 class="text-center">REGISTER</h1>
						<%
						String msg1 = (String) session.getAttribute("RegisterdUserMsg");
						if (msg1 != null) {
						%>

						<div class="alert alert-success"><%=msg1%></div>

						<%
						}
						session.removeAttribute("RegisterdUserMsg");
						%>
						
						
						
						<%
						String msg2 = (String) session.getAttribute("NotRegisteredUserMsg");
						if (msg2!= null) {
						%>

						<div class="alert alert-danger"><%=msg2%></div>

						<%
						}
						session.removeAttribute("NotRegisteredUserMsg");
						%>

					</div>
					<div class="card-body">


						<form action="RegisterServlet" method="post">
							<div class="mb-3">
								<label for="exampleInputName" class="form-label">Name</label> <input
									type="text" class="form-control" id="exampleInputName"
									name="user_register_name" required="required">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="user_register_mail" required="required">
								<div id="emailHelp" class="form-text">We'll never share
									your email with anyone else.</div>
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control"
									id="exampleInputPassword1" name="user_register_password" required="required">
							</div>

							<div class="d-grid">
								<button type="submit" class="btn btn-primary btn-block">Submit</button>
							</div>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>