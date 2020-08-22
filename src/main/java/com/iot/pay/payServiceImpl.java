package com.iot.pay;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class payServiceImpl implements payService {
	@Autowired
	@Qualifier("payDao")
	payDAO dao;
	@Override
	public int insert(payVO pay) {
		return dao.insert(pay);
	}

	@Override
	public int delete(payVO pay) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(payVO pay) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<payVO> select(String user_id) {
		List<payVO> paylist = dao.select(user_id);
		return paylist;
	}

}
