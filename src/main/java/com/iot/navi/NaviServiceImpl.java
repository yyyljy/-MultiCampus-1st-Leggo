package com.iot.navi;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.iot.lastmile.FavoriteVO;
import com.iot.lastmile.RecentVO;

@Service
public class NaviServiceImpl implements NaviService {
	@Autowired
	@Qualifier("naviDAO")
	NaviDAO dao;
	@Override
	public List<FavoriteVO> getFavoriteList(String user_id) {
		List<FavoriteVO> favoriteList = dao.selectFavorite(user_id);
		return favoriteList;
	}

	@Override
	public List<RecentVO> getRecentList(String user_id) {
		List<RecentVO> recentList = dao.selectRecent(user_id);
		return recentList;
	}

}
