package com.iot.parkingAPI;

public class parkingInfoVO {
	private String PARKING_NAME;
	private String ADDR;
	private String PARKING_CODE;
	private String PARKING_TYPE;
	private String PARKING_TYPE_NM;
	private String OPERATION_RULE;
	private String OPERATION_RULE_NM;
	private String TEL;
	private String QUE_STATUS;
	private String QUE_STATUS_NM;
	private String CAPACITY;
	private String CUR_PARKING;
	private String CUR_PARKING_TIME;
	private String PAY_YN;
	private String PAY_NM;
	private String NIGHT_FREE_OPEN;
	private String NIGHT_FREE_OPEN_NM;
	private String WEEKDAY_BEGIN_TIME;
	private String WEEKDAY_END_TIME;
	private String WEEKEND_BEGIN_TIME;
	private String WEEKEND_END_TIME;
	private String HOLIDAY_BEGIN_TIME;
	private String HOLIDAY_END_TIME;
	private String SYNC_TIME;
	private String SATURDAY_PAY_YN;
	private String SATURDAY_PAY_NM;
	private String HOLIDAY_PAY_YN;
	private String HOLIDAY_PAY_NM;
	private String FULLTIME_MONTHLY;
	private String GRP_PARKNM;
	private double RATES;
	private double TIME_RATE;
	private double ADD_RATES;
	private double ADD_TIME_RATE;
	private double BUS_RATES;
	private double BUS_TIME_RATE;
	private double BUS_ADD_TIME_RATE;
	private double BUS_ADD_RATES;
	private String DAY_MAXIMUM;
	private double LAT;
	private double LNG;
	private String ASSIGN_CODE;
	private String ASSIGN_CODE_NM;

	public parkingInfoVO() {

	}

	public parkingInfoVO(String pARKING_NAME, String aDDR, String pARKING_CODE, String pARKING_TYPE,
			String pARKING_TYPE_NM, String oPERATION_RULE, String oPERATION_RULE_NM, String tEL, String qUE_STATUS,
			String qUE_STATUS_NM, String cAPACITY, String cUR_PARKING, String cUR_PARKING_TIME, String pAY_YN,
			String pAY_NM, String nIGHT_FREE_OPEN, String nIGHT_FREE_OPEN_NM, String wEEKDAY_BEGIN_TIME,
			String wEEKDAY_END_TIME, String wEEKEND_BEGIN_TIME, String wEEKEND_END_TIME, String hOLIDAY_BEGIN_TIME,
			String hOLIDAY_END_TIME, String sYNC_TIME, String sATURDAY_PAY_YN, String sATURDAY_PAY_NM,
			String hOLIDAY_PAY_YN, String hOLIDAY_PAY_NM, String fULLTIME_MONTHLY, String gRP_PARKNM, double rATES,
			double tIME_RATE, double aDD_RATES, double aDD_TIME_RATE, double bUS_RATES, double bUS_TIME_RATE,
			double bUS_ADD_TIME_RATE, double bUS_ADD_RATES, String dAY_MAXIMUM, double lAT, double lNG,
			String aSSIGN_CODE, String aSSIGN_CODE_NM) {
		super();
		PARKING_NAME = pARKING_NAME;
		ADDR = aDDR;
		PARKING_CODE = pARKING_CODE;
		PARKING_TYPE = pARKING_TYPE;
		PARKING_TYPE_NM = pARKING_TYPE_NM;
		OPERATION_RULE = oPERATION_RULE;
		OPERATION_RULE_NM = oPERATION_RULE_NM;
		TEL = tEL;
		QUE_STATUS = qUE_STATUS;
		QUE_STATUS_NM = qUE_STATUS_NM;
		CAPACITY = cAPACITY;
		CUR_PARKING = cUR_PARKING;
		CUR_PARKING_TIME = cUR_PARKING_TIME;
		PAY_YN = pAY_YN;
		PAY_NM = pAY_NM;
		NIGHT_FREE_OPEN = nIGHT_FREE_OPEN;
		NIGHT_FREE_OPEN_NM = nIGHT_FREE_OPEN_NM;
		WEEKDAY_BEGIN_TIME = wEEKDAY_BEGIN_TIME;
		WEEKDAY_END_TIME = wEEKDAY_END_TIME;
		WEEKEND_BEGIN_TIME = wEEKEND_BEGIN_TIME;
		WEEKEND_END_TIME = wEEKEND_END_TIME;
		HOLIDAY_BEGIN_TIME = hOLIDAY_BEGIN_TIME;
		HOLIDAY_END_TIME = hOLIDAY_END_TIME;
		SYNC_TIME = sYNC_TIME;
		SATURDAY_PAY_YN = sATURDAY_PAY_YN;
		SATURDAY_PAY_NM = sATURDAY_PAY_NM;
		HOLIDAY_PAY_YN = hOLIDAY_PAY_YN;
		HOLIDAY_PAY_NM = hOLIDAY_PAY_NM;
		FULLTIME_MONTHLY = fULLTIME_MONTHLY;
		GRP_PARKNM = gRP_PARKNM;
		RATES = rATES;
		TIME_RATE = tIME_RATE;
		ADD_RATES = aDD_RATES;
		ADD_TIME_RATE = aDD_TIME_RATE;
		BUS_RATES = bUS_RATES;
		BUS_TIME_RATE = bUS_TIME_RATE;
		BUS_ADD_TIME_RATE = bUS_ADD_TIME_RATE;
		BUS_ADD_RATES = bUS_ADD_RATES;
		DAY_MAXIMUM = dAY_MAXIMUM;
		LAT = lAT;
		LNG = lNG;
		ASSIGN_CODE = aSSIGN_CODE;
		ASSIGN_CODE_NM = aSSIGN_CODE_NM;
	}

