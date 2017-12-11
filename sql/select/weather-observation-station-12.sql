SELECT DISTINCT CITY
FROM STATION
WHERE LEFT(CITY, 1) NOT IN ('a',
                            'i',
                            'u',
                            'e',
                            'o')
  AND RIGHT(CITY, 1) NOT IN ('a',
                             'i',
                             'u',
                             'e',
                             'o')
