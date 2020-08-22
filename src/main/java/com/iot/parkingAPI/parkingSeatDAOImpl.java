package com.iot.parkingAPI;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("parkingSeatDao")
public class parkingSeatDAOImpl implements parkingSeatDAO {
	@Autowired
	SqlSession sqlsession;
	
	@Override
	public int updateParkingSeats(String parking_code) {
		return sqlsession.update("com.iot.parkingAPI.update", "String");
	}

}
