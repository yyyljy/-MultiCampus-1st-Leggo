package com.iot.reservation;

import java.util.List;

public interface resvService {
	public int insert(resvVO resv);
	public int delete(resvVO resv);
	public int update(resvVO resv);
	public List<resvVO> select(String user_id);
	public resvVO getResvInfo(String user_id);
	
}
