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

 Date: 20/05/2022 15:32:23
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
INSERT INTO `hibernate_sequence` VALUES (213);
INSERT INTO `hibernate_sequence` VALUES (213);
INSERT INTO `hibernate_sequence` VALUES (213);
INSERT INTO `hibernate_sequence` VALUES (213);
INSERT INTO `hibernate_sequence` VALUES (213);
INSERT INTO `hibernate_sequence` VALUES (213);
INSERT INTO `hibernate_sequence` VALUES (213);
INSERT INTO `hibernate_sequence` VALUES (213);
INSERT INTO `hibernate_sequence` VALUES (213);

-- ----------------------------
-- Table structure for my_reply
-- ----------------------------
DROP TABLE IF EXISTS `my_reply`;
CREATE TABLE `my_reply`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `init_time` datetime NULL DEFAULT NULL,
  `up` int(11) NULL DEFAULT NULL,
  `hfuser_id` int(11) NULL DEFAULT NULL,
  `bhfuser_id` int(11) NULL DEFAULT NULL,
  `reply_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of my_reply
-- ----------------------------
INSERT INTO `my_reply` VALUES (1, '1111111111111', NULL, NULL, 130, 95, 97);
INSERT INTO `my_reply` VALUES (2, '66666666666', NULL, NULL, 130, 130, 97);

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
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quark_advertisement
-- ----------------------------
INSERT INTO `quark_advertisement` VALUES ('http://yzzy.top/images/upload/2022-03-31/ae018301-f6a1-437b-add1-2f6e0c82cba8.jpeg', 'th', 'fdh', 'fdgh', '1', '2022-04-21 00:00:00', NULL, 'shanghai', 1, '2022-04-05 00:00:00', '09:54:14', '13:54:16', ';o;j', 1);
INSERT INTO `quark_advertisement` VALUES ('http://yzzy.top/images/upload/2022-04-01/5a75852d-b194-45fb-a9d0-da035daa732a.jpeg', 'dgf', 'dg', 'dg', '1', '2022-05-18 00:00:00', NULL, 'shanghai', 110, '2022-04-04 00:00:00', '13:28:43', '16:28:46', 'test', 2);
INSERT INTO `quark_advertisement` VALUES ('http://yzzy.top/images/upload/2022-04-01/5a75852d-b194-45fb-a9d0-da035daa732a.jpeg', 'dgf', 'dg', 'dg', '1', '2022-05-18 00:00:00', NULL, 'shanghai', 110, '2022-04-04 00:00:00', '13:28:43', '16:28:46', 'test', 3);
INSERT INTO `quark_advertisement` VALUES ('http://yzzy.top/images/upload/2022-04-01/ee6aec98-d822-4ea8-94c6-303605e22657.jpeg', 'as', 'as', 'as', '1', '2022-05-23 00:00:00', NULL, 'shanghai', 110, '2022-04-11 00:00:00', '14:31:14', '15:31:16', 'test', 4);
INSERT INTO `quark_advertisement` VALUES ('http://yzzy.top/images/upload/2022-04-02/4e8f2ffb-4842-48bc-8275-8353fbce04da.jpeg', 'ee', 'ee', 'ee', '1', '2022-05-18 00:00:00', NULL, 'shanghai', 1, '2022-04-05 00:00:00', '15:03:33', '17:08:35', 'test', 5);
INSERT INTO `quark_advertisement` VALUES ('http://yzzy.top/images/upload/2022-04-02/34e76e19-5fcb-4357-96bb-c5db1cb8e3b4.png', 'url', 'url', 'url', '1', '2022-05-26 00:00:00', NULL, 'shanghai', 1, '2022-04-15 00:00:00', '14:43:10', '18:43:13', '测试', 6);
INSERT INTO `quark_advertisement` VALUES ('http://yzzy.top/images/upload/2022-04-25/72b79346-aa1b-4a4f-926a-1a5077110a16.jpeg', 'www.dak.com', 'sdfjh', '156006656', '9', '2022-05-12 00:00:00', NULL, 'shanghai', 1, '2022-04-04 00:00:00', '17:48:47', '20:48:50', 'test', 7);
INSERT INTO `quark_advertisement` VALUES ('http://yzzy.top/images/upload/2022-05-19/a2b11281-a643-4878-a148-0f934162aaf3.png', 'lll', '1515', '151515', '2', '2022-06-30 00:00:00', NULL, 'shanghai', 1, '2022-05-19 00:00:00', '11:11:32', '15:11:37', 'test', 8);
INSERT INTO `quark_advertisement` VALUES ('http://yzzy.top/images/upload/2022-05-19/4c49d381-345a-44da-b987-bb13daab9dc7.png', '', NULL, '', '3', '2022-06-30 00:00:00', NULL, 'shanghai', 1, '2022-05-19 00:00:00', '11:15:54', '14:15:59', 'test2', 9);
INSERT INTO `quark_advertisement` VALUES ('http://yzzy.top/images/upload/2022-05-19/9591adae-553e-4e29-9604-3f7212b9f616.png', 'kkk', 'kk', 'kk', '4', '2022-06-30 00:00:00', NULL, 'beijing', 1, '2022-05-19 00:00:00', '06:16:24', '14:16:29', 'kkk', 10);
INSERT INTO `quark_advertisement` VALUES ('http://yzzy.top/images/upload/2022-05-19/e7ecc4e3-2158-4d48-9557-f884a2914eeb.png', '', NULL, '', '5', '2022-06-30 00:00:00', NULL, 'shanghai', 1, '2022-05-19 00:00:00', '01:16:58', '14:17:02', 'lll', 11);
INSERT INTO `quark_advertisement` VALUES ('http://yzzy.top/images/upload/2022-05-19/45984007-8395-436c-957d-2ff33352f4a2.png', '', NULL, '', '6', '2022-06-30 00:00:00', NULL, 'shanghai', 1, '2022-05-19 00:00:00', '07:17:29', '15:17:34', 'yuuuu', 12);
INSERT INTO `quark_advertisement` VALUES ('http://yzzy.top/images/upload/2022-05-19/c831f735-dba5-4021-8e73-63abd0ae74eb.png', '', NULL, '', '8', '2022-06-30 00:00:00', NULL, 'shanghai', 1, '2022-05-19 00:00:00', '07:18:10', '19:18:15', 'sfdsf', 13);
INSERT INTO `quark_advertisement` VALUES ('http://yzzy.top/images/upload/2022-05-19/b82040f7-2dd6-4a14-adfc-ec536f98a3fa.png', '', NULL, '', '9', '2022-06-30 00:00:00', NULL, 'shanghai', 1, '2022-05-19 00:00:00', '10:18:51', '15:18:54', 'fgjdg', 14);
INSERT INTO `quark_advertisement` VALUES ('http://yzzy.top/images/upload/2022-05-19/782c1dcc-a101-48e2-b166-9c6483d9215d.png', '', NULL, '', '87', '2022-06-30 00:00:00', NULL, 'shanghai', 1, '2022-05-19 00:00:00', '10:20:05', '15:20:08', 'jjj', 15);
INSERT INTO `quark_advertisement` VALUES ('http://yzzy.top/images/upload/2022-05-19/7b707241-83da-42d8-b167-f9287cf939a8.png', '', NULL, '', '200', '2022-06-30 00:00:00', NULL, 'shanghai', 1, '2022-05-19 00:00:00', '10:20:34', '15:20:38', 'hhh', 16);
INSERT INTO `quark_advertisement` VALUES ('http://yzzy.top/images/upload/2022-05-19/a205dac8-7d07-43f1-8cd3-d00a0bd1d10a.png', 'http://www.baidu.com', NULL, '', '200', '2022-06-30 00:00:00', NULL, 'shanghai', 130, '2022-05-12 00:00:00', '01:42:01', '15:42:05', '跳转测试', 17);
INSERT INTO `quark_advertisement` VALUES ('http://yzzy.top/images/upload/2022-05-19/1d1b3784-d3d5-4e41-8640-d1e0d791ccd7.png', 'www.baidu.com', NULL, '', '200', '2022-06-30 00:00:00', NULL, 'shanghai', 130, '2022-05-19 00:00:00', '11:44:47', '23:44:49', '141', 18);

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
INSERT INTO `quark_chat_user` VALUES ('Chat:130:1', 130, 1);
INSERT INTO `quark_chat_user` VALUES ('Chat:130:127', 130, 127);
INSERT INTO `quark_chat_user` VALUES ('Chat:130:130', 130, 130);
INSERT INTO `quark_chat_user` VALUES ('Chat:193:1', 193, 1);
INSERT INTO `quark_chat_user` VALUES ('Chat:193:127', 193, 127);
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
) ENGINE = InnoDB AUTO_INCREMENT = 209 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quark_collect
-- ----------------------------
INSERT INTO `quark_collect` VALUES (192, '2022-04-19 16:08:42', 93, 130);
INSERT INTO `quark_collect` VALUES (205, '2022-05-19 09:52:51', 154, 1);
INSERT INTO `quark_collect` VALUES (206, '2022-05-19 09:53:41', 154, 130);
INSERT INTO `quark_collect` VALUES (208, '2022-05-19 10:33:40', 196, 130);

-- ----------------------------
-- Table structure for quark_keyWord
-- ----------------------------
DROP TABLE IF EXISTS `quark_keyWord`;
CREATE TABLE `quark_keyWord`  (
  `keyWord` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关键词',
  `createTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '搜索时间',
  INDEX `time`(`createTime`) USING BTREE COMMENT '方便删除',
  INDEX `key`(`keyWord`) USING BTREE COMMENT '方便统计'
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quark_keyWord
-- ----------------------------
INSERT INTO `quark_keyWord` VALUES ('a', '2022-05-17 02:32:54');
INSERT INTO `quark_keyWord` VALUES ('test', '2022-05-17 18:49:20');
INSERT INTO `quark_keyWord` VALUES ('升级', '2022-05-19 11:16:37');
INSERT INTO `quark_keyWord` VALUES ('s', '2022-05-19 12:06:13');
INSERT INTO `quark_keyWord` VALUES ('test', '2022-05-19 12:06:13');
INSERT INTO `quark_keyWord` VALUES ('a', '2022-05-19 12:06:14');

