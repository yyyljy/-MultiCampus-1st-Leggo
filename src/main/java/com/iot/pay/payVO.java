package com.iot.pay;

import java.sql.Date;

public class payVO {
	private int pm_num;
	private String rv_id;
	private String user_id;
	private String pm_method_code;
	private int pm_price;
	private Date pm_date;
	private int pm_price_plus;
	private int use_point;
	private int discount;
	private String card_grant_num;
	private String pm_confirm;
	
	public payVO() {
	
	}

	public payVO(int pm_num, String rv_id, String user_id, String pm_method_code, int pm_price, Date pm_date,
			int pm_price_plus, int use_point, int discount, String card_grant_num, String pm_confirm) {
		super();
		this.pm_num = pm_num;
		this.rv_id = rv_id;
		this.user_id = user_id;
		this.pm_method_code = pm_method_code;
		this.pm_price = pm_price;
		this.pm_date = pm_date;
		this.pm_price_plus = pm_price_plus;
		this.use_point = use_point;
		this.discount = discount;
		this.card_grant_num = card_grant_num;
		this.pm_confirm = pm_confirm;
	}

	public int getPm_num() {
		return pm_num;
	}

	public void setPm_num(int pm_num) {
		this.pm_num = pm_num;
	}

	public String getRv_id() {
		return rv_id;
	}

	public void setRv_id(String rv_id) {
		this.rv_id = rv_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPm_method_code() {
		return pm_method_code;
	}

	public void setPm_method_code(String pm_method_code) {
		this.pm_method_code = pm_method_code;
	}

	public int getPm_price() {
		return pm_price;
	}

	public void setPm_price(int pm_price) {
		this.pm_price = pm_price;
	}

	public Date getPm_date() {
		return pm_date;
	}

	public void setPm_date(Date pm_date) {
		this.pm_date = pm_date;
	}

	public int getPm_price_plus() {
		return pm_price_plus;
	}

	public void setPm_price_plus(int pm_price_plus) {
		this.pm_price_plus = pm_price_plus;
	}

	public int getUse_point() {
		return use_point;
	}

	public void setUse_point(int use_point) {
		this.use_point = use_point;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public String getCard_grant_num() {
		return card_grant_num;
	}

	public void setCard_grant_num(String card_grant_num) {
		this.card_grant_num = card_grant_num;
	}

	public String getPm_confirm() {
		return pm_confirm;
	}

	public void setPm_confirm(String pm_confirm) {
		this.pm_confirm = pm_confirm;
	}

	@Override
	public String toString() {
		return "payVO [pm_num=" + pm_num + ", rv_id=" + rv_id + ", user_id=" + user_id + ", pm_method_code="
				+ pm_method_code + ", pm_price=" + pm_price + ", pm_date=" + pm_date + ", pm_price_plus="
				+ pm_price_plus + ", use_point=" + use_point + ", discount=" + discount + ", card_grant_num="
				+ card_grant_num + ", pm_confirm=" + pm_confirm + "]";
	}
}

/*
pm_num	number
rv_id	number
user_id	varchar2
pm_method_code	number
pm_price	number
pm_date	date
pm_price_plus	number
use_point	number
discount	numer
card_grant_num	varchar2
pm_confirm	varchar2
*/