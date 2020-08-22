package com.iot.navi;

import java.util.List;

import com.iot.lastmile.FavoriteVO;
import com.iot.lastmile.RecentVO;

public interface NaviService {
	public List<FavoriteVO> getFavoriteList(String user_id);
	public List<RecentVO> getRecentList(String user_id);
}
