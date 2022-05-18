-- 获取用户点赞数、收藏数、发帖数、用户等级
SELECT
	collectCounts,
	postsCount,
	postsGood,
	quark_userLevel.userLevel,
	quark_user.id,
	quark_user.username,
	quark_user.icon,
	quark_user.`enable` 
FROM
	quark_user
	LEFT JOIN ( SELECT count(*) AS postsCount, quark_posts.user_id, sum( quark_posts.good ) AS postsGood FROM quark_posts GROUP BY quark_posts.user_id ) AS posts ON posts.user_id = quark_user.id
	LEFT JOIN (
	SELECT
		sum( collectCount ) AS collectCounts,
		quark_posts.user_id 
	FROM
		quark_posts
		LEFT JOIN ( SELECT COUNT(*) AS collectCount, quark_collect.posts_id AS posts_id FROM quark_collect GROUP BY quark_collect.posts_id ) AS a ON quark_posts.id = a.posts_id 
	GROUP BY
		quark_posts.user_id 
	) AS collect ON collect.user_id = quark_user.id
	LEFT JOIN quark_userLevel ON quark_userLevel.userId = quark_user.id;



EXPLAIN SELECT 
  `USER`.id,
	USER.username,
	USER.icon,
	quark_userLevel.userLevel ,
  count(*) as postsCount
	,a.collectCount as collectCount
FROM
	quark_user  `USER`
	LEFT JOIN quark_userLevel ON USER.id = quark_userLevel.userId
	LEFT JOIN quark_posts ON quark_posts.user_id = `USER`.id
	LEFT JOIN (SELECT count(*) as collectCount,quark_collect.posts_id as posts_id from quark_collect GROUP BY quark_collect.posts_id) as a on a.posts_id = quark_posts.id
GROUP BY `USER`.id;
show WARNINGS;
-- 每个用户的发帖数

SELECT   count(*) as postsCount,quark_posts.user_id,sum(quark_posts.good) as postsGood  from quark_posts GROUP BY quark_posts.user_id;

-- 每个用户的被收藏数
SELECT COUNT(*) as collectCount,quark_collect.posts_id from quark_collect GROUP BY quark_collect.posts_id;

SELECT
	sum( collectCount ) AS collectCounts,
	quark_posts.user_id 
FROM
	quark_posts
	left join (
	SELECT
		COUNT(*) AS collectCount,
		quark_collect.posts_id AS posts_id 
	FROM
		quark_collect 
	GROUP BY
		quark_collect.posts_id 
	) AS a 
on
	quark_posts.id = a.posts_id
	GROUP BY quark_posts.user_id ;
-- 	每个用户的等级
SELECT
	quark_user.id,
	quark_user.icon,
	quark_user.username ,
	quark_userLevel.userLevel
FROM
	quark_user
	LEFT JOIN quark_userLevel ON quark_userLevel.userId = quark_user.id;
	

SELECT 
  `USER`.id,
	USER.username,
	USER.icon,
	quark_userLevel.userLevel ,
  count(*)
FROM
	quark_user  `USER`
	LEFT JOIN quark_userLevel ON USER.id = quark_userLevel.userId
	LEFT JOIN quark_posts ON quark_posts.user_id = `USER`.id
GROUP BY `USER`.id;

SELECT 
  `USER`.id,
	USER.username,
	USER.icon,
	quark_userLevel.userLevel 
	, count(*)
FROM
	quark_user  `USER`
	LEFT JOIN quark_userLevel ON USER.id = quark_userLevel.userId
	LEFT JOIN quark_posts ON quark_posts.user_id = `USER`.id
GROUP BY quark_posts.user_id;