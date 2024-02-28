package com.SERVLET;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.NumberDAO;
import com.DB.DbConnection;


@WebServlet("/DeleteContactServlet")
public class DeleteContactServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String deleteContactid=request.getParameter("cid");
		int delConid=Integer.parseInt(deleteContactid);
		
		
		NumberDAO delcontact=new NumberDAO(DbConnection.getCon());
		
		boolean f=delcontact.deleteContact(delConid);
		
		HttpSession session=request.getSession();
		
		
		if(f) {
			session.setAttribute("DeleteContactMsg", "Contact Deleted ");
			response.sendRedirect("showNumber.jsp");
		}else {
			session.setAttribute("FailDeleteContactMsg","Contact Deletion Failed !");
			response.sendRedirect("showNumber.jsp");
		}
	}

	

}
