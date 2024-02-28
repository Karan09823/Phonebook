package com.SERVLET;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.DB.DbConnection;
import com.USER.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String user_login_mail=request.getParameter("user_login_mail");
		String user_login_password=request.getParameter("user_login_password");

		Connection con=DbConnection.getCon();
		UserDAO uda=new UserDAO(con);

		User usr=uda.LoginUser(user_login_mail, user_login_password);

		if(usr!=null) {
			HttpSession session2=request.getSession();
			session2.setAttribute("HomePageAccess", usr);
			response.sendRedirect("home.jsp");
		}else {
			HttpSession session=request.getSession();
			session.setAttribute("FailedloginedUserMsg", "Something went wrong!");
			response.sendRedirect("login.jsp");
		}


	}

}
