package com.USER;

public class User {

	private int user_Id;
	private String user_Email;
	private String user_password;
	private String user_name;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User( String user_Email, String user_password, String user_name) {
		super();
		this.user_Email = user_Email;
		this.user_password = user_password;
		this.user_name = user_name;
	}
	public int getUser_Id() {
		return user_Id;
	}
	public void setUser_Id(int user_Id) {
		this.user_Id = user_Id;
	}
	public String getUser_Email() {
		return user_Email;
	}
	public void setUser_Email(String user_Email) {
		this.user_Email = user_Email;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}




}
