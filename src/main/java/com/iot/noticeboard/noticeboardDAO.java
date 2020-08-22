package com.iot.noticeboard;

import java.util.List;
//spl문 하나당 한개의 DAO메소드를 만들어야한다.
public interface noticeboardDAO {
	//공지사항 목록 조회
	List<noticeboardVO> boardList();
	//공지사항 보기
	noticeboardVO read(String brd_num);
}
