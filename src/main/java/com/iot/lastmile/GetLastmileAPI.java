package com.iot.lastmile;

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
import org.springframework.stereotype.Service;

@Service
public class GetLastmileAPI {
	public List<LastmileVO> getBikeJSON() {
		List<LastmileVO> bikeList = new ArrayList<LastmileVO>();
		JSONParser parser = new JSONParser();
		
		try {
			JSONObject object = (JSONObject) parser.parse(readURL(1, 1000));
			JSONObject json = (JSONObject) object.get("rentBikeStatus");
			JSONArray array = (JSONArray) json.get("row");
			
			for(int i=0;i<array.size();i++) {
				JSONObject rowObject = (JSONObject) array.get(i);
				
				int rackTotCnt = Integer.parseInt((String)rowObject.get("rackTotCnt"));
				String stationName = (String)rowObject.get("stationName");
				int parkingBikeTotCnt = Integer.parseInt((String)rowObject.get("parkingBikeTotCnt"));
				int shared = Integer.parseInt((String)rowObject.get("shared"));
				double stationLatitude = Double.parseDouble((String)rowObject.get("stationLatitude"));
				double stationLongitude = Double.parseDouble((String)rowObject.get("stationLongitude"));
				String stationId = (String)rowObject.get("stationId");
				
				LastmileVO bike = new LastmileVO(rackTotCnt, stationName, parkingBikeTotCnt, 
											shared, stationLatitude, stationLongitude, stationId);
				bikeList.add(bike);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		try {
			JSONObject object = (JSONObject) parser.parse(readURL(1001, 2000));
			JSONObject json = (JSONObject) object.get("rentBikeStatus");
			JSONArray array = (JSONArray) json.get("row");
			
			for(int i=0;i<array.size();i++) {
				JSONObject rowObject = (JSONObject) array.get(i);
				
				int rackTotCnt = Integer.parseInt((String)rowObject.get("rackTotCnt"));
				String stationName = (String)rowObject.get("stationName");
				int parkingBikeTotCnt = Integer.parseInt((String)rowObject.get("parkingBikeTotCnt"));
				int shared = Integer.parseInt((String)rowObject.get("shared"));
				double stationLatitude = Double.parseDouble((String)rowObject.get("stationLatitude"));
				double stationLongitude = Double.parseDouble((String)rowObject.get("stationLongitude"));
				String stationId = (String)rowObject.get("stationId");
				
				LastmileVO bike = new LastmileVO(rackTotCnt, stationName, parkingBikeTotCnt, 
											shared, stationLatitude, stationLongitude, stationId);
				bikeList.add(bike);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return bikeList;
	}
	
	public String readURL(int start, int end) {
		String key = "4f644f707579797935346a766e424c";
        String result = "";
		BufferedReader br = null;
		
        try{            
            String urlstr = "http://openapi.seoul.go.kr:8088/" + key + "/json/bikeList/" + start + "/" + end + "/";
            URL url = new URL(urlstr);
            HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
            urlConnection.setRequestMethod("GET");
            br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(),"UTF-8"));
            
            String line;
            while((line = br.readLine()) != null) {
                result = result + line + "\n";
            }
            System.out.println(result);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }

        System.out.println(result);
        
        return result;
	}
	
	/* {"rentBikeStatus":
	 * 		{"list_total_count":5,
	 * 		 "RESULT":{"CODE":"INFO-000","MESSAGE":"정상 처리되었습니다."},
	 * 			"row":[{"rackTotCnt":"5","stationName":"101. (구)합정동 주민센터","parkingBikeTotCnt":"1","shared":"20","stationLatitude":"37.54956055","stationLongitude":"126.90575409","stationId":"ST-3"},
	 * 					{"rackTotCnt":"20","stationName":"102. 망원역 1번출구 앞","parkingBikeTotCnt":"16","shared":"80","stationLatitude":"37.55564880","stationLongitude":"126.91062927","stationId":"ST-4"},
	 * 					{"rackTotCnt":"14","stationName":"103. 망원역 2번출구 앞","parkingBikeTotCnt":"12","shared":"86","stationLatitude":"37.55495071","stationLongitude":"126.91083527","stationId":"ST-5"},
	 * 					{"rackTotCnt":"13","stationName":"104. 합정역 1번출구 앞","parkingBikeTotCnt":"8","shared":"62","stationLatitude":"37.55062866","stationLongitude":"126.91498566","stationId":"ST-6"},
	 * 					{"rackTotCnt":"5","stationName":"105. 합정역 5번출구 앞","parkingBikeTotCnt":"1","shared":"20","stationLatitude":"37.55000687","stationLongitude":"126.91482544","stationId":"ST-7"}]}}
	 * 
	 * */
}
