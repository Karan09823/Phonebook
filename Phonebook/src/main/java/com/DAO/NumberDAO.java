package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.USER.Contact;

public class NumberDAO {

	private Connection con;

	public NumberDAO(Connection con) {
		super();
		this.con = con;
	}

	public boolean AddContact(String contactName, String contactNumber, Integer userId) {
		boolean f = false;

		try {

			String query = "insert into number(user_number_name,user_number,user_number_fid) values(?,?,?)";

			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, contactName);
			ps.setString(2, contactNumber);
			ps.setInt(3, userId);

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Contact> showContact(int userId) {
		List<Contact> li = new ArrayList<Contact>();
		Contact c = null;

		try {
			String query = "select * from number where user_number_fid=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, userId);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				c = new Contact();
				c.setContact_id(rs.getInt(1));
				c.setContact_name(rs.getString(2));
				c.setContact_Phno(rs.getString(3));
				li.add(c);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return li;

	}

	public Contact getContact(int contactid) {// data from edit.jsp
		Contact ced = new Contact();
		try {

			String query = "select * from number where user_number_id=? ";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, contactid);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				ced.setContact_id(rs.getInt(1));
				ced.setContact_name(rs.getString(2));
				ced.setContact_Phno(rs.getString(3));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return ced;
	}

	public boolean updateContact(int contactid, String updateContactName, String updateContactNumber) {
		boolean f = false;
		try {

			String query = "update number set user_number_name=?,user_number=? where user_number_id=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, updateContactName);
			ps.setString(2, updateContactNumber);
			ps.setInt(3, contactid);

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean deleteContact(int contactid) {
		boolean f = false;

		Contact delcid = new Contact();
		try {

			String query = "delete from number where user_number_id=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, contactid);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
}
