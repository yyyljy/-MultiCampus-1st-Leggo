package com.iot.pay;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("payDao")
public class payDAOImpl implements payDAO {
	@Autowired
	SqlSession sqlsession;
	@Override
	public int insert(payVO pay) {
		return sqlsession.insert("com.iot.pay.payinsert", pay);
	}

	@Override
	public int delete(payVO pay) {
		// TODO Auto-generated method stub
		return sqlsession.insert("com.iot.pay.delete", pay);
	}

	@Override
	public int update(payVO pay) {
		// TODO Auto-generated method stub
		return sqlsession.insert("com.iot.pay.update", pay);
	}

	@Override
	public List<payVO> select(String user_id) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("com.iot.pay.select", user_id);
	}

}
