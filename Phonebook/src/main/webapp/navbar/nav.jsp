<%@page import="com.USER.User"%>
<nav class="navbar navbar-expand-lg navbar-light bg-warning">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"><i
			class="fa-solid fa-blender-phone"></i>PhoneBook</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link" aria-current="page"
					href="home.jsp"><i class="fa-solid fa-house"></i>Home</a></li>
				<li class="nav-item"><a class="nav-link" href="addNumber.jsp"><i
						class="fa-solid fa-user-plus"></i>AddNumber</a></li>

				<li class="nav-item"><a class="nav-link " href="showNumber.jsp"
					tabindex="-1" aria-disabled="true"><i class="fa-solid fa-eye"></i>ShowNumber</a></li>
			</ul>
			<form class="d-flex">

				<%
				User homeuser = (User) session.getAttribute("HomePageAccess");

				if (homeuser == null) {
					/* session.setAttribute("LoginFirstMsg", "Please Login !");
					response.sendRedirect("login.jsp"); */
				%>

				<a class="btn btn-primary" href="login.jsp">Login</a> <span
					class="mx-2"></span> <a class="btn btn-info" href="register.jsp">Register</a>
				<%
				} else {
				%>
				<a class="btn btn-info" href="#"><i class="fa-solid fa-user"></i><%=homeuser.getUser_name()%></a> <span
					class="mx-2"></span> <a class="btn btn-danger" href="LogoutServlet">Logout</a>

				<%
				}
				%>

			</form>
		</div>
	</div>
</nav>