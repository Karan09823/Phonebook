package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.USER.User;

public class UserDAO {

	private Connection con;

	public UserDAO(Connection con) {
		super();
		this.con = con;
	}

	public boolean userRegister(User user) {

		boolean f = false;

		try {
			String query = "insert into user(usermail,userpassword,username) values(?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, user.getUser_Email());
			ps.setString(2, user.getUser_password());
			ps.setString(3, user.getUser_name());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public User LoginUser(String email, String password) {

		User loginedUser =null;

		try {

			String query = "select * from user where usermail=? and userpassword=?";

			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs=ps.executeQuery();

			while(rs.next()) {
				loginedUser=new User();
				loginedUser.setUser_Id(rs.getInt(1));
				loginedUser.setUser_Email(rs.getString(2));
				loginedUser.setUser_password(rs.getString(3));
				loginedUser.setUser_name(rs.getString(4));

			}


		} catch (Exception e) {
			e.printStackTrace();
		}

		return loginedUser;
	}

}
