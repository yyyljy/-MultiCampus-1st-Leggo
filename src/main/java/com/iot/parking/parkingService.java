package com.iot.parking;

import java.util.List;

import com.iot.lastmile.FavoriteVO;
import com.iot.lastmile.RecentVO;

public interface parkingService {
	public List<parkingVO> select();
	public List<FavoriteVO> getFavoriteList(String user_id);
	public List<RecentVO> getRecentList(String user_id);
}