	public String getPARKING_NAME() {
		return PARKING_NAME;
	}

	public void setPARKING_NAME(String pARKING_NAME) {
		PARKING_NAME = pARKING_NAME;
	}

	public String getADDR() {
		return ADDR;
	}

	public void setADDR(String aDDR) {
		ADDR = aDDR;
	}

	public String getPARKING_CODE() {
		return PARKING_CODE;
	}

	public void setPARKING_CODE(String pARKING_CODE) {
		PARKING_CODE = pARKING_CODE;
	}

	public String getPARKING_TYPE() {
		return PARKING_TYPE;
	}

	public void setPARKING_TYPE(String pARKING_TYPE) {
		PARKING_TYPE = pARKING_TYPE;
	}

	public String getPARKING_TYPE_NM() {
		return PARKING_TYPE_NM;
	}

	public void setPARKING_TYPE_NM(String pARKING_TYPE_NM) {
		PARKING_TYPE_NM = pARKING_TYPE_NM;
	}

	public String getOPERATION_RULE() {
		return OPERATION_RULE;
	}

	public void setOPERATION_RULE(String oPERATION_RULE) {
		OPERATION_RULE = oPERATION_RULE;
	}

	public String getOPERATION_RULE_NM() {
		return OPERATION_RULE_NM;
	}

	public void setOPERATION_RULE_NM(String oPERATION_RULE_NM) {
		OPERATION_RULE_NM = oPERATION_RULE_NM;
	}

	public String getTEL() {
		return TEL;
	}

	public void setTEL(String tEL) {
		TEL = tEL;
	}

	public String getQUE_STATUS() {
		return QUE_STATUS;
	}

	public void setQUE_STATUS(String qUE_STATUS) {
		QUE_STATUS = qUE_STATUS;
	}

	public String getQUE_STATUS_NM() {
		return QUE_STATUS_NM;
	}

	public void setQUE_STATUS_NM(String qUE_STATUS_NM) {
		QUE_STATUS_NM = qUE_STATUS_NM;
	}

