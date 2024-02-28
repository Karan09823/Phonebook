package com.USER;

public class Contact {

	private int contact_id;
	private String contact_name;
	private String contact_Phno;
	private int contact_fkey;

	public Contact() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Contact(String contact_name, String contact_Phno, int contact_fkey) {
		super();
		this.contact_name = contact_name;
		this.contact_Phno = contact_Phno;
		this.contact_fkey = contact_fkey;
	}

	public int getContact_id() {
		return contact_id;
	}

	public void setContact_id(int contact_id) {
		this.contact_id = contact_id;
	}

	public String getContact_name() {
		return contact_name;
	}

	public void setContact_name(String contact_name) {
		this.contact_name = contact_name;
	}

	public String getContact_Phno() {
		return contact_Phno;
	}

	public void setContact_Phno(String contact_Phno) {
		this.contact_Phno = contact_Phno;
	}

}
