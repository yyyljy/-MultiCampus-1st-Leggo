package com.iot.comment;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("cmtDao")//이름정의
public class cmtDAOImpl implements cmtDAO {
	@Autowired//setget메소드 연결
	SqlSession sqlsession;//batis파일의 sql을 정의
	@Override
	public int insert(cmtVO cmt) {//cmtVO에 정의한 변수들을 담을 cmt선언하고 insert메소드 생성
		return sqlsession.insert("com.iot.comment.insert", cmt);//sql insert구문 불러오고 cmt에 저장
	}
	@Override
	public List<cmtVO> readcmt(String brd_num) {
		return sqlsession.selectList("com.iot.comment.readcmt", brd_num);
	}
	@Override
	public int delete(String brd_num) {
		return sqlsession.delete("com.iot.comment.delcmtAll", brd_num);
	}
	@Override
	public int deleteone(int cmt_num) {
		return sqlsession.delete("com.iot.comment.delcmt", cmt_num);
	}
	

}
