SELECT u.user_id, u.username,  COUNT(f.followed_by_id) followers_number
FROM user u
LEFT JOIN follower f
  ON  u.user_id = f.user_id
GROUP BY u.user_id
ORDER BY followers_number DESC;