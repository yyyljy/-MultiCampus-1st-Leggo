	package com.iot.freeboard;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
@Service
public class freeboardServiceImpl implements freeboardService {
	@Autowired
	@Qualifier("freeboardDao")
	
	freeboardDAO dao;
  
	@Override
	public List<freeboardVO> boardList() {
		List<freeboardVO> list = dao.boardList();
		return list;
	}


	
	@Override
	public int insert(freeboardVO freeboard) {
		// TODO Auto-generated method stub
		return dao.insert(freeboard);
	}
	
	@Override
	public freeboardVO read(String brd_num) {
		// TODO Auto-generated method stub
		return dao.read(brd_num);
	}
	
	

	@Override
	public int txinsert(freeboardVO freeboard) {
		// TODO Auto-generated method stub
		return 0;
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
	public int update(freeboardVO board) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String brd_num) {
		// TODO Auto-generated method stub
		return dao.delete(brd_num);
	}

	@Override
	public List<freeboardVO> findByCategory(String category) {
		// TODO Auto-generated method stub
		return null;
	}



}