	public String getCAPACITY() {
		return CAPACITY;
	}

	public void setCAPACITY(String cAPACITY) {
		CAPACITY = cAPACITY;
	}

	public String getCUR_PARKING() {
		return CUR_PARKING;
	}

	public void setCUR_PARKING(String cUR_PARKING) {
		CUR_PARKING = cUR_PARKING;
	}

	public String getCUR_PARKING_TIME() {
		return CUR_PARKING_TIME;
	}

	public void setCUR_PARKING_TIME(String cUR_PARKING_TIME) {
		CUR_PARKING_TIME = cUR_PARKING_TIME;
	}

	public String getPAY_YN() {
		return PAY_YN;
	}

	public void setPAY_YN(String pAY_YN) {
		PAY_YN = pAY_YN;
	}

	public String getPAY_NM() {
		return PAY_NM;
	}

	public void setPAY_NM(String pAY_NM) {
		PAY_NM = pAY_NM;
	}

	public String getNIGHT_FREE_OPEN() {
		return NIGHT_FREE_OPEN;
	}

	public void setNIGHT_FREE_OPEN(String nIGHT_FREE_OPEN) {
		NIGHT_FREE_OPEN = nIGHT_FREE_OPEN;
	}

	public String getNIGHT_FREE_OPEN_NM() {
		return NIGHT_FREE_OPEN_NM;
	}

	public void setNIGHT_FREE_OPEN_NM(String nIGHT_FREE_OPEN_NM) {
		NIGHT_FREE_OPEN_NM = nIGHT_FREE_OPEN_NM;
	}

	public String getWEEKDAY_BEGIN_TIME() {
		return WEEKDAY_BEGIN_TIME;
	}

	public void setWEEKDAY_BEGIN_TIME(String wEEKDAY_BEGIN_TIME) {
		WEEKDAY_BEGIN_TIME = wEEKDAY_BEGIN_TIME;
	}

	public String getWEEKDAY_END_TIME() {
		return WEEKDAY_END_TIME;
	}

	public void setWEEKDAY_END_TIME(String wEEKDAY_END_TIME) {
		WEEKDAY_END_TIME = wEEKDAY_END_TIME;
	}

	public String getWEEKEND_BEGIN_TIME() {
		return WEEKEND_BEGIN_TIME;
	}

	public void setWEEKEND_BEGIN_TIME(String wEEKEND_BEGIN_TIME) {
		WEEKEND_BEGIN_TIME = wEEKEND_BEGIN_TIME;
	}

	public String getWEEKEND_END_TIME() {
		return WEEKEND_END_TIME;
	}

	public void setWEEKEND_END_TIME(String wEEKEND_END_TIME) {
		WEEKEND_END_TIME = wEEKEND_END_TIME;
	}

	public String getHOLIDAY_BEGIN_TIME() {
		return HOLIDAY_BEGIN_TIME;
	}

	public void setHOLIDAY_BEGIN_TIME(String hOLIDAY_BEGIN_TIME) {
		HOLIDAY_BEGIN_TIME = hOLIDAY_BEGIN_TIME;
	}

	public String getHOLIDAY_END_TIME() {
		return HOLIDAY_END_TIME;
	}

	public void setHOLIDAY_END_TIME(String hOLIDAY_END_TIME) {
		HOLIDAY_END_TIME = hOLIDAY_END_TIME;
	}

	public String getSYNC_TIME() {
		return SYNC_TIME;
	}

	public void setSYNC_TIME(String sYNC_TIME) {
		SYNC_TIME = sYNC_TIME;
	}

	public String getSATURDAY_PAY_YN() {
		return SATURDAY_PAY_YN;
	}

	public void setSATURDAY_PAY_YN(String sATURDAY_PAY_YN) {
		SATURDAY_PAY_YN = sATURDAY_PAY_YN;
	}

	public String getSATURDAY_PAY_NM() {
		return SATURDAY_PAY_NM;
	}

