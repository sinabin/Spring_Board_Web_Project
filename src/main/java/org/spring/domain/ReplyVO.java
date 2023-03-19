package org.spring.domain;

import java.util.Date;

public class ReplyVO {
	private Integer reply_id;
	private String user_id;
	private Integer bno;
	private String reply_content;
	private Date reply_reg_date;
	private int r_rec_cnt;
	public Integer getReply_id() {
		return reply_id;
	}
	public void setReply_id(Integer reply_id) {
		this.reply_id = reply_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public Date getReply_reg_date() {
		return reply_reg_date;
	}
	public void setReply_reg_date(Date reply_reg_date) {
		this.reply_reg_date = reply_reg_date;
	}
	public int getR_rec_cnt() {
		return r_rec_cnt;
	}
	public void setR_rec_cnt(int r_rec_cnt) {
		this.r_rec_cnt = r_rec_cnt;
	}
	
	@Override
	public String toString() {
		return "replyVO [reply_id=" + reply_id + ", user_id=" + user_id + ", bno=" + bno + ", reply_content="
				+ reply_content + ", reply_reg_date=" + reply_reg_date + ", r_rec_cnt=" + r_rec_cnt + "]";
	}
	
}
