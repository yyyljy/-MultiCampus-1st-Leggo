package com.iot.member;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("memberDao")
public class memberDAOImpl implements memberDAO {
	@Autowired
	SqlSession sqlSession;
	@Override
	public int insert(memberVO user) {
		return sqlSession.insert("com.iot.member.signUp", user);
	}

	@Override
	public int delete(memberVO user) {
		return sqlSession.delete("com.iot.member.withdrawal", user);
	}

	@Override
	public int modifyMyInfo(memberVO user) {
		return sqlSession.update("com.iot.member.modifyMyInfo", user);
	}

	@Override
	public memberVO login(memberVO loginUser) {
		return sqlSession.selectOne("com.iot.member.login", loginUser);
	}

	@Override
	public boolean idCheck(String id) {
		boolean result = false;
		memberVO user = (memberVO)sqlSession.selectOne("com.iot.member.idCheck", id);
		if(user!=null) {
			result = true;
		}
		return result;
	}
}
