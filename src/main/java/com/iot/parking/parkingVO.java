package com.iot.parking;

public class parkingVO {
	private int parking_code;
	private String parking_name; 
	private String addr;
	private double lat;
	private double lng;
	private String parking_type;
	private String parking_type_nm;
	private String operation_rule;
	private String operation_rule_nm;
	private String tel; 
	//기본생성자
	public parkingVO() {
		super();
		
	}
	//2개 매개변수 받는 생성자
	public parkingVO(double lat, double lng) {
		super();
	}
	//getter and setter
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	
	public int getParking_code() {
		return parking_code;
	}
	public void setParking_code(int parking_code) {
		this.parking_code = parking_code;
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
	public String getParking_type() {
		return parking_type;
	}
	public void setParking_type(String parking_type) {
		this.parking_type = parking_type;
	}
	public String getParking_type_nm() {
		return parking_type_nm;
	}
	public void setParking_type_nm(String parking_type_nm) {
		this.parking_type_nm = parking_type_nm;
	}
	public String getOperation_rule() {
		return operation_rule;
	}
	public void setOperation_rule(String operation_rule) {
		this.operation_rule = operation_rule;
	}
	public String getOperation_rule_nm() {
		return operation_rule_nm;
	}
	public void setOperation_rule_nm(String operation_rule_nm) {
		this.operation_rule_nm = operation_rule_nm;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	//toString
	@Override
	public String toString() {
		return "parkingVO [parking_name=" + parking_name + ", lat=" + lat + ", lng=" + lng + "]";
	}
	
	
	
	
}
