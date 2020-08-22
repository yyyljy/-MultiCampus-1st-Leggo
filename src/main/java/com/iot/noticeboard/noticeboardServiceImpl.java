package com.iot.noticeboard;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
@Service
public class noticeboardServiceImpl implements noticeboardService {
	@Autowired
	@Qualifier("noticeboardDao")
	noticeboardDAO dao;
	
	//게시글 목록
	@Override
	public List<noticeboardVO> boardList() {
		List<noticeboardVO> list = dao.boardList();
		return list;
	}

	@Override
	public noticeboardVO read(String brd_num) {
		return dao.read(brd_num);
	}
	
}
