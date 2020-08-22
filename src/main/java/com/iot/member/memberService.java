package com.iot.member;


public interface memberService {
	int insert(memberVO user);
	int delete(memberVO user);
	memberVO modifyMyInfo(memberVO user);
	memberVO login(memberVO loginUser);
	boolean idCheck(String id);
}
