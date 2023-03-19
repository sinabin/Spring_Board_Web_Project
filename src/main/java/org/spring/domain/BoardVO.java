package org.spring.domain;

import java.util.Date;

public class BoardVO {
	private Integer bno;
	private String user_id;
	private String title;
	private String content;
	private Date board_reg_date;
	private int view_cnt;
	private int b_rec_cnt;
	private String category;


	public Integer getBno() {
		return bno;
	}

	public void setBno(Integer bno) {
		this.bno = bno;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getReg_date() {
		return board_reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.board_reg_date = reg_date;
	}

	public int getView_cnt() {
		return view_cnt;
	}
	
	public int getView_cnt(int bno) {
		return view_cnt;
	}

	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}

	public int getB_rec_cnt() {
		return b_rec_cnt;
	}

	public void setB_rec_cnt(int b_rec_cnt) {
		this.b_rec_cnt = b_rec_cnt;
	}

	public Date getBoard_reg_date() {
		return board_reg_date;
	}

	public void setBoard_reg_date(Date board_reg_date) {
		this.board_reg_date = board_reg_date;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "boardVO [bno=" + bno + ", user_id=" + user_id + ", title=" + title + ", content=" + content
				+ ", board_reg_date=" + board_reg_date + ", view_cnt=" + view_cnt + ", b_rec_cnt=" + b_rec_cnt
				+ ", category=" + category + "]";
	}

}
