package com.iot.lastmile;

public class RecentVO {
	 String recent_code;
	 String user_id;
	 String parking_code;
	 String location_name;
	 double latitude;
	 double longitude;
	 
	 public RecentVO() {
		 
	 }

	public RecentVO(String recent_code, String user_id, String parking_code, String location_name, double latitude,
			double longitude) {
		super();
		this.recent_code = recent_code;
		this.user_id = user_id;
		this.parking_code = parking_code;
		this.location_name = location_name;
		this.latitude = latitude;
		this.longitude = longitude;
	}

	public String getRecent_code() {
		return recent_code;
	}

	public void setRecent_code(String recent_code) {
		this.recent_code = recent_code;
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

	public String getLocation_name() {
		return location_name;
	}

	public void setLocation_name(String location_name) {
		this.location_name = location_name;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	 
	 
}
