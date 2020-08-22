OPTIONS(skip=1)
load data
infile 'F:\project1\db\parking_price.csv'
append
into table parking_price
fields terminated by ','
(
parking_code
,pay_yn
,pay_nm
,rates,time_rate,add_rates,add_time_rate,Saturday_pay_yn,Saturday_pay_nm,holiday_pay_yn
,holiday_pay_nm
,bus_rates
,bus_add_rates
,bus_time_rate
,bus_add_time_rate
,day_max_rate
,monthly_pass
)