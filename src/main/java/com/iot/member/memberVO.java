package com.iot.member;

import java.sql.Date;

public class memberVO {
	private String user_id;
	private String pass;
	private String pass_hint;
	private String pass_ans;
	private String user_name;
	private String birth;
	private String gender;
	private String tel;
	private String mobile;
	private String addr;
	private String postcode;
	private String email;
	private String recv_email;
	private String recv_text;
	private Date reg_date;
	private Date lastlogin;
	public memberVO() {
		super();
	}

	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getPass_hint() {
		return pass_hint;
	}
	public void setPass_hint(String pass_hint) {
		this.pass_hint = pass_hint;
	}
	public String getPass_ans() {
		return pass_ans;
	}
	public void setPass_ans(String pass_ans) {
		this.pass_ans = pass_ans;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRecv_email() {
		return recv_email;
	}
	public void setRecv_email(String recv_email) {
		this.recv_email = recv_email;
	}
	public String getRecv_text() {
		return recv_text;
	}
	public void setRecv_text(String recv_text) {
		this.recv_text = recv_text;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Date getLastlogin() {
		return lastlogin;
	}
	public void setLastlogin(Date lastlogin) {
		this.lastlogin = lastlogin;
	}

	@Override
	public String toString() {
		return "memberVO [user_id=" + user_id + ", pass=" + pass + ", pass_hint=" + pass_hint + ", pass_ans=" + pass_ans
				+ ", user_name=" + user_name + ", birth=" + birth + ", gender=" + gender + ", tel=" + tel + ", mobile="
				+ mobile + ", addr=" + addr + ", postcode=" + postcode + ", email=" + email + ", recv_email="
				+ recv_email + ", recv_text=" + recv_text + ", reg_date=" + reg_date + ", lastlogin=" + lastlogin + "]";
	}
}
