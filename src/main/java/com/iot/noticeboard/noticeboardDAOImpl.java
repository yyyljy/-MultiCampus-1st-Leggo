package com.iot.noticeboard;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("noticeboardDao")
public class noticeboardDAOImpl implements noticeboardDAO {
	@Autowired
	SqlSession sqlsession;
	//공지사항 목록
	@Override
	public List<noticeboardVO> boardList() {
		return sqlsession.selectList("com.iot.noticeboard.noticelist");
	}
	@Override
	public noticeboardVO read(String brd_num) {
		return sqlsession.selectOne("com.iot.noticeboard.noticeread", brd_num);
	}

}
