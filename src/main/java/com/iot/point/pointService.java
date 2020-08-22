package com.iot.point;

import java.util.List;

public interface pointService {
	public int insert(pointVO point);
	public int delete(pointVO point);
	public int update(pointVO point);
	public List<pointVO> select(String user_id);
	public pointVO selectMyPoint(String user_id);
	public int chargePoint(pointVO point);
}
