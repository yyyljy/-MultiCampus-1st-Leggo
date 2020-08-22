package com.iot.freeboard;

import java.util.List;
//spl문 하나당 한개의 DAO메소드를 만들어야한다.
public interface freeboardDAO {
	//게시글전체목록조회
	List<freeboardVO> boardList();
	//게시글등록하기
	int insert(freeboardVO content);
	List<freeboardVO> searchList(String search);
	List<freeboardVO> pageList();
	//게시글조회
	freeboardVO read(String free_brd_num);
	//게시글수정
	int update(freeboardVO content);
	//게시글삭제
	int delete(String brd_num);
}
