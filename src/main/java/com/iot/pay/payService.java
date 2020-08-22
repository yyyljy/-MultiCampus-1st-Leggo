package com.iot.pay;

import java.util.List;

public interface payService {
	public int insert(payVO pay);
	public int delete(payVO pay);
	public int update(payVO pay);
	public List<payVO> select(String user_id);
}
