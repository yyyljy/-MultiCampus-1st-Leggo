package com.iot.lastmile;

public class LastmileVO {
	private int rackTotCnt;				//거치대 개수			
	private String stationName;			//대여소 이름
	private int parkingBikeTotCnt;		//자전거 주차 총 건수
	private int shared;					//거치율
	private double stationLatitude;		//위도
	private double stationLongitude;	//경도
	private String stationId;			//대여소 ID
	
	public LastmileVO() {
		
	}

	public LastmileVO(int rackTotCnt, String stationName, int parkingBikeTotCnt, int shared, double stationLatitude,
			double stationLongitude, String stationId) {
		super();
		this.rackTotCnt = rackTotCnt;
		this.stationName = stationName;
		this.parkingBikeTotCnt = parkingBikeTotCnt;
		this.shared = shared;
		this.stationLatitude = stationLatitude;
		this.stationLongitude = stationLongitude;
		this.stationId = stationId;
	}

	public int getRackTotCnt() {
		return rackTotCnt;
	}

	public void setRackTotCnt(int rackTotCnt) {
		this.rackTotCnt = rackTotCnt;
	}

	public String getStationName() {
		return stationName;
	}

	public void setStationName(String stationName) {
		this.stationName = stationName;
	}

	public int getParkingBikeTotCnt() {
		return parkingBikeTotCnt;
	}

	public void setParkingBikeTotCnt(int parkingBikeTotCnt) {
		this.parkingBikeTotCnt = parkingBikeTotCnt;
	}

	public int getShared() {
		return shared;
	}

	public void setShared(int shared) {
		this.shared = shared;
	}

	public double getStationLatitude() {
		return stationLatitude;
	}

	public void setStationLatitude(double stationLatitude) {
		this.stationLatitude = stationLatitude;
	}

	public double getStationLongitude() {
		return stationLongitude;
	}

	public void setStationLongitude(double stationLongitude) {
		this.stationLongitude = stationLongitude;
	}

	public String getStationId() {
		return stationId;
	}

	public void setStationId(String stationId) {
		this.stationId = stationId;
	}
}
