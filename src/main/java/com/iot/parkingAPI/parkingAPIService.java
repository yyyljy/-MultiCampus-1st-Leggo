package com.iot.parkingAPI;

import java.util.List;

public interface parkingAPIService {
	public String readURL(String parking_code);
	public parkingjsonVO getParkingJSON(String parking_code);
	public int updateParkingSeats(String parking_code);
	public parkingInfoVO getNameAddr(String parking_code);
	
	//전체 주차장 데이터 API 받아오기 
	public String readURL(int start, int end);	
	public List<parkingjsonVO> getParkingAllJSON();
}