	public void setSATURDAY_PAY_NM(String sATURDAY_PAY_NM) {
		SATURDAY_PAY_NM = sATURDAY_PAY_NM;
	}

	public String getHOLIDAY_PAY_YN() {
		return HOLIDAY_PAY_YN;
	}

	public void setHOLIDAY_PAY_YN(String hOLIDAY_PAY_YN) {
		HOLIDAY_PAY_YN = hOLIDAY_PAY_YN;
	}

	public String getHOLIDAY_PAY_NM() {
		return HOLIDAY_PAY_NM;
	}

	public void setHOLIDAY_PAY_NM(String hOLIDAY_PAY_NM) {
		HOLIDAY_PAY_NM = hOLIDAY_PAY_NM;
	}

	public String getFULLTIME_MONTHLY() {
		return FULLTIME_MONTHLY;
	}

	public void setFULLTIME_MONTHLY(String fULLTIME_MONTHLY) {
		FULLTIME_MONTHLY = fULLTIME_MONTHLY;
	}

	public String getGRP_PARKNM() {
		return GRP_PARKNM;
	}

	public void setGRP_PARKNM(String gRP_PARKNM) {
		GRP_PARKNM = gRP_PARKNM;
	}

	public double getRATES() {
		return RATES;
	}

	public void setRATES(double rATES) {
		RATES = rATES;
	}

	public double getTIME_RATE() {
		return TIME_RATE;
	}

	public void setTIME_RATE(double tIME_RATE) {
		TIME_RATE = tIME_RATE;
	}

	public double getADD_RATES() {
		return ADD_RATES;
	}

	public void setADD_RATES(double aDD_RATES) {
		ADD_RATES = aDD_RATES;
	}

	public double getADD_TIME_RATE() {
		return ADD_TIME_RATE;
	}

	public void setADD_TIME_RATE(double aDD_TIME_RATE) {
		ADD_TIME_RATE = aDD_TIME_RATE;
	}

	public double getBUS_RATES() {
		return BUS_RATES;
	}

	public void setBUS_RATES(double bUS_RATES) {
		BUS_RATES = bUS_RATES;
	}

	public double getBUS_TIME_RATE() {
		return BUS_TIME_RATE;
	}

	public void setBUS_TIME_RATE(double bUS_TIME_RATE) {
		BUS_TIME_RATE = bUS_TIME_RATE;
	}

	public double getBUS_ADD_TIME_RATE() {
		return BUS_ADD_TIME_RATE;
	}

	public void setBUS_ADD_TIME_RATE(double bUS_ADD_TIME_RATE) {
		BUS_ADD_TIME_RATE = bUS_ADD_TIME_RATE;
	}

	public double getBUS_ADD_RATES() {
		return BUS_ADD_RATES;
	}

	public void setBUS_ADD_RATES(double bUS_ADD_RATES) {
		BUS_ADD_RATES = bUS_ADD_RATES;
	}

	public String getDAY_MAXIMUM() {
		return DAY_MAXIMUM;
	}

	public void setDAY_MAXIMUM(String dAY_MAXIMUM) {
		DAY_MAXIMUM = dAY_MAXIMUM;
	}

	public double getLAT() {
		return LAT;
	}

	public void setLAT(double lAT) {
		LAT = lAT;
	}

	public double getLNG() {
		return LNG;
	}

	public void setLNG(double lNG) {
		LNG = lNG;
	}

	public String getASSIGN_CODE() {
		return ASSIGN_CODE;
	}

	public void setASSIGN_CODE(String aSSIGN_CODE) {
		ASSIGN_CODE = aSSIGN_CODE;
	}

	public String getASSIGN_CODE_NM() {
		return ASSIGN_CODE_NM;
	}

	public void setASSIGN_CODE_NM(String aSSIGN_CODE_NM) {
		ASSIGN_CODE_NM = aSSIGN_CODE_NM;
	}
	
}