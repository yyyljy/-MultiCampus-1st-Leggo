package com.iot.parkingAPI;

public class parkingjsonVO {
	private double rates;	//기본주차요금
	private String parking_name; // 주차장이름
	private String que_status;	//주차현황 정보 제공여부
	private String que_status_nm; //주차현황 정보 제공여부명
	private double capacity;	//주차 면(주차 가능 차량 수)
	private double cur_parking;	//현재 주차중인 대수
	private String cur_parking_time;	//현재 주차 차량 업데이트 시간
	private String parking_code; //주차장 코드
	private String night_free_open; //야간 무료 여부
	private String night_free_open_nm; //야간 무료명
	private String weekday_begin_time; // 주간운영 시작시간
	private String weekday_end_time; // 주간운영 마감시간
	private String weekend_begin_time;
	private String weekend_end_time;
	private String holiday_begin_time;
	private String holiday_end_time;
	//운영시간, 기본요금, 주차가능대수, 주차장이름, 예약시간,
	public parkingjsonVO() {
		
	}
	
	public parkingjsonVO(double rates, String parking_name, String que_status, String que_status_nm, double capacity,
			double cur_parking, String cur_parking_time, String parking_code, String night_free_open,
			String night_free_open_nm, String weekday_begin_time, String weekday_end_time, String weekend_begin_time,
			String weekend_end_time, String holiday_begin_time, String holiday_end_time) {
		super();
		this.rates = rates * 10;
		this.parking_name = parking_name;
		this.que_status = que_status;
		this.que_status_nm = que_status_nm;
		this.capacity = capacity;
		this.cur_parking = cur_parking;
		this.cur_parking_time = cur_parking_time;
		this.parking_code = parking_code;
		this.night_free_open = night_free_open;
		this.night_free_open_nm = night_free_open_nm;
		this.weekday_begin_time = weekday_begin_time;
		this.weekday_end_time = weekday_end_time;
		this.weekend_begin_time = weekend_begin_time;
		this.weekend_end_time = weekend_end_time;
		this.holiday_begin_time = holiday_begin_time;
		this.holiday_end_time = holiday_end_time;
	}

	public double getRates() {
		return rates;
	}
	public void setRates(double rates) {
		this.rates = rates;
	}
	public String getParking_name() {
		return parking_name;
	}
	public void setParking_name(String parking_name) {
		this.parking_name = parking_name;
	}
	public String getQue_status() {
		return que_status;
	}
	public void setQue_status(String que_status) {
		this.que_status = que_status;
	}
	public String getQue_status_nm() {
		return que_status_nm;
	}
	public void setQue_status_nm(String que_status_nm) {
		this.que_status_nm = que_status_nm;
	}
	public double getCapacity() {
		return capacity;
	}
	public void setCapacity(double capacity) {
		this.capacity = capacity;
	}
	public double getCur_parking() {
		return cur_parking;
	}
	public void setCur_parking(double cur_parking) {
		this.cur_parking = cur_parking;
	}
	public String getCur_parking_time() {
		return cur_parking_time;
	}
	public void setCur_parking_time(String cur_parking_time) {
		this.cur_parking_time = cur_parking_time;
	}
	public String getParking_code() {
		return parking_code;
	}
	public void setParking_code(String parking_code) {
		this.parking_code = parking_code;
	}
	public String getNight_free_open() {
		return night_free_open;
	}

	public void setNight_free_open(String night_free_open) {
		this.night_free_open = night_free_open;
	}

	public String getNight_free_open_nm() {
		return night_free_open_nm;
	}

	public void setNight_free_open_nm(String night_free_open_nm) {
		this.night_free_open_nm = night_free_open_nm;
	}

	public String getWeekday_begin_time() {
		return weekday_begin_time;
	}

	public void setWeekday_begin_time(String weekday_begin_time) {
		this.weekday_begin_time = weekday_begin_time;
	}

	public String getWeekday_end_time() {
		return weekday_end_time;
	}

	public void setWeekday_end_time(String weekday_end_time) {
		this.weekday_end_time = weekday_end_time;
	}

	public String getWeekend_begin_time() {
		return weekend_begin_time;
	}

	public void setWeekend_begin_time(String weekend_begin_time) {
		this.weekend_begin_time = weekend_begin_time;
	}

	public String getWeekend_end_time() {
		return weekend_end_time;
	}

	public void setWeekend_end_time(String weekend_end_time) {
		this.weekend_end_time = weekend_end_time;
	}

	public String getHoliday_begin_time() {
		return holiday_begin_time;
	}

	public void setHoliday_begin_time(String holiday_begin_time) {
		this.holiday_begin_time = holiday_begin_time;
	}

	public String getHoliday_end_time() {
		return holiday_end_time;
	}

	public void setHoliday_end_time(String holiday_end_time) {
		this.holiday_end_time = holiday_end_time;
	}

	@Override
	public String toString() {
		return "parkingjsonVO [rates=" + rates + ", parking_name=" + parking_name + ", que_status=" + que_status
				+ ", que_status_nm=" + que_status_nm + ", capacity=" + capacity + ", cur_parking=" + cur_parking
				+ ", cur_parking_time=" + cur_parking_time + ", parking_code=" + parking_code + ", night_free_open="
				+ night_free_open + ", night_free_open_nm=" + night_free_open_nm + ", weekday_begin_time="
				+ weekday_begin_time + ", weekday_end_time=" + weekday_end_time + ", weekend_begin_time="
				+ weekend_begin_time + ", weekend_end_time=" + weekend_end_time + ", holiday_begin_time="
				+ holiday_begin_time + ", holiday_end_time=" + holiday_end_time + "]";
	}
}
