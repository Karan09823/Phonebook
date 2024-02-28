<%@page import="java.util.List"%>
<%@page import="com.USER.Contact"%>
<%@page import="com.DB.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DAO.NumberDAO"%>
<%@page import="com.USER.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@include file="AllComponent/allcomponent.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SHOW_NUMBER</title>
</head>
<body>
	<%
	User homeuser = (User) session.getAttribute("HomePageAccess");

	if (homeuser == null) {
		session.setAttribute("LoginFirstMsg", "Please Login !");
		response.sendRedirect("login.jsp");
	} else {
	%>
	<nav class="navbar navbar-light bg-warning ">
		<div class="container">
			<a class="navbar-brand " href="home.jsp"> <i
				class="fa-solid fa-blender-phone "></i>Home - ContactDetails
			</a>


			<!-- ============================================================================ -->
			<%
			String msg1 = (String) session.getAttribute("updateContactMsg");
			if (msg1 != null) {
			%>
			<div class="alert alert-success"><%=msg1%></div>

			<%
			}
			session.removeAttribute("updateContactMsg");
			%>

			<!-- ============================================================================ -->




			<!-- ============================================================================ -->

			<%
			String msg2 = (String) session.getAttribute("failupdateMsg");
			if (msg2 != null) {
			%>
			<div class="alert alert-danger"><%=msg2%></div>

			<%
			}
			session.removeAttribute("failupdateMsg");
			%>
			<!-- ============================================================================ -->
			
			
			
			
			<!-- ============================================================================ -->
			<%
			String msg3 = (String) session.getAttribute("DeleteContactMsg");
			if (msg3 != null) {
			%>
			<div class="alert alert-success"><%=msg3%></div>

			<%
			}
			session.removeAttribute("DeleteContactMsg");
			%>

			<!-- ============================================================================ -->
			
			
			
			
			<!-- ============================================================================ -->
			<%
			String msg4 = (String) session.getAttribute("FailDeleteContactMsg");
			if (msg4 != null) {
			%>
			<div class="alert alert-danger"><%=msg4%></div>

			<%
			}
			session.removeAttribute("FailDeleteContactMsg");
			%>

			<!-- ============================================================================ -->


		</div>
	</nav>



	<div class="container-fluid mt-3 mx-3 ">
		<div class="row">
			<div class="col-md-12">
				<div class="row">

					<%
					Connection con = DbConnection.getCon();
					NumberDAO cdao = new NumberDAO(con);
					List<Contact> li = cdao.showContact(homeuser.getUser_Id());

					for (Contact cn : li) {
					%>
					<div class="col-md-3">
						<div class="card mb-3">
							<div class="card-body bg-secondary text-light">
								<h5 class="card-title">
									Name:
									<%=cn.getContact_name()%></h5>
								<p class="card-text">
									Number: +91
									<%=cn.getContact_Phno()%></p>
								<div class="btn-group" role="group" aria-label="Basic example">
									<a class="btn btn-outline-info mx-3"
										href="edit.jsp?cid=<%=cn.getContact_id()%>">Edit</a> <a
										class="btn btn-outline-danger" href="DeleteContactServlet?cid=<%=cn.getContact_id()%>">Delete</a>
								</div>
							</div>
						</div>
					</div>
					<%
					}
					%>

				</div>
			</div>
		</div>
	</div>

	<%
	}
	%>


</body>
</html>