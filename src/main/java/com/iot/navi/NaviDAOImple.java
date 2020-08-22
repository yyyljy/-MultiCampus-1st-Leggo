package com.iot.navi;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iot.lastmile.FavoriteVO;
import com.iot.lastmile.RecentVO;

@Repository("naviDAO")
public class NaviDAOImple implements NaviDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<FavoriteVO> selectFavorite(String user_id) {
		
		return sqlSession.selectList("com.iot.parking.favorite", user_id);
	}

	@Override
	public List<RecentVO> selectRecent(String user_id) {
		
		return sqlSession.selectList("com.iot.parking.recent", user_id);
	}

}
