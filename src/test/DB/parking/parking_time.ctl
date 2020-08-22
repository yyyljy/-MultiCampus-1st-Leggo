OPTIONS(skip=1)
load data
infile 'F:\project1\db\parking_time.csv'
append
into table parking_time
fields terminated by ','
trailing nullcols
(
parking_code
,night_free_open
,night_free_open_nm
,weekday_begin_time
,weekday_end_time
,weekend_begin_time
,weekend_end_time
,holiday_begin_time
,holiday_end_time
,sync_time
)