package com.iot.freeboard;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("freeboardDao")
public class freeboardDAOImpl implements freeboardDAO {
	@Autowired
	SqlSession sqlsession;
	//게시글 목록
	@Override
	public List<freeboardVO> boardList() {
		// TODO Auto-generated method stub
		return sqlsession.selectList("com.iot.freeboard.listall");
	}
	
	//게시글 쓰기
	@Override
	public int insert(freeboardVO freeboard) {
		// TODO Auto-generated method stub
		System.out.println(freeboard);
		return sqlsession.insert("com.iot.freeboard.write",freeboard);
	}
	//게시글 보기
	@Override
	public freeboardVO read(String brd_num) {
		// TODO Auto-generated method stub
		System.out.println(brd_num);
		return sqlsession.selectOne("com.iot.freeboard.read",brd_num);
	}
	
	//게시글 삭제
	@Override
	public int delete(String brd_num) {
		// TODO Auto-generated method stub
		return sqlsession.delete("com.iot.freeboard.delete",brd_num);
	}


	@Override
	public List<freeboardVO> searchList(String search) {
		// TODO Auto-generated method stub
		return null;
	}
 
	@Override
	public List<freeboardVO> pageList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(freeboardVO freeboard) {
		// TODO Auto-generated method stub
		return 0;
	}

	


	


}
