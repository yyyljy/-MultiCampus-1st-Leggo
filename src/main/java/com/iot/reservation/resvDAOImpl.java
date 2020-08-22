package com.iot.reservation;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("resvDao")
public class resvDAOImpl implements resvDAO {
	@Autowired
	SqlSession sqlsession;

	@Override
	public int insert(resvVO resv) {
		return sqlsession.insert("com.iot.reservation.resvInsert", resv);
	}

	@Override
	public int delete(resvVO resv) {
		return sqlsession.delete("com.iot.reservation.resvDelete", resv);
	}

	@Override
	public int update(resvVO resv) {
		return sqlsession.update("com.iot.reservation.resvUpdate" ,resv);
	}

	@Override
	public List<resvVO> select(String user_id) {
		return sqlsession.selectList("com.iot.reservation.resvSelect", user_id);
	}

	@Override
	public resvVO getResvInfo(String user_id) {
		return sqlsession.selectOne("com.iot.reservation.getResvInfo", user_id);
	}

}
