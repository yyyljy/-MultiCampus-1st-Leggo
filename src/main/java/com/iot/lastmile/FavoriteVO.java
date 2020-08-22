package com.iot.lastmile;

public class FavoriteVO {
	private String favorite_code;
	private String user_id;
	private String parking_code;
	private String location_name;
	private double latitude;
	private double longitude;
	private String favorite_name;
	 
	public FavoriteVO() {
		
	}
	 
	public FavoriteVO(String favorite_code, String user_id, String parking_code, String location_name, double latitude,
			double longitude, String favorite_name) {
		super();
		this.favorite_code = favorite_code;
		this.user_id = user_id;
		this.parking_code = parking_code;
		this.location_name = location_name;
		this.latitude = latitude;
		this.longitude = longitude;
		this.favorite_name = favorite_name;
	}

	public String getFavorite_code() {
		return favorite_code;
	}

	public void setFavorite_code(String favorite_code) {
		this.favorite_code = favorite_code;
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

	public String getFavorite_name() {
		return favorite_name;
	}

	public void setFavorite_name(String favorite_name) {
		this.favorite_name = favorite_name;
	}
	
	
}
