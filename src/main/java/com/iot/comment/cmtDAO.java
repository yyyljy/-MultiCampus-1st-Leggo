package com.iot.comment;

import java.util.List;

public interface cmtDAO {

	int insert(cmtVO cmt);//한 컬럼씩 insert하기 때문에 int형으로 선언
	List<cmtVO> readcmt(String brd_num);
	int delete(String brd_num);
	int deleteone(int cmt_num);
}
