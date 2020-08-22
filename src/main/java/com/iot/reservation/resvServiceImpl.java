package com.iot.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class resvServiceImpl implements resvService {
	@Autowired
	@Qualifier("resvDao")
	resvDAO dao;
	
	@Override
	public int insert(resvVO resv) {
		return dao.insert(resv);
	}

	@Override
	public int delete(resvVO resv) {
		return dao.delete(resv);
	}

	@Override
	public int update(resvVO resv) {
		return dao.update(resv);
	}

	@Override
	public List<resvVO> select(String user_id) {
		return dao.select(user_id);
	}

	@Override
	public resvVO getResvInfo(String user_id) {
		return dao.getResvInfo(user_id);
	}

}
