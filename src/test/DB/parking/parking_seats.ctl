OPTIONS(skip=1)
load data
infile 'F:\project1\db\parking_seats.csv'
append
into table parking_seats
fields terminated by ','
trailing nullcols
(
parking_code
,que_status
,que_status_nm
,capacity
,cur_parking
,cur_parking_time
)