SELECT u.user_id, u.username, t.body users_feed, t.create_time
FROM tweet t
JOIN user u
 ON u.user_id = t.user_id
WHERE u.user_id = 1
	UNION
SELECT u.user_id, u.username, t.body users_feed, t.create_time
FROM tweet t
JOIN user u
 ON u.user_id = t.user_id
WHERE u.user_id IN (SELECT user_id FROM follower 
	WHERE followed_by_id = 1)
ORDER BY create_time DESC;