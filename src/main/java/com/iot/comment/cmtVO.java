package com.iot.comment;

import java.sql.Date;

public class cmtVO {

	private String brd_num;
	private int cmt_num;
	private String cmt_content;
	private String update_date;
	private String user_id;
	public cmtVO() {
		
	}
	/*public cmtVO(String brd_num, int cmt_num, String cmt_content, Date update_date, String user_id) {
		super();
		this.brd_num = brd_num;
		this.cmt_num = cmt_num;
		this.cmt_content = cmt_content;
		this.update_date = update_date;
		this.user_id = user_id;
	}*/
	
	public String getBrd_num() {
		return brd_num;
	}
	public cmtVO(String brd_num, int cmt_num, String cmt_content, String update_date, String user_id) {
		super();
		this.brd_num = brd_num;
		this.cmt_num = cmt_num;
		this.cmt_content = cmt_content;
		this.update_date = update_date;
		this.user_id = user_id;
	}

	public void setBrd_num(String brd_num) {
		this.brd_num = brd_num;
	}
	public int getCmt_num() {
		return cmt_num;
	}
	public void setCmt_num(int cmt_num) {
		this.cmt_num = cmt_num;
	}
	public String getCmt_content() {
		return cmt_content;
	}
	public void setCmt_content(String cmt_content) {
		this.cmt_content = cmt_content;
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
	@Override
	public String toString() {
		return "cmtVO [brd_num=" + brd_num + ", cmt_num=" + cmt_num + ", cmt_content=" + cmt_content + ", update_date="
				+ update_date + ", user_id=" + user_id + "]";
	}
	
	
	
}
/*create table cmt(
		  brd_num varchar2(10) references freeboard (brd_num),
		  cmt_num number(7) primary key,
		  cmt_content varchar2(500) not null,
		  update_date date,
		  user_id varchar2(20) references member (user_id)
		  );*/