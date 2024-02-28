<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DbConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@include file="AllComponent/allcomponent.jsp"%>
<%@include file="navbar/nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index_page</title>
</head>
<body>
	<style type="text/css">
.bg-img {
	background: url("AllComponent/phonebook.png");
	width: 100%;
	height: 90vh;
	background-size: cover;
	background-position: center;
}
</style>

	<img class="bg-img" src="AllComponent/allcomponent.jsp">

<%Connection con=DbConnection.getCon();

out.println(con);
%>
</body>

</html>