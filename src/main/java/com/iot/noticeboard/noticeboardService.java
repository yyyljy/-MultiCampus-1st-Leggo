package com.iot.noticeboard;

import java.util.List;
 
public interface noticeboardService {
	//공지사항 조회 - 전체 조회 및 카테고리별 조회작업
	List<noticeboardVO> boardList();
	//공지사항 보기
	noticeboardVO read(String brd_num);
}
