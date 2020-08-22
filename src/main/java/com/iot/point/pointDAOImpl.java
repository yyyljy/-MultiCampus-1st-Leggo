package com.iot.point;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("pointDao")
public class pointDAOImpl implements pointDAO {
	@Autowired
	SqlSession sqlsession;

	@Override
	public int insert(pointVO point) {
		return sqlsession.insert("com.iot.point.insert", point);
	}

	@Override
	public int delete(pointVO point) {
		// TODO Auto-generated method stub
		return sqlsession.delete("com.iot.point.deleteAll", point);
	}

	@Override
	public int update(pointVO point) {
		return sqlsession.update("com.iot.point.update", point);
	}

	@Override
	public List<pointVO> select(String user_id) {
		return sqlsession.selectList("com.iot.point.selectAll", user_id);
	}

	@Override
	public pointVO selectMyPoint(String user_id) {
		return sqlsession.selectOne("com.iot.point.selectPoint", user_id);
	}

	@Override
	public int chargePoint(pointVO point) {
		return sqlsession.insert("com.iot.point.insert", point);
	}

}
