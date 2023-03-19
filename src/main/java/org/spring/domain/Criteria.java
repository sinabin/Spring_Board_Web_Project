package org.spring.domain;
// 페이징 처리에 필요한 getter/setter 작성

public class Criteria {
	private String user_id; // showMyPost 구현할 때 필요한 필드
	private int page;
	private int perPageNum;
	private String searchType;
	private String keyword;

	public Criteria() { // Redefine defaultConstructor
		this.page = 1;
		this.perPageNum = 5;
	}
	
	public Criteria(int num) {
		this.page = 1;
		this.perPageNum = num;
	}

	public void setPage(int page) {
		if (page < 0) {
			this.page = 1;
			return;
		}

		this.page = page;
	}
	
	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}

		this.perPageNum = perPageNum;
	}

	public int getPage() {
		return page;
	}

	// method for MyBatis SQL Mapper -
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}

	// method for MyBatis SQL Mapper -
	public int getPerPageNum() {
		return this.perPageNum;
	}

	@Override
	public String toString() {
		return "Criteria [user_id=" + user_id + ", page=" + page + ", perPageNum=" + perPageNum + ", searchType="
				+ searchType + ", keyword=" + keyword + "]";
	}



}
