SELECT ROUND(LAT_N, 4)
FROM STATION
WHERE 38.7780 < LAT_N
ORDER BY LAT_N
LIMIT 1
