package com.iot.parkingAPI;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class parkingAPIServiceImpl implements parkingAPIService {
	@Qualifier("parkingSeatDao")
	@Autowired
	parkingSeatDAO dao;
	@Qualifier("parkingInfoDao")
	@Autowired
	parkingInfoDAO pinfo;
	@Override
	public String readURL(String parking_code) {
		String key = "4f644f707579797935346a766e424c";
        String result = "";
		BufferedReader br = null;
        try{            
            String urlstr = "http://openapi.seoul.go.kr:8088/" + key + "/json/GetParkInfo/1/1/%20/" + parking_code + "/";
            /*http://openapi.seoul.go.kr:8088/(인증키)/xml/GetParkInfo/1/5/ /1033125*/
            URL url = new URL(urlstr);
            HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
            urlConnection.setRequestMethod("GET");
            br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(),"UTF-8"));
            
            String line;
            while((line = br.readLine()) != null) {
                result = result + line + "\n";
            }
            /*System.out.println(result);*/
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        /*System.out.println(result);*/
        return result;
	}

	@Override
	public parkingjsonVO getParkingJSON(String parking_code) {
		parkingjsonVO pVO = null;
		JSONParser parser = new JSONParser();
		
		try {
			JSONObject object = (JSONObject) parser.parse(readURL(parking_code));
			JSONObject json = (JSONObject) object.get("GetParkInfo");
			JSONArray array = (JSONArray) json.get("row");
			
			for(int i=0;i<array.size();i++) {
				JSONObject rowObject = (JSONObject) array.get(i);
				
				double RATES = (double)rowObject.get("RATES");
				String PARKING_NAME = (String)rowObject.get("PARKING_NAME");
				String QUE_STATUS = (String)rowObject.get("QUE_STATUS");
				String QUE_STATUS_NM = (String)rowObject.get("QUE_STATUS_NM");
				double CAPACITY = (Double)rowObject.get("CAPACITY");
				double CUR_PARKING = (Double)rowObject.get("CUR_PARKING");
				String CUR_PARKING_TIME = (String)rowObject.get("CUR_PARKING_TIME");
				String PARKING_CODE = (String)rowObject.get("PARKING_CODE");
				String night_free_open = (String)rowObject.get("NIGHT_FREE_OPEN");
				String night_free_open_nm = (String)rowObject.get("NIGHT_FREE_OPEN_NM");
				String weekday_begin_time = (String)rowObject.get("WEEKDAY_BEGIN_TIME");
				String weekday_end_time = (String)rowObject.get("WEEKDAY_END_TIME");
				String weekend_begin_time = (String)rowObject.get("WEEKEND_BEGIN_TIME");
				String weekend_end_time = (String)rowObject.get("WEEKEND_END_TIME");
				String holiday_begin_time = (String)rowObject.get("HOLIDAY_BEGIN_TIME");
				String holiday_end_time = (String)rowObject.get("HOLIDAY_END_TIME");
				
				pVO = new parkingjsonVO(RATES, PARKING_NAME, QUE_STATUS, QUE_STATUS_NM, CAPACITY, 
						CUR_PARKING, CUR_PARKING_TIME, PARKING_CODE,night_free_open,night_free_open_nm,weekday_begin_time,weekday_end_time,weekend_begin_time,weekend_end_time,holiday_begin_time,holiday_end_time);
				System.out.println("주차장 생성자 확인 :"+pVO);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return pVO;
	}

	@Override
	public int updateParkingSeats(String parking_code) {
		return dao.updateParkingSeats(parking_code);
	}

	@Override
	public parkingInfoVO getNameAddr(String parking_code) {
		return pinfo.getNameAddr(parking_code);
	}
	
	@Override	
	public String readURL(int start, int end) {	
		String key = "4f644f707579797935346a766e424c";	
        String result = "";	
		BufferedReader br = null;	
        try{            	
            String urlstr = "http://openapi.seoul.go.kr:8088/" + key + "/json/GetParkInfo/" + start + "/" + end + "//";	
            /*http://openapi.seoul.go.kr:8088/(인증키)/xml/GetParkInfo/1/5/ /1033125*/	
            URL url = new URL(urlstr);	
            HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();	
            urlConnection.setRequestMethod("GET");	
            br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(),"UTF-8"));	
            	
            String line;	
            while((line = br.readLine()) != null) {	
                result = result + line + "\n";	
            }	
            /*System.out.println(result);*/	
        }catch(Exception e){	
            System.out.println(e.getMessage());	
        }	
        /*System.out.println(result);*/	
        return result;	
	}	
		
	@Override	
	public List<parkingjsonVO> getParkingAllJSON() {	
		List<parkingjsonVO> jsonList = new ArrayList<parkingjsonVO>();	
		JSONParser parser = new JSONParser();	
			
		for(int s=1;s<15000;s += 1000) {	
			try {	
				JSONObject object = (JSONObject) parser.parse(readURL(s, s + 999));	
				JSONObject json = (JSONObject) object.get("GetParkInfo");	
				JSONArray array = (JSONArray) json.get("row");	
					
				for(int i=0;i<array.size();i++) {	
					parkingjsonVO pVO = null;	
					JSONObject rowObject = (JSONObject) array.get(i);	
						
					double RATES = (double)rowObject.get("RATES");	
					String PARKING_NAME = (String)rowObject.get("PARKING_NAME");	
					String QUE_STATUS = (String)rowObject.get("QUE_STATUS");	
					String QUE_STATUS_NM = (String)rowObject.get("QUE_STATUS_NM");	
					double CAPACITY = (Double)rowObject.get("CAPACITY");	
					double CUR_PARKING = (Double)rowObject.get("CUR_PARKING");	
					String CUR_PARKING_TIME = (String)rowObject.get("CUR_PARKING_TIME");	
					String PARKING_CODE = (String)rowObject.get("PARKING_CODE");	
					String WEEKDAY_BEGIN_TIME = (String)rowObject.get("WEEKDAY_BEGIN_TIME");	
					String WEEKDAY_END_TIME = (String)rowObject.get("WEEKDAY_END_TIME");	
					String WEEKEND_START_TIME = (String)rowObject.get("WEEKEND_START_TIME");	
					String WEEKEND_END_TIME = (String)rowObject.get("WEEKEND_END_TIME");	
					String HOLIDAY_BEGIN_TIME = (String)rowObject.get("HOLIDAY_BEGIN_TIME");	
					String HOLIDAY_END_TIME = (String)rowObject.get("HOLIDAY_END_TIME");	
						
					pVO = new parkingjsonVO(RATES, PARKING_NAME, QUE_STATUS, QUE_STATUS_NM, CAPACITY, 	
							CUR_PARKING, CUR_PARKING_TIME, PARKING_CODE,WEEKDAY_BEGIN_TIME,WEEKDAY_END_TIME,	
							WEEKDAY_END_TIME,WEEKEND_START_TIME,WEEKEND_END_TIME,WEEKEND_END_TIME,HOLIDAY_BEGIN_TIME,HOLIDAY_END_TIME);	
						
					jsonList.add(pVO);	
				}	
			} catch (ParseException e) {	
				e.printStackTrace();	
			}	
		}	
			
		return jsonList;	
	}
}
