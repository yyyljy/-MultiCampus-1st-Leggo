package com.iot.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service//service 명시
public class cmtServiceImpl implements cmtService {
	@Autowired//setget메소드 연결
	@Qualifier("cmtDao")//DAO와 연동하기 위한 어노테이션(DAO의 repository와 이름이 같아야한다.)
	cmtDAO dao;//cmtDAO를 service클래스에 쓰기 위해 선언
	@Override
	public int insert(cmtVO cmt) {
		return dao.insert(cmt);//DAO의 insert구문을 불러온다.
	}
	@Override
	public List<cmtVO> readcmt(String brd_num) {
		return dao.readcmt(brd_num);
	}
	@Override
	public int delete(String brd_num) {
		return dao.delete(brd_num);
	}
	@Override
	public int deleteone(int cmt_num,String brd_num) {
		return dao.deleteone(cmt_num);
	}



}
