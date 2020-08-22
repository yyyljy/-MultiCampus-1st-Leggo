package com.iot.lastmile;

import java.util.List;

public interface LastmileService {
	public List<LastmileVO> getLastmileAPI();
	public List<FavoriteVO> getFavoriteList(String user_id);
	public List<RecentVO> getRecentList(String user_id);
}
