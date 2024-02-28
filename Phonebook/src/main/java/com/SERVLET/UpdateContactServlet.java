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

@WebServlet("/UpdateContactServlet")
public class UpdateContactServlet extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String update_contact_id=request.getParameter("update_contact_id");
		int updateCid=Integer.parseInt(update_contact_id);
		
		String update_contact_name=request.getParameter("update_contact_name");
		String update_contact_number=request.getParameter("update_contact_number");
		
		NumberDAO updao=new NumberDAO(DbConnection.getCon());
		
		boolean f=updao.updateContact(updateCid, update_contact_name, update_contact_number);
		
		HttpSession session=request.getSession();
		
		if(f) {
			session.setAttribute("updateContactMsg", "Contact Updated !");
			response.sendRedirect("showNumber.jsp");
		}else {
			session.setAttribute("failupdateMsg","Contact Updation Failed ");
			response.sendRedirect("showNumber.jsp");
		}
	}

}
