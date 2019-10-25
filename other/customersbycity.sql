SELECT C.CustomerCity, Count(*)
FROM
	customer C
group by
	C.CustomerCity;