SELECT comment comments_for_last_10h, create_time
FROM comment
WHERE create_time BETWEEN SUBDATE(NOW(), INTERVAL 11 HOUR)  AND  NOW()
ORDER BY create_time;