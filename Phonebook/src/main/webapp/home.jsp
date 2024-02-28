<%@page import="com.USER.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@include file="AllComponent/allcomponent.jsp"%>
<%@include file="navbar/nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HOME</title>
</head>
<body>
	<%
	User homeuser1 = (User) session.getAttribute("HomePageAccess");

	if (homeuser1 == null) {
		session.setAttribute("LoginFirstMsg", "Please Login !");
		response.sendRedirect("login.jsp");

	} else {
	%>
	<h1 class="text-center mt-3">
		Hello,<%=homeuser1.getUser_name()%>
	</h1>
	<marquee scrollamount="10">
		<h1 class="text-info mt-3">Welcome to Phonebook - A place to save
			your contact</h1>
	</marquee>

	<%
	}
	%>

</body>
</html>