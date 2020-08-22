package com.iot.parking;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.iot.lastmile.FavoriteVO;
import com.iot.lastmile.RecentVO;



@Service
public class parkingServiceImpl implements parkingService {
	@Autowired
	@Qualifier("parkingDao")
	parkingDAO dao;
	
	@Override
	public List<parkingVO> select() {
		System.out.println("parkingServiceImpl 호출 됌");
		return dao.select();
		//mapper, DAO, service 했고 이제 컨트롤러
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