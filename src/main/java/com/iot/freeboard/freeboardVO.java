package com.iot.freeboard;

import java.util.Date;

public class freeboardVO {
	//첨부파일 관련 생성자 필요(강사님 질문)
	//게시판 관련
	int brd_type_num;
	String brd_num;
	String title;
	String content;
	String update_date;
	String user_id;
	String img_path;

public freeboardVO() {
		
	}

/*	public freeboardVO(int brd_type_num, String brd_num, String title, String content, Date update_date, String user_id,
			String img_path) {
		super();
		this.brd_type_num = brd_type_num;
		this.brd_num = brd_num;
		this.title = title;
		this.content = content;
		this.update_date = update_date;
		this.user_id = user_id;
		this.img_path = img_path;
	}
*/

	public int getBrd_type_num() {
		return brd_type_num;
	}

	public freeboardVO(int brd_type_num, String brd_num, String title, String content, String update_date, String user_id,
		String img_path) {
	super();
	this.brd_type_num = brd_type_num;
	this.brd_num = brd_num;
	this.title = title;
	this.content = content;
	this.update_date = update_date;
	this.user_id = user_id;
	this.img_path = img_path;
}

	public void setBrd_type_num(int brd_type_num) {
		this.brd_type_num = brd_type_num;
	}

	public String getBrd_num() {
		return brd_num;
	}

	public void setBrd_num(String brd_num) {
		this.brd_num = brd_num;
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

/*	public Date getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}*/
	
	
	public String getUser_id() {
		return user_id;
	}

	public String getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getImg_path() {
		return img_path;
	}

	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}
	
	

	@Override
	public String toString() {
		return "freeboardVO [brd_type_num=" + brd_type_num + ", brd_num=" + brd_num + ", title=" + title + ", content="
				+ content + ", update_date=" + update_date + ", user_id=" + user_id + ", img_path=" + img_path + "]";
	}
}