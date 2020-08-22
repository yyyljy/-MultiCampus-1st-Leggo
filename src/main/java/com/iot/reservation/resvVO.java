package com.iot.reservation;

import java.sql.Date;

public class resvVO {
	private String rv_id;
	private String user_id;
	private String parking_code;
	private double rv_price;
	private String license_plate;
	private String rv_code;
	private Date rv_date;
	private String rv_time;
	
	public resvVO() {
		super();
	}
	public resvVO(String rv_id, String user_id, String parking_code, double rv_price, String license_plate,
			String rv_code, Date rv_date, String rv_time) {
		super();
		this.rv_id = rv_id;
		this.user_id = user_id;
		this.parking_code = parking_code;
		this.rv_price = rv_price;
		this.license_plate = license_plate;
		this.rv_code = rv_code;
		this.rv_date = rv_date;
		this.rv_time = rv_time;
	}
	public String getRv_id() {
		return rv_id;
	}
	public void setRv_id(String rv_id) {
		this.rv_id = rv_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getParking_code() {
		return parking_code;
	}
	public void setParking_code(String parking_code) {
		this.parking_code = parking_code;
	}
	public double getRv_price() {
		return rv_price;
	}
	public void setRv_price(double rv_price) {
		this.rv_price = rv_price;
	}
	public String getLicense_plate() {
		return license_plate;
	}
	public void setLicense_plate(String license_plate) {
		this.license_plate = license_plate;
	}
	public String getRv_code() {
		return rv_code;
	}
	public void setRv_code(String rv_code) {
		this.rv_code = rv_code;
	}
	public Date getRv_date() {
		return rv_date;
	}
	public void setRv_date(Date rv_date) {
		this.rv_date = rv_date;
	}
	public String getRv_time() {
		return rv_time;
	}
	public void setRv_time(String rv_time) {
		this.rv_time = rv_time;
	}
	@Override
	public String toString() {
		return "resvVO [rv_id=" + rv_id + ", user_id=" + user_id + ", parking_code=" + parking_code + ", rv_price="
				+ rv_price + ", license_plate=" + license_plate + ", rv_code=" + rv_code + ", rv_date=" + rv_date
				+ ", rv_time=" + rv_time + "]";
	}
}
