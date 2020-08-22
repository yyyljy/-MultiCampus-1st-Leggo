package com.iot.lastmile;

import java.util.List;

public interface LastmileDAO {
	List<FavoriteVO> selectFavorite(String user_id);
	List<RecentVO> selectRecent(String user_id);
}
