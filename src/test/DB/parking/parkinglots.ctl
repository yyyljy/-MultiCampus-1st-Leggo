OPTIONS(skip=1)
load data
infile 'F:\project1\db\parkinglots.csv'
append
into table parking_lots
fields terminated by ','
(
parking_code
,parking_name
,addr
,lat
,lng
,parking_type
,parking_type_nm
,operation_rule
,operation_rule_nm
,tel
)