package com.SERVLET;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.NumberDAO;
import com.DB.DbConnection;

@WebServlet("/AddNumberServlet")
public class AddNumberServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String user_loggined_id=request.getParameter("user_loggined_id");
		Integer userid=Integer.parseInt(user_loggined_id);
		String user_contact_name=request.getParameter("user_contact_name");
		String user_contact_number=request.getParameter("user_contact_number");


		Connection con=DbConnection.getCon();
		NumberDAO ndo=new NumberDAO(con);

		boolean f=ndo .AddContact(user_contact_name, user_contact_number, userid);

		if(f) {
			HttpSession session1=request.getSession();
			session1.setAttribute("SavedContactMsg", "Contact Saved");
			response.sendRedirect("addNumber.jsp");
		}else {
			HttpSession session2=request.getSession();
			session2.setAttribute("FailedContactMsg","Contact Not Saved !");
			response.sendRedirect("addNumber.jsp");

		}
	}

}
