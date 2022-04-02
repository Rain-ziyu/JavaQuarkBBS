/*
 Navicat Premium Data Transfer

 Source Server         : tx云
 Source Server Type    : MariaDB
 Source Server Version : 100328
 Source Host           : yzzy.top:3306
 Source Schema         : zutCommunity

 Target Server Type    : MariaDB
 Target Server Version : 100328
 File Encoding         : 65001

 Date: 02/04/2022 17:05:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence`  (
  `next_val` bigint(20) NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------
INSERT INTO `hibernate_sequence` VALUES (130);
INSERT INTO `hibernate_sequence` VALUES (130);
INSERT INTO `hibernate_sequence` VALUES (130);
INSERT INTO `hibernate_sequence` VALUES (130);
INSERT INTO `hibernate_sequence` VALUES (130);
INSERT INTO `hibernate_sequence` VALUES (130);
INSERT INTO `hibernate_sequence` VALUES (130);
INSERT INTO `hibernate_sequence` VALUES (130);
INSERT INTO `hibernate_sequence` VALUES (130);

-- ----------------------------
-- Table structure for my_reply
-- ----------------------------
DROP TABLE IF EXISTS `my_reply`;
CREATE TABLE `my_reply`  (
  `id` int(11) NOT NULL,
  `content` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `init_time` datetime NULL DEFAULT NULL,
  `up` int(11) NULL DEFAULT NULL,
  `hfuser_id` int(11) NULL DEFAULT NULL,
  `bhfuser_id` int(11) NULL DEFAULT NULL,
  `reply_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of my_reply
-- ----------------------------

-- ----------------------------
-- Table structure for quark_adminuser
-- ----------------------------
DROP TABLE IF EXISTS `quark_adminuser`;
CREATE TABLE `quark_adminuser`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enable` int(11) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_4erqa44qkwwkl539xouso7v4c`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 89 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quark_adminuser
-- ----------------------------
INSERT INTO `quark_adminuser` VALUES (88, 1, 'c22e977b9063ea8edc6e4847271451fb', 'root');

-- ----------------------------
-- Table structure for quark_adminuser_role
-- ----------------------------
DROP TABLE IF EXISTS `quark_adminuser_role`;
CREATE TABLE `quark_adminuser_role`  (
  `adminuser_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`adminuser_id`, `role_id`) USING BTREE,
  INDEX `FK26lllx1jn0c1k8f8oj2qt4io1`(`role_id`) USING BTREE,
  CONSTRAINT `FK26lllx1jn0c1k8f8oj2qt4io1` FOREIGN KEY (`role_id`) REFERENCES `quark_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKatv5o94k3fooskwr53rvqfven` FOREIGN KEY (`adminuser_id`) REFERENCES `quark_adminuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quark_adminuser_role
-- ----------------------------
INSERT INTO `quark_adminuser_role` VALUES (88, 1);
INSERT INTO `quark_adminuser_role` VALUES (88, 6);

-- ----------------------------
-- Table structure for quark_advertisement
-- ----------------------------
DROP TABLE IF EXISTS `quark_advertisement`;
CREATE TABLE `quark_advertisement`  (
  `imgUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `webPageUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `endDate` datetime NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT 0,
  `advLocation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userId` int(255) NULL DEFAULT NULL,
  `startDate` datetime NULL DEFAULT NULL,
  `dailyStartTime` time NULL DEFAULT NULL,
  `dailyEndTime` time NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quark_advertisement
-- ----------------------------
INSERT INTO `quark_advertisement` VALUES ('http://yzzy.top/images/upload/2022-03-31/ae018301-f6a1-437b-add1-2f6e0c82cba8.jpeg', 'th', 'fdh', 'fdgh', '1', '2022-04-21 00:00:00', NULL, 'shanghai', 1, '2022-04-05 00:00:00', '09:54:14', '13:54:16', ';o;j', 1);
INSERT INTO `quark_advertisement` VALUES ('http://yzzy.top/images/upload/2022-04-01/5a75852d-b194-45fb-a9d0-da035daa732a.jpeg', 'dgf', 'dg', 'dg', '1', '2022-05-18 00:00:00', NULL, 'shanghai', 110, '2022-04-04 00:00:00', '13:28:43', '16:28:46', 'test', 2);
INSERT INTO `quark_advertisement` VALUES ('http://yzzy.top/images/upload/2022-04-01/5a75852d-b194-45fb-a9d0-da035daa732a.jpeg', 'dgf', 'dg', 'dg', '1', '2022-05-18 00:00:00', NULL, 'shanghai', 110, '2022-04-04 00:00:00', '13:28:43', '16:28:46', 'test', 3);
INSERT INTO `quark_advertisement` VALUES ('http://yzzy.top/images/upload/2022-04-01/ee6aec98-d822-4ea8-94c6-303605e22657.jpeg', 'as', 'as', 'as', '1', '2022-05-23 00:00:00', NULL, 'shanghai', 110, '2022-04-11 00:00:00', '14:31:14', '15:31:16', 'test', 4);
INSERT INTO `quark_advertisement` VALUES ('http://yzzy.top/images/upload/2022-04-02/4e8f2ffb-4842-48bc-8275-8353fbce04da.jpeg', 'ee', 'ee', 'ee', '1', '2022-05-18 00:00:00', NULL, 'shanghai', 1, '2022-04-05 00:00:00', '15:03:33', '17:08:35', 'test', 5);
INSERT INTO `quark_advertisement` VALUES ('http://yzzy.top/images/upload/2022-04-02/34e76e19-5fcb-4357-96bb-c5db1cb8e3b4.png', 'url', 'url', 'url', '1', '2022-05-26 00:00:00', NULL, 'shanghai', 1, '2022-04-15 00:00:00', '14:43:10', '18:43:13', '测试', 6);

-- ----------------------------
-- Table structure for quark_chat_user
-- ----------------------------
DROP TABLE IF EXISTS `quark_chat_user`;
CREATE TABLE `quark_chat_user`  (
  `chatId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `firstUserId` int(11) NULL DEFAULT NULL,
  `secondUserId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`chatId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quark_chat_user
-- ----------------------------
INSERT INTO `quark_chat_user` VALUES ('Chat:127:1', 127, 1);
INSERT INTO `quark_chat_user` VALUES ('Chat:127:127', 127, 127);
INSERT INTO `quark_chat_user` VALUES ('Chat:1:1', 1, 1);
INSERT INTO `quark_chat_user` VALUES ('Chat:95:1', 1, 95);

-- ----------------------------
-- Table structure for quark_collect
-- ----------------------------
DROP TABLE IF EXISTS `quark_collect`;
CREATE TABLE `quark_collect`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `init_time` datetime NULL DEFAULT NULL,
  `posts_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK5a8rh83fve6ug3utggpy8wdvi`(`posts_id`) USING BTREE,
  INDEX `FKg4gtyqabrsuwr5y35lxvjy515`(`user_id`) USING BTREE,
  CONSTRAINT `FK5a8rh83fve6ug3utggpy8wdvi` FOREIGN KEY (`posts_id`) REFERENCES `quark_posts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKg4gtyqabrsuwr5y35lxvjy515` FOREIGN KEY (`user_id`) REFERENCES `quark_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 130 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quark_collect
-- ----------------------------
INSERT INTO `quark_collect` VALUES (128, '2022-04-02 17:01:28', 93, 1);
INSERT INTO `quark_collect` VALUES (129, '2022-04-02 17:01:28', 93, 1);

-- ----------------------------
-- Table structure for quark_label
-- ----------------------------
DROP TABLE IF EXISTS `quark_label`;
CREATE TABLE `quark_label`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `details` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `posts_count` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_6vml4ba2itmaor84892v92b1f`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 88 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quark_label
-- ----------------------------
INSERT INTO `quark_label` VALUES (1, '关于JavaSe的话题', 'JavaSe', 204);
INSERT INTO `quark_label` VALUES (2, '关于Java企业级开发的话题', 'JavaEE', 2);
INSERT INTO `quark_label` VALUES (3, '关于Java虚拟机的话题', 'JVM', 3);
INSERT INTO `quark_label` VALUES (4, '关于Spring框架的话题', 'Spring', 2);
INSERT INTO `quark_label` VALUES (5, '关于Hibernate框架的话题', 'Hibernate', 1);
INSERT INTO `quark_label` VALUES (6, '关于Scala语言的话题', 'Scala', 0);
INSERT INTO `quark_label` VALUES (8, '关于Java并发编程的话题', 'Java并发编程', 2);
INSERT INTO `quark_label` VALUES (9, '关于Android的话题', 'Android', 2);
INSERT INTO `quark_label` VALUES (87, '常见的项目开发遇到的问题与解决方案', '项目开发问题', 11);

-- ----------------------------
-- Table structure for quark_notification
-- ----------------------------
DROP TABLE IF EXISTS `quark_notification`;
CREATE TABLE `quark_notification`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_read` bit(1) NULL DEFAULT NULL,
  `fromuser_id` int(11) NOT NULL,
  `posts_id` int(11) NOT NULL,
  `touser_id` int(11) NOT NULL,
  `init_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKac4wjs0b3992ohkf61jy4ilmj`(`fromuser_id`) USING BTREE,
  INDEX `FKilg05a7ki3vkv7lfjnn57pdw2`(`posts_id`) USING BTREE,
  INDEX `FKquscxmtiqggsch7w833ywubux`(`touser_id`) USING BTREE,
  CONSTRAINT `FKac4wjs0b3992ohkf61jy4ilmj` FOREIGN KEY (`fromuser_id`) REFERENCES `quark_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKilg05a7ki3vkv7lfjnn57pdw2` FOREIGN KEY (`posts_id`) REFERENCES `quark_posts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKquscxmtiqggsch7w833ywubux` FOREIGN KEY (`touser_id`) REFERENCES `quark_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quark_notification
-- ----------------------------
INSERT INTO `quark_notification` VALUES (98, b'1', 95, 93, 1, '2022-02-23 16:03:24');
INSERT INTO `quark_notification` VALUES (101, b'1', 96, 93, 1, '2022-02-23 16:03:56');
INSERT INTO `quark_notification` VALUES (103, b'1', 95, 92, 1, '2022-02-23 16:04:08');
INSERT INTO `quark_notification` VALUES (105, b'1', 94, 93, 1, '2022-02-23 16:04:59');
INSERT INTO `quark_notification` VALUES (108, b'0', 1, 106, 95, '2022-02-23 16:12:54');

-- ----------------------------
-- Table structure for quark_permission
-- ----------------------------
DROP TABLE IF EXISTS `quark_permission`;
CREATE TABLE `quark_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `perurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  `parentid` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quark_permission
-- ----------------------------
INSERT INTO `quark_permission` VALUES (1, '系统设置', '/system', 1, 0, 0);
INSERT INTO `quark_permission` VALUES (2, '管理员管理', '/adminsPage', 2, 1, 1);
INSERT INTO `quark_permission` VALUES (3, '角色管理', '/rolesPage', 3, 1, 1);
INSERT INTO `quark_permission` VALUES (4, '权限管理', '/permissionsPage', 4, 1, 1);
INSERT INTO `quark_permission` VALUES (5, '添加管理员', '/admins/add', 21, 2, 2);
INSERT INTO `quark_permission` VALUES (6, '删除管理员', '/admins/delete', 22, 2, 2);
INSERT INTO `quark_permission` VALUES (7, '添加角色', '/roles/add', 23, 2, 3);
INSERT INTO `quark_permission` VALUES (8, '删除角色', '/roles/delete', 24, 2, 3);
INSERT INTO `quark_permission` VALUES (9, '添加权限', '/permissions/add', 25, 2, 4);
INSERT INTO `quark_permission` VALUES (10, '删除权限', '/permissions/delete', 26, 2, 4);
INSERT INTO `quark_permission` VALUES (11, '分配角色', '/admins/saveAdminRole', 27, 2, 2);
INSERT INTO `quark_permission` VALUES (12, '分配权限', '/roles/saveRolePermission', 28, 2, 3);
INSERT INTO `quark_permission` VALUES (13, '启用/禁用管理员', '/admins/saveAdminEnable', 29, 2, 2);
INSERT INTO `quark_permission` VALUES (16, '用户管理', '/usersPage', 5, 1, 1);
INSERT INTO `quark_permission` VALUES (17, '启用/禁用用户', '/users/saveUserEnable', 31, 2, 16);
INSERT INTO `quark_permission` VALUES (18, '帖子管理', '/postsPage', 6, 1, 1);
INSERT INTO `quark_permission` VALUES (19, '帖子置顶', '/posts/saveTop', 32, 2, 18);
INSERT INTO `quark_permission` VALUES (20, '帖子加精', '/posts/saveGood', 33, 2, 18);
INSERT INTO `quark_permission` VALUES (21, '帖子删除', '/posts/delete', 34, 2, 18);
INSERT INTO `quark_permission` VALUES (22, '回复管理', '/replysPage', 7, 1, 1);
INSERT INTO `quark_permission` VALUES (24, '删除回复', '/replys/delete', 35, 2, 22);
INSERT INTO `quark_permission` VALUES (25, '标签管理', '/labelsPage', 8, 1, 1);
INSERT INTO `quark_permission` VALUES (26, '添加标签', '/labels/add', 36, 2, 25);
INSERT INTO `quark_permission` VALUES (27, '删除标签', '/labels/delete', 37, 2, 25);
INSERT INTO `quark_permission` VALUES (28, '修改标签', '/labels/update', 37, 2, 25);

-- ----------------------------
-- Table structure for quark_posts
-- ----------------------------
DROP TABLE IF EXISTS `quark_posts`;
CREATE TABLE `quark_posts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `good` bit(1) NOT NULL,
  `init_time` datetime NOT NULL,
  `label_id` int(11) NULL DEFAULT NULL,
  `reply_count` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `top` bit(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_46eh0lt2x9ftqcv9tjs8meqj8`(`title`) USING BTREE,
  INDEX `FK41ebsa5jpn18egdtjo6uiaugn`(`user_id`) USING BTREE,
  INDEX `FKnxd3qh1m3c0o6tc3ojfa8fm6o`(`label_id`) USING BTREE,
  CONSTRAINT `FK41ebsa5jpn18egdtjo6uiaugn` FOREIGN KEY (`user_id`) REFERENCES `quark_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKnxd3qh1m3c0o6tc3ojfa8fm6o` FOREIGN KEY (`label_id`) REFERENCES `quark_label` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 214 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quark_posts
-- ----------------------------
INSERT INTO `quark_posts` VALUES (92, '<p><img src=\"http://yzzy.top/images/upload/2022-02-23/24f35195-ad47-4f1a-9271-403422c1db6b.png\" alt=\"null\"><br></p><p>需要添加一下代码，渲染html</p><pre>$(<span>\"</span><span>#label_select</span><span>\"</span>).<span>append</span>(htm)<span>;<br></span><span>layui</span>.<span>use</span>([<span>\'form\'</span><span>, </span><span>\'layedit\'</span>]<span>, function </span>() {<br>    <span>var </span>form = <span>layui</span>.<span>form</span><span>;<br></span><span>        </span>form.render()<span>;<br></span>})<span>;</span></pre>', b'0', '2022-02-23 15:59:31', 87, 1, '使用LayUI进行HTML标签的append时会出现不能及时刷新显示的问题', b'0', 1);
INSERT INTO `quark_posts` VALUES (93, '<img src=\"http://yzzy.top/images/upload/2022-02-23/f81028b8-d1c0-44d9-84b7-4639213e5a18.png\" alt=\"null\">', b'0', '2022-02-23 16:02:35', 87, 3, '考研成绩已出，大家对未来有什么规划吗', b'0', 1);
INSERT INTO `quark_posts` VALUES (106, '说出你的想法', b'0', '2022-02-23 16:05:33', 8, 1, '论如何逃避现实', b'0', 95);
INSERT INTO `quark_posts` VALUES (109, '<img src=\"http://yzzy.top/images/upload/2022-02-23/71f6dbec-db58-441c-833a-a60e56b75367.jpeg\" alt=\"null\">', b'0', '2022-02-23 16:14:24', 1, 0, '大家都多少分啊，也没个人说（Http状态码）', b'0', 1);
INSERT INTO `quark_posts` VALUES (111, '每次发帖5exp', b'0', '2022-04-02 13:10:55', 87, 0, '测试发帖是否提升等级', b'0', 1);

-- ----------------------------
-- Table structure for quark_rank
-- ----------------------------
DROP TABLE IF EXISTS `quark_rank`;
CREATE TABLE `quark_rank`  (
  `rankId` int(11) NOT NULL AUTO_INCREMENT COMMENT '头衔id',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头衔获取描述',
  `rankName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头衔名称',
  `userLevel` int(11) NULL DEFAULT 999 COMMENT '获取头衔需要的等级：没有等级要求999',
  `userPostsCount` int(11) NULL DEFAULT 999 COMMENT '获取头衔所需的发帖数量：没有该要求999',
  `rankUrl` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '头衔样式及url',
  PRIMARY KEY (`rankId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quark_rank
-- ----------------------------
INSERT INTO `quark_rank` VALUES (1, '初始账号默认头衔', '萌新新', 0, 0, 'url');

-- ----------------------------
-- Table structure for quark_reply
-- ----------------------------
DROP TABLE IF EXISTS `quark_reply`;
CREATE TABLE `quark_reply`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `init_time` datetime NULL DEFAULT NULL,
  `up` int(11) NOT NULL,
  `posts_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKnr6a7xtk9rm31ptn6gchi9113`(`posts_id`) USING BTREE,
  INDEX `FKnt12hb9oqfm5eamjpg27bkpvv`(`user_id`) USING BTREE,
  CONSTRAINT `FKnr6a7xtk9rm31ptn6gchi9113` FOREIGN KEY (`posts_id`) REFERENCES `quark_posts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKnt12hb9oqfm5eamjpg27bkpvv` FOREIGN KEY (`user_id`) REFERENCES `quark_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quark_reply
-- ----------------------------
INSERT INTO `quark_reply` VALUES (97, '规划如何欺负我龙哥', '2022-02-23 16:03:24', 0, 93, 95);
INSERT INTO `quark_reply` VALUES (99, '公务员不好吗&nbsp;', '2022-02-23 16:03:56', 0, 93, 96);
INSERT INTO `quark_reply` VALUES (100, '？？？', '2022-02-23 16:03:56', 0, 93, 1);
INSERT INTO `quark_reply` VALUES (102, '<p>牛的呀</p><p><br></p>', '2022-02-23 16:04:08', 0, 92, 95);
INSERT INTO `quark_reply` VALUES (104, '？？？', '2022-02-23 16:04:59', 0, 93, 94);
INSERT INTO `quark_reply` VALUES (107, '<p>多看片，少看书。</p><p>多看色图</p>', '2022-02-23 16:12:54', 0, 106, 1);

-- ----------------------------
-- Table structure for quark_role
-- ----------------------------
DROP TABLE IF EXISTS `quark_role`;
CREATE TABLE `quark_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_ff572j64wr6y4taed1c27vfo6`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quark_role
-- ----------------------------
INSERT INTO `quark_role` VALUES (1, '超级权限', '超级管理员');
INSERT INTO `quark_role` VALUES (6, '管理用户', '用户管理员');

-- ----------------------------
-- Table structure for quark_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `quark_role_permission`;
CREATE TABLE `quark_role_permission`  (
  `role_id` int(11) NOT NULL,
  `permissions_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`, `permissions_id`) USING BTREE,
  INDEX `FKlsdkf5vtsq5qvepw45r0y89jw`(`permissions_id`) USING BTREE,
  CONSTRAINT `FK763ep4ix05naeoliv21sm6m81` FOREIGN KEY (`role_id`) REFERENCES `quark_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKlsdkf5vtsq5qvepw45r0y89jw` FOREIGN KEY (`permissions_id`) REFERENCES `quark_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quark_role_permission
-- ----------------------------
INSERT INTO `quark_role_permission` VALUES (1, 1);
INSERT INTO `quark_role_permission` VALUES (1, 2);
INSERT INTO `quark_role_permission` VALUES (1, 3);
INSERT INTO `quark_role_permission` VALUES (1, 4);
INSERT INTO `quark_role_permission` VALUES (1, 5);
INSERT INTO `quark_role_permission` VALUES (1, 6);
INSERT INTO `quark_role_permission` VALUES (1, 7);
INSERT INTO `quark_role_permission` VALUES (1, 8);
INSERT INTO `quark_role_permission` VALUES (1, 9);
INSERT INTO `quark_role_permission` VALUES (1, 10);
INSERT INTO `quark_role_permission` VALUES (1, 11);
INSERT INTO `quark_role_permission` VALUES (1, 12);
INSERT INTO `quark_role_permission` VALUES (1, 13);
INSERT INTO `quark_role_permission` VALUES (1, 16);
INSERT INTO `quark_role_permission` VALUES (1, 17);
INSERT INTO `quark_role_permission` VALUES (1, 18);
INSERT INTO `quark_role_permission` VALUES (1, 19);
INSERT INTO `quark_role_permission` VALUES (1, 20);
INSERT INTO `quark_role_permission` VALUES (1, 21);
INSERT INTO `quark_role_permission` VALUES (1, 22);
INSERT INTO `quark_role_permission` VALUES (1, 24);
INSERT INTO `quark_role_permission` VALUES (1, 25);
INSERT INTO `quark_role_permission` VALUES (1, 26);
INSERT INTO `quark_role_permission` VALUES (1, 27);
INSERT INTO `quark_role_permission` VALUES (1, 28);
INSERT INTO `quark_role_permission` VALUES (6, 1);
INSERT INTO `quark_role_permission` VALUES (6, 16);
INSERT INTO `quark_role_permission` VALUES (6, 17);

-- ----------------------------
-- Table structure for quark_user
-- ----------------------------
DROP TABLE IF EXISTS `quark_user`;
CREATE TABLE `quark_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `enable` int(11) NOT NULL,
  `init_time` datetime NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` int(11) NULL DEFAULT NULL,
  `signature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_2uqfoo05i1p5qm4ntysj2ivbs`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 128 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quark_user
-- ----------------------------
INSERT INTO `quark_user` VALUES (1, 'http://yzzy.top/images/upload/2022-04-02/fa2f3554-7ad9-46f0-8f13-19872cc044c3.jpeg', 1, '2022-02-07 14:11:51', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 'ziyu', '1874300301@qq.com');
INSERT INTO `quark_user` VALUES (94, 'http://yzzy.top/images/upload/default.png', 1, '2022-02-23 16:02:37', 'c1a5b2c9a2ea32bef984b65e405409e0', 0, NULL, 'aloha', 'w297824@163.com');
INSERT INTO `quark_user` VALUES (95, 'http://yzzy.top/images/upload/default.png', 1, '2022-02-23 16:02:43', '65a0ec385ca6a0c1e20d1f8270c28303', 0, NULL, '呀呼', '123456789@163.com');
INSERT INTO `quark_user` VALUES (96, 'http://yzzy.top/images/upload/default.png', 1, '2022-02-23 16:03:13', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 'chen', '294@qq.com');
INSERT INTO `quark_user` VALUES (127, 'http://yzzy.top/images/upload/default.png', 1, '2022-04-02 16:13:03', 'f6fdffe48c908deb0f4c3bd36c032e72', 0, NULL, 'admin', 'admin@admin.com');

-- ----------------------------
-- Table structure for quark_userLevel
-- ----------------------------
DROP TABLE IF EXISTS `quark_userLevel`;
CREATE TABLE `quark_userLevel`  (
  `userId` int(11) NOT NULL,
  `userExp` int(11) NULL DEFAULT 0,
  `userLevel` int(11) NULL DEFAULT 0,
  `useingRank` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rankUrl` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `lastLoginTime` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quark_userLevel
-- ----------------------------
INSERT INTO `quark_userLevel` VALUES (1, 100010, 10001, '1', 'url', '2022-04-02 13:01:18');
INSERT INTO `quark_userLevel` VALUES (94, 0, 0, '1', 'url', '2022-04-02 16:48:50');
INSERT INTO `quark_userLevel` VALUES (95, 0, 0, '1', 'url', '2022-04-02 16:48:50');
INSERT INTO `quark_userLevel` VALUES (96, 0, 0, '1', 'url', '2022-04-02 16:48:50');
INSERT INTO `quark_userLevel` VALUES (127, 5, 0, '1', 'url', '2022-04-02 16:13:17');

-- ----------------------------
-- Table structure for quark_userRank
-- ----------------------------
DROP TABLE IF EXISTS `quark_userRank`;
CREATE TABLE `quark_userRank`  (
  `userId` int(11) NOT NULL,
  `userRank` int(11) NOT NULL,
  `getTime` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`userRank`, `userId`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quark_userRank
-- ----------------------------
INSERT INTO `quark_userRank` VALUES (1, 1, '2022-04-01 17:20:31');
INSERT INTO `quark_userRank` VALUES (94, 1, NULL);
INSERT INTO `quark_userRank` VALUES (95, 1, NULL);
INSERT INTO `quark_userRank` VALUES (96, 1, NULL);
INSERT INTO `quark_userRank` VALUES (127, 1, NULL);

-- ----------------------------
-- View structure for view_quark_userRank
-- ----------------------------
DROP VIEW IF EXISTS `view_quark_userRank`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_quark_userRank` AS select `quark_rank`.`rankId` AS `rankId`,`quark_rank`.`description` AS `description`,`quark_rank`.`rankName` AS `rankName`,`quark_rank`.`userLevel` AS `userLevel`,`quark_rank`.`userPostsCount` AS `userPostsCount`,`quark_rank`.`rankUrl` AS `rankUrl`,`quark_user`.`id` AS `userID` from (`quark_rank` join `quark_user`) where `quark_rank`.`userPostsCount` < (select count(1) from `quark_posts` where `quark_posts`.`user_id` = `quark_user`.`id`) and `quark_rank`.`userLevel` < (select `quark_userLevel`.`userLevel` from `quark_userLevel` where `quark_userLevel`.`userId` = `quark_user`.`id`);

SET FOREIGN_KEY_CHECKS = 1;
