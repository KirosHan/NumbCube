/*
 Navicat Premium Data Transfer

 Source Server         : www.onsigma.com
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : www.onsigma.com:3306
 Source Schema         : numbcube

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 30/03/2019 23:18:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `direction` int(11) NOT NULL COMMENT '1-重置  0-支出',
  `amount` float(11, 2) NOT NULL COMMENT '金额',
  `method` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '充值方式',
  `time` datetime(0) NOT NULL,
  `usefor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用途',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES (1, 'kiros', 1, 20.00, 'online', '2018-09-01 00:09:00', '线上充值');

-- ----------------------------
-- Table structure for data_rows
-- ----------------------------
DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE `data_rows`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `data_rows_data_type_id_foreign`(`data_type_id`) USING BTREE,
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_rows
-- ----------------------------
INSERT INTO `data_rows` VALUES (1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1);
INSERT INTO `data_rows` VALUES (2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 2);
INSERT INTO `data_rows` VALUES (3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '', 3);
INSERT INTO `data_rows` VALUES (4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '', 4);
INSERT INTO `data_rows` VALUES (5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '', 5);
INSERT INTO `data_rows` VALUES (6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '', 6);
INSERT INTO `data_rows` VALUES (7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '', 7);
INSERT INTO `data_rows` VALUES (8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '', 8);
INSERT INTO `data_rows` VALUES (9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\"}', 10);
INSERT INTO `data_rows` VALUES (10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11);
INSERT INTO `data_rows` VALUES (11, 1, 'locale', 'text', 'Locale', 0, 1, 1, 1, 1, 0, '', 12);
INSERT INTO `data_rows` VALUES (12, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '', 12);
INSERT INTO `data_rows` VALUES (13, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1);
INSERT INTO `data_rows` VALUES (14, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 2);
INSERT INTO `data_rows` VALUES (15, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '', 3);
INSERT INTO `data_rows` VALUES (16, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '', 4);
INSERT INTO `data_rows` VALUES (17, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1);
INSERT INTO `data_rows` VALUES (18, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 2);
INSERT INTO `data_rows` VALUES (19, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '', 3);
INSERT INTO `data_rows` VALUES (20, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '', 4);
INSERT INTO `data_rows` VALUES (21, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, '', 5);
INSERT INTO `data_rows` VALUES (22, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, '', 9);

-- ----------------------------
-- Table structure for data_types
-- ----------------------------
DROP TABLE IF EXISTS `data_types`;
CREATE TABLE `data_types`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `model_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `policy_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `controller` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `data_types_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `data_types_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_types
-- ----------------------------
INSERT INTO `data_types` VALUES (1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', '', '', 1, 0, NULL, '2018-05-11 06:32:46', '2018-05-11 06:32:46');
INSERT INTO `data_types` VALUES (2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2018-05-11 06:32:46', '2018-05-11 06:32:46');
INSERT INTO `data_types` VALUES (3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2018-05-11 06:32:46', '2018-05-11 06:32:46');

-- ----------------------------
-- Table structure for ip_lock
-- ----------------------------
DROP TABLE IF EXISTS `ip_lock`;
CREATE TABLE `ip_lock`  (
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'IP地址',
  `islock` int(11) NULL DEFAULT 0 COMMENT '是否锁定',
  `sign_time` datetime(0) NULL DEFAULT NULL,
  `times` int(11) NULL DEFAULT NULL COMMENT '次数',
  `lock_level` int(11) NULL DEFAULT 0 COMMENT '封锁级别'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ip_lock
-- ----------------------------
INSERT INTO `ip_lock` VALUES ('43.243.138.90', 0, '2018-09-04 16:41:45', 36, 0);
INSERT INTO `ip_lock` VALUES ('123.1.157.252', 0, '2018-09-05 00:21:23', 31, 0);
INSERT INTO `ip_lock` VALUES ('27.222.139.0', 0, '2018-09-21 20:54:47', 28, 0);
INSERT INTO `ip_lock` VALUES ('112.28.159.68', 0, '2018-10-04 17:08:24', 28, 0);
INSERT INTO `ip_lock` VALUES ('119.84.153.253', 0, '2018-10-05 20:00:24', 27, 0);
INSERT INTO `ip_lock` VALUES ('112.97.49.214', 0, '2019-03-05 21:04:50', 12, 0);

-- ----------------------------
-- Table structure for liveroom
-- ----------------------------
DROP TABLE IF EXISTS `liveroom`;
CREATE TABLE `liveroom`  (
  `room_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `room_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '放映厅显示名称',
  `room_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '拉流地址',
  `room_cdn_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'CDN拉流地址',
  `room_stream` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '流名称',
  `room_pub` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '放映厅公告',
  `room_vod` int(2) NOT NULL COMMENT '是否开放  0-仅管理员可用  1-所有用户可用',
  INDEX `room_id`(`room_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of liveroom
-- ----------------------------
INSERT INTO `liveroom` VALUES ('room0', '展示厅', 'https://stream.numbcube.com:7777/numblive/', 'https://tstream.numbcube.com/live/', 'a0d75803bbdb855', '本放映厅不定时播放。', 0);
INSERT INTO `liveroom` VALUES ('room1', '1号厅', 'https://stream.numbcube.com:7777/numblive/', 'https://tstream.numbcube.com/live/', 'f24d4ba9c2836c0', NULL, 1);
INSERT INTO `liveroom` VALUES ('room2', '2号厅', 'https://stream.numbcube.com:7777/numblive/', 'https://tstream.numbcube.com/live/', 'e9accef2d7fc1b6', NULL, 1);
INSERT INTO `liveroom` VALUES ('room3', '3号厅', 'https://stream.numbcube.com:7777/numblive/', 'https://tstream.numbcube.com/live/', '455dbce28dd2328', NULL, 1);
INSERT INTO `liveroom` VALUES ('room4', '4号厅', 'https://stream.numbcube.com:7777/numblive/', 'https://tstream.numbcube.com/live/', '15f0fd3250510eb', NULL, 1);
INSERT INTO `liveroom` VALUES ('room5', '5号厅', 'https://stream.numbcube.com:7777/numblive/', 'https://tstream.numbcube.com/live/', '33704a787bbb777', NULL, 1);
INSERT INTO `liveroom` VALUES ('roomvip', 'VIP厅', 'https://stream.numbcube.com:7777/numblive/', 'https://tstream.numbcube.com/live/', '95472470170d32b', '本厅为VIP付费厅。', 0);
INSERT INTO `liveroom` VALUES ('roompersonal', '私人放映厅', 'https://stream.numbcube.com:7777/numblive/', 'https://tstream.numbcube.com/live/', '609a42a5acf2a9a', '本厅用于私人点播服务。', 1);
INSERT INTO `liveroom` VALUES ('roommax', '大屏超清厅', 'https://stream.numbcube.com:7777/numblive/', 'https://tstream.numbcube.com/live/', 'roommax', NULL, 0);

-- ----------------------------
-- Table structure for menu_items
-- ----------------------------
DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE `menu_items`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `parameters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `menu_items_menu_id_foreign`(`menu_id`) USING BTREE,
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu_items
-- ----------------------------
INSERT INTO `menu_items` VALUES (1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2018-05-11 06:32:46', '2018-05-11 06:32:46', 'voyager.dashboard', NULL);
INSERT INTO `menu_items` VALUES (2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2018-05-11 06:32:46', '2018-05-11 06:32:46', 'voyager.media.index', NULL);
INSERT INTO `menu_items` VALUES (3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2018-05-11 06:32:46', '2018-05-11 06:32:46', 'voyager.users.index', NULL);
INSERT INTO `menu_items` VALUES (4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2018-05-11 06:32:46', '2018-05-11 06:32:46', 'voyager.roles.index', NULL);
INSERT INTO `menu_items` VALUES (5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2018-05-11 06:32:46', '2018-05-11 06:32:46', NULL, NULL);
INSERT INTO `menu_items` VALUES (6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2018-05-11 06:32:46', '2018-05-11 06:32:46', 'voyager.menus.index', NULL);
INSERT INTO `menu_items` VALUES (7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2018-05-11 06:32:46', '2018-05-11 06:32:46', 'voyager.database.index', NULL);
INSERT INTO `menu_items` VALUES (8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2018-05-11 06:32:46', '2018-05-11 06:32:46', 'voyager.compass.index', NULL);
INSERT INTO `menu_items` VALUES (9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2018-05-11 06:32:46', '2018-05-11 06:32:46', 'voyager.bread.index', NULL);
INSERT INTO `menu_items` VALUES (10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2018-05-11 06:32:46', '2018-05-11 06:32:46', 'voyager.settings.index', NULL);
INSERT INTO `menu_items` VALUES (11, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 13, '2018-05-11 06:32:46', '2018-05-11 06:32:46', 'voyager.hooks', NULL);

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `menus_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES (1, 'admin', '2018-05-11 06:32:46', '2018-05-11 06:32:46');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2016_01_01_000000_add_voyager_user_fields', 1);
INSERT INTO `migrations` VALUES (4, '2016_01_01_000000_create_data_types_table', 1);
INSERT INTO `migrations` VALUES (5, '2016_05_19_173453_create_menu_table', 1);
INSERT INTO `migrations` VALUES (6, '2016_10_21_190000_create_roles_table', 1);
INSERT INTO `migrations` VALUES (7, '2016_10_21_190000_create_settings_table', 1);
INSERT INTO `migrations` VALUES (8, '2016_11_30_135954_create_permission_table', 1);
INSERT INTO `migrations` VALUES (9, '2016_11_30_141208_create_permission_role_table', 1);
INSERT INTO `migrations` VALUES (10, '2016_12_26_201236_data_types__add__server_side', 1);
INSERT INTO `migrations` VALUES (11, '2017_01_13_000000_add_route_to_menu_items_table', 1);
INSERT INTO `migrations` VALUES (12, '2017_01_14_005015_create_translations_table', 1);
INSERT INTO `migrations` VALUES (13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1);
INSERT INTO `migrations` VALUES (14, '2017_03_06_000000_add_controller_to_data_types_table', 1);
INSERT INTO `migrations` VALUES (15, '2017_04_21_000000_add_order_to_data_rows_table', 1);
INSERT INTO `migrations` VALUES (16, '2017_07_05_210000_add_policyname_to_data_types_table', 1);
INSERT INTO `migrations` VALUES (17, '2017_08_05_000000_add_group_to_settings_table', 1);
INSERT INTO `migrations` VALUES (18, '2017_11_26_013050_add_user_role_relationship', 1);
INSERT INTO `migrations` VALUES (19, '2017_11_26_015000_create_user_roles_table', 1);
INSERT INTO `migrations` VALUES (20, '2018_03_11_000000_add_user_settings', 1);
INSERT INTO `migrations` VALUES (21, '2018_03_14_000000_add_details_to_data_types_table', 1);
INSERT INTO `migrations` VALUES (22, '2018_03_16_000000_make_settings_value_nullable', 1);
INSERT INTO `migrations` VALUES (23, '2018_05_15_123001_create_sessions_table', 2);

-- ----------------------------
-- Table structure for movie
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie`  (
  `movie_id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '影片名称',
  `movie_time` int(10) NOT NULL COMMENT '影片时长(重要，尽量准确，关系到控制用户是否可进入放映厅以及推流端设置场次状态)',
  `movie_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '影片类型 如恐怖科幻剧情等',
  `movie_intro` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '影片简介(显示在放映厅页面)',
  `movie_actor` varchar(2500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '影片演员(显示在放映厅页面)',
  `movie_years` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '影片年代(显示在放映厅页面)',
  `movie_director` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '影片导演(显示在放映厅页面)',
  `movie_origin` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '影片产地(显示在放映厅页面)',
  `movie_subtitle` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '影片语言字幕等(显示在放映厅页面)',
  `movie_path` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '影片文件在硬盘上地址(如D:/movie/123.mkv后端推流使用)',
  `needconvert` int(255) NOT NULL DEFAULT 0 COMMENT '是否需要转码，非h.264+aac编码填1，后端推流时将先转换再推流',
  `movie_price` int(10) NOT NULL COMMENT '点映时的价格',
  `cdn_price` int(10) NOT NULL DEFAULT 0 COMMENT 'CDN线路价格',
  `vod_enable` int(2) NOT NULL COMMENT '是否允许点映',
  PRIMARY KEY (`movie_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of movie
-- ----------------------------
INSERT INTO `movie` VALUES (1, '与神同行1:罪与罚', 139, '剧情/奇幻', '阴间有法，所有亡者在死后的49天内都要经过七次审判——分别在杀人狱、懒惰狱、欺骗狱、不义狱、背叛狱、暴力狱、天伦狱中进行，只有通过了七次审判宣告无罪的亡者，才有获得新生的机会。 \n\n　　消防员金子洪在一场火灾当中为了救一名女孩而不幸牺牲。地狱使者解怨脉和德春出现在了金子洪的面前。尽管金子洪无法相信自己的死亡，却被德春一脸严肃地告知自己既是亡者、又是贵人。在通往地狱的入口，金子洪遇到了在初军门等着自己的另一位使者江林。他掌管着解怨脉和德春两位使者，同时也将在子洪即将接受的七次审判中为子洪进行辩护。 \n\n　　原来倘若阎罗大王在1000年内令49位亡者得以往生，三位使者也可以重新投胎至凡间。他们相信第48位亡者——19年来出现的这位贵人金子洪是可以顺利重获新生的。然而在各地狱里，金子洪的过去接二连三地出现，原来这位贵人也依然有“不能说的秘密”。 ', '河正宇 Jung-woo Ha 车太贤 Tae-hyun Cha 朱智勋 Ji-hun Ju 金香奇 Hyang-ki Kim 金东旭 Dong-wook Kim 芮秀贞 Ye Soo-jung 李政宰 Jung-Jae Lee 吴达洙 Dal-su Oh 林元熙 Won-hie Lim 都暻秀 Kyung-soo Doh 张光 Gwang Jang 郑海钧 Hae-kyun Jung 金荷娜 Ha-Neul Kim 金海淑 Hae-suk Kim 金秀安 Soo-an Kim 马东锡 Tong-Seok Ma ', '2017', '金容华', '韩国', '韩文中字', 'D:/movie/与神同行1.mkv', 0, 45, 2, 0);
INSERT INTO `movie` VALUES (2, '与神同行2:因与缘', 142, '剧情/奇幻', '故事接上集，为了完成阎罗王（李政宰 饰）开出的条件，解怨脈（朱智勋 饰）与德春（金香起 饰）与凶悍的城主神（马东锡 饰）展开决斗。江林（河正宇 饰）也力劝一等兵（都暻秀 饰）公开秀鸿意外死亡的真相，就在阴间使者们试图完成任务的同时，千年前，他们生前的悲剧也将被逐一揭开… ', '河正宇 Jung-woo Ha 朱智勋 Ji-hun Ju 马东锡 Tong-Seok Ma 金香起 Hyang-ki Kim 李政宰 Jung-Jae Lee 赵汉哲 Han-chul Jo 金明坤 Myung-gon Kim 金东旭 Dong-wook Kim 郑惟安 Yoo-ahn Jung 都暻秀 Kyung-soo Doh ', '2018', '金容华', '韩国', '韩文中字', 'D:/movie/与神同行2.mkv', 0, 45, 2, 0);
INSERT INTO `movie` VALUES (3, '升级', 100, '动作/科幻/惊悚 ', '一场抢劫案后，男主角格雷的妻子丧生，自己也全身瘫痪。他接受了一个亿万富翁科学家对他身体的“升级”改造治疗——在他的身体里植入了人工智能程序STEM，不但使四肢恢复了行动力，更能做出自己从未训练过的格斗动作，俨然成为一名职业杀手 。', '罗根·马歇尔-格林 Logan Marshall-Green 理查德·考索恩 Richard Cawthorne 贝蒂·加布里埃尔 Betty Gabriel 哈里森·吉尔伯特森 Harrison Gilbertson 本尼迪克·哈迪 Benedict Hardie 克里斯托弗·卡比 Christopher Kirby 梅拉里·沃列何 Melanie Vallejo 理查德·阿纳斯塔西奥斯 Richard Anastasios 罗斯科·坎贝尔 Rosco Campbell 琳达·克罗珀 Linda Cropper ', '2018', '雷·沃纳尔 Leigh Whannell', '澳大利亚', '中英双字', 'D:/movie/升级.BD.720p.中英双字幕.mkv', 0, 45, 2, 0);
INSERT INTO `movie` VALUES (4, '网络谜踪', 102, '剧情/悬疑/惊悚', '故事发生在北加州的圣荷西，玛格（米切尔·拉 Michelle La 饰）成长在一个幸福的家庭之中，父亲金（约翰·赵 John Cho 饰）和母亲帕尔马（萨拉·米博·索恩 Sara Mibo Sohn 饰）非常的恩爱，他们用摄像机记录了玛格成长的一点一滴，在女儿的身上，两人可谓倾注了全部的心血。然而，不幸就这样降临了，帕尔马患上了癌症，虽然全家人合力同病魔抗争，但最终帕尔马还是未能战胜病魔。 \r\n\r\n　　母亲去世了，全家的重担都落在了金的身上，坚强的他独自将女儿抚养长大，虽然玛格非常的听话懂事，但随着时间的推移，金还是渐渐感受到了和女儿之间的隔阂。一天，玛格在放学后没有按时回家，直到第二天早晨也毫无音信。 ', '约翰·赵 John Cho米切尔·拉 Michelle La黛博拉·梅辛 Debra Messing约瑟夫·李 Joseph Lee萨拉·米博·孙 Sara Mibo Sohn亚历克丝·杰恩·高 Alex Jayne Go梅金·刘 Megan Liu刘卡雅 Kya Dawn Lau多米尼克·霍夫曼 Dominic Hoffman西尔维亚·米纳西安 Sylvia Minassian梅丽莎·迪斯尼 Melissa Disney康纳·麦克雷斯 Connor McRaith科林·伍德尔 Colin Woodell约瑟夫·约翰·谢尔勒 Joseph John Schirle阿什丽·艾德纳 Ashley Edner考特尼·劳伦·卡明斯 Courtney Lauren Cummings托马斯·巴布萨卡 Thomas Barbusca朱莉·内桑森 Julie Nathanson罗伊·阿布拉姆森 Roy Abramsohn盖奇·比尔托福 Gage Biltoft肖恩·奥布赖恩 Sean O\'Bryan瑞克·萨拉比亚 Ric Sarabia布拉德·阿布瑞尔 Brad Abrell加布里埃尔D·安吉尔 Gabriel D. Angell ', '2018', '阿尼什·查甘蒂 Aneesh Chaganty ', '美国/俄罗斯', '中英双字', 'D:/movie/网络谜踪.mkv', 0, 45, 2, 0);
INSERT INTO `movie` VALUES (5, '西虹市首富', 118, '喜剧', '西虹市丙级球队大翔队的守门员王多鱼（沈腾 饰）因比赛失利被教练开除，一筹莫展之际王多鱼突然收到神秘人士金老板（张晨光 饰）的邀请，被告知自己竟然是保险大亨王老太爷（李立群 饰）的唯一继承人，遗产高达百亿！但是王老太爷给出了一个非常奇葩的条件，那就是要求王多鱼在一个月内花光十亿，还不能告诉身边人，否则失去继承权。王多鱼毫不犹豫签下了“军令状”，与好友庄强（张一鸣 饰）以及财务夏竹（宋芸桦 饰）一起开启了“挥金之旅”，即将成为西虹市首富的王多鱼，第一次感受到了做富人的快乐，同时也发现想要挥金如土实在没有那么简单！ ', '沈腾 Teng Shen宋芸桦 Vivian Sung张一鸣 Yiming Zhang张晨光 Morning Chang常远 Yuan Chang魏翔 Xiang Wei赵自强 Tzu-chiang Chao九孔 Kong Jiu李立群 Lichun Lee王成思 Chengsi Wang徐冬冬 Dongdong Xu艾伦 Allen杨皓宇 Haoyu Yang黄才伦 Cailun Huang王力宏 Lee-Hom Wang包贝尔 Bei\'er Bao郎咸平 Larry Hsien Ping Lang张绍刚 Shaogang Zhang杨文哲 Wenzhe Yang陶亮 Liang Tao王赞 Zan Wang黄杨 Yang Huang刘鉴 Jian Liu杨沅翰 Yuanhan Yang林炳宝 Bingbao Lin骆佳 Jia Luo陈昊明 Haoming Chen臧一人 Yiren Zang ', '2018', '闫非 Fei Yan 彭大魔 Damo Peng', '中国', '国语中字', 'D:/movie/西虹市首富.mp4', 0, 45, 2, 0);
INSERT INTO `movie` VALUES (6, '黑暗心灵', 104, '科幻/惊悚', '基于Alexandra Bracken所著同名畅销青少年小说，讲述在一场疾病夺走了美国98%的儿童的生命后，剩余的2%发展出了超能力，他们被安置在拘留营中。一名16岁女孩逃离了营地，加入一群青少年的团队，躲避政府的追捕，踏上奇幻冒险旅程。', '阿曼德拉·斯坦伯格 Amandla Stenberg 曼迪·摩尔 Mandy Moore 格温多兰·克里斯蒂 Gwendoline Christie 布莱德利·惠特福德 Bradley Whitford 哈里斯·迪金森 Harris Dickinson 马克·奥布莱恩 Mark O\'Brien 韦德·威廉姆斯 Wade Williams 华莱士·朗翰 Wallace Langham 帕特里克·吉布森 Patrick Gibson 高顿·布鲁克斯 Golden Brooks 司盖兰·布鲁克斯 Skylan Brooks 凯萨琳·戴尔 Catherine Dyer 米娅·切赫 Miya Cech 佩顿·威奇 Peyton Wich 凯蕾·里维拉 Kaleigh Rivera 查尔斯·格林 Charles Green 卡尔森·霍尔姆斯 Carson Holmes 莉娅·朱厄特 Lidya Jewett 盖奇·劳森 Gage Lawson', '2018', '吕寅荣 Jennifer Yuh', '美国', '中英双字', 'D:/movie/黑暗心灵.mkv', 0, 45, 2, 0);
INSERT INTO `movie` VALUES (7, '神奇动物在哪里', 133, '剧情/奇幻/冒险', '故事发生在1926年的纽约，彼时，麻鸡们对魔法师的抵制达到了最高峰，由玛丽露（萨曼莎·莫顿 Samantha Morton 饰）所领导的反魔法组织活动频繁。与此同时，街头巷尾之中时时发生的种种灾难意外让魔法世界的存在离暴露仅有一线之隔，整个魔法部陷入了空前紧张的气氛之中。\r\n就在这个节骨眼上，环游世界进行着研究神奇魔法动物之行动的魔法动物学家纽特（埃迪·雷德梅恩 Eddie Redmayne 饰）抵达了纽约，他随身携带的魔法手提箱里，装着几十种他一路营救的魔法动物们，而他的一举一动，均处于隶属于魔法部的前傲罗蒂娜（凯瑟琳·沃特森 Katherine Waterston 饰）的监视之下。一场意外中，麻鸡雅各布（丹·福格勒 Dan Fogler 饰）误拿了纽特的手提箱，并且放出了藏在箱子里的魔法动物，为此，纽特、蒂娜、雅各布和蒂娜的妹妹奎妮（艾莉森·苏朵儿 Alison Sudol 饰）不得不踏上了寻找魔法动物的旅途。', '埃迪·雷德梅恩 Eddie Redmayne 凯瑟琳·沃特斯顿 Katherine Waterston 丹·福勒 Dan Fogler 艾莉森·萨多尔 Alison Sudol 科林·法瑞尔 Colin Farrell 埃兹拉·米勒 Ezra Miller 朗·普尔曼 Ron Perlman 强·沃特 Jon Voight 萨曼莎·莫顿 Samantha Morton 嘉玛·陈 Gemma Chan 卡门·艾乔戈 Carmen Ejogo 克里斯汀·马扎诺 Christine Marzano 詹·穆瑞 Jenn Murray 约翰尼·德普 Johnny Depp', '2016', '大卫·叶茨 David Yates', '英国/美国', '中英双字', 'D:/movie/神奇动物在哪里.mp4', 0, 45, 2, 0);
INSERT INTO `movie` VALUES (9, '镰仓物语', 129, '剧情/奇幻', '镰仓，一个看似不起眼的小城，却是连通两个异世界的神奇之处，流传着各种奇妙的 传说。推理作家一色正和（堺雅人 饰）与天然呆妻子亚纪子（高畑充希 饰）新婚蜜月 后定居在老家镰仓，过着夫唱妇和的幸福生活。一次偶然，亚纪子中了怪物的设计被 带到异世界，爱妻心切的一色为了夺回妻子，不惜打破禁忌，只身冒险，在奇妙的异世界展开了一场奇幻冒险…… ', '堺雅人 Masato Sakai  高畑充希 Mitsuki Takahata  堤真一 Shin\'ichi Tsutsumi  安藤樱 Sakura Andô  田中泯 Min Tanaka  中村玉绪 Tamao Nakamura  市川实日子 Mikako Ichikawa  室毅 Tsuyoshi Muro  要润 Jun Kaname  大仓孝二 Koji Ookura  神户浩 Hiroshi Kanbe  国村隼 Jun Kunimura  古田新太 Arata Furuta  鹤田真由 Mayu Tsuruta  药师丸博子 Hiroko Yakushimaru  吉行和子 Kazuko Yoshiyuki  桥爪功 Isao Hashizume  三浦友和 Tomokazu Miura', '2017', '山崎贵 Takashi Yamazaki', '日本', '日语中字', 'D:/movie/镰仓物语.mkv', 0, 45, 2, 0);
INSERT INTO `movie` VALUES (10, '无名之辈', 108, '剧情/喜剧', '在一座山间小城中，一对低配劫匪、一个落魄的泼皮保安、一个身体残疾却性格彪悍的毒舌女以及一系列生活在社会不同轨迹上的小人物，在一个貌似平常的日子里，因为一把丢失的老枪和一桩当天发生在城中的乌龙劫案，从而被阴差阳错地拧到一起，发生的一幕幕令人啼笑皆非的荒诞喜剧', '陈建斌 Jianbin Chen 任素汐 Suxi Ren 潘斌龙 Bin-long Pan 章宇 Yu Zhang 王砚辉 Yanhui Wang 九孔 Kong Jiu 马吟吟 Yinyin Ma 程怡 Yi Cheng 宁桓宇 Huanyu Ning 邓恩熙 Enxi Deng 谢波 Bo Xie 范翔 Xiang Fan 赵梓冲 Zichong Zhao 史策 Ce Shi 马睿瀚 Ruihan Ma 林海 邓钢 Gang Deng ', '2018', '饶晓志 Xiaozhi Rao', '中国', '中英双字', 'D:/movie/无名之辈.mp4', 0, 45, 2, 0);
INSERT INTO `movie` VALUES (11, '狗十三', 120, '剧情/家庭', '13岁的少女李玩，由于父母离异，与爷爷奶奶生活在一起。正处于青春期的她渴望了解、陪伴和爱。在“要听话”的中国式教育里，李玩也完成了属于她的“成人礼”。电影中，父亲希望通过一条宠物小狗完成与女儿的和解与沟通，李玩为狗取名“爱因斯坦”，暗潮涌动的青春因“爱因斯坦”意外走失，开启了它汹涌又无奈的成长之路', '张雪迎 Xueying Zhang 果靖霖 Jinglin Guo 智一桐 Yitong Zhi 代旭 Xu Dai 黄诗佳 Shijia Huang 曹馨月 Xinyue Cao 聂鑫 Xin Nie 周珍 Zhen Zhou ', '2013', '曹保平 Baoping Cao', '中国', '中英双字', 'D:/movie/狗十三.mkv', 0, 45, 2, 0);
INSERT INTO `movie` VALUES (12, '无双', 130, '剧情/动作/犯罪', '《无双》讲述了以代号“画家”（周润发 饰）为首的犯罪团伙，掌握了制造伪钞技术，难辨真伪，并在全球进行交易获取利益，引起警方高度重视。然而“画家”和其他成员的身份一直成谜，警方的破案进度遭受到了前所未有的挑战。在关键时刻，擅长绘画的李问（郭富城 饰）打开了破案的突破口，而“画家”的真实身份却让众人意想不到……', '周润发 Yun-Fat Chow 郭富城 Aaron Kwok 张静初 Jingchu Zhang 冯文娟 Wenjuan Feng 廖启智 Kai Chi Liu 周家怡 Catherine Chau 王耀庆 David Wang 方中信 Alex Fong 高捷 Jack Kao 邢佳栋 Jiadong Xing 张松枝 Deno Cheung 张建声 Justin Cheung 吴嘉龙 Carl Wu 孙佳君 Paulyn Sun', '2018', '庄文强 Felix Chong', '中国香港', '中文', 'D:/movie/无双.mp4', 0, 45, 2, 0);
INSERT INTO `movie` VALUES (13, '完美陌生人', 97, '剧情/喜剧', '七个常年的好朋友聚在一起吃晚餐。忽然他们决定与对方分享每一个短信的内容，包括他们收到的电子邮件和电话，由此许多秘密开始公布而他们之间的关系开始发生波动。吉塞培·巴蒂斯通 Giuseppe Battiston 安娜·福列塔 Anna Foglietta 马可·贾利尼 Marco Giallini 艾多尔多·里奥 Edoardo Leo 瓦里诺·马斯坦德雷阿 Valerio Mastandrea 阿尔芭·洛尔瓦彻 Alba Rohrwacher 卡西娅·史穆特妮亚克 Kasia Smutniak ', '吉塞培·巴蒂斯通 Giuseppe Battiston 安娜·福列塔 Anna Foglietta 马可·贾利尼 Marco Giallini 艾多尔多·里奥 Edoardo Leo 瓦里诺·马斯坦德雷阿 Valerio Mastandrea 阿尔芭·洛尔瓦彻 Alba Rohrwacher 卡西娅·史穆特妮亚克 Kasia Smutniak', '2016', '保罗·格诺维瑟 Paolo Genovese', '意大利', '意中双字', 'D:/movie/完美陌生人.mp4', 0, 45, 2, 0);
INSERT INTO `movie` VALUES (14, '云图', 178, '剧情/悬疑/科幻', '    本片是根据英国作家大卫·米切尔（David Mitchell）的同名小说改编而成的史诗科幻巨作，由《黑客帝国》导演沃卓斯基姐弟（原沃卓斯基兄弟）联手《罗拉快跑》导演汤姆·提克威共同拍摄而成。主演更是阵容强大：包括奥斯卡影帝汤姆·汉克斯、影后哈莉·贝瑞， 雨果·维文、休·格兰特、本·威士肖、周迅、裴斗娜、苏珊·萨兰登、詹姆斯·达西等。投资超过一亿美元，由“钻石级幕后团队”所打造，制作团队中累计有67个奥斯卡奖提名。\r\n\r\n　　《云图》是大卫·米切尔的第三部小说。它的故事分为成六个部分，分别发生于1850年的太平洋、1931年的比利时、1975年的加州、21世纪初的英国、反乌托邦时代未来的内索国和后末日未来的夏威夷。六个故事看似彼此独立，但彼此之间却存在着某种神秘的相互影响，并最终形成真实的联系。该小说出版于2004年，荣膺英国国家图书奖最佳小说奖和理查与茱蒂读书俱乐部年度选书，同时入围布克奖、星云奖、克拉克奖决选。\r\n　　  \r\n　　2005年，在《V字仇杀队》的拍摄现场，娜塔莉·波特曼将电影下载《云图》的原著英文小说交到了拉娜·沃卓斯基（那时的拉里·沃卓斯基）手中，从那时起他便萌生了将本片改为电影的想法。但将文字转化成为电影叙事的镜头语言这一难题，使得片方单剧本就修改了十几遍。对于故事复杂性是否会考验到观众的接受能力，制片人格兰特·希尔给予了很积极正面的回应，“《黑客帝国》和《盗梦空间》都是很费脑力的电影，但他们的票房都相当成功，很多人会痴迷的去研究和挖掘故事的更深层次。最新电影《云图》恰巧可以满足人们的这种需求。”这位好莱坞顶级制片人认为复杂的叙事和深刻的思想并不会让观众望而却步，相反会吸引更多不同层次的观众。格兰特先生也认为，本片的“重生”“涅槃”等思想十分符合亚洲人的佛家思想，因而也使得本片在亚洲的融资以及卖片计划得以顺利实施。\r\n\r\n　　故事从6个人在不同时空的生活入手，从公元1850年一直贯穿到后末日时期的未来。据悉部分演员会横穿整个影片，分别在六个故事中饰演不同的角色。我们将看到汤姆·汉克斯这样影帝级的演员与其他巨星在银幕中大玩穿越。', '汤姆·汉克斯 Tom Hanks  ....Dr. Henry Goose / Hotel Manager / Isaac Sachs / Dermot Hoggins / Cavendish Look-a-Like Actor / Zachry 哈莉·贝瑞 Halle Berry  ....Native Woman / Jocasta Ayrs / Luisa Rey / Indian Party Guest / Ovid / Meronym 裴斗娜 Du-na Bae  ....Tilda / Megan\'s Mom / Mexican Woman / Sonmi-451 / Sonmi-351 / Sonmi Prostitute 吉姆·斯特吉斯 Jim Sturgess  ....Adam Ewing / Poor Hotel Guest / Megan\'s Dad / Highlander / Hae-Joo Chang / Adam / Zachry Brother-in-Law 雨果·维文 Hugo Weaving  ....Haskell Moore / Tadeusz Kesselring / Bill Smoke / Nurse Noakes / Boardman Mephi / Old Georgie 吉姆·布劳德本特 Jim Broadbent  ....Captain Molyneux / Vyvyan Ayrs / Timothy Cavendish / Korean Musician / Prescient 2 本·威士肖 Ben Whishaw  ....Cabin Boy / Robert Frobisher / Store Clerk / Georgette / Tribesman 凯斯·大卫 Keith David  ....Kupaka / Joe Napier / An-kor Apis / Prescient 詹姆斯·达西 James D\'Arcy  ....Young Rufus Sixsmith / Old Rufus Sixsmith / Nurse James / Archivist 周迅 Xun Zhou  ....Talbot / Hotel Manager / Yoona-939 / Rose 大卫·吉亚斯 David Gyasi  ....Autua / Lester Rey / Duophsyte 苏珊·萨兰登 Susan Sarandon  ....Madame Horrox / Older Ursula / Yusouf Suleiman / Abbess 休·格兰特 Hugh Grant  ....Rev. Giles Horrox / Hotel Heavy / Lloyd Hooks / Denholme Cavendish / Seer Rhee / Kona Chief 大卫·詹森 David Jensen ....Super Robert Fyfe  ....Old Salty Dog / Mr. Meeks / Prescient 1 马丁·乌特克 Martin Wuttke  ....Mr. Boerhaave / Guard / Leary the Healer Robin Morrissey  ....Young Cavendish Brody Nicholas Lee  ....Javier Gomez / Jonas / Zachry\'s Older Nephew 阿曼达·沃克尔 Amanda Walker  ....Veronica Ralph Riach  ....Ernie Andrew Havill  ....Mr. Hotchkiss Tanja de Wendt  ....Mrs. Hotchkiss Raevan Lee Hanan  ....Little Girl with Orison at Papa Song\'s / Catkin / Zachry Relative  戈兹·奥托 Götz Otto  ....Groundsman Withers Niall Greig Fulton  ....Haskell Moore\'s Dinner Guest 2 / Mozza Hoggins Louis Dempsey  ....Haskell Moore\'s Dinner Guest 3 / Jarvis Hoggins Martin Docherty  ....Haskell Moore\'s Dinner Guest 4 / Eddie Hoggins Alistair Petrie  ....Haskell Moore\'s Dinner Guest 1 / Musician / Felix Finch / Lascivious Businessman 朱珠 Zhu Zhu  ....Megan Sixsmith / 12th Star Clone 斯薇斯特·L·唐兹尔 Sylvestra Le Touzel  ....Haskell Moore\'s Dinner Guest 5 / Nurse Judd / Aide in Slaughtership Jojo Schöning  ....Papa Song Punk Laura Vietzen  ....Young Ursula Thomas Kügel  ....Ursula\'s Father', '2012', '汤姆·提克威 Tom Tykwer 安迪·沃卓斯基 Andy Wachowski 拉娜·沃卓斯基 Lana Wachowski', '德国/美国/中国香港/新加坡 ', '英语中字', 'D:/movie/云图.mp4', 0, 45, 2, 0);
INSERT INTO `movie` VALUES (16, '神秘来电', 91, '恐怖/神秘/惊悚', '    离婚女人玛丽，不停的接到一个陌生号码的神秘来电，之后她发现在她住所周围存在着一股神秘的气息。在经过一段时候之后，玛丽发现打神秘电话的主人公来自过去，而且她必须把打电话的人杀死她才可以活下来。但是玛丽如何杀死一个存在于过去的人呢？而且如果行动失败玛丽将会遭遇些什么？', '斯蒂芬·莫耶 Stephen Moyer ... John Guidi 雷切尔·洛弗热 Rachelle Lefevre ... Mary Kee 路易斯·古斯曼 Luis Guzmán ... George 埃德·奎因 Ed Quinn ... Steven Lorna Raver ... Rose 考狄利娅·冈萨雷斯 Cordelia González ... Judge 马莱斯·阿尔瓦雷斯 Marisé Alvarez ... Nurse Alfredo De Quesada ... Attorney Davies 布赖恩·塔斯特 Brian Tester ... Attorney Kirkby Aris Mejias ... Young Woman Gladys Rodríguez ... Mrs. Guidi Grace Connelly ... Dr. Hain Jose Cotte ... Social Services Clerk Leonardo Castro ... Fire Dancer Johnathan R. Santiago ... Creepy Student', '2011', '马修·帕克希尔 Matthew Parkhill', '英国/波多黎各', '中英双字', 'D:/movie/神秘来电.rmvb', 1, 45, 2, 0);
INSERT INTO `movie` VALUES (17, '蒙上你的眼', 124, '剧情/科幻/惊悚', '　　当一股神秘力量要歼灭人类，大家只知道一个法则：万一你看到它，就要奉上自己的性命。面对一切未知，梅乐莉找着爱与希望，以及可以瓦解这股力量的新转机。 \r\n她别无选择，只好带着两个孩子渡过危机四伏的河流，逃往唯一可能安全的地方避难。为了生存下去，他们必须蒙上双眼，踏上长达两天的危险旅程。 ', '桑德拉·布洛克 Sandra Bullock 崔凡特·罗兹 Trevante Rhodes 约翰·马尔科维奇 John Malkovich 莎拉·保罗森 Sarah Paulson 杰基·韦佛 Jacki Weaver 罗莎·萨拉查 Rosa Salazar 丹妮尔·麦克唐纳 Danielle Macdonald 里尔·莱尔·哈瓦瑞 Lil Rel Howery 汤姆·霍兰德 Tom Hollander 机关枪凯利 Machine Gun Kelly 黄荣亮 B.D. Wong 普路特·泰勒·文斯 Pruitt Taylor Vince 维维恩·莱拉·布莱尔 Vivien Lyra Blair 帕敏德·纳格拉 Parminder Nagra 丽贝卡·彼得跟 Rebecca Pidgeon 艾米·古麦尼克 Amy Gumenick 泰勒·汉德雷 Taylor Handley 海皮·安德森 Happy Anderson 大卫·达斯马齐连 David Dastmalchian 基思·雅各 Keith Jardine 克里斯托弗洛根 Kristopher Logan 弗兰克·莫特克 Frank Mottek 泰德·霍利斯 Ted Hollis 麦特·伦纳德 Matt Leonard ', '2018', '苏珊娜·比尔 Susanne Bier ', '美国', '中英双字', 'D:/movie/蒙上你的眼.mkv', 0, 45, 2, 0);
INSERT INTO `movie` VALUES (18, '守塔人', 107, '惊悚/悬疑', '    3位灯塔看守人换班到一个无人岛上工作6周，而意外发现的黄金却改变了这一切。孤独、贪婪、偏执全部爆发，三人开始自相残杀。', '杰拉德·巴特勒 Gerard Butler 彼得·穆兰 Peter Mullan 塞林·琼斯 Celyn Jones 奥拉维尔·达里·拉夫森 Ólafur Darri Ólafsson 加里·刘易斯 Gary Lewis 索伦·莫灵 Søren Malling Ken Drury ', '2018', '克里斯托弗·尼霍姆 Kristoffer Nyholm  ', '英国', '中英双字', 'D:/movie/守塔人.mkv', 0, 45, 2, 0);
INSERT INTO `movie` VALUES (19, '康斯坦丁：恶魔之城', 90, '动画/奇幻', '　CW Seed的网剧《康斯坦丁：恶魔之城》准备发布一部长篇的版本正如网剧《雌狐》一样，5集的《康斯坦丁：恶魔之城》将汇编在一起并加入新片段，最终转换成一部完整的电影。 ', '马特·瑞安 Matt Ryan 达米恩·奥哈尔 Damian O\'Hare 劳拉·贝莉 Laura Bailey 艾米丽·奥布莱恩 Emily O\'Brien 罗宾·阿特金·唐斯 Robin Atkin Downes Rachel Kimsey 吉姆·麦司奇门 Jim Meskimen 凯文·迈克尔·理查德森 Kevin Michael Richardson Rick D. Wasserman ', '2018', '道格·墨菲 Doug Murphy', '美国', '中英双字', 'D:/movie/康斯坦丁.mkv', 0, 40, 2, 0);
INSERT INTO `movie` VALUES (20, '谁先爱上他的', 100, '剧情/喜剧', '    妈妈刘三莲（谢盈萱饰）为家付出一切，可怎样也无法忍受外遇的亡夫宋正远（陈如山饰）竟把保险理赔金留给外人，还是个男人阿杰（邱泽饰）。她决定代子出征，直踏小王门户开战。却没想到叛逆儿子（黄圣球饰）竟然窝里反，倒阵入宿外人家。刘三莲恨亡夫让她变成不被爱的“小三”。更焦虑于她生命中的另一个男人也可能离她而去 。', '邱泽 谢盈萱 陈如山', '2018', '徐誉庭 许志彦', '中国', '中文', 'D:/movie/谁先爱上他的.mp4', 0, 40, 2, 0);
INSERT INTO `movie` VALUES (22, '头号玩家', 140, '动作/科幻/冒险', '　　故事发生在2045年，虚拟现实技术已经渗透到了人类生活的每一个角落。詹姆斯哈利迪（马克·里朗斯 Mark Rylance 饰）一手建造了名 \r\n\r\n为“绿洲”的虚拟现实游戏世界，临终前，他宣布自己在游戏中设置了一个彩蛋，找到这枚彩蛋的人即可成为绿洲的继承人。要找到这枚彩蛋 \r\n\r\n，必须先获得三把钥匙，而寻找钥匙的线索就隐藏在詹姆斯的过往之中。 \r\n韦德（泰尔·谢里丹 Tye Sheridan 饰）、艾奇（丽娜·维特 Lena Waithe 饰）、大东（森崎温 饰）和修（赵家正 饰）是游戏中的好友，和 \r\n\r\n之后遇见的阿尔忒弥斯（奥利维亚·库克 Olivia Cooke 饰）一起，五人踏上了寻找彩蛋的征程。他们所要对抗的，是名为诺兰索伦托（本· \r\n\r\n门德尔森 Ben Mendelsohn 饰）的大资本家。 ', '泰伊·谢里丹 Tye Sheridan 奥利维亚·库克 Olivia Cooke 本·门德尔森 Ben Mendelsohn 马克·里朗斯 Mark Rylance 丽娜·维特 Lena Waithe 森崎温 Win Morisaki 菲利普·赵 Philip Zhao 西蒙·佩吉 Simon Pegg T·J·米勒 T.J. Miller 汉娜·乔恩-卡门 Hannah John-Kamen 拉尔夫·尹爱森 Ralph Ineson 苏珊·林奇 Susan Lynch 克莱尔·希金斯 Clare Higgins 劳伦斯·斯佩尔曼 Laurence Spellman 佩蒂塔·维克斯 Perdita Weeks 艾萨克·安德鲁斯 Isaac Andrews ', '2018', '史蒂文·斯皮尔伯格 Steven Spielberg ', '美国', '中英双字', 'D:/movie/头号玩家.mkv', 0, 45, 2, 0);
INSERT INTO `movie` VALUES (23, '死侍2', 133, '喜剧/动作/科幻/冒险', '　　拥有不死之身的死侍韦德·威尔森（瑞恩·雷诺兹 Ryan Reynolds 饰）继续在惩恶扬善、毒舌嘴贱的路上绝命狂奔，与此同时他和女友瓦内莎（莫蕾娜·巴卡林 Morena Baccarin 饰）的爱情逐渐升华，两人全新期待新生命的到来。谁知命运难测，因瓦内莎意外身亡，韦德万念俱灰，绝望地渴求生命的终结。在他最失落的时候，钢力士和少年弹头等将他领走，成为X战警中的一员。在某次行动中，死侍因袒护暴走的14岁变种人拉塞尔（朱利安·迪尼森 Julian Dennison 饰）而随同对方被关入冰盒监狱。没过多久，来自未来的电索（乔什·布洛林 Josh Brolin 饰）闯入监狱，意图杀死在未来引起无数灾难的拉塞尔。 \r\n\r\n　　为了阻止电索，逃离监狱的死侍找到一群战友与之对抗，而拉塞尔则朝着黑暗渐渐远去……', '瑞恩·雷诺兹 Ryan Reynolds 乔什·布洛林 Josh Brolin 莫蕾娜·巴卡林 Morena Baccarin 朱利安·迪尼森 Julian Dennison 莎姬·贝兹 Zazie Beetz T·J·米勒 T.J. Miller 莱斯利·格塞斯 Leslie Uggams 卡兰·索尼 Karan Soni 布里安娜·希德布兰德 Brianna Hildebrand 杰克·凯西 Jack Kesy 埃迪·马森 Eddie Marsan 忽那汐里 Kutsuna Shiori 斯蒂芬·卡皮契奇 Stefan Kapicic 兰德尔·瑞德 Randal Reeder 尼古莱·维切尔 Nikolai Witschl 赛尔·哈里斯 Thayr Harris 罗伯·德兰尼 Rob Delaney 刘易斯·谭 Lewis Tan 比尔·斯卡斯加德 Bill Skarsgård 泰瑞·克鲁斯 Terry Crews 布拉德·皮特 Brad Pitt 罗伯特·梅耶 Robert Maillet 艾伦·图代克 Alan Tudyk 马特·达蒙 Matt Damon 海莉·塞尔斯 Hayley Sales 麦克·多普德 Mike Dopud 卢克·勒斯勒尔 Luke Roessler 亨特·狄龙 Hunter Dillon 萨拉·贝克 Sala Baker 保罗·韦尼克 Paul Wernick 略特·里斯 Rhett Reese 大卫·雷奇 David Leitch 艾丽西娅·莫顿 Alicia Morton 肖恩·吉斯灵厄姆 Sean Gislingham 山姆·哈格雷夫 Sam Hargrave 尼古拉斯·霍尔特 Nicholas Hoult 莱昂内尔·玛丽 Lionel Marye 詹姆斯·麦卡沃伊 James McAvoy 埃文·彼得斯 Evan Peters 泰伊·谢里丹 Tye Sheridan 亚历山德拉·希普 Alexandra Shipp 柯蒂·斯密特-麦菲 Kodi Smit-McPhee 斯科特·维卡尤斯 Scott Vickaryous ', '2018', '大卫·雷奇 David Leitch', '美国', '中英双字', 'D:/movie/死侍2.mkv', 0, 35, 2, 0);
INSERT INTO `movie` VALUES (24, '地球最后的夜晚', 140, '剧情/爱情/悬疑', '　　罗紘武（黄觉 饰）因父亲离世再次回到贵州。12年前，好友白猫（李鸿其 饰）被杀，罗紘武在追查凶手左宏元（陈永忠 饰）的过程中，被凶手的情人万绮雯（汤唯 饰）所利用。从此以后，这个神秘的女人构成了他所有的记忆、欲望、信念和梦魇，一段追寻之旅让他发现了被隐藏多年的秘密……', '汤唯 Wei Tang  黄觉 Jue Huang  张艾嘉 Sylvia Chang  李鸿其 Hong-Chi Lee  陈永忠 Yongzhong Chen  罗飞扬 Feiyang Luo  曾美慧孜 Meihuizi Zeng  段钧豪 Chun-hao Tuan  谢理循 Lixun Xie  齐溪 Xi Qi  明道 Ming Dow  龙泽治 Zezhi Long ', '2018', '毕赣 Bi Gan', '中国', '中英双字(贵州方言)', 'D:/movie/地球最后的夜晚.mkv', 0, 25, 2, 0);
INSERT INTO `movie` VALUES (25, '朝花夕誓', 115, '动画/奇幻', '　　在世界的尽头，住着一群被称为“离别一族”的古老民族：他们拥有着长寿之血和永生不老的面容。在一场外族入侵的战役中，离别一族惨遭灭族，15岁的玛奇亚虽然侥幸逃生，却彻底和朋友失去了联系。孤身一人的她在残骸中拾到了一个普通人家的遗孤，并决定收养它。然而随着时间的流逝，玛奇亚必须要学会如何做一个母亲，经历人间的生离死别，并在朝代的更迭中守护“离别一族”最后的信仰……', '石见舞菜香 Iwami Manaka  入野自由 Miyu Irino  茅野爱衣 Ai Kayano  梶裕贵 Yûki Kaji  泽城美雪 Miyuki Sawashiro  细谷佳正 Yoshimasa Hosoya  佐藤利奈 Rina Satou  日笠阳子 Yoko Hikasa  久野美咲 Misaki Kuno  杉田智和 Tomokazu Sugita  平田广明 Hiroaki Hirata ', '2018', '冈田磨里 Mari Okada/篠原俊哉 Toshiya Shinohara ', '日本', '日语中字', 'D:/movie/朝花夕誓.mkv', 0, 30, 2, 0);
INSERT INTO `movie` VALUES (26, '看不见的客人', 106, '剧情/悬疑/惊悚/犯罪', '　　艾德里安（马里奥·卡萨斯 Mario Casas 饰）经营着一间科技公司，事业蒸蒸日上，家中有美丽贤惠的妻子和活泼可爱的女儿，事业家庭双丰收的他是旁人羡慕的对象。然而，野心勃勃的艾德里安并未珍惜眼前来之不易的生活，一直以来，他和一位名叫劳拉（芭芭拉·蓝妮 Bárbara Lennie 饰）的女摄影师保持着肉体关系。 \r\n某日幽会过后，两人驱车离开别墅，却在路上发生了车祸，为了掩盖事件的真相，两人决定将在车祸中死去的青年丹尼尔联同他的车一起沉入湖底。之后，劳拉遇见了一位善良的老人，老人将劳拉坏掉的车拉回家中修理，然而，令劳拉没有想到的是，这位老人，竟然就是丹尼尔的父亲。 ', '马里奥·卡萨斯 Mario Casas  阿娜·瓦格纳 Ana Wagener  何塞·科罗纳 José Coronado  芭芭拉·蓝妮 Bárbara Lennie  法兰西斯克·欧瑞拉 Francesc Orella  帕科·图斯 Paco Tous  大卫·塞尔瓦斯 David Selvas  伊尼戈·加斯特西 Iñigo Gastesi  珊·叶拉姆斯 San Yélamos  马内尔·杜尔索 Manel Dueso  布兰卡·马丁内斯 Blanca Martínez  佩雷·布拉索 Pere Brasó  乔迪·布鲁内特 Jordi Brunet  鲍毕·冈塞莱斯 Bobby Gonzalez  玛蒂娜·乌尔塔多 Martina Hurtado ', '2017', '奥里奥尔·保罗 Oriol Paulo', '西班牙', '中英双字', 'D:/movie/看不见的客人.mkv', 0, 35, 2, 0);
INSERT INTO `movie` VALUES (27, '掠食城市：致命引擎', 128, '动作/科幻/冒险', '　　一次灾难性事件毁灭了文明，数千年后，人类已经适应，并进化出了新的生存方式。如今，巨大的移动城市在地球上漫步，无情地吞噬着小牵引城镇。汤姆·纳茨沃西（罗伯特·席安饰），来自大牵引城市伦敦的低层，在遭遇了危险逃犯海特·肖（海拉·希尔莫饰）后，不得不开始为生存而奋战。两个截然相反，本不该相遇的人，却意外结盟，他们注定将改变未来。', '海拉·西尔玛 Hera Hilmar  雨果·维文 Hugo Weaving  金吉 Jihae  罗伯特·席安 Robert Sheehan  莱拉·乔治 Leila George  史蒂芬·朗 Stephen Lang  弗兰基·亚当斯 Frankie Adams  凯伦·皮斯托里斯 Caren Pistorius  科林·萨蒙 Colin Salmon  安德鲁斯·李斯 Andrew Lees  罗南·拉夫特瑞 Ronan Raftery  乔尔·托贝克 Joel Tobeck  帕特里克·麦拉海德 Patrick Malahide  史蒂芬·乌瑞 Stephen Ure  马尼克·古纳拉塔尼 Menik Gooneratne  菲利普·里夫 Philip Reeve  纳撒尼尔·利斯 Nathaniel Lees  雷吉-让·佩吉 Regé-Jean Page  卡卢姆·吉廷斯 Calum Gittins  安佑森 Yoson An  马克·哈德洛 Mark Hadlow  马克米钦森 Mark Mitchinson  莎拉·皮尔斯 Sarah Peirse  特里·诺瑞斯 Terry Norris  安龙·杰克森 Aaron Jackson  尼克·布雷克 Nick Blake  玛丽亚·沃克 Maria Walker ', '2018', '克里斯蒂安·瑞沃斯 Christian Rivers', '美国/新西兰', '中英双字', 'D:/movie/掠食城市.mkv', 0, 40, 2, 0);
INSERT INTO `movie` VALUES (28, '中国合伙人2', 123, '剧情', '　　影片讲述了从九十年代末到当下的近二十年期间，互联网行业在中国从发轫、发展到行业泡沫再到高速爆发行业成熟的过程。影片选取了三位有代表的行业人物，程序员楚振辉、秦磊和投资人徐顺之。影片围绕楚振辉、秦磊，并以徐顺之的视角展现了一个程序员向创业者的蜕变，讲述他们三人在互联网大潮中创业、守业以及行业升级的故事，表现了中国互联网人的中国精神和民族情怀。他们将成为新时代的中国合伙人，而中国互联网行业的创业热血正在继续生生不息。', '赵立新 Lixin Zhao  凌潇肃 Xiao-su Ling  王嘉 Jevon Wang  董琦 Qi Dong  马梦唯 Mengwei Ma  寇世勋 Johnny Kou Hsi-Shun  王劲松 Jinsong Wang  多布杰 Duobujie  杨轶 Yi Yang  王蔚 Wei Wang  贺宽 Kuan He  海一天 Yitian Hai ', '2018', '刘亚当 Yadang Liu', '中国', '中英双字', 'D:/movie/中国合伙人2.mkv', 1, 25, 2, 0);
INSERT INTO `movie` VALUES (29, '来电狂响', 103, '剧情/喜剧', '　　七个好友聚餐，有人提议大家玩一个将手机公开的游戏：与在场所有人分享当晚收到的每一通来电、每一条短信微信、甚至广告弹窗，由此掀开了一场啼笑皆非的情感风暴。数字时代，小小手机隐藏着无数秘密，当聚餐局变成“揭秘局”，当通讯工具化身定时炸弹，嬉笑打闹之后，甜蜜情侣和模范夫妻、多年死党之间还能真诚相待、美好如初吗？这场刺激的勇敢者游戏，你敢玩吗？ ', '佟大为 Dawei Tong  马丽 Li Ma  霍思燕 Siyan Huo  乔杉 Shan Qiao  田雨 Yu Tian  代乐乐 Lele Dai  奚梦瑶 Ming Xi  艾伦 Allen  张晨光 Morning Chang  杨玏 Le Yang  李成敏 Clara Lee  何泓姗 Hongshan He  徐冬冬 Dongdong Xu  许娣 Di Xu  李萍 Ping Li  刘奇 Qi Liu  姜来  张帆 Fan Zhang  李柄熹  韩昕妤 Xinyu Han', '2018', '于淼 Miao Yu', '中国', '中文', 'D:/movie/来电狂响.mkv', 0, 30, 2, 0);
INSERT INTO `movie` VALUES (30, '克隆人', 107, '科幻/悬疑/犯罪', '　　神经学科学家威尔·福斯特（基努·里维斯 饰）在一场车祸中失去了他的妻子（爱丽丝·伊芙 饰）和三个孩子，在好友同时也是科学家埃德·惠特尔（托马斯·米德蒂奇 饰）的帮助下，他通过克隆身体以及传输意识复活了家人。为了达到目的，他不惜与警方为敌，不惜对峙政府控制的实验室，甚至不惜挑战一切科学限制，惹来了始料未及的麻烦…… ', '基努·里维斯 Keanu Reeves  爱丽丝·伊芙 Alice Eve  艾米丽·阿琳·林德 Emily Alyn Lind  托马斯·米德蒂奇 Thomas Middleditch  恩杰伊·安东尼 Emjay Anthony  约翰·奥提兹 John Ortiz  尼亚切·海邓迪 Nyasha Hatendi  Aria Lyric Leabu  Amber Rivera  Amber Townsend  Jeffrey Holsman  Sunshine Logroño  Omar Cruz Soto  Iván J. Torres Lasanta  Jean Pierre Prats  Evelyn Dean-Olmsted', '2018', '杰弗利·纳赫马诺夫 Jeffrey Nachmanoff', '英国/中国大陆/波多黎各/美国', '中英双字', 'D:/movie/克隆人.mkv', 0, 30, 2, 0);
INSERT INTO `movie` VALUES (31, '绿皮书', 130, '剧情/喜剧/传记', '　　一名黑人钢琴家，为前往种族歧视严重的南方巡演，找了一个粗暴的白人混混做司机。在一路开车南下的过程里，截然不同的两人矛盾不断，引发了不少争吵和笑料。但又在彼此最需要的时候，一起共渡难关。行程临近结束，两人也慢慢放下了偏见…… \r\n\r\n　　绿皮书，是一本专为黑人而设的旅行指南，标注了各城市中允许黑人进入的旅店、餐馆。电影由真实故事改编。 ', '维果·莫腾森 Viggo Mortensen  马赫沙拉·阿里 Mahershala Ali  琳达·卡德里尼 Linda Cardellini  塞巴斯蒂安·马尼斯科 Sebastian Maniscalco  迪米特·D·马里诺夫 Dimiter D. Marinov  迈克·哈顿 Mike Hatton  P·J·伯恩 P.J. Byrne  乔·柯蒂斯 Joe Cortese  玛姬·尼克松 Maggie Nixon  冯·刘易斯 Von Lewis  乔恩·索特兰 Jon Sortland  唐·斯达克 Don Stark  安东尼·曼加诺 Anthony Mangano  保罗·斯隆 Paul Sloan  珍娜·劳伦索 Jenna Laurenzo  肯尼斯·以色列 Kenneth Israel  伊克博·塞巴 Iqbal Theba  尼克·瓦莱隆加 Nick Vallelonga  大卫·安 David An  迈克·切罗内 Mike Cerrone  杰拉尔丁·辛格 Geraldine Singer  马丁·巴特斯·布拉德福德 Martin Bats Bradford  格拉伦·布莱恩特·班克斯 Gralen Bryant Banks  汤姆·维图 Tom Virtue  夏恩·帕特洛 Shane Partlow  丹尼斯·W·霍尔 Dennis W. Hall  吉姆·克洛克 Jim Klock  戴恩·罗兹 Dane Rhodes  布赖恩·斯特帕尼克 Brian Stepanek  乔恩·迈克尔·戴维斯 Jon Michael Davis  布莱恩·海耶斯·库瑞 Brian Hayes Currie ', '2018', '彼得·法雷里 Peter Farrelly', '英语/意大利语/俄语/德语', '中英双字', 'D:/movie/绿皮书.mkv', 0, 35, 2, 0);
INSERT INTO `movie` VALUES (32, '海王', 143, '动作/奇幻/冒险', '　　华纳兄弟影片公司与导演温子仁联手为您呈现波澜壮阔的动作冒险电影——《海王》！横跨七大洋的广阔海底世界徐徐展开，给观众带来震撼十足的视觉奇观。本片由杰森·莫玛领衔主演，讲述半人半亚特兰蒂斯血统的亚瑟·库瑞踏上永生难忘的征途——他不但需要直面自己的特殊身世，更不得不面对生而为王的考验：自己究竟能否配得上“海王”之名', '杰森·莫玛 Jason Momoa 艾梅柏·希尔德 Amber Heard 威廉·达福 Willem Dafoe 帕特里克·威尔森 Patrick Wilson 妮可·基德曼 Nicole Kidman 杜夫·龙格尔 Dolph Lundgren 叶海亚·阿卜杜勒-迈丁 Yahya Abdul-Mateen II 特穆拉·莫里森 Temuera Morrison 林路迪 Ludi Lin 迈克尔·比奇 Michael Beach 兰道尔·朴 Randall Park 格拉汉姆·麦克泰维什 Graham McTavish 雷·沃纳尔 Leigh Whannell 泰努伊·柯克伍德 Tainui Kirkwood 塔穆尔·柯克伍德 Tamor Kirkwood 丹泽尔·夸克 Denzel Quirke 卡恩·古尔杜尔 Kaan Guldur 奥蒂斯·丹吉 Otis Dhanji 克考亚·克库毛诺 Kekoa Kekumano 朱莉·安德鲁斯 Julie Andrews 约翰·瑞斯-戴维斯 John Rhys-Davies 杰曼·翰苏 Djimon Hounsou 索菲亚·福雷斯特 Sophia Forrest 娜塔莉亚姗福瑞 Natalia Safran 杰克·安德鲁 Jack Andrew 汉克·阿莫斯 Hank Amos 帕特里克·考克斯 Patrick Cox 罗伯特·朗斯特里特 Robert Longstreet 德维卡·帕利赫 Devika Parikh 梅布尔·塔莫内 Mabel Tamone 文森特·B·拉戈斯 Vincent B. Gorce 加布里埃拉·佩特科娃 Gabriella Petkova 爱丽丝·兰斯伯里 Alice Lanesbury 帕特里克·艾奇逊 Patrick Atchison 约翰·盖蒂尔 John Gettier 塔丽亚·杰德·霍尔特 Tahlia Jade Holt 罗斯·克纳汉 Ross Kernahan 布拉登·刘易斯 Braden Lewis 萨尔瓦多·梅伦达 Salvatore Merenda 山姆·莫纳汉 Sam Monaghan 温妮·穆赞贝 Winnie Mzembe 凯·潘塔诺 Kai Pantano 安娜·帕奇 Anna Patch 乔恩·奎斯蒂德 Jon Quested 迪伦·斯图默 Dylan Stumer 米奇·武尔夫 Mikey Wulff ', '2018', '温子仁 James Wan', '美国/澳大利亚', '中韩双字', 'D:/movie/海王.mkv', 1, 45, 1, 0);
INSERT INTO `movie` VALUES (33, '海市蜃楼', 128, '科幻/悬疑/惊悚', '　　《看不见的客人》导演、西班牙悬疑大师奥里奥尔·保罗新作悬念升级。25年前一个风暴将至的夜晚，小男孩尼克目睹了邻居杀妻的全过程，被凶手发现的他在逃跑途中被车撞死。尼克死去25年后，幸福的已婚妇女维拉（阿德丽安娜·尤加特 饰）搬进了尼克住过的这所房子。一场和25年前一样的风暴让两段时空交错，惊醒的维拉发现自己竟能与电视机里的尼克跨时空对话。维拉透过电视机试图挽救这个男孩的性命，却引发一系列连锁反应——女儿消失、丈夫和身边的人全都不再认识和相信自己。于是，维拉只能在风暴消失前有限的15小时里，与唯一相信她的莱拉警长（奇诺·达林饰）解开所有谜团…', '阿德里亚娜·乌加特 Adriana Ugarte 奇诺·达林 Chino Darín 哈维尔·古铁雷斯 Javier Gutiérrez 阿尔瓦罗·莫奇 Álvaro Morte 诺拉·纳瓦斯 Nora Navas 米格尔·费南德斯 Miquel Fernández 克拉拉·塞古拉 Clara Segura 艾娜·克洛特 Aina Clotet 弗兰塞斯克·奥雷利亚 Francesc Orella 阿娜·瓦格纳 Ana Wagener 西尔维亚·阿隆索 Silvia Alonso 贝伦·鲁埃达 Belén Rueda Mima Riera Albert Pérez ', '2018', '奥里奥尔·保罗 Oriol Paulo ', '西班牙', '(西语)中英双字', 'D:/movie/海市蜃楼.mkv', 0, 35, 2, 0);
INSERT INTO `movie` VALUES (34, '忌日快乐2', 100, '悬疑/惊悚/恐怖', '　　Blumhouse制片公司即将开始进行恐怖片《忌日快乐2》的制作工作。影片将于5月10日开始拍摄，预计2019年在影院上映，上映日期尚未正式公布。\r\n\r\n　　第一部中的女主杰西卡·罗瑟和男主伊瑟尔·布罗萨德已确认回归，继续扮演自己的角色。新演员包括苏拉·沙玛(《少年派的奇幻漂流》)，据报道他将扮演Samar Ghosh，这个角色被描述为一个喜欢编程的技术宅男。女演员Sarah Yarkin（《美国恐怖故事》），将饰演假小子Dre \r\n　　Morgan，也是一个科学达人，并且是Ghosh的犯罪同伙。', '杰西卡·罗德 Jessica Rothe 伊瑟尔·布罗萨德 Israel Broussard 露比·莫迪恩 Ruby Modine 苏拉·沙玛 Suraj Sharma 史蒂夫·齐西斯 Steve Zissis 瑞秋·马休斯 Rachel Matthews 查尔斯·艾特肯 Charles Aitken 莎拉·亚金 Sarah Yarkin 凯莱布·斯比尔亚兹 Caleb Spillyards 吉吉·埃内塔 GiGi Erneta 劳拉·克利夫顿 Laura Clifton 温迪·米克洛维奇 Wendy Miklovic 凯勒布·拿奎恩 Kaleb Naquin 肯尼斯·以色列 Kenneth Israel 泰内娅·因崔亚戈 Tenea Intriago 布莱恩·克恩 Blaine Kern III 川川 Tran Tran 卡瑞尔拉·史密斯 Cariella Smith 罗布·梅洛 Rob Mello 林赛·G.史密斯 Lindsey G. Smith 飞·武 Phi Vu 莎拉·贝纳尼 Sarah Bennani 杰奎琳·哈里斯·马瑟恩 Jacqueline Harris Matherne 西尔维娅·格雷丝·克里姆 Sylvia Grace Crim 拉姆齐·安德森 Ramsey Anderson', '2019', '克里斯托弗·兰登 Christopher Landon', '美国', '(英文)中文字幕', 'D:/movie/忌日快乐2.mkv', 0, 30, 2, 0);
INSERT INTO `movie` VALUES (35, 'ONBETA展示视频', 999999, '-', '-', '-', '2019', '-', '-', '-', '-', 0, 0, 0, 0);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '消息类型：notice-通知  direct-私信',
  `time` datetime(0) NOT NULL,
  `userid` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isread` int(11) NOT NULL DEFAULT 0 COMMENT '是否已读',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `isdeleted` int(11) NOT NULL DEFAULT 0 COMMENT '是否已删除',
  PRIMARY KEY (`id`, `username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 138 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, 'notice', '2018-01-01 00:00:00', 1, 'kiros', 1, '这是测试', '你好，:<p>欢迎您成为会员，一封包含激活链接的邮件已经发往您的邮箱，请您点击后完成注册。</p><p>如有任何疑问，可发送邮件到<a href=\"mailto:kiros@onbeta.com\">kiros@onsigma.com</a>进行反馈。</p>', 0);

-- ----------------------------
-- Table structure for numbcube_room
-- ----------------------------
DROP TABLE IF EXISTS `numbcube_room`;
CREATE TABLE `numbcube_room`  (
  `user_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `room_level` int(11) NOT NULL COMMENT '房间等级',
  `room_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '房间标题',
  `room_pub` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '房间公告',
  `room_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '房间链接',
  `stream_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '直播间推流地址',
  `room_stream` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '直播间流名称',
  `room_status` int(10) NOT NULL COMMENT '0--未审核\r\n1--已审核\r\n2--封禁',
  `room_livestatus` int(10) NOT NULL COMMENT '0--未直播\r\n1--直播中',
  `room_lock` int(10) NOT NULL COMMENT '0--未上锁\r\n1--上锁',
  `room_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '房间密码',
  `room_award` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '特殊荣誉(显示在房间页面标题前)',
  `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '实名认证:名字',
  `id_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '实名认证:身份证号'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of numbcube_room
-- ----------------------------
INSERT INTO `numbcube_room` VALUES (1, 7777, 327, 'Kiros的直播间', '这是公告', 'http://stream.numbcube.com:7777/numblive/', 'rtmp://stream.numbcube.com/numblive/', 'c1ec91c9eb501c5', 1, 1, 0, '123456', '【超级COOL】', 'kiros', '510000000000000002');
INSERT INTO `numbcube_room` VALUES (2, 10016, 1, 'jojo的房间', '暂无公告', 'http://stream.numbcube.com:7777/numblive/', 'rtmp://stream.numbcube.com/numblive/', '2b35ab624dcf336', 1, 0, 0, '123456', NULL, '测试', '510000000000000001');
INSERT INTO `numbcube_room` VALUES (22, 20117, 3, '再看？再看咬你哦', '欢迎加入肯德基豪华午餐', 'http://stream.numbcube.com:7777/numblive/', 'rtmp://stream.numbcube.com/numblive/', '92c29cc7708f7e5', 1, 0, 0, '123456', '【推荐】', '陈二狗', '510000000000000000');

-- ----------------------------
-- Table structure for numbcube_temp
-- ----------------------------
DROP TABLE IF EXISTS `numbcube_temp`;
CREATE TABLE `numbcube_temp`  (
  `item` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '相关配置名称',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '配置选项--直播需添加一条记录latestroom--12345（用户记录直播间申请的房间号）'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of numbcube_temp
-- ----------------------------
INSERT INTO `numbcube_temp` VALUES ('latestroom', '10017');

-- ----------------------------
-- Table structure for numbcube_ticket
-- ----------------------------
DROP TABLE IF EXISTS `numbcube_ticket`;
CREATE TABLE `numbcube_ticket`  (
  `ticket_id` int(50) NOT NULL AUTO_INCREMENT,
  `ticket_scene_id` int(50) NOT NULL COMMENT '场次id',
  `ticket_user_id` int(50) NULL DEFAULT NULL COMMENT '用户id',
  `ticket_time` datetime(0) NULL DEFAULT NULL COMMENT '买票时间',
  PRIMARY KEY (`ticket_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of numbcube_ticket
-- ----------------------------
INSERT INTO `numbcube_ticket` VALUES (1, 115, 2, NULL);
INSERT INTO `numbcube_ticket` VALUES (2, 118, 3, '2019-03-28 10:04:49');
INSERT INTO `numbcube_ticket` VALUES (3, 118, 4, '2019-03-28 10:11:05');
INSERT INTO `numbcube_ticket` VALUES (4, 118, 2, '2019-03-28 10:16:33');
INSERT INTO `numbcube_ticket` VALUES (5, 120, 2, '2019-03-28 17:50:52');
INSERT INTO `numbcube_ticket` VALUES (6, 124, 33, '2019-03-29 14:15:35');
INSERT INTO `numbcube_ticket` VALUES (7, 126, 10, '2019-03-29 20:17:25');
INSERT INTO `numbcube_ticket` VALUES (8, 126, 33, '2019-03-29 20:30:18');
INSERT INTO `numbcube_ticket` VALUES (9, 127, 22, '2019-03-29 21:31:07');
INSERT INTO `numbcube_ticket` VALUES (10, 127, 36, '2019-03-29 23:19:22');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for permission_role
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role`  (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`) USING BTREE,
  INDEX `permission_role_permission_id_index`(`permission_id`) USING BTREE,
  INDEX `permission_role_role_id_index`(`role_id`) USING BTREE,
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission_role
-- ----------------------------
INSERT INTO `permission_role` VALUES (1, 1);
INSERT INTO `permission_role` VALUES (2, 1);
INSERT INTO `permission_role` VALUES (3, 1);
INSERT INTO `permission_role` VALUES (4, 1);
INSERT INTO `permission_role` VALUES (5, 1);
INSERT INTO `permission_role` VALUES (6, 1);
INSERT INTO `permission_role` VALUES (7, 1);
INSERT INTO `permission_role` VALUES (8, 1);
INSERT INTO `permission_role` VALUES (9, 1);
INSERT INTO `permission_role` VALUES (10, 1);
INSERT INTO `permission_role` VALUES (11, 1);
INSERT INTO `permission_role` VALUES (12, 1);
INSERT INTO `permission_role` VALUES (13, 1);
INSERT INTO `permission_role` VALUES (14, 1);
INSERT INTO `permission_role` VALUES (15, 1);
INSERT INTO `permission_role` VALUES (16, 1);
INSERT INTO `permission_role` VALUES (17, 1);
INSERT INTO `permission_role` VALUES (18, 1);
INSERT INTO `permission_role` VALUES (19, 1);
INSERT INTO `permission_role` VALUES (20, 1);
INSERT INTO `permission_role` VALUES (21, 1);
INSERT INTO `permission_role` VALUES (22, 1);
INSERT INTO `permission_role` VALUES (23, 1);
INSERT INTO `permission_role` VALUES (24, 1);
INSERT INTO `permission_role` VALUES (25, 1);
INSERT INTO `permission_role` VALUES (26, 1);

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `permissions_key_index`(`key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, 'browse_admin', NULL, '2018-05-11 06:32:46', '2018-05-11 06:32:46');
INSERT INTO `permissions` VALUES (2, 'browse_bread', NULL, '2018-05-11 06:32:46', '2018-05-11 06:32:46');
INSERT INTO `permissions` VALUES (3, 'browse_database', NULL, '2018-05-11 06:32:46', '2018-05-11 06:32:46');
INSERT INTO `permissions` VALUES (4, 'browse_media', NULL, '2018-05-11 06:32:46', '2018-05-11 06:32:46');
INSERT INTO `permissions` VALUES (5, 'browse_compass', NULL, '2018-05-11 06:32:46', '2018-05-11 06:32:46');
INSERT INTO `permissions` VALUES (6, 'browse_menus', 'menus', '2018-05-11 06:32:46', '2018-05-11 06:32:46');
INSERT INTO `permissions` VALUES (7, 'read_menus', 'menus', '2018-05-11 06:32:46', '2018-05-11 06:32:46');
INSERT INTO `permissions` VALUES (8, 'edit_menus', 'menus', '2018-05-11 06:32:46', '2018-05-11 06:32:46');
INSERT INTO `permissions` VALUES (9, 'add_menus', 'menus', '2018-05-11 06:32:46', '2018-05-11 06:32:46');
INSERT INTO `permissions` VALUES (10, 'delete_menus', 'menus', '2018-05-11 06:32:46', '2018-05-11 06:32:46');
INSERT INTO `permissions` VALUES (11, 'browse_roles', 'roles', '2018-05-11 06:32:46', '2018-05-11 06:32:46');
INSERT INTO `permissions` VALUES (12, 'read_roles', 'roles', '2018-05-11 06:32:46', '2018-05-11 06:32:46');
INSERT INTO `permissions` VALUES (13, 'edit_roles', 'roles', '2018-05-11 06:32:46', '2018-05-11 06:32:46');
INSERT INTO `permissions` VALUES (14, 'add_roles', 'roles', '2018-05-11 06:32:46', '2018-05-11 06:32:46');
INSERT INTO `permissions` VALUES (15, 'delete_roles', 'roles', '2018-05-11 06:32:46', '2018-05-11 06:32:46');
INSERT INTO `permissions` VALUES (16, 'browse_users', 'users', '2018-05-11 06:32:46', '2018-05-11 06:32:46');
INSERT INTO `permissions` VALUES (17, 'read_users', 'users', '2018-05-11 06:32:46', '2018-05-11 06:32:46');
INSERT INTO `permissions` VALUES (18, 'edit_users', 'users', '2018-05-11 06:32:46', '2018-05-11 06:32:46');
INSERT INTO `permissions` VALUES (19, 'add_users', 'users', '2018-05-11 06:32:46', '2018-05-11 06:32:46');
INSERT INTO `permissions` VALUES (20, 'delete_users', 'users', '2018-05-11 06:32:46', '2018-05-11 06:32:46');
INSERT INTO `permissions` VALUES (21, 'browse_settings', 'settings', '2018-05-11 06:32:46', '2018-05-11 06:32:46');
INSERT INTO `permissions` VALUES (22, 'read_settings', 'settings', '2018-05-11 06:32:46', '2018-05-11 06:32:46');
INSERT INTO `permissions` VALUES (23, 'edit_settings', 'settings', '2018-05-11 06:32:46', '2018-05-11 06:32:46');
INSERT INTO `permissions` VALUES (24, 'add_settings', 'settings', '2018-05-11 06:32:46', '2018-05-11 06:32:46');
INSERT INTO `permissions` VALUES (25, 'delete_settings', 'settings', '2018-05-11 06:32:46', '2018-05-11 06:32:46');
INSERT INTO `permissions` VALUES (26, 'browse_hooks', NULL, '2018-05-11 06:32:46', '2018-05-11 06:32:46');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `roles_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'admin', 'Administrator', '2018-05-11 06:32:46', '2018-05-11 06:32:46');
INSERT INTO `roles` VALUES (2, 'user', 'Normal User', '2018-05-11 06:32:46', '2018-05-11 06:32:46');

-- ----------------------------
-- Table structure for scene
-- ----------------------------
DROP TABLE IF EXISTS `scene`;
CREATE TABLE `scene`  (
  `scene_id` int(50) NOT NULL AUTO_INCREMENT,
  `isvod` int(2) NOT NULL COMMENT '是否为点映(管理员点播的影片记为非点映)',
  `movie_id` int(11) NOT NULL COMMENT '影片id',
  `date` datetime(0) NOT NULL COMMENT '放映时间',
  `room_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '放映厅id',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '当前放映状态(waiting-未开始  opening-正在打开 playing-放映中 over-结束)',
  `iscdn` int(2) NOT NULL DEFAULT 0 COMMENT '是否开启cdn加速',
  `hide_status` int(2) NOT NULL COMMENT '是否隐藏点映者名字  不隐藏会在场次列表页显示',
  `vod_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '点映者名字',
  `vod_userid` int(10) NULL DEFAULT NULL COMMENT '点映者id',
  `ticket_price` int(10) NULL DEFAULT 0 COMMENT '票价(点映者定的)',
  `max_count` int(11) NULL DEFAULT 50 COMMENT '当前场次最大观众数',
  PRIMARY KEY (`scene_id`) USING BTREE,
  INDEX `movie_id`(`movie_id`) USING BTREE,
  INDEX `room_id`(`room_id`) USING BTREE,
  CONSTRAINT `movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `room_id` FOREIGN KEY (`room_id`) REFERENCES `liveroom` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 129 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scene
-- ----------------------------
INSERT INTO `scene` VALUES (1, 0, 1, '2018-12-20 20:55:00', 'room1', 'over', 0, 1, '1', 1, 0, 50);
INSERT INTO `scene` VALUES (2, 0, 3, '2018-12-20 21:50:00', 'room2', 'over', 0, 1, '1', 1, 0, 50);
INSERT INTO `scene` VALUES (3, 0, 5, '2018-12-21 10:15:00', 'room5', 'over', 0, 1, '1', 1, 0, 50);
INSERT INTO `scene` VALUES (51, 0, 16, '2019-01-15 19:00:00', 'room1', 'over', 0, 1, '1', 1, 0, 50);
INSERT INTO `scene` VALUES (52, 0, 16, '2019-01-15 21:00:00', 'room1', 'over', 0, 1, '1', 1, 0, 50);
INSERT INTO `scene` VALUES (53, 0, 16, '2019-01-15 22:50:00', 'room1', 'over', 0, 1, '1', 1, 0, 50);
INSERT INTO `scene` VALUES (54, 0, 18, '2019-01-15 19:30:00', 'room2', 'over', 0, 1, '1', 1, 0, 50);
INSERT INTO `scene` VALUES (55, 0, 18, '2019-01-15 21:30:00', 'room2', 'over', 0, 1, '1', 1, 0, 50);
INSERT INTO `scene` VALUES (56, 0, 14, '2019-01-15 21:10:00', 'room3', 'over', 0, 1, '1', 1, 0, 50);
INSERT INTO `scene` VALUES (57, 0, 1, '2019-01-23 20:00:00', 'room1', 'over', 0, 1, '1', 1, 0, 50);
INSERT INTO `scene` VALUES (58, 0, 2, '2019-01-23 22:30:00', 'room2', 'over', 0, 1, '1', 1, 0, 50);
INSERT INTO `scene` VALUES (60, 1, 4, '2019-01-28 16:38:27', 'room4', 'over', 0, 0, '2', 1, 0, 50);
INSERT INTO `scene` VALUES (61, 1, 5, '2019-01-28 17:38:27', 'room5', 'over', 0, 1, '2', 1, 0, 50);
INSERT INTO `scene` VALUES (67, 1, 9, '2019-01-28 17:36:00', 'room1', 'over', 0, 0, 'zoehan', 1, 0, 50);
INSERT INTO `scene` VALUES (68, 0, 10, '2019-01-28 20:45:00', 'room0', 'over', 0, 1, 'kiros', 1, 0, 50);
INSERT INTO `scene` VALUES (69, 0, 1, '2019-01-28 22:00:00', 'room1', 'over', 0, 1, 'kiros', 1, 0, 50);
INSERT INTO `scene` VALUES (71, 0, 5, '2019-01-29 20:30:00', 'room1', 'over', 0, 1, 'kiros', 1, 0, 50);
INSERT INTO `scene` VALUES (72, 0, 1, '2019-01-30 09:15:00', 'room0', 'over', 0, 1, 'kiros', 1, 0, 50);
INSERT INTO `scene` VALUES (73, 0, 2, '2019-01-30 19:15:00', 'room0', 'over', 0, 1, 'kiros', 1, 0, 50);
INSERT INTO `scene` VALUES (74, 0, 19, '2019-01-31 13:00:00', 'roompersonal', 'over', 0, 1, 'kiros', 1, 0, 50);
INSERT INTO `scene` VALUES (75, 0, 19, '2019-01-31 16:00:00', 'roompersonal', 'over', 0, 1, 'kiros', 1, 0, 50);
INSERT INTO `scene` VALUES (76, 0, 19, '2019-01-31 19:00:00', 'roompersonal', 'over', 0, 1, 'kiros', 1, 0, 50);
INSERT INTO `scene` VALUES (77, 0, 18, '2019-01-31 20:49:00', 'room2', 'over', 0, 1, 'kiros', 1, 0, 50);
INSERT INTO `scene` VALUES (78, 1, 19, '2019-01-31 21:16:00', 'room1', 'over', 0, 0, 'zoehan', 1, 0, 50);
INSERT INTO `scene` VALUES (79, 0, 20, '2019-02-01 19:00:00', 'room2', 'over', 0, 1, 'kiros', 1, 0, 50);
INSERT INTO `scene` VALUES (80, 0, 20, '2019-02-01 21:25:00', 'room2', 'over', 0, 1, 'kiros', 1, 0, 50);
INSERT INTO `scene` VALUES (81, 0, 20, '2019-02-01 21:38:00', 'room1', 'over', 0, 1, 'kiros', 1, 0, 50);
INSERT INTO `scene` VALUES (82, 1, 20, '2019-02-03 22:09:00', 'room1', 'over', 0, 0, 'zoehan', 1, 0, 50);
INSERT INTO `scene` VALUES (83, 0, 16, '2019-02-15 10:00:00', 'room1', 'over', 0, 1, 'kiros', 1, 0, 50);
INSERT INTO `scene` VALUES (84, 0, 18, '2019-02-15 12:00:00', 'room2', 'over', 0, 1, 'kiros', 1, 0, 50);
INSERT INTO `scene` VALUES (85, 0, 19, '2019-02-15 14:00:00', 'room3', 'over', 0, 1, 'kiros', 1, 0, 50);
INSERT INTO `scene` VALUES (86, 0, 19, '2019-02-15 16:30:00', 'room3', 'over', 0, 1, 'kiros', 1, 0, 50);
INSERT INTO `scene` VALUES (87, 0, 20, '2019-02-15 18:30:00', 'roomvip', 'over', 0, 1, 'kiros', 1, 0, 50);
INSERT INTO `scene` VALUES (88, 0, 20, '2019-02-15 21:00:00', 'roomvip', 'over', 0, 1, 'kiros', 1, 0, 50);
INSERT INTO `scene` VALUES (92, 0, 22, '2019-02-21 20:00:00', 'room1', 'over', 0, 1, 'kiros', 1, 0, 50);
INSERT INTO `scene` VALUES (93, 1, 23, '2019-02-21 22:00:00', 'room2', 'over', 0, 0, 'liushisheng', 1, 0, 50);
INSERT INTO `scene` VALUES (94, 1, 1, '2019-02-21 22:28:00', 'room1', 'over', 0, 0, 'liushisheng', 1, 0, 50);
INSERT INTO `scene` VALUES (95, 1, 23, '2019-02-21 22:39:03', 'room2', 'over', 0, 0, 'liushisheng', 1, 0, 50);
INSERT INTO `scene` VALUES (96, 0, 24, '2019-02-24 20:24:00', 'room0', 'over', 0, 1, 'kiros', 1, 0, 50);
INSERT INTO `scene` VALUES (97, 0, 1, '2019-02-13 00:00:00', 'room0', 'over', 0, 0, 'kiros', 1, 0, 50);
INSERT INTO `scene` VALUES (98, 0, 2, '2019-02-24 21:03:00', 'room0', 'over', 0, 0, 'kiros', 1, 0, 50);
INSERT INTO `scene` VALUES (99, 0, 25, '2019-02-24 21:15:00', 'room1', 'over', 0, 0, 'kiros', 1, 0, 50);
INSERT INTO `scene` VALUES (100, 0, 1, '2019-02-25 00:00:00', 'room0', 'over', 0, 0, 'kiros', 1, 0, 50);
INSERT INTO `scene` VALUES (101, 1, 24, '2019-02-24 22:00:00', 'room1', 'over', 0, 0, 'liushisheng', 1, 0, 50);
INSERT INTO `scene` VALUES (102, 0, 28, '2019-02-26 21:34:00', 'room0', 'over', 0, 1, 'kiros', 1, 0, 50);
INSERT INTO `scene` VALUES (103, 0, 29, '2019-02-26 21:55:00', 'room2', 'over', 0, 0, 'kiros', 1, 0, 50);
INSERT INTO `scene` VALUES (107, 1, 1, '2019-02-27 18:57:00', 'room5', 'over', 0, 0, 'liushisheng', 1, 0, 50);
INSERT INTO `scene` VALUES (108, 1, 32, '2019-02-27 18:59:00', 'room1', 'over', 0, 0, 'liushisheng', 1, 0, 50);
INSERT INTO `scene` VALUES (109, 0, 31, '2019-03-01 22:40:00', 'room1', 'over', 0, 1, 'kiros', 1, 0, 50);
INSERT INTO `scene` VALUES (110, 0, 31, '2019-03-02 08:30:00', 'room1', 'over', 0, 1, 'kiros', 1, 0, 50);
INSERT INTO `scene` VALUES (111, 0, 31, '2019-03-02 11:00:00', 'room1', 'over', 0, 1, 'kiros', 1, 0, 50);
INSERT INTO `scene` VALUES (112, 0, 31, '2019-03-02 13:30:00', 'room1', 'over', 0, 1, 'kiros', 1, 0, 50);
INSERT INTO `scene` VALUES (113, 0, 31, '2019-03-02 16:00:00', 'room1', 'over', 0, 1, 'kiros', 1, 0, 50);
INSERT INTO `scene` VALUES (114, 1, 31, '2019-03-03 15:06:00', 'room1', 'over', 0, 0, 'zoehan', 1, 0, 50);
INSERT INTO `scene` VALUES (115, 0, 1, '2019-03-27 14:50:00', 'room4', 'over', 0, 0, 'kiros', 1, 15, 3);
INSERT INTO `scene` VALUES (116, 0, 5, '2019-03-27 22:52:00', 'room4', 'over', 0, 0, 'kiros', 2, 99999, 5);
INSERT INTO `scene` VALUES (117, 0, 12, '2019-03-26 00:00:00', 'roomvip', 'over', 0, 0, 'kiros', 1, 15, 10);
INSERT INTO `scene` VALUES (118, 0, 4, '2019-03-28 10:03:00', 'room3', 'over', 0, 0, 'kiros', 1, 13, 5);
INSERT INTO `scene` VALUES (119, 1, 6, '2019-03-28 16:58:00', 'room2', 'over', 1, 0, 'jojo', 2, 15, 50);
INSERT INTO `scene` VALUES (120, 0, 11, '2019-03-28 17:25:00', 'room5', 'over', 1, 0, 'kiros', 1, 10, 30);
INSERT INTO `scene` VALUES (121, 0, 35, '2019-03-29 00:00:00', 'room0', 'playing', 0, 1, '1', 1, 0, 99999);
INSERT INTO `scene` VALUES (122, 0, 33, '2019-03-29 09:47:00', 'room1', 'over', 1, 0, 'kiros', 1, 0, 50);
INSERT INTO `scene` VALUES (123, 0, 34, '2019-03-29 09:49:00', 'room3', 'over', 1, 0, 'kiros', 1, 0, 30);
INSERT INTO `scene` VALUES (124, 0, 33, '2019-03-29 14:05:00', 'room1', 'over', 1, 1, 'kiros', 1, 0, 5);
INSERT INTO `scene` VALUES (125, 0, 34, '2019-03-29 16:30:00', 'room2', 'over', 1, 0, 'kiros', 1, 0, 50);
INSERT INTO `scene` VALUES (126, 0, 22, '2019-03-29 18:33:00', 'room1', 'over', 1, 0, 'kiros', 1, 0, 5);
INSERT INTO `scene` VALUES (127, 0, 33, '2019-03-29 21:10:00', 'room2', 'over', 0, 0, 'kiros', 1, 0, 50);
INSERT INTO `scene` VALUES (128, 1, 33, '2019-03-29 23:25:00', 'room1', 'over', 0, 0, 'eveningwong', 36, 0, 50);

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `payload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE INDEX `sessions_id_unique`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `settings_key_unique`(`key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES (1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site');
INSERT INTO `settings` VALUES (2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site');
INSERT INTO `settings` VALUES (3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site');
INSERT INTO `settings` VALUES (4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site');
INSERT INTO `settings` VALUES (5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin');
INSERT INTO `settings` VALUES (6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin');
INSERT INTO `settings` VALUES (7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin');
INSERT INTO `settings` VALUES (8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin');
INSERT INTO `settings` VALUES (9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin');
INSERT INTO `settings` VALUES (10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- ----------------------------
-- Table structure for sms_temp
-- ----------------------------
DROP TABLE IF EXISTS `sms_temp`;
CREATE TABLE `sms_temp`  (
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '电话号码',
  `vercode` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '验证码',
  `userid` int(11) NULL DEFAULT NULL COMMENT '用户id'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_temp
-- ----------------------------
INSERT INTO `sms_temp` VALUES ('18155556666', '123456', NULL);

-- ----------------------------
-- Table structure for temp
-- ----------------------------
DROP TABLE IF EXISTS `temp`;
CREATE TABLE `temp`  (
  `id` int(11) NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of temp
-- ----------------------------
INSERT INTO `temp` VALUES (1, '3');
INSERT INTO `temp` VALUES (2, '3');
INSERT INTO `temp` VALUES (3, NULL);
INSERT INTO `temp` VALUES (4, NULL);
INSERT INTO `temp` VALUES (5, NULL);
INSERT INTO `temp` VALUES (6, NULL);

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test`  (
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `balance` float NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('123', 0);
INSERT INTO `test` VALUES ('abc', 5);
INSERT INTO `test` VALUES ('111', 65);

-- ----------------------------
-- Table structure for translations
-- ----------------------------
DROP TABLE IF EXISTS `translations`;
CREATE TABLE `translations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `translations_table_name_column_name_foreign_key_locale_unique`(`table_name`, `column_name`, `foreign_key`, `locale`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_data
-- ----------------------------
DROP TABLE IF EXISTS `user_data`;
CREATE TABLE `user_data`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `user_sta` int(11) NOT NULL COMMENT '用户状态1-正常 2-审核中 3-禁言 4-锁定 5-封停',
  `vip_level` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'vip等级1-7',
  `mp` int(11) NULL DEFAULT NULL COMMENT '积分',
  `balance` float(255, 2) NOT NULL DEFAULT 0.00 COMMENT '余额',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '性别',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '手机号',
  `mobile_check` int(11) NOT NULL DEFAULT 0 COMMENT '是否验证',
  `email_check` int(11) NOT NULL DEFAULT 0 COMMENT '电子邮件验证',
  `loginIP` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '登录ip',
  `access_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'token',
  `loginTime` datetime(0) NULL DEFAULT NULL COMMENT '登录时间',
  `remark` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '签名',
  `mobile_temp` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '手机验证码',
  `email_temp` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '邮件验证链接串',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_data
-- ----------------------------
INSERT INTO `user_data` VALUES (1, 'kiros', 1, '7', 2307, 1217.20, '男', '18611111111', 1, 1, '101.80.169.70', 'b4c27f6ec27c3e2c259d9aa75619c75e45c48cce2e2d7fbdea1afc51c7c6ad26', '2019-03-30 23:14:03', '签名签名签名签名', '', '');
INSERT INTO `user_data` VALUES (2, 'jojo', 1, '2', 219, 783.00, '男', '1860000000', 1, 1, '114.84.177.83', '99a7a54e36a613f535f309a2b4837775e4da3b7fbbce2345d7772b0674a318d5', '2019-03-28 17:48:05', NULL, '', NULL);
INSERT INTO `user_data` VALUES (5, 'test', 1, '3', 300, 0.00, '女', '18600000001', 1, 0, '127.0.0.1', '6394c1e4f31bc38311b6bdf5f151128cfc490ca45c00b1249bbe3554a4fdf6fb', '2018-09-20 14:18:35', NULL, NULL, NULL);
INSERT INTO `user_data` VALUES (6, 'baobao', 1, '0', 0, 0.00, '保密', '18600000002', 1, 0, NULL, NULL, NULL, '', NULL, NULL);
INSERT INTO `user_data` VALUES (7, 'bao', 1, '0', 0, 0.00, '保密', '18600000003', 1, 0, '127.0.0.1', 'f8c1022b0c0fd9389b6aa57d4b6c1d6a67c6a1e7ce56d3d6fa748ab6d9af3fd7', '2018-05-21 17:56:14', '', NULL, '9QBSVNW57YFZ1FBXF12SKS16MV9D36ERKMF7Z32H89VJHUDJVHX72NWK9HARP57G');
INSERT INTO `user_data` VALUES (8, 'admin', 1, '0', 0, 0.00, '男', '18600000004', 1, 1, '127.0.0.1', '4000b24bbdf05866b6d4f4dfd466f98544f683a84163b3523afe57c2e008bc8c', '2018-05-21 16:50:16', 'null', NULL, '');
INSERT INTO `user_data` VALUES (9, '管理员', 1, '0', 0, 0.00, '保密', '18600000005', 1, 1, '127.0.0.1', 'fd9b9e7dbb20e7ffd918c4504bd697ddc74d97b01eae257e44aa9d5bade97baf', '2018-05-22 23:34:59', '', NULL, '');
INSERT INTO `user_data` VALUES (10, '老公', 1, '1', 9, 1998.00, '男', '18600000006', 1, 1, '183.195.14.149', '890c6edf7ce9ef11e31f09b0059571d76512bd43d9caa6e02c990b0a82652dca', '2019-03-29 20:16:48', '', NULL, '');
INSERT INTO `user_data` VALUES (11, 'wilson404', 1, '1', 1, 0.00, '男', '18600000007', 1, 1, '223.104.210.170', '5406915e0dae1cb5911616a473041eaf14bfa6bb14875e45bba028a21ed38046', '2018-05-24 13:38:37', NULL, NULL, '');
INSERT INTO `user_data` VALUES (12, 'woaini', 1, '0', 0, 0.00, '保密', '18600000009', 1, 0, '101.228.45.192', 'PC端登录', '2018-06-11 19:48:23', '', NULL, 'PKE7437Z8ZSQJVPXN6GPVASP2DM3QZGJQBM5KW4WVXK9UZ6VMJS39PM23AWZA716');
INSERT INTO `user_data` VALUES (13, 'Fay', 1, '1', 30, 0.00, '保密', '18600000008', 1, 1, '49.77.249.34', 'PC端登录', '2018-06-07 12:07:16', 'null', NULL, '');
INSERT INTO `user_data` VALUES (14, 'sl3737', 1, '1', 80, 0.00, '保密', '18600000011', 1, 0, '36.161.145.161', 'PC端登录', '2019-03-26 15:46:52', '这个人很懒，没留下备注。', NULL, 'T9UV5KMMHDSJR6WFY7E3S4GA457N1APJN8NXAGGKN42VR4PRMVGGTEEX7TEGXDS1');
INSERT INTO `user_data` VALUES (15, 'a554905586', 1, '1', 2, 0.00, '保密', '18600000010', 1, 1, '119.178.200.71', 'PC端登录', '2018-07-10 10:57:49', '这个人很懒，没留下备注。', NULL, '');
INSERT INTO `user_data` VALUES (16, 'vfxx', 1, '1', 2, 0.00, '保密', '18600000012', 1, 1, '112.244.154.121', 'PC端登录', '2018-06-28 16:48:51', '这个人很懒，没留下备注。', NULL, '');
INSERT INTO `user_data` VALUES (17, 'wang13737', 1, '0', 0, 0.00, '保密', '18600000013', 1, 0, '123.4.119.66', '5bef1d2adf69f2bd0d04de76a198e50d19ca14e7ea6328a42e0eb13d585e4c22', '2018-06-29 02:06:00', '这个人很懒，没留下备注。', NULL, 'MNBAK6YQ3PYKQ94W2N1PJ37J4FU4XCSU9ME75E7TJ4TK3GMCBJ6PWY4HTHSHW9RY');
INSERT INTO `user_data` VALUES (18, 'vip8998', 1, '0', 0, 0.00, '保密', '18600000014', 1, 1, '121.207.40.169', 'PC端登录', '2018-10-11 10:49:54', '这个人很懒，没留下备注。', NULL, '');
INSERT INTO `user_data` VALUES (19, 'q462056389', 1, '0', 0, 0.00, '保密', '18600000015', 1, 0, '125.78.3.189', '3fa08b0cfd9b82e3165be64464d9924e3416a75f4cea9109507cacd8e2f2aefc', '2018-07-28 18:35:26', '这个人很懒，没留下备注。', NULL, '7SNNFQYC2SM5XAD7YFE4WH1J28UT89Q64DC62FA84EMRQE44JUEBQSGDJNKAQ68C');
INSERT INTO `user_data` VALUES (20, '小魂', 1, '0', 0, 0.00, '保密', '18600000016', 1, 1, '59.109.153.28', 'PC端登录', '2018-09-16 23:42:06', '这个人很懒，没留下备注。', NULL, '');
INSERT INTO `user_data` VALUES (21, '123he', 1, '0', 0, 0.00, '保密', '18600000017', 1, 0, '223.12.14.25', 'd7b70c973ac97cd03c5a41745b4eb69fc9f0f895fb98ab9159f51fd0297e236d', '2018-09-07 03:54:01', '这个人很懒，没留下备注。', NULL, 'NYYP69EGMY52Q7STSQ1CB38RHSPVPHU7YDEFWU6FM6G1JZWTMTDEM2Z21WDU2X57');
INSERT INTO `user_data` VALUES (22, 'zoehan', 1, '2', 162, 1838.00, '保密', '18600000018', 1, 0, '183.69.202.125', '8a3130a63b4013610a92d04b6867bb15c51ce410c124a10e0db5e4b97fc2af39', '2019-03-29 21:30:29', '这个人很懒，没留下备注。', NULL, 'VG6SK1THGUCGRJPU6M1Y78C4B4XRVPA8DQ1YHJ1XK21AKEPGB3WZVMSB4Q2CDXU4');
INSERT INTO `user_data` VALUES (23, 'wuliaoker', 1, '0', 0, 0.00, '保密', '18600000019', 1, 1, '119.141.84.143', '452d1132f6bfab60f25eed6f6e7eb5954e732ced3463d06de0ca9a15b6153677', '2018-10-22 10:57:50', '这个人很懒，没留下备注。', NULL, '');
INSERT INTO `user_data` VALUES (24, '32247892', 1, '0', 0, 0.00, '保密', '18600000020', 1, 0, '122.5.31.198', 'PC端登录', '2018-10-28 06:16:20', '这个人很懒，没留下备注。', NULL, 'DK79FPMUKHCR4DUEGTTAF464U5DTZ5Q17S3FJGNR9BCE1TA69N6GMUX49DRSZ1PT');
INSERT INTO `user_data` VALUES (25, 'liushisheng', 1, '2', 230, 1385.00, '男', '18600000021', 1, 0, '14.111.55.194', 'be5a2a718262c445c622753f81e944e96ea9ab1baa0efb9e19094440c317e21b', '2019-03-11 19:41:02', '这个人很傻，没留下备注。', NULL, '8NDWKTKFN59ZD6QYPMU8GC6XGB3TS6RE81C84W65VJFV5RTM9F8XXBPWEURN2166');
INSERT INTO `user_data` VALUES (26, '176bbb', 1, '0', 0, 0.00, '保密', '18600000022', 1, 0, '117.151.157.98', '875603099790824f509226da9c35257c642e92efb79421734881b53e1e1b18b6', '2018-12-26 14:52:40', '这个人很懒，没留下备注。', NULL, 'DR96RBA7D3ZMC7GD5XXW5JYCP5HFDGF65SY9WGCXQVM2P8YS6484GCNXYZUKXBW7');
INSERT INTO `user_data` VALUES (27, 'spidermansam', 1, '0', 0, 0.00, '保密', '18600000023', 1, 0, '107.182.26.180', '1bbe4a19396ae07e263071b3e04ec5d99a1158154dfa42caddbd0694a4e9bdc8', '2019-01-10 15:48:03', '这个人很懒，没留下备注。', NULL, 'K1YTUMU5F1MBAG1W1J529WRF286WH6YHAVU97NXMNG62KSQJVPKU3H7QZK74SKDU');
INSERT INTO `user_data` VALUES (28, 'wangyikang', 1, '0', 0, 200.00, '保密', '18600000024', 1, 0, '112.10.0.100', '0a606b0aa393cbdfd07e399424863b6f66f041e16a60928b05a7e228a89c3799', '2019-01-28 20:46:08', '这个人很懒，没留下备注。', NULL, 'KERVHT3GRHBDAJ6PWCM216VHMY5CTYPSCDD3228VYHZP1M95DZ6FNQESCH33YZYG');
INSERT INTO `user_data` VALUES (29, 'wildefire', 1, '0', 0, 1000.00, '保密', '18600000025', 1, 0, '101.88.9.80', 'e964084f63b0a460a7366fe3abde22be8f14e45fceea167a5a36dedd4bea2543', '2019-02-05 11:31:11', '这个人很懒，没留下备注。', NULL, '8TCJ2TSMTJWUT281WGG652J1KMA4ACW5NCMQ1ECDJ6PSF9G2P378DS8SJQD9K3GE');
INSERT INTO `user_data` VALUES (30, '4982833', 1, '0', 0, 0.00, '保密', '18600000026', 1, 0, '120.239.27.23', '5bf05413c91e50b6904d212d9df719ae17e62166fc8586dfa4d1bc0e1742c08b', '2019-02-20 23:49:36', '这个人很懒，没留下备注。', NULL, 'MU4M8WNCY3V2F39FCR9JM85CWX95263J2TZUMF2WB3AZ15XD179RHDHSC66Z8ZRU');
INSERT INTO `user_data` VALUES (31, '17181023333', 1, '0', 0, 0.00, '保密', '18600000027', 1, 1, '14.205.155.47', '8b58caf0336b9afcebf2b0fceae9cd2ed09bf41544a3365a46c9077ebb5e35c3', '2019-02-21 13:53:51', '这个人很懒，没留下备注。', NULL, '');
INSERT INTO `user_data` VALUES (32, 'mk888', 1, '1', 5, 0.00, '保密', '18600000028', 1, 1, '103.246.154.93', 'PC端登录', '2019-02-24 18:47:54', '这个人很懒，没留下备注。', NULL, '');
INSERT INTO `user_data` VALUES (33, '张大cannon', 1, '1', 4, 96.00, '保密', '18600000029', 1, 0, '36.149.73.52', '21fb65ac7a734bc1d243b95c9c1a45406f4922f45568161a8cdf4ad2299f6d23', '2019-03-29 20:28:53', '这个人很懒，没留下备注。', NULL, '24KMR8PCY61DGZ77PHW3N343FQ55JC6NNXVM3TQZ3BQEH41WKKWMSS61S8VAYVF8');
INSERT INTO `user_data` VALUES (34, 'aa6956305', 1, '0', 0, 0.00, '保密', '18600000030', 1, 0, '223.104.102.54', 'PC端登录', '2019-03-18 21:43:54', '这个人很懒，没留下备注。', NULL, 'G2GDVMZXFJEWKW14XQ4HYM5KR268TZ3AAJ5B3T15XCBG9G67D4SYUR8JHKD8J9U4');
INSERT INTO `user_data` VALUES (35, 'wzy134188077', 1, '0', 0, 0.00, '保密', '18600000031', 1, 0, NULL, NULL, NULL, '这个人很懒，没留下备注。', NULL, 'YA6DYHYR527E297GBMM2QWV86UH42MHT8UYDZ5J72APSCXZP6W6K5VXVCSPPHK6N');
INSERT INTO `user_data` VALUES (36, 'eveningwong', 1, '1', 37, 63.00, '保密', '18600000032', 1, 1, '124.227.55.37', 'fa6e5bac1826a1293a4c7ffb0db0db78d2ddea18f00665ce8623e36bd4e3c7c5', '2019-03-29 23:19:02', '这个人很懒，没留下备注。', NULL, '');

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles`  (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `user_roles_user_id_index`(`user_id`) USING BTREE,
  INDEX `user_roles_role_id_index`(`role_id`) USING BTREE,
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'users/default.png',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE,
  INDEX `users_role_id_foreign`(`role_id`) USING BTREE,
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 1, 'kiros', 'kiros@onbeta.com', 'users/default.png', '$2y$10$NSM.MdVoEj0BrGoW0TY10OWnDF55t8oMleHiCVLLjr9n0J0dVSgw6', 'lP0c9RTqVyZkwPtd51OScf81bSi4aM8CRwHuE7uX41jeubYgvvJ9C4lkkVHL', NULL, '2018-05-11 08:41:56', '2018-05-11 08:41:56');
INSERT INTO `users` VALUES (2, 2, 'jojo', '1@onbeta.com', 'users/default.png', '$2y$10$dmmIY/GX9/nlGxNQ3G9neOx37uayAWKARDJN1eMJw6XICMUPAMlbe', 'Vc2yTSfBmSOYISJcvghJahb0aI3QQGBVFGmquc1f9FG9AGb8fYxUzby5cbmQ', '{\"locale\":\"zh_CN\"}', '2018-05-11 08:44:23', '2018-05-11 08:44:23');
INSERT INTO `users` VALUES (5, 2, 'test', '2@onbeta.com', 'users/default.png', '$2y$10$uVhCVfa.PD4.ake.YpBPPOc7EkX46bLts9BUnhqczbDmq9qrss82u', 'o2vMfwFFuX5RqHjKXpBFXx7ey1CWJzuqcmq6NlC0ygymUfXH3EVfZN9dlloc', NULL, NULL, NULL);
INSERT INTO `users` VALUES (6, 2, 'baobao', '3@onbeta.com', 'users/default.png', '$2y$10$UFhn4wLqxMW4lV5tf6j8C.t6tsF/yzEMlfFpPr/FY2DpgebdU0giy', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (7, 2, 'bao', '4@onbeta.com', 'users/default.png', '$2y$10$bBZMlVZ1coMTFdpePZEkaeXZHkcuX.Dg9vV9XzrGQZHgRT4M0Glsi', 'UaAcl2otzFT0Mi9nDtvZztsHeHDeA5P7PMAmQz6cxVbSHublAzcrrkCIpOiD', NULL, NULL, NULL);
INSERT INTO `users` VALUES (8, 2, 'admin', '5@onbeta.com', 'users/default.png', '$2y$10$uaz6AfticOZbQPP4BnCmaOkDqEeJ3UFfJ0xUeTNXLJ42Shg1X/5u.', 'TM3bI2Pcjuer7ndr5v5FNkX8IRKpsTbZKsXLWGVrP1pbmvfab8B2lfjePhQq', NULL, NULL, NULL);
INSERT INTO `users` VALUES (9, 2, '管理员', '6@onbeta.com', 'users/default.png', '$2y$10$NgGpkk3aH318nTo7/gS8Vus.NMoCPGxhTGL.JvNtkQwagdPmmGYiW', '5geQssQUPu1aqbOrpCFoxAxiYba0teMf1sVTIql4YCYVvoHUPRhAJGLqWPmu', NULL, NULL, NULL);
INSERT INTO `users` VALUES (10, 2, '老公', '7@onbeta.com', 'users/default.png', '$2y$10$i3bQ8ITk2dMwZXI/yyctVOaj1Q9ANQuQioZzz02PpFYjR2hgpoEFi', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (11, 2, 'wilson404', '8@onbeta.com', 'users/default.png', '$2y$10$gYqp/lDqVlx0CN3Gm37iTOJv7ABdHbBVbyNfSAze3ktiKZXV5Mcwe', 'dIfO2upBX5NwWIWs4hzmh1QFUk38L4oNVo1Rg5hgV8xFhZBS9teo5tJ1kxEP', NULL, NULL, NULL);
INSERT INTO `users` VALUES (12, 2, 'woaini', '9@onbeta.com', 'users/default.png', '$2y$10$rylKx1B6XajtvCz0VV/iEOe6gxywFJCDysjiIRrKEHgYrSPyFO3HG', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (13, 2, 'Fay', '10@onbeta.com', 'users/default.png', '$2y$10$kgyzzvSlqJl4QaY/0PfY8.dkgTf4U55RWxBLr0Z4iaRd6IYPWZPXq', 'fBsExUKSSzwuOIowOnnxBm2g0xKjM1JRsnqXcQ7Mb0qDAFhujc7eqY64rIJK', NULL, NULL, NULL);
INSERT INTO `users` VALUES (14, 2, 'sl3737', '11@onbeta.com', 'users/default.png', '$2y$10$D99bcFg5/JQ30C0eEsyPBODyXtBum93Z4b7Tv/K8wWAIhDb2Z.AeG', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (15, 2, 'a554905586', '12@onbeta.com', 'users/default.png', '$2y$10$rfOVX1qykqq36B2PJDpF6OJFlg60fyTZD8.b0.Q0vRgYFPHyGVLHe', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (16, 2, 'vfxx', '13@onbeta.com', 'users/default.png', '$2y$10$SH3AWwSnHGzbdIX2MK2omutAQX3j0C0t/FC1bxi9b4/bzd7zohNNO', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (17, 2, 'wang13737', '14@onbeta.com', 'users/default.png', '$2y$10$orVIq7Q7pgNelji0ZixZse5fKnw8CG9A.8NbSds42UCyC3fOLohI.', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (18, 2, 'vip8998', '15@onbeta.com', 'users/default.png', '$2y$10$M9DLz52aCZNrYduKSBZc7un4e/AquiEs6/2bnfPCGEeL7QrXL6HRW', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (19, 2, 'q462056389', '16@onbeta.com', 'users/default.png', '$2y$10$vbdih8.Zu6i8N8jnubQ0/eO53Ui8noOGMqBhwBVjm8nQxESF5BXJm', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (20, 2, '小魂', '17@onbeta.com', 'users/default.png', '$2y$10$3oKo8jIh0tNDgLjFJLaH0uI4OLAncafs8sf4NKKrY7yy4CsNa6pBG', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (21, 2, '123he', '18@onbeta.com', 'users/default.png', '$2y$10$C6RXimzV1ho8C4D9ZsPXeOGbfg49CcfWU4Z.GYEWI9.AlYov0O6BC', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (22, 2, 'zoehan', '19@onbeta.com', 'users/default.png', '$2y$10$x92O75kras0wpskPZh2Gxu4ytg9YSy9ngPIUH6deqSUDFactwKyDK', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (23, 2, 'wuliaoker', '20@onbeta.com', 'users/default.png', '$2y$10$MEo.WhnF5s97bXNKi5H4SOyEahfclxEOuGMP0ed7Y03tr1d4T8.9C', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (24, 2, '32247892', '21@onbeta.com', 'users/default.png', '$2y$10$mqhacXhPZGldDK07Uft0LOwSfRdVEiCDMiFAPsRuLBiwIlVs3VgC6', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (25, 2, 'liushisheng', '22@onbeta.com', 'users/default.png', '$2y$10$RbKIUGKHzFG/MOKK0iCAPedONNmt2KTLA.erw/KRD8Hr9WuN8tCpu', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (26, 2, '176bbb', '23@onbeta.com', 'users/default.png', '$2y$10$HdHyp9p9meDUH6op4fAAYuBQHGg.ubQmW85xPMmiLvbjqfz/p4hem', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (27, 2, 'spidermansam', '24@onbeta.com', 'users/default.png', '$2y$10$XhwLmjsUgVHZn6SH3W25..4lkACQjpviMY278d4UnhFazfpI/zhcy', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (28, 2, 'wangyikang', '25@onbeta.com', 'users/default.png', '$2y$10$HwkQNpZPvtnHbt18SYIH1.xBOmPQrg8VLzO98/tdm0HYadDCD/JqK', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (29, 2, 'wildefire', '26@onbeta.com', 'users/default.png', '$2y$10$sHwd4kYou1c0OgZ0oOgQDOGdPaMm5eqRxmJMIbHE6Stx7eTjctSw2', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (30, 2, '4982833', '27@onbeta.com', 'users/default.png', '$2y$10$d4eEQmQwMXxJWm9vjXdZWuxMByGUjUxoPRl31S1ypk1CSy1t4T.0e', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (31, 2, '171810233141', '28@onbeta.com', 'users/default.png', '$2y$10$kctwUeVfwmheOvFkDTJdmeBtXOIjt2YS2EwRQRoRCDW9OzPNJSKP2', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (32, 2, 'mk888', '29@onbeta.com', 'users/default.png', '$2y$10$UsFIufSsQ8CQnXeB2icRXeL7erAepT0ZfZeqemcPXKBTMMVaUejLy', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (33, 2, '张大cannon', '30@onbeta.com', 'users/default.png', '$2y$10$0MZi96mUd8/MrvH/l17d8OtPCg42bo7CpT.Z2RvVZi7N3LzgiwSZy', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (34, 2, 'aa6956305', '31@onbeta.com', 'users/default.png', '$2y$10$pOcLTyT6c95HVDgqzQDVR.a5uloxfNh26CVzP6ZLGrPEAqj.KCUem', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (35, 2, 'wzy134188077', '32@onbeta.com', 'users/default.png', '$2y$10$xO53V88sg8pc65jSINZRLOOlQkHw2sfYA.PJhcebQRxVkar/GNtvq', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (36, 2, 'eveningwong', '33@onbeta.com', 'users/default.png', '$2y$10$BT3eRIOdCSQ6FRH7WFGU..AM0FBBJldfuCWuO6RpfAUvIR7cimN2C', NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
