package com.iot.lastmile;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class LastmileServiceImpl implements LastmileService {
	@Autowired
	GetLastmileAPI getLastmileAPI;
	
	@Autowired
	@Qualifier("lastmileDAO")
	LastmileDAO dao;

	@Override
	public List<LastmileVO> getLastmileAPI() {
		List<LastmileVO> lastmileList = getLastmileAPI.getBikeJSON();
		return lastmileList;
	}

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
