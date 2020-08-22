package com.iot.reservation;

import java.sql.Date;

public class resvTableVO {
	private String rv_id;
	private String parking_name;
	private String addr;
	private int price;
	private Date resvDate;
	private Date resvTime;
	
	public resvTableVO(String rv_id, String parking_name, String addr, int price, Date resvDate, Date resvTime) {
		super();
		this.rv_id = rv_id;
		this.parking_name = parking_name;
		this.addr = addr;
		this.price = price;
		this.resvDate = resvDate;
		this.resvTime = resvTime;
	}

	public String getRv_id() {
		return rv_id;
	}

	public void setRv_id(String rv_id) {
		this.rv_id = rv_id;
	}

	public String getParking_name() {
		return parking_name;
	}

	public void setParking_name(String parking_name) {
		this.parking_name = parking_name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getResvDate() {
		return resvDate;
	}

	public void setResvDate(Date resvDate) {
		this.resvDate = resvDate;
	}

	public Date getResvTime() {
		return resvTime;
	}

	public void setResvTime(Date resvTime) {
		this.resvTime = resvTime;
	}

	@Override
	public String toString() {
		return "resvTableVO [rv_id=" + rv_id + ", parking_name=" + parking_name + ", addr=" + addr + ", price=" + price
				+ ", resvDate=" + resvDate + ", resvTime=" + resvTime + "]";
	}
}
