package com.iot.member;

public class kakaoVO {
	private String kId;
	private String kNickname;
	private String kLImg;
	private String kSImg;
	public kakaoVO() {
		super();
	}
	public String getkId() {
		return kId;
	}
	public void setkId(String kId) {
		this.kId = kId;
	}
	public String getkNickname() {
		return kNickname;
	}
	public void setkNickname(String kNickname) {
		this.kNickname = kNickname;
	}
	public String getkLImg() {
		return kLImg;
	}
	public void setkLImg(String kLImg) {
		this.kLImg = kLImg;
	}
	public String getkSImg() {
		return kSImg;
	}
	public void setkSImg(String kSImg) {
		this.kSImg = kSImg;
	}
	@Override
	public String toString() {
		return "kakaoVO [kId=" + kId + ", kNickname=" + kNickname + ", kLImg=" + kLImg + ", kSImg=" + kSImg + "]";
	}
}
