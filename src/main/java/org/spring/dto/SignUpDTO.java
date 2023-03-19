package org.spring.dto;

public class SignUpDTO {
	private String user_id;
	private String user_pw;
	private String user_nick;
	private String user_email;

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_nick() {
		return user_nick;
	}

	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	@Override
	public String toString() {
		return "SignUpDTO [user_id=" + user_id + ", user_pw=" + user_pw + ", user_nick=" + user_nick + ", user_email="
				+ user_email + "]";
	}

}
