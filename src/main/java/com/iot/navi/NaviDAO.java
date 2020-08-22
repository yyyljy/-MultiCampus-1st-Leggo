package com.iot.navi;

import java.util.List;

import com.iot.lastmile.FavoriteVO;
import com.iot.lastmile.RecentVO;

public interface NaviDAO {
	List<FavoriteVO> selectFavorite(String user_id);
	List<RecentVO> selectRecent(String user_id);
}
