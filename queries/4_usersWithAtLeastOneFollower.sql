SELECT u.user_id, u.username users_with_followers,  COUNT(f.followed_by_id) followers_number
FROM user u
 JOIN follower f
  ON f.user_id = u.user_id
GROUP BY f.user_id
HAVING followers_number >=1
ORDER BY followers_number;