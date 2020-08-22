package com.iot.freeboard;

import java.util.List;
 
public interface freeboardService {
	//게시글 조회 - 전체 조회 및 카테고리별 조회작업
	List<freeboardVO> boardList();
	
	//게시글 삽입
	int insert(freeboardVO freeboard);
	
	//게시글 보기
	freeboardVO read(String brd_num);
	
	
	List<freeboardVO> searchList(String search);
	List<freeboardVO> pageList();
	
	int txinsert(freeboardVO freeboard);
	
	int update(freeboardVO board);
	int delete(String brd_num);
	
	
	List<freeboardVO> findByCategory(String category);
	
}









