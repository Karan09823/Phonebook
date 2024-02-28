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

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String user_register_name = request.getParameter("user_register_name");
		String user_register_mail = request.getParameter("user_register_mail");
		String user_register_password = request.getParameter("user_register_password");

		User user_register_data=new User(user_register_mail,user_register_password, user_register_name);


		Connection con=DbConnection.getCon();
		UserDAO udo=new UserDAO(con);

		boolean f=udo.userRegister(user_register_data);

		if(f) {
			HttpSession session1=request.getSession();
			session1.setAttribute("RegisterdUserMsg", "Registered Sucessfully");
			response.sendRedirect("register.jsp");
		}else {
			HttpSession session2=request.getSession();
			session2.setAttribute("NotRegisteredUserMsg","Registration failed !");
			response.sendRedirect("register.jsp");
		}


	}

}
