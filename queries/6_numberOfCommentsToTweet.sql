SELECT t.tweet_id, t.body tweet, COUNT(c.comment_id) comments_number
FROM tweet t
INNER JOIN comment c
 ON c.tweet_id = t.tweet_id
GROUP BY c.tweet_id
ORDER BY comments_number DESC;