package com.iot.lastmile;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("lastmileDAO")
public class LastmailDAOImple implements LastmileDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<FavoriteVO> selectFavorite(String user_id) {
		
		return sqlSession.selectList("com.iot.lastmile.favorite", user_id);
	}

	@Override
	public List<RecentVO> selectRecent(String user_id) {
		
		return sqlSession.selectList("com.iot.lastmile.recent", user_id);
	}

}
