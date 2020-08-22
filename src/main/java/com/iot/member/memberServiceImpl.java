package com.iot.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class memberServiceImpl implements memberService {
	@Autowired
	@Qualifier("memberDao")
	memberDAO dao;
	@Override
	public int insert(memberVO user) {
		return dao.insert(user);
	}

	@Override
	public int delete(memberVO user) {
		int result = dao.delete(user);
		System.out.println("delete결과:"+result);
		return result;
	}

	@Override
	public memberVO modifyMyInfo(memberVO user) {
		memberVO modifiedUser = null;
		int result = dao.modifyMyInfo(user);
		if(result==1) {
			modifiedUser = dao.login(user);
		}
		return modifiedUser;
	}

	@Override
	public memberVO login(memberVO loginUser) {
		memberVO user = dao.login(loginUser);
		return user;
	}

	@Override
	public boolean idCheck(String id) {
		return dao.idCheck(id);
	}

}
