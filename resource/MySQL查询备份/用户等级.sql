SELECT
	`quark_rank`.`rankId` AS `rankId`,
	`quark_rank`.`description` AS `description`,
	`quark_rank`.`rankName` AS `rankName`,
	`quark_rank`.`userLevel` AS `userLevel`,
	`quark_rank`.`userPostsCount` AS `userPostsCount`,
	`quark_rank`.`rankUrl` AS `rankUrl`,
	`quark_user`.`id` AS `userID` 
FROM
	( `quark_rank` JOIN `quark_user` ) 
WHERE
	`quark_rank`.`userPostsCount` < ( SELECT count( 1 ) FROM `quark_posts` WHERE `quark_posts`.`user_id` = `quark_user`.`id` ) 
	AND `quark_rank`.`userLevel` < ( SELECT `quark_userLevel`.`userLevel` FROM `quark_userLevel` WHERE `quark_userLevel`.`userId` = `quark_user`.`id` ) 
	
	
SELECT
	rankId,
	description,
	rankName,
	userLevel,
	userPostsCount,
	rankUrl 
FROM
	view_quark_userRank 
WHERE
	userID = 1 SELECT
	* 
FROM
	quark_userRank
	LEFT JOIN quark_rank ON ( quark_rank.rankId = quark_userRank.userRank ) 
	
	
	
SELECT
	userId,
	getTime,
	rankId,
	description,
	rankName,
	userLevel,
	userPostsCount,
	rankUrl 
FROM
	quark_userRank
	LEFT JOIN quark_rank ON ( quark_rank.rankId = quark_userRank.userRank ) 
WHERE
	quark_userRank.userId = 1