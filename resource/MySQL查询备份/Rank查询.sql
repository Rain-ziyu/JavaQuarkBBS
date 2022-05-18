select rankId,description,rankName,userLevel,userPostsCount,rankUrl from quark_rank where userPostsCount>(select COUNT(1) from quark_posts where user_id = 1) and userLevel>(SELECT userLevel from quark_userLevel where userId = 1)


SELECT
	rankId,
	description,
	rankName,
	userLevel,
	userPostsCount,
	rankUrl 
FROM
	quark_rank 
WHERE
	userPostsCount >(
	SELECT
		COUNT( 1 ) 
	FROM
		quark_posts 
		left JOIN
		quark_user
	on
		(quark_posts.user_id = quark_user.id) 
	) 
	AND userLevel >(
	SELECT
		userLevel 
	FROM
		quark_userLevel 
			left JOIN
		quark_user
	on
		(quark_userLevel.userId = quark_user.id) )
		
		
		select userId, userExp, userLevel, useingRank as rankId, rankUrl, lastLoginTime         from quark_userLevel         where userId = 1