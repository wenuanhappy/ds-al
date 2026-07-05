/*
 Navicat Premium Dump SQL

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80044 (8.0.44-0ubuntu0.22.04.2)
 Source Host           : localhost:3306
 Source Schema         : ds

 Target Server Type    : MySQL
 Target Server Version : 80044 (8.0.44-0ubuntu0.22.04.2)
 File Encoding         : 65001

 Date: 24/12/2025 15:14:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for action
-- ----------------------------
DROP TABLE IF EXISTS `action`;
CREATE TABLE `action` (
  `userid` bigint NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `set_up_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `action_list` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  KEY `fk_action_user` (`userid`) USING BTREE,
  CONSTRAINT `fk_action_user` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of action
-- ----------------------------
BEGIN;
INSERT INTO `action` (`userid`, `username`, `type`, `set_up_time`, `action_list`) VALUES (1, 'wangxingzi', 'linearList', '0', '(init,10);(insert,0,1);(insert,1,2);(insert,2,3);');
INSERT INTO `action` (`userid`, `username`, `type`, `set_up_time`, `action_list`) VALUES (23, '1234', 'stringMatch', '0', '(mubiao,ws);(moshi,wshhh)');
INSERT INTO `action` (`userid`, `username`, `type`, `set_up_time`, `action_list`) VALUES (23, '1234', 'linearList', '0', '(init,10);(insert,2,3);(insert,0,3);(insert,0,3);');
INSERT INTO `action` (`userid`, `username`, `type`, `set_up_time`, `action_list`) VALUES (18, '周琪瑶', 'linearList', '0', '(init,4);');
COMMIT;

-- ----------------------------
-- Table structure for algorithm
-- ----------------------------
DROP TABLE IF EXISTS `algorithm`;
CREATE TABLE `algorithm` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_algorithm_id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of algorithm
-- ----------------------------
BEGIN;
INSERT INTO `algorithm` (`id`, `name`) VALUES (1, '线性表');
INSERT INTO `algorithm` (`id`, `name`) VALUES (2, '树');
INSERT INTO `algorithm` (`id`, `name`) VALUES (3, '图');
INSERT INTO `algorithm` (`id`, `name`) VALUES (4, '排序');
INSERT INTO `algorithm` (`id`, `name`) VALUES (5, '查找');
INSERT INTO `algorithm` (`id`, `name`) VALUES (6, '根排序练习');
INSERT INTO `algorithm` (`id`, `name`) VALUES (7, '搜索树练习');
INSERT INTO `algorithm` (`id`, `name`) VALUES (8, '循环队列练习');
INSERT INTO `algorithm` (`id`, `name`) VALUES (9, '搜索练习');
INSERT INTO `algorithm` (`id`, `name`) VALUES (10, '最短路径练习');
INSERT INTO `algorithm` (`id`, `name`) VALUES (11, '最小生成树练习');
COMMIT;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `course_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_anonymous` tinyint(1) DEFAULT '0',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `html_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `like_count` int DEFAULT '0',
  `reply_count` int DEFAULT '0',
  `pinned` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  `client_temp_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_course_id` (`course_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------
BEGIN;
INSERT INTO `comment` (`id`, `course_id`, `course_type`, `user_id`, `username`, `is_anonymous`, `content`, `html_content`, `like_count`, `reply_count`, `pinned`, `deleted`, `client_temp_id`, `created_at`, `updated_at`) VALUES (1, '1', 'DFS', 25, 'testye', 0, '这是修改后的评论内容', '<p>这是修改后的评论内容</p>', 5, 4, 0, 1, NULL, '2025-12-23 23:00:49', '2025-12-23 23:47:08');
INSERT INTO `comment` (`id`, `course_id`, `course_type`, `user_id`, `username`, `is_anonymous`, `content`, `html_content`, `like_count`, `reply_count`, `pinned`, `deleted`, `client_temp_id`, `created_at`, `updated_at`) VALUES (2, '1', 'DFS', 28, 'test1128', 0, '这是第二条测试评论', '<p>这是第二条测试评论</p>', 3, 1, 0, 0, NULL, '2025-12-23 23:00:49', '2025-12-23 23:00:49');
INSERT INTO `comment` (`id`, `course_id`, `course_type`, `user_id`, `username`, `is_anonymous`, `content`, `html_content`, `like_count`, `reply_count`, `pinned`, `deleted`, `client_temp_id`, `created_at`, `updated_at`) VALUES (3, '1', 'DFS', 29, 'maria', 0, '这是置顶评论', '<p>这是置顶评论</p>', 10, 5, 1, 0, NULL, '2025-12-23 23:00:49', '2025-12-23 23:00:49');
INSERT INTO `comment` (`id`, `course_id`, `course_type`, `user_id`, `username`, `is_anonymous`, `content`, `html_content`, `like_count`, `reply_count`, `pinned`, `deleted`, `client_temp_id`, `created_at`, `updated_at`) VALUES (4, '12', 'BFS', 25, 'testye', 0, 'BFS课程的评论', '<p>BFS课程的评论</p>', 2, 0, 0, 0, NULL, '2025-12-23 23:00:49', '2025-12-23 23:00:49');
INSERT INTO `comment` (`id`, `course_id`, `course_type`, `user_id`, `username`, `is_anonymous`, `content`, `html_content`, `like_count`, `reply_count`, `pinned`, `deleted`, `client_temp_id`, `created_at`, `updated_at`) VALUES (5, '37', 'practice/heap_sort', 1, '1', 0, '我没意见', '<p>我没意见</p>', 0, 0, 0, 0, NULL, '2025-12-23 23:57:47', '2025-12-23 23:57:47');
INSERT INTO `comment` (`id`, `course_id`, `course_type`, `user_id`, `username`, `is_anonymous`, `content`, `html_content`, `like_count`, `reply_count`, `pinned`, `deleted`, `client_temp_id`, `created_at`, `updated_at`) VALUES (6, '24', 'practice/search_tree_predecessor', 1, '1', 0, '测试', '<p>测试</p>', 0, 0, 0, 0, NULL, '2025-12-23 23:58:45', '2025-12-23 23:58:45');
INSERT INTO `comment` (`id`, `course_id`, `course_type`, `user_id`, `username`, `is_anonymous`, `content`, `html_content`, `like_count`, `reply_count`, `pinned`, `deleted`, `client_temp_id`, `created_at`, `updated_at`) VALUES (7, '24', 'practice/search_tree_predecessor', 1, '11111', 0, '11', '<p>11</p>', 0, 0, 0, 0, NULL, '2025-12-24 00:00:10', '2025-12-24 00:00:10');
INSERT INTO `comment` (`id`, `course_id`, `course_type`, `user_id`, `username`, `is_anonymous`, `content`, `html_content`, `like_count`, `reply_count`, `pinned`, `deleted`, `client_temp_id`, `created_at`, `updated_at`) VALUES (8, '24', 'practice/search_tree_predecessor', 1, '11111', 0, '111', '<p>111</p>', 0, 0, 0, 0, NULL, '2025-12-24 00:02:23', '2025-12-24 00:02:23');
INSERT INTO `comment` (`id`, `course_id`, `course_type`, `user_id`, `username`, `is_anonymous`, `content`, `html_content`, `like_count`, `reply_count`, `pinned`, `deleted`, `client_temp_id`, `created_at`, `updated_at`) VALUES (9, '24', 'practice/search_tree_predecessor', 1, '11111', 0, '1111q1', '<p>1111q1</p>', 0, 0, 0, 0, NULL, '2025-12-24 00:02:54', '2025-12-24 00:02:54');
INSERT INTO `comment` (`id`, `course_id`, `course_type`, `user_id`, `username`, `is_anonymous`, `content`, `html_content`, `like_count`, `reply_count`, `pinned`, `deleted`, `client_temp_id`, `created_at`, `updated_at`) VALUES (10, '37', 'practice/heap_sort', 1, '11111', 0, 'hello', '<p>hello</p>', 0, 0, 0, 0, NULL, '2025-12-24 00:06:45', '2025-12-24 00:06:45');
INSERT INTO `comment` (`id`, `course_id`, `course_type`, `user_id`, `username`, `is_anonymous`, `content`, `html_content`, `like_count`, `reply_count`, `pinned`, `deleted`, `client_temp_id`, `created_at`, `updated_at`) VALUES (11, '37', 'practice/heap_sort', 1, '11111', 0, '你好', '<p>你好</p>', 0, 0, 0, 0, NULL, '2025-12-24 11:36:53', '2025-12-24 14:45:19');
INSERT INTO `comment` (`id`, `course_id`, `course_type`, `user_id`, `username`, `is_anonymous`, `content`, `html_content`, `like_count`, `reply_count`, `pinned`, `deleted`, `client_temp_id`, `created_at`, `updated_at`) VALUES (12, '36', 'practice/circular_queue', 10, '15111495048', 0, '111', '<p>111</p>', 1, 0, 0, 1, NULL, '2025-12-24 12:25:54', '2025-12-24 12:33:41');
INSERT INTO `comment` (`id`, `course_id`, `course_type`, `user_id`, `username`, `is_anonymous`, `content`, `html_content`, `like_count`, `reply_count`, `pinned`, `deleted`, `client_temp_id`, `created_at`, `updated_at`) VALUES (13, '36', 'practice/circular_queue', 10, '15111495048', 0, '这个有点难阿', '<p>这个有点难阿</p>', 0, 0, 0, 0, NULL, '2025-12-24 12:34:22', '2025-12-24 12:34:22');
INSERT INTO `comment` (`id`, `course_id`, `course_type`, `user_id`, `username`, `is_anonymous`, `content`, `html_content`, `like_count`, `reply_count`, `pinned`, `deleted`, `client_temp_id`, `created_at`, `updated_at`) VALUES (14, '36', 'practice/circular_queue', 10, '15111495048', 0, '是的', '<p>是的</p>', 0, 0, 0, 0, NULL, '2025-12-24 12:35:58', '2025-12-24 12:35:58');
INSERT INTO `comment` (`id`, `course_id`, `course_type`, `user_id`, `username`, `is_anonymous`, `content`, `html_content`, `like_count`, `reply_count`, `pinned`, `deleted`, `client_temp_id`, `created_at`, `updated_at`) VALUES (15, '36', 'practice/circular_queue', 10, '15111495048', 0, '怎么弄呢', '<p>怎么弄呢</p>', 0, 0, 0, 0, NULL, '2025-12-24 12:36:38', '2025-12-24 12:36:38');
INSERT INTO `comment` (`id`, `course_id`, `course_type`, `user_id`, `username`, `is_anonymous`, `content`, `html_content`, `like_count`, `reply_count`, `pinned`, `deleted`, `client_temp_id`, `created_at`, `updated_at`) VALUES (16, '36', 'practice/circular_queue', 10, '15111495048', 0, '加油', '<p>加油</p>', 0, 0, 0, 0, NULL, '2025-12-24 12:37:31', '2025-12-24 12:37:31');
INSERT INTO `comment` (`id`, `course_id`, `course_type`, `user_id`, `username`, `is_anonymous`, `content`, `html_content`, `like_count`, `reply_count`, `pinned`, `deleted`, `client_temp_id`, `created_at`, `updated_at`) VALUES (17, '36', 'practice/circular_queue', 10, '15111495048', 0, '加油！！！', '<p>加油！！！</p>', 0, 0, 0, 0, NULL, '2025-12-24 12:38:30', '2025-12-24 12:38:30');
COMMIT;

-- ----------------------------
-- Table structure for comment_like
-- ----------------------------
DROP TABLE IF EXISTS `comment_like`;
CREATE TABLE `comment_like` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `comment_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_comment_user` (`comment_id`,`user_id`) USING BTREE,
  CONSTRAINT `comment_like_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of comment_like
-- ----------------------------
BEGIN;
INSERT INTO `comment_like` (`id`, `comment_id`, `user_id`, `created_at`) VALUES (1, 12, 15, '2025-12-24 12:32:58');
COMMIT;

-- ----------------------------
-- Table structure for comment_reply
-- ----------------------------
DROP TABLE IF EXISTS `comment_reply`;
CREATE TABLE `comment_reply` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `comment_id` bigint NOT NULL,
  `parent_reply_id` bigint DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `to_user_id` bigint DEFAULT NULL,
  `to_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `html_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `like_count` int DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_comment_id` (`comment_id`) USING BTREE,
  CONSTRAINT `comment_reply_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of comment_reply
-- ----------------------------
BEGIN;
INSERT INTO `comment_reply` (`id`, `comment_id`, `parent_reply_id`, `user_id`, `username`, `to_user_id`, `to_username`, `content`, `html_content`, `like_count`, `deleted`, `created_at`, `updated_at`) VALUES (1, 1, NULL, 28, 'test1128', NULL, NULL, '这是对第一条评论的回复', '<p>这是对第一条评论的回复</p>', 0, 0, '2025-12-23 23:00:49', '2025-12-23 23:00:49');
INSERT INTO `comment_reply` (`id`, `comment_id`, `parent_reply_id`, `user_id`, `username`, `to_user_id`, `to_username`, `content`, `html_content`, `like_count`, `deleted`, `created_at`, `updated_at`) VALUES (2, 1, NULL, 29, 'maria', NULL, NULL, '这是第二条回复', '<p>这是第二条回复</p>', 0, 0, '2025-12-23 23:00:49', '2025-12-23 23:00:49');
INSERT INTO `comment_reply` (`id`, `comment_id`, `parent_reply_id`, `user_id`, `username`, `to_user_id`, `to_username`, `content`, `html_content`, `like_count`, `deleted`, `created_at`, `updated_at`) VALUES (3, 1, NULL, 28, 'test1128', NULL, NULL, '这是对评论1的回复', '<p>这是对评论1的回复</p>', 0, 0, '2025-12-23 23:34:39', '2025-12-23 23:34:39');
INSERT INTO `comment_reply` (`id`, `comment_id`, `parent_reply_id`, `user_id`, `username`, `to_user_id`, `to_username`, `content`, `html_content`, `like_count`, `deleted`, `created_at`, `updated_at`) VALUES (4, 1, NULL, 28, 'test1128', NULL, NULL, '这是对评论1的回复', '<p>这是对评论1的回复</p>', 0, 0, '2025-12-23 23:35:30', '2025-12-23 23:35:30');
COMMIT;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `algorithm` tinyint NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `exp` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_course_algorithm` (`algorithm`) USING BTREE,
  KEY `idx_course_id` (`id`) USING BTREE,
  CONSTRAINT `fk_course_algorithm` FOREIGN KEY (`algorithm`) REFERENCES `algorithm` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of course
-- ----------------------------
BEGIN;
INSERT INTO `course` (`algorithm`, `id`, `content`, `exp`) VALUES (1, 1, '顺序表', 5);
INSERT INTO `course` (`algorithm`, `id`, `content`, `exp`) VALUES (1, 2, '单链表', 5);
INSERT INTO `course` (`algorithm`, `id`, `content`, `exp`) VALUES (1, 3, '栈', 5);
INSERT INTO `course` (`algorithm`, `id`, `content`, `exp`) VALUES (1, 4, '队列', 5);
INSERT INTO `course` (`algorithm`, `id`, `content`, `exp`) VALUES (1, 5, '链式队列', 5);
INSERT INTO `course` (`algorithm`, `id`, `content`, `exp`) VALUES (2, 6, '二叉搜索树', 10);
INSERT INTO `course` (`algorithm`, `id`, `content`, `exp`) VALUES (2, 7, '堆', 10);
INSERT INTO `course` (`algorithm`, `id`, `content`, `exp`) VALUES (2, 8, '霍夫曼树', 10);
INSERT INTO `course` (`algorithm`, `id`, `content`, `exp`) VALUES (2, 9, 'AVL树', 10);
INSERT INTO `course` (`algorithm`, `id`, `content`, `exp`) VALUES (2, 10, '二叉树转换', 10);
INSERT INTO `course` (`algorithm`, `id`, `content`, `exp`) VALUES (2, 11, '线索二叉树', 10);
INSERT INTO `course` (`algorithm`, `id`, `content`, `exp`) VALUES (3, 12, 'DFS遍历', 15);
INSERT INTO `course` (`algorithm`, `id`, `content`, `exp`) VALUES (3, 13, 'BFS遍历', 15);
INSERT INTO `course` (`algorithm`, `id`, `content`, `exp`) VALUES (3, 14, 'Prim算法', 15);
INSERT INTO `course` (`algorithm`, `id`, `content`, `exp`) VALUES (3, 15, 'Kruskal算法', 15);
INSERT INTO `course` (`algorithm`, `id`, `content`, `exp`) VALUES (3, 16, 'Dijkstra算法', 15);
INSERT INTO `course` (`algorithm`, `id`, `content`, `exp`) VALUES (3, 17, 'Floyd算法', 15);
INSERT INTO `course` (`algorithm`, `id`, `content`, `exp`) VALUES (4, 18, '比较排序', 5);
INSERT INTO `course` (`algorithm`, `id`, `content`, `exp`) VALUES (4, 19, '堆排序', 5);
INSERT INTO `course` (`algorithm`, `id`, `content`, `exp`) VALUES (4, 20, '基数排序', 5);
INSERT INTO `course` (`algorithm`, `id`, `content`, `exp`) VALUES (5, 21, '查找', 5);
INSERT INTO `course` (`algorithm`, `id`, `content`, `exp`) VALUES (5, 22, '字符串匹配', 5);
INSERT INTO `course` (`algorithm`, `id`, `content`, `exp`) VALUES (6, 23, '最小堆排序', 10);
INSERT INTO `course` (`algorithm`, `id`, `content`, `exp`) VALUES (7, 24, '前驱练习', 10);
INSERT INTO `course` (`algorithm`, `id`, `content`, `exp`) VALUES (7, 25, '后继练习', 10);
INSERT INTO `course` (`algorithm`, `id`, `content`, `exp`) VALUES (7, 26, '查询练习', 10);
INSERT INTO `course` (`algorithm`, `id`, `content`, `exp`) VALUES (8, 27, '循环队列练习', 10);
INSERT INTO `course` (`algorithm`, `id`, `content`, `exp`) VALUES (9, 28, '广度搜索练习', 10);
INSERT INTO `course` (`algorithm`, `id`, `content`, `exp`) VALUES (9, 29, '深度搜索练习', 10);
INSERT INTO `course` (`algorithm`, `id`, `content`, `exp`) VALUES (10, 30, 'Dijkstra算法练习', 10);
INSERT INTO `course` (`algorithm`, `id`, `content`, `exp`) VALUES (10, 31, 'Floyd算法练习', 10);
INSERT INTO `course` (`algorithm`, `id`, `content`, `exp`) VALUES (11, 32, 'Kruskal算法练习', 10);
INSERT INTO `course` (`algorithm`, `id`, `content`, `exp`) VALUES (11, 33, 'Prim算法练习', 10);
INSERT INTO `course` (`algorithm`, `id`, `content`, `exp`) VALUES (3, 34, '拓扑排序', 15);
INSERT INTO `course` (`algorithm`, `id`, `content`, `exp`) VALUES (2, 35, '大根堆', 15);
INSERT INTO `course` (`algorithm`, `id`, `content`, `exp`) VALUES (8, 36, '循环队列练习', 10);
INSERT INTO `course` (`algorithm`, `id`, `content`, `exp`) VALUES (6, 37, '最小堆排序练习', 10);
COMMIT;

-- ----------------------------
-- Table structure for follow
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL,
  `followid` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_followid` (`followid`) USING BTREE,
  KEY `idx_userid` (`userid`) USING BTREE,
  CONSTRAINT `fk_follow_followid` FOREIGN KEY (`followid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_follow_user` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of follow
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for friend
-- ----------------------------
DROP TABLE IF EXISTS `friend`;
CREATE TABLE `friend` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `userId` bigint DEFAULT NULL,
  `friendsId` bigint DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `friend_ibfk_1` (`friendsId`) USING BTREE,
  KEY `fk_friend_user` (`userId`) USING BTREE,
  CONSTRAINT `fk_friend_friends` FOREIGN KEY (`friendsId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_friend_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of friend
-- ----------------------------
BEGIN;
INSERT INTO `friend` (`Id`, `userId`, `friendsId`) VALUES (3, 1, 10);
INSERT INTO `friend` (`Id`, `userId`, `friendsId`) VALUES (4, 1, 17);
INSERT INTO `friend` (`Id`, `userId`, `friendsId`) VALUES (5, 1, 18);
INSERT INTO `friend` (`Id`, `userId`, `friendsId`) VALUES (6, 1, 19);
INSERT INTO `friend` (`Id`, `userId`, `friendsId`) VALUES (7, 1, 20);
INSERT INTO `friend` (`Id`, `userId`, `friendsId`) VALUES (8, 18, 20);
COMMIT;

-- ----------------------------
-- Table structure for learning_history
-- ----------------------------
DROP TABLE IF EXISTS `learning_history`;
CREATE TABLE `learning_history` (
  `userid` bigint NOT NULL,
  `courseid` bigint NOT NULL,
  `history` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userid`,`courseid`) USING BTREE,
  KEY `idx_learning_history_userid` (`userid`) USING BTREE,
  KEY `idx_learning_history_courseid` (`courseid`) USING BTREE,
  CONSTRAINT `fk_history_course` FOREIGN KEY (`courseid`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_history_user` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of learning_history
-- ----------------------------
BEGIN;
INSERT INTO `learning_history` (`userid`, `courseid`, `history`) VALUES (25, 10, '2024-12-20 13:06:39');
INSERT INTO `learning_history` (`userid`, `courseid`, `history`) VALUES (25, 13, '2024-12-21 12:50:15');
INSERT INTO `learning_history` (`userid`, `courseid`, `history`) VALUES (25, 16, '2024-12-22 05:29:23');
INSERT INTO `learning_history` (`userid`, `courseid`, `history`) VALUES (25, 19, '2024-12-11 12:51:19');
INSERT INTO `learning_history` (`userid`, `courseid`, `history`) VALUES (28, 3, '2024-12-12 12:50:15');
INSERT INTO `learning_history` (`userid`, `courseid`, `history`) VALUES (28, 5, '2024-12-03 13:06:39');
INSERT INTO `learning_history` (`userid`, `courseid`, `history`) VALUES (28, 7, '2024-12-21 16:03:38');
INSERT INTO `learning_history` (`userid`, `courseid`, `history`) VALUES (28, 8, '2024-12-02 16:24:33');
INSERT INTO `learning_history` (`userid`, `courseid`, `history`) VALUES (28, 10, '2024-12-10 16:03:41');
INSERT INTO `learning_history` (`userid`, `courseid`, `history`) VALUES (28, 12, '2024-12-05 12:51:19');
INSERT INTO `learning_history` (`userid`, `courseid`, `history`) VALUES (28, 15, '2024-12-15 05:29:23');
INSERT INTO `learning_history` (`userid`, `courseid`, `history`) VALUES (28, 16, '2024-12-20 16:31:53');
COMMIT;

-- ----------------------------
-- Table structure for option
-- ----------------------------
DROP TABLE IF EXISTS `option`;
CREATE TABLE `option` (
  `id` bigint NOT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `answer` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `fk_option_course` FOREIGN KEY (`id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of option
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `level` tinyint NOT NULL DEFAULT '0',
  `exp` int NOT NULL DEFAULT '0',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` (`username`, `password`, `id`, `email`, `tel`, `level`, `exp`, `createTime`, `updateTime`) VALUES ('wangxingzi', '$2a$10$2MbPhR5CYXmVMTh.u9zatOKaAUFP5jOrjcZAnXj25YAGbzZZQ336K', 1, NULL, NULL, 0, 0, '2024-12-01 00:00:00', '2025-12-23 23:15:41');
INSERT INTO `user` (`username`, `password`, `id`, `email`, `tel`, `level`, `exp`, `createTime`, `updateTime`) VALUES ('15111495048', '$2a$10$pcbWjvRhRrOAGuPFoCM7qegm60aorFETh5CmSwf/L3PG5D7ySwyi6', 10, '111', '342', 0, 0, '2024-12-01 00:00:00', '2025-12-23 23:15:42');
INSERT INTO `user` (`username`, `password`, `id`, `email`, `tel`, `level`, `exp`, `createTime`, `updateTime`) VALUES ('11', '$2a$10$9wSHaYvhw1GVVkUYRTCFmuQxJkEj30cO5EYvyvNywJvJppdvODYlK', 11, '1', '5', 0, 0, '2024-12-01 00:00:00', '2025-12-23 23:15:42');
INSERT INTO `user` (`username`, `password`, `id`, `email`, `tel`, `level`, `exp`, `createTime`, `updateTime`) VALUES ('143', '$2a$10$twMjOFHXG6AytimkItPR0eiKnu7nEGK6dw68xQGGZiKBXFC0.ymdW', 12, '22', '11', 0, 0, '2024-12-01 00:00:00', '2025-12-23 23:15:42');
INSERT INTO `user` (`username`, `password`, `id`, `email`, `tel`, `level`, `exp`, `createTime`, `updateTime`) VALUES ('22', '$2a$10$UmsulDFl/NmSpSy7DHazz.7zXJKCt24v6Ic0sumkRCIZwk0pf4rkK', 13, '', '', 0, 0, '2024-12-01 00:00:00', '2025-12-23 23:15:42');
INSERT INTO `user` (`username`, `password`, `id`, `email`, `tel`, `level`, `exp`, `createTime`, `updateTime`) VALUES ('23', '$2a$10$EdM2Iq9REnQfVGODo70XJe87mDAH7G1FhpCuANlUCl25aWCwGH3M2', 14, '', '', 0, 0, '2024-12-01 00:00:00', '2025-12-23 23:15:42');
INSERT INTO `user` (`username`, `password`, `id`, `email`, `tel`, `level`, `exp`, `createTime`, `updateTime`) VALUES ('1111', '$2a$10$7aGhoMjGqoA54dQKyQHwX.cnea4DB7qdIA2F1nFnAQIDN34iKSr82', 15, '', '', 0, 0, '2024-12-01 00:00:00', '2025-12-23 23:15:42');
INSERT INTO `user` (`username`, `password`, `id`, `email`, `tel`, `level`, `exp`, `createTime`, `updateTime`) VALUES ('wangxingzi2', '$2a$10$kzGDlI9XylW7Is/oO9Q68uTkx7/3zas3IkzCU2d5JsLp5KXuHr3NO', 16, '', '', 0, 0, '2024-12-01 00:00:00', '2025-12-23 23:15:42');
INSERT INTO `user` (`username`, `password`, `id`, `email`, `tel`, `level`, `exp`, `createTime`, `updateTime`) VALUES ('程诗寒', '$2a$10$zd9JkeTvgJPQSnYEPIgGaeJrHmcHJFrCTSH/yk5imX0eX/iCSu8t2', 17, NULL, NULL, 0, 0, '2024-12-01 00:00:00', '2025-12-23 23:15:42');
INSERT INTO `user` (`username`, `password`, `id`, `email`, `tel`, `level`, `exp`, `createTime`, `updateTime`) VALUES ('周琪瑶', '$2a$10$J/aPyB7Zda/szs6U1Nr1ZOqDAMAwDkddBjBt/QoiROcgPHbp7zze.', 18, NULL, NULL, 0, 0, '2024-12-01 00:00:00', '2025-12-23 23:15:42');
INSERT INTO `user` (`username`, `password`, `id`, `email`, `tel`, `level`, `exp`, `createTime`, `updateTime`) VALUES ('杨严', NULL, 19, NULL, NULL, 0, 0, '2024-12-01 00:00:00', '2024-12-01 00:00:00');
INSERT INTO `user` (`username`, `password`, `id`, `email`, `tel`, `level`, `exp`, `createTime`, `updateTime`) VALUES ('111', '$2a$10$F8qGC1bucWl7mrdPk/9cl.cWlJLr6FcZEim5GorVdzMEc9/e5Yxoq', 20, '11', '1', 0, 2, '2024-12-01 00:00:00', '2025-12-24 12:07:24');
INSERT INTO `user` (`username`, `password`, `id`, `email`, `tel`, `level`, `exp`, `createTime`, `updateTime`) VALUES ('111111', '$2a$10$LwDGCYxIQIXn8lus4NY7X.a4JICToudZp7lnyRAy12laGjdsKopV2', 21, '11', '', 0, 0, '2024-12-01 00:00:00', '2025-12-23 23:15:42');
INSERT INTO `user` (`username`, `password`, `id`, `email`, `tel`, `level`, `exp`, `createTime`, `updateTime`) VALUES ('123', '$2a$10$Zgm5kAL5t7hcdbg.rthBD.tnKUVErzUunYxSQj3nmyBQ.ZTahMsm.', 22, '', '', 0, 0, '2024-12-01 00:00:00', '2025-12-23 23:15:42');
INSERT INTO `user` (`username`, `password`, `id`, `email`, `tel`, `level`, `exp`, `createTime`, `updateTime`) VALUES ('1234', '$2a$10$rkhzmB/HxqBBm0vRl4J.w.2L1dhtQ.q5jor9yPfNGXkZOw8.zrpWO', 23, '', '', 0, 0, '2024-12-01 00:00:00', '2025-12-23 23:15:42');
INSERT INTO `user` (`username`, `password`, `id`, `email`, `tel`, `level`, `exp`, `createTime`, `updateTime`) VALUES ('123456', '$2a$10$63Ep39xaXGtkViK4V5mJvuuHQ6bTGzZf5omVEUZGpiQQJWyMZNKSC', 24, '', '', 0, 0, '2024-12-01 00:00:00', '2025-12-23 23:15:42');
INSERT INTO `user` (`username`, `password`, `id`, `email`, `tel`, `level`, `exp`, `createTime`, `updateTime`) VALUES ('testye', '$2a$10$HJ/XJMkIc3aeMp7CWIThXOlBvvaUX.SOn0ZpFQ6euLwgIZ6Mpp/l2', 25, '12345678@sufe.edu.cn', '189098765432', 2, 26, '2024-11-27 00:57:48', '2025-12-23 23:15:43');
INSERT INTO `user` (`username`, `password`, `id`, `email`, `tel`, `level`, `exp`, `createTime`, `updateTime`) VALUES ('test1127', '$2a$10$MvOj9WPiaaLDJK9SE2VWNemRxEniQIVBS1aOEcb9o9sVO8INtNnhO', 26, '123456abcdefg@qq.com', '123456789012', 0, 0, '2024-11-27 01:20:48', '2025-12-23 23:15:43');
INSERT INTO `user` (`username`, `password`, `id`, `email`, `tel`, `level`, `exp`, `createTime`, `updateTime`) VALUES ('hahaSucc', '$2a$10$lR8LRzL2ycGbB8AjZfw28uq1GniqttUdvRN1OxTSJOpBqPyMHjZwi', 27, 'haha123456@qq.com', '133123456789', 0, 0, '2024-11-27 06:41:31', '2025-12-23 23:15:43');
INSERT INTO `user` (`username`, `password`, `id`, `email`, `tel`, `level`, `exp`, `createTime`, `updateTime`) VALUES ('test1128', '$2a$10$LUJRFwG5vizIbBLrbd8rBe5rIE7dDn8TUQ/tuL2zoDWba8eOUD6fq', 28, '123456789@qq.com', '13398765432', 2, 21, '2024-11-28 17:29:42', '2025-12-23 23:15:43');
INSERT INTO `user` (`username`, `password`, `id`, `email`, `tel`, `level`, `exp`, `createTime`, `updateTime`) VALUES ('maria', '$2a$10$3Yr53NfgK/oRr5mCo0RJ5.5YFIMIo9l4Qek4HxoSXa5om3OdYPdUG', 29, '123456789@qq.com', '13398765432', 0, 0, '2024-11-28 17:29:42', '2025-12-23 23:15:43');
INSERT INTO `user` (`username`, `password`, `id`, `email`, `tel`, `level`, `exp`, `createTime`, `updateTime`) VALUES ('test', '$2a$10$2ubSEBHVktVpCNUpQaqC4eLihQcamP475TV7KGHZh5Bp1kz5h.gfu', 30, '123456789@qq.com', '13398765432', 0, 0, '2024-11-28 17:29:42', '2025-12-23 23:15:43');
INSERT INTO `user` (`username`, `password`, `id`, `email`, `tel`, `level`, `exp`, `createTime`, `updateTime`) VALUES ('11111', '$2a$10$PwQpQQfTlOoYYU9/9F5pPOEmGw7jAcetNyW9siqUhxuaDk.o/zPx.', 31, '11@qq.com', '15878446545', 0, 0, '2025-12-23 23:59:58', '2025-12-23 23:59:58');
COMMIT;

-- ----------------------------
-- Table structure for user_friends
-- ----------------------------
DROP TABLE IF EXISTS `user_friends`;
CREATE TABLE `user_friends` (
  `user_id` bigint NOT NULL,
  `friend_id` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`friend_id`),
  KEY `friend_id` (`friend_id`),
  CONSTRAINT `user_friends_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_friends_ibfk_2` FOREIGN KEY (`friend_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_friends
-- ----------------------------
BEGIN;
INSERT INTO `user_friends` (`user_id`, `friend_id`, `created_at`) VALUES (15, 16, '2025-12-24 14:47:35');
INSERT INTO `user_friends` (`user_id`, `friend_id`, `created_at`) VALUES (16, 15, '2025-12-24 14:47:35');
COMMIT;

-- ----------------------------
-- Table structure for user_login_logs
-- ----------------------------
DROP TABLE IF EXISTS `user_login_logs`;
CREATE TABLE `user_login_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `login_date` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_id` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user_login_logs
-- ----------------------------
BEGIN;
INSERT INTO `user_login_logs` (`id`, `username`, `login_date`) VALUES (1, '111', '2025-12-24 12:07:23');
INSERT INTO `user_login_logs` (`id`, `username`, `login_date`) VALUES (2, '111', '2025-12-24 12:07:25');
COMMIT;

-- ----------------------------
-- View structure for view_learning_history_details
-- ----------------------------
DROP VIEW IF EXISTS `view_learning_history_details`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_learning_history_details` AS select `u`.`id` AS `userid`,`lh`.`history` AS `history_time`,`a`.`name` AS `algorithm_name`,`c`.`content` AS `course_name` from (((`learning_history` `lh` join `user` `u` on((`lh`.`userid` = `u`.`id`))) join `course` `c` on((`lh`.`courseid` = `c`.`id`))) join `algorithm` `a` on((`c`.`algorithm` = `a`.`id`))) where (`a`.`id` between 1 and 5);

-- ----------------------------
-- View structure for view_practice_history_details
-- ----------------------------
DROP VIEW IF EXISTS `view_practice_history_details`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_practice_history_details` AS select `u`.`id` AS `userid`,`lh`.`history` AS `history_time`,`a`.`name` AS `algorithm_name`,`c`.`content` AS `course_name` from (((`learning_history` `lh` join `user` `u` on((`lh`.`userid` = `u`.`id`))) join `course` `c` on((`lh`.`courseid` = `c`.`id`))) join `algorithm` `a` on((`c`.`algorithm` = `a`.`id`))) where (`a`.`id` between 6 and 11);

-- ----------------------------
-- Triggers structure for table user
-- ----------------------------
DROP TRIGGER IF EXISTS `update_user_level_before_update`;
delimiter ;;
CREATE TRIGGER `ds`.`update_user_level_before_update` BEFORE UPDATE ON `user` FOR EACH ROW BEGIN
    SET NEW.level = CASE
                        WHEN NEW.exp < 10 THEN 0
                        WHEN NEW.exp BETWEEN 10 AND 20 THEN 1
                        WHEN NEW.exp BETWEEN 21 AND 30 THEN 2
                        WHEN NEW.exp BETWEEN 31 AND 40 THEN 3
                        WHEN NEW.exp BETWEEN 41 AND 50 THEN 4
                        ELSE 5
        END;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
