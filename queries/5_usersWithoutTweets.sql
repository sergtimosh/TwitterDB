SELECT user_id, username user_without_tweets
FROM user u
WHERE user_id NOT IN
	(SELECT user_id FROM tweet);