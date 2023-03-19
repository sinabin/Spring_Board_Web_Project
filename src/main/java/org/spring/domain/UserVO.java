package org.spring.domain;

import java.util.Date;

public class UserVO {
	private String new_user_pw;

	public String getNew_user_pw() {
		return new_user_pw;
	}

	public void setNew_user_pw(String new_user_pw) {
		this.new_user_pw = new_user_pw;
	}

	private String user_id;
	private String user_pw;
	private String user_nick;
	private String user_email;
	private Date user_reg_date;
	private String user_grade;

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

	public Date getUser_reg_date() {
		return user_reg_date;
	}

	public void setUser_reg_date(Date user_reg_date) {
		this.user_reg_date = user_reg_date;
	}

	public String getUser_grade() {
		return user_grade;
	}

	public void setUser_grade(String user_grade) {
		this.user_grade = user_grade;
	}

	@Override
	public String toString() {
		return "UserVO [new_user_pw=" + new_user_pw + ", user_id=" + user_id + ", user_pw=" + user_pw + ", user_nick="
				+ user_nick + ", user_email=" + user_email + ", user_reg_date=" + user_reg_date + ", user_grade="
				+ user_grade + "]";
	}

}
