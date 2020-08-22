package com.iot.parkingAPI;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("parkingInfoDao")
public class parkingInfoDAOImpl implements parkingInfoDAO {
	@Autowired
	SqlSession sqlsession;
	@Override
	public parkingInfoVO getNameAddr(String parking_code) {
		return sqlsession.selectOne("com.iot.parkingAPI.pNameAddr", parking_code);
	}

}
