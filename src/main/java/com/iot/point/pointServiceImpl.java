package com.iot.point;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class pointServiceImpl implements pointService {
	@Autowired
	@Qualifier("pointDao")
	pointDAO dao;

	@Override
	public int insert(pointVO point) {
		return dao.insert(point);
	}

	@Override
	public int delete(pointVO point) {
		return dao.delete(point);
	}

	@Override
	public int update(pointVO point) {
		return dao.update(point);
	}

	@Override
	public List<pointVO> select(String user_id) {
		return dao.select(user_id);
	}

	@Override
	public pointVO selectMyPoint(String user_id) {
		return dao.selectMyPoint(user_id);
	}

	@Override
	public int chargePoint(pointVO point) {
		return dao.chargePoint(point);
	}

}
