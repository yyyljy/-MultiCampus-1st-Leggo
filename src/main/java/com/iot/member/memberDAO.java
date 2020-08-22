package com.iot.member;


public interface memberDAO {
	int insert(memberVO user);
	int delete(memberVO user);
	int modifyMyInfo(memberVO user);
	memberVO login(memberVO loginUser);
	boolean idCheck(String id);
}
