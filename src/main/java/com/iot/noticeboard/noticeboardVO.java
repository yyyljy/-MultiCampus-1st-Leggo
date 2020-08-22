package com.iot.noticeboard;

import java.util.Date;

public class noticeboardVO {
	int brd_type_num;
	String brd_num;
	String title;
	String content;
	String update_date;
	String mng_id;


public noticeboardVO() {
		
	}

/*public noticeboardVO(int brd_type_num, String brd_num, String title, String content, Date update_date, String mng_id) {
	super();
	this.brd_type_num = brd_type_num;
	this.brd_num = brd_num;
	this.title = title;
	this.content = content;
	this.update_date = update_date;
	this.mng_id = mng_id;
}*/



public int getBrd_type_num() {
	return brd_type_num;
}

public noticeboardVO(int brd_type_num, String brd_num, String title, String content, String update_date,
		String mng_id) {
	super();
	this.brd_type_num = brd_type_num;
	this.brd_num = brd_num;
	this.title = title;
	this.content = content;
	this.update_date = update_date;
	this.mng_id = mng_id;
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

/*public Date getUpdate_date() {
	return update_date;
}

public void setUpdate_date(Date update_date) {
	this.update_date = update_date;
}*/



public String getMng_id() {
	return mng_id;
}

public void setMng_id(String mng_id) {
	this.mng_id = mng_id;
}

public String getUpdate_date() {
	return update_date;
}

public void setUpdate_date(String update_date) {
	this.update_date = update_date;
}
@Override
public String toString() {
	return "noticeboardVO [brd_type_num=" + brd_type_num + ", brd_num=" + brd_num + ", title=" + title + ", content="
			+ content + ", update_date=" + update_date + ", mng_id=" + mng_id + "]";
}

}