-- ----------------------------
-- Table structure for quark_label
-- ----------------------------
DROP TABLE IF EXISTS `quark_label`;
CREATE TABLE `quark_label`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `details` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `posts_count` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_6vml4ba2itmaor84892v92b1f`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 201 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quark_label
-- ----------------------------
INSERT INTO `quark_label` VALUES (1, '关于JavaSe的话题', 'JavaSe', 205);
INSERT INTO `quark_label` VALUES (2, '关于Java企业级开发的话题', 'JavaEE', 2);
INSERT INTO `quark_label` VALUES (3, '关于Java虚拟机的话题', 'JVM', 3);
INSERT INTO `quark_label` VALUES (4, '关于Spring框架的话题', 'Spring', 3);
INSERT INTO `quark_label` VALUES (5, '关于Hibernate框架的话题', 'Hibernate', 1);
INSERT INTO `quark_label` VALUES (6, '关于Scala语言的话题', 'Scala', 0);
INSERT INTO `quark_label` VALUES (8, '关于Java并发编程的话题', 'Java并发编程', 3);
INSERT INTO `quark_label` VALUES (9, '关于Android的话题', 'Android', 2);
INSERT INTO `quark_label` VALUES (87, '常见的项目开发遇到的问题与解决方案', '项目开发问题', 27);
INSERT INTO `quark_label` VALUES (200, 'test', '哈哈哈', 2);

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
) ENGINE = InnoDB AUTO_INCREMENT = 212 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quark_notification
-- ----------------------------
INSERT INTO `quark_notification` VALUES (98, b'1', 95, 93, 1, '2022-02-23 16:03:24');
INSERT INTO `quark_notification` VALUES (101, b'1', 96, 93, 1, '2022-02-23 16:03:56');
INSERT INTO `quark_notification` VALUES (103, b'1', 95, 92, 1, '2022-02-23 16:04:08');
INSERT INTO `quark_notification` VALUES (105, b'1', 94, 93, 1, '2022-02-23 16:04:59');
INSERT INTO `quark_notification` VALUES (108, b'0', 1, 106, 95, '2022-02-23 16:12:54');
INSERT INTO `quark_notification` VALUES (135, b'0', 1, 131, 127, '2022-04-06 09:22:51');
INSERT INTO `quark_notification` VALUES (138, b'0', 1, 106, 95, '2022-04-06 09:23:30');
INSERT INTO `quark_notification` VALUES (142, b'0', 1, 131, 127, '2022-04-06 09:25:09');
INSERT INTO `quark_notification` VALUES (143, b'0', 1, 131, 127, '2022-04-06 09:25:09');
INSERT INTO `quark_notification` VALUES (146, b'0', 1, 131, 127, '2022-04-06 09:26:08');
INSERT INTO `quark_notification` VALUES (147, b'0', 1, 131, 127, '2022-04-06 09:26:08');
INSERT INTO `quark_notification` VALUES (150, b'0', 1, 131, 127, '2022-04-06 09:26:17');
INSERT INTO `quark_notification` VALUES (151, b'0', 1, 131, 127, '2022-04-06 09:26:17');
INSERT INTO `quark_notification` VALUES (170, b'0', 130, 166, 1, '2022-04-08 16:52:37');
INSERT INTO `quark_notification` VALUES (173, b'0', 130, 154, 1, '2022-04-08 16:54:10');
INSERT INTO `quark_notification` VALUES (174, b'0', 130, 154, 1, '2022-04-08 16:54:10');
INSERT INTO `quark_notification` VALUES (211, b'1', 193, 209, 130, '2022-05-19 12:01:19');

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
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `quark_permission` VALUES (29, '广告管理', '/advertisementPage', 9, 1, 1);

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
INSERT INTO `quark_posts` VALUES (92, '<p><img src=\"http://yzzy.top/images/upload/2022-02-23/24f35195-ad47-4f1a-9271-403422c1db6b.png\" alt=\"null\"><br></p><p>需要添加一下代码，渲染html</p><pre>$(<span>\"</span><span>#label_select</span><span>\"</span>).<span>append</span>(htm)<span>;<br></span><span>layui</span>.<span>use</span>([<span>\'form\'</span><span>, </span><span>\'layedit\'</span>]<span>, function </span>() {<br>    <span>var </span>form = <span>layui</span>.<span>form</span><span>;<br></span><span>        </span>form.render()<span>;<br></span>})<span>;</span></pre> hjhkhjkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', b'0', '2022-02-23 15:59:31', 87, 1, '使用LayUI进行HTML标签的append时会出现不能及时刷新显示的问题', b'0', 1);
INSERT INTO `quark_posts` VALUES (93, '<img src=\"http://yzzy.top/images/upload/2022-02-23/f81028b8-d1c0-44d9-84b7-4639213e5a18.png\" alt=\"null\">', b'1', '2022-02-23 16:02:35', 87, 3, '考研成绩已出，大家对未来有什么规划吗', b'1', 1);
INSERT INTO `quark_posts` VALUES (106, '说出你的想法', b'0', '2022-02-23 16:05:33', 8, 2, '论如何逃避现实', b'0', 95);
INSERT INTO `quark_posts` VALUES (109, '<img src=\"http://yzzy.top/images/upload/2022-02-23/71f6dbec-db58-441c-833a-a60e56b75367.jpeg\" alt=\"null\">', b'0', '2022-02-23 16:14:24', 1, 0, '大家都多少分啊，也没个人说（Http状态码）', b'0', 1);
INSERT INTO `quark_posts` VALUES (111, '每次发帖5exp', b'0', '2022-04-02 13:10:55', 87, 0, '测试发帖是否提升等级', b'0', 1);
INSERT INTO `quark_posts` VALUES (131, '等级在哪里看啊', b'0', '2022-04-02 17:47:08', 87, 4, '等级', b'0', 127);
INSERT INTO `quark_posts` VALUES (152, '测试发帖升级', b'0', '2022-04-06 14:58:51', 87, 0, '测试', b'0', 1);
INSERT INTO `quark_posts` VALUES (153, '给经验吗', b'0', '2022-04-06 15:02:37', 8, 0, '再次测试', b'0', 1);
INSERT INTO `quark_posts` VALUES (154, '为甚魔不给', b'1', '2022-04-06 15:04:07', 87, 2, '升级有问题', b'1', 1);
INSERT INTO `quark_posts` VALUES (155, '是否所有信息一致', b'0', '2022-04-06 15:07:52', 87, 0, '发帖的一致性测试', b'0', 1);
INSERT INTO `quark_posts` VALUES (156, '获得专属头衔', b'0', '2022-04-06 15:10:09', 87, 0, '更新头衔', b'0', 1);
INSERT INTO `quark_posts` VALUES (157, '进行install', b'0', '2022-04-06 15:11:44', 87, 0, '可能是common的问题', b'0', 1);
INSERT INTO `quark_posts` VALUES (158, '测试重新清除缓存', b'0', '2022-04-06 15:13:25', 87, 0, '清楚缓存', b'0', 1);
INSERT INTO `quark_posts` VALUES (160, 'test', b'0', '2022-04-06 15:27:25', 87, 0, '测试1', b'0', 1);
INSERT INTO `quark_posts` VALUES (161, 'sda', b'0', '2022-04-06 15:28:43', 87, 0, 'as', b'0', 1);
INSERT INTO `quark_posts` VALUES (162, 'te', b'0', '2022-04-08 15:29:36', 87, 0, '测试一对多', b'0', 1);
INSERT INTO `quark_posts` VALUES (164, 'te', b'0', '2022-04-08 15:33:10', 87, 0, '测试一对多的', b'0', 1);
INSERT INTO `quark_posts` VALUES (165, 'te', b'0', '2022-04-08 15:37:47', 87, 0, '测试一对', b'0', 1);
INSERT INTO `quark_posts` VALUES (166, 'l', b'0', '2022-04-08 15:39:27', 87, 1, '测试多多', b'0', 1);
INSERT INTO `quark_posts` VALUES (188, 'ddd', b'0', '2022-04-12 11:24:42', 87, 0, '测试普通账户', b'0', 187);
INSERT INTO `quark_posts` VALUES (189, 'redis', b'0', '2022-04-12 11:26:45', 1, 0, '注意在使用redis时要防止缓存击穿', b'0', 187);
INSERT INTO `quark_posts` VALUES (190, 'yyy', b'0', '2022-04-12 11:27:06', 87, 0, '测试发帖升级', b'0', 187);
INSERT INTO `quark_posts` VALUES (191, '<p>好康的<a href=\"https://b23.tv/j0rQzU\" target=\"_blank\">https://b23.tv/j0rQzU</a></p>', b'0', '2022-04-12 20:09:27', 87, 0, '好康的', b'0', 127);
INSERT INTO `quark_posts` VALUES (196, 'dfsdfsf', b'0', '2022-04-25 19:47:45', 4, 0, 'test', b'0', 1);
INSERT INTO `quark_posts` VALUES (207, 'test定制', b'0', '2022-05-19 10:27:17', 200, 0, '1', b'1', 130);
INSERT INTO `quark_posts` VALUES (209, '王一昊***了', b'0', '2022-05-19 11:49:12', 200, 2, '**一下', b'1', 130);

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
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quark_rank
-- ----------------------------
INSERT INTO `quark_rank` VALUES (1, '初始账号默认头衔', '萌新新', 0, 0, '7eac851736ac8ff4ec42fce6299f56a3dfcbc5a5.png@360w_360h.webp');
INSERT INTO `quark_rank` VALUES (2, '发帖两次', '发帖初体验', 1, 2, '9c5f14d6749daded668f3f66998baf4a50e7d8da.png@360w_360h.webp');
INSERT INTO `quark_rank` VALUES (3, '达到等级二', '小收藏家', 2, 0, '6af2816d4acbc919b956d56957e405841def89dc.png@360w_360h.webp');
INSERT INTO `quark_rank` VALUES (4, '达到等级三', '小有才识', 3, 0, 'ab29dca20a7f02c9b6909e454aa345ecd99b7446.png@360w_360h.webp');
INSERT INTO `quark_rank` VALUES (5, '达到等级四', '初长成', 4, 0, 'fd4a04100e7bdd68716592e4c68d55ac2a4e21c2.png@360w_360h.webp');
INSERT INTO `quark_rank` VALUES (6, '达到等级五', '如鱼得水', 5, 0, '4548043d54c0c7aacc74ffc8774fafdcb2191029.png@360w_360h.webp');
INSERT INTO `quark_rank` VALUES (7, '达到等级六', '变秃了，也变强了', 6, 0, 'c8735da69314d54144a0b1fde5d69676ce72d7b6.png@360w_360h.webp');
INSERT INTO `quark_rank` VALUES (8, '圣诞节专用', '圣诞快乐', 0, 0, 'b72dbf785e810e94fce2481265e71b6f16c64681.png@360w_360h.webp');
INSERT INTO `quark_rank` VALUES (9, '官方认证，合作方', '合作方', 999, 999, '0f1f8ec045abd1fc572f537a6652207bcbf70a40.png@360w_360h.webp');
INSERT INTO `quark_rank` VALUES (10, '官方认证，专业领域', '领域大神', 999, 999, '6fbee28f782926612eb1ad71d6c8aa7264206fe9.png@360w_360h.webp');
INSERT INTO `quark_rank` VALUES (11, '开发者专用', '我们说了算', 999, 999, 'b9eba4944ec9c2d2f7d60f38f90b4487136832ff.png@360w_360h.webp');
INSERT INTO `quark_rank` VALUES (12, '中工学子', 'zut', 0, 0, '201819244416.png');
INSERT INTO `quark_rank` VALUES (13, '设计者专属', '王一昊专属', 999, 999, '0cd9ea1a4cc28c85e8299631587d47599f678037.png');

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
) ENGINE = InnoDB AUTO_INCREMENT = 213 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quark_reply
-- ----------------------------
INSERT INTO `quark_reply` VALUES (97, '规划如何欺负我龙哥', '2022-02-23 16:03:24', 0, 93, 95);
INSERT INTO `quark_reply` VALUES (99, '公务员不好吗&nbsp;', '2022-02-23 16:03:56', 0, 93, 96);
INSERT INTO `quark_reply` VALUES (100, '？？？', '2022-02-23 16:03:56', 0, 93, 1);
INSERT INTO `quark_reply` VALUES (102, '<p>牛的呀</p><p><br></p>', '2022-02-23 16:04:08', 0, 92, 95);
INSERT INTO `quark_reply` VALUES (104, '？？？', '2022-02-23 16:04:59', 0, 93, 94);
INSERT INTO `quark_reply` VALUES (107, '<p>多看片，少看书。</p><p>多看色图</p>', '2022-02-23 16:12:54', 0, 106, 1);
INSERT INTO `quark_reply` VALUES (133, '经验暂未展示，仅供内部测试', '2022-04-06 09:22:51', 0, 131, 1);
INSERT INTO `quark_reply` VALUES (136, 'test', '2022-04-06 09:23:30', 0, 106, 1);
INSERT INTO `quark_reply` VALUES (140, '测试回复', '2022-04-06 09:25:09', 0, 131, 1);
INSERT INTO `quark_reply` VALUES (141, '测试回复', '2022-04-06 09:25:09', 0, 131, 1);
INSERT INTO `quark_reply` VALUES (144, '测试', '2022-04-06 09:26:08', 0, 131, 1);
INSERT INTO `quark_reply` VALUES (145, '测试', '2022-04-06 09:26:08', 0, 131, 1);
INSERT INTO `quark_reply` VALUES (148, '服务器异常？', '2022-04-06 09:26:17', 0, 131, 1);
INSERT INTO `quark_reply` VALUES (149, '服务器异常？', '2022-04-06 09:26:17', 0, 131, 1);
INSERT INTO `quark_reply` VALUES (168, '123546', '2022-04-08 16:52:37', 0, 166, 130);
INSERT INTO `quark_reply` VALUES (171, '<p>jy+3?</p><p><br></p>', '2022-04-08 16:54:10', 0, 154, 130);
INSERT INTO `quark_reply` VALUES (172, '<p>jy+3?</p><p><br></p>', '2022-04-08 16:54:10', 0, 154, 130);
INSERT INTO `quark_reply` VALUES (195, 'kk', '2022-04-25 19:46:43', 0, 154, 1);
INSERT INTO `quark_reply` VALUES (212, 'hhh', '2022-05-19 12:38:31', 0, 209, 130);

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
INSERT INTO `quark_role_permission` VALUES (1, 29);
INSERT INTO `quark_role_permission` VALUES (6, 1);
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
) ENGINE = InnoDB AUTO_INCREMENT = 198 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quark_user
-- ----------------------------
INSERT INTO `quark_user` VALUES (1, 'http://yzzy.top/images/upload/2022-04-06/a5d9e60a-a40e-4dfc-987b-1b0b20589d3c.jpeg', 1, '2022-02-07 14:11:51', 'e10adc3949ba59abbe56e057f20f883e', 0, '', '子煜', '1874300301@qq.com');
INSERT INTO `quark_user` VALUES (94, 'http://yzzy.top/images/upload/default.png', 1, '2022-02-23 16:02:37', 'c1a5b2c9a2ea32bef984b65e405409e0', 0, NULL, 'aloha', 'w297824@163.com');
INSERT INTO `quark_user` VALUES (95, 'http://yzzy.top/images/upload/default.png', 1, '2022-02-23 16:02:43', '65a0ec385ca6a0c1e20d1f8270c28303', 0, NULL, '呀呼', '123456789@163.com');
INSERT INTO `quark_user` VALUES (96, 'http://yzzy.top/images/upload/default.png', 1, '2022-02-23 16:03:13', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 'chen', '294@qq.com');
INSERT INTO `quark_user` VALUES (127, 'http://yzzy.top/images/upload/2022-04-02/b5af706b-3f71-4f16-bf55-5c4a8f1dd6c8.png', 1, '2022-04-02 16:13:03', 'f6fdffe48c908deb0f4c3bd36c032e72', 0, NULL, 'admin', 'admin@admin.com');
INSERT INTO `quark_user` VALUES (130, 'http://yzzy.top/images/upload/default.png', 1, '2022-04-02 17:11:29', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 'qwer9426', '1478757814@qq.com');
INSERT INTO `quark_user` VALUES (187, 'http://yzzy.top/images/upload/default.png', 1, '2022-04-12 10:25:23', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 'test', 'test@qq.com');
INSERT INTO `quark_user` VALUES (193, 'http://yzzy.top/images/upload/2022-04-25/b01e0d54-6ebf-4963-9f8a-09e5301df229.jpeg', 1, '2022-04-25 14:45:16', '250a193f4eb6f66221437667ae4d79a4', 0, '猜猜我是谁', '', '839083251@qq.com');
INSERT INTO `quark_user` VALUES (197, 'http://yzzy.top/images/upload/default.png', 1, '2022-05-16 15:29:33', '25f9e794323b453885f5181f1b624d0b', 0, NULL, '123456789', '123456789@1.com');

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
INSERT INTO `quark_userLevel` VALUES (1, 100159, 10015, '11', 'b9eba4944ec9c2d2f7d60f38f90b4487136832ff.png@360w_360h.webp', '2022-05-19 09:52:46');
INSERT INTO `quark_userLevel` VALUES (94, 0, 0, '1', '9c5f14d6749daded668f3f66998baf4a50e7d8da.png@360w_360h.webp', '2022-04-12 12:58:48');
INSERT INTO `quark_userLevel` VALUES (95, 0, 0, '1', '9c5f14d6749daded668f3f66998baf4a50e7d8da.png@360w_360h.webp', '2022-04-12 12:58:44');
INSERT INTO `quark_userLevel` VALUES (96, 0, 0, '1', '9c5f14d6749daded668f3f66998baf4a50e7d8da.png@360w_360h.webp', '2022-04-12 12:58:40');
INSERT INTO `quark_userLevel` VALUES (127, 17, 1, '1', '9c5f14d6749daded668f3f66998baf4a50e7d8da.png@360w_360h.webp', '2022-04-12 20:09:27');
INSERT INTO `quark_userLevel` VALUES (130, 52, 5, '1', '9c5f14d6749daded668f3f66998baf4a50e7d8da.png@360w_360h.webp', '2022-05-19 11:49:12');
INSERT INTO `quark_userLevel` VALUES (187, 23, 2, '2', '9c5f14d6749daded668f3f66998baf4a50e7d8da.png@360w_360h.webp', '2022-04-12 11:27:13');
INSERT INTO `quark_userLevel` VALUES (193, 40, 4, '1', '7eac851736ac8ff4ec42fce6299f56a3dfcbc5a5.png@360w_360h.webp', '2022-05-19 12:01:08');
INSERT INTO `quark_userLevel` VALUES (197, 10, 1, '1', 'url', '2022-05-18 12:52:39');

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
INSERT INTO `quark_userRank` VALUES (130, 1, NULL);
INSERT INTO `quark_userRank` VALUES (187, 1, '2022-04-12 10:25:23');
INSERT INTO `quark_userRank` VALUES (193, 1, '2022-04-25 14:45:16');
INSERT INTO `quark_userRank` VALUES (197, 1, '2022-05-16 15:29:33');
INSERT INTO `quark_userRank` VALUES (1, 2, '2022-04-08 15:39:30');
INSERT INTO `quark_userRank` VALUES (187, 2, '2022-04-12 11:27:06');
INSERT INTO `quark_userRank` VALUES (1, 3, '2022-04-08 15:39:30');
INSERT INTO `quark_userRank` VALUES (130, 3, '2022-05-19 10:27:17');
INSERT INTO `quark_userRank` VALUES (1, 4, '2022-04-08 15:39:30');
INSERT INTO `quark_userRank` VALUES (130, 4, '2022-05-19 10:27:17');
INSERT INTO `quark_userRank` VALUES (1, 5, '2022-04-08 15:39:30');
INSERT INTO `quark_userRank` VALUES (130, 5, '2022-05-19 11:49:12');
INSERT INTO `quark_userRank` VALUES (1, 6, '2022-04-08 15:39:30');
INSERT INTO `quark_userRank` VALUES (1, 7, '2022-04-08 15:39:30');
INSERT INTO `quark_userRank` VALUES (1, 8, '2022-04-08 15:39:30');
INSERT INTO `quark_userRank` VALUES (127, 8, '2022-04-12 20:09:27');
INSERT INTO `quark_userRank` VALUES (130, 8, '2022-05-19 10:27:17');
INSERT INTO `quark_userRank` VALUES (187, 8, '2022-04-12 11:24:42');
INSERT INTO `quark_userRank` VALUES (1, 9, '2022-04-08 15:39:30');
INSERT INTO `quark_userRank` VALUES (1, 10, '2022-04-08 15:39:30');
INSERT INTO `quark_userRank` VALUES (1, 11, '2022-04-08 15:39:30');

-- ----------------------------
-- View structure for view_quark_userRank
-- ----------------------------
DROP VIEW IF EXISTS `view_quark_userRank`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_quark_userRank` AS select `quark_rank`.`rankId` AS `rankId`,`quark_rank`.`description` AS `description`,`quark_rank`.`rankName` AS `rankName`,`quark_rank`.`userLevel` AS `userLevel`,`quark_rank`.`userPostsCount` AS `userPostsCount`,`quark_rank`.`rankUrl` AS `rankUrl`,`quark_user`.`id` AS `userID` from (`quark_rank` join `quark_user`) where `quark_rank`.`userPostsCount` < (select count(1) from `quark_posts` where `quark_posts`.`user_id` = `quark_user`.`id`) and `quark_rank`.`userLevel` < (select `quark_userLevel`.`userLevel` from `quark_userLevel` where `quark_userLevel`.`userId` = `quark_user`.`id`);

-- ----------------------------
-- View structure for view_userRank
-- ----------------------------
DROP VIEW IF EXISTS `view_userRank`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_userRank` AS select `quark_userRank`.`userId` AS `userId`,`quark_userRank`.`getTime` AS `getTime`,`quark_rank`.`rankId` AS `rankId`,`quark_rank`.`description` AS `description`,`quark_rank`.`rankName` AS `rankName`,`quark_rank`.`userLevel` AS `userLevel`,`quark_rank`.`userPostsCount` AS `userPostsCount`,`quark_rank`.`rankUrl` AS `rankUrl` from (`quark_userRank` left join `quark_rank` on(`quark_rank`.`rankId` = `quark_userRank`.`userRank`));

-- ----------------------------
-- Event structure for e_clear_keyWord
-- ----------------------------
DROP EVENT IF EXISTS `e_clear_keyWord`;
delimiter ;;
CREATE EVENT `e_clear_keyWord`
ON SCHEDULE
EVERY '1' HOUR STARTS '2022-05-19 18:01:01'
DO DELETE FROM 
quark_keyWord WHERE createTime  < subdate(now(), interval 5 day)
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
