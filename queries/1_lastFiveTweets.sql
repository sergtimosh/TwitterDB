SELECT t.tweet_id, u.username, t.body, t.create_time
FROM tweet t
JOIN user u
  ON u.user_id = t.user_id
ORDER BY t.create_time DESC
LIMIT 5;