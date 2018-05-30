/*
 Navicat Premium Data Transfer

 Source Server         : MySql
 Source Server Type    : MySQL
 Source Server Version : 100109
 Source Host           : 127.0.0.1:3306
 Source Schema         : horarios

 Target Server Type    : MySQL
 Target Server Version : 100109
 File Encoding         : 65001

 Date: 30/05/2018 08:20:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for classification__category
-- ----------------------------
DROP TABLE IF EXISTS `classification__category`;
CREATE TABLE `classification__category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NULL DEFAULT NULL,
  `context` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `position` int(11) NULL DEFAULT NULL,
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `media_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX_43629B36727ACA70`(`parent_id`) USING BTREE,
  INDEX `IDX_43629B36E25D857E`(`context`) USING BTREE,
  INDEX `IDX_43629B36EA9FDD75`(`media_id`) USING BTREE,
  CONSTRAINT `FK_43629B36727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `classification__category` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_43629B36E25D857E` FOREIGN KEY (`context`) REFERENCES `classification__context` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_43629B36EA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media__media` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of classification__category
-- ----------------------------
INSERT INTO `classification__category` VALUES (1, NULL, 'default', 'default', 1, 'default', 'default', NULL, '2018-05-28 13:58:55', '2018-05-28 13:58:55', NULL);

-- ----------------------------
-- Table structure for classification__collection
-- ----------------------------
DROP TABLE IF EXISTS `classification__collection`;
CREATE TABLE `classification__collection`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `context` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `media_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tag_collection`(`slug`, `context`) USING BTREE,
  INDEX `IDX_A406B56AE25D857E`(`context`) USING BTREE,
  INDEX `IDX_A406B56AEA9FDD75`(`media_id`) USING BTREE,
  CONSTRAINT `FK_A406B56AE25D857E` FOREIGN KEY (`context`) REFERENCES `classification__context` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_A406B56AEA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media__media` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for classification__context
-- ----------------------------
DROP TABLE IF EXISTS `classification__context`;
CREATE TABLE `classification__context`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of classification__context
-- ----------------------------
INSERT INTO `classification__context` VALUES ('default', 'default', 1, '2018-05-28 13:58:55', '2018-05-28 13:58:55');

-- ----------------------------
-- Table structure for classification__tag
-- ----------------------------
DROP TABLE IF EXISTS `classification__tag`;
CREATE TABLE `classification__tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `context` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tag_context`(`slug`, `context`) USING BTREE,
  INDEX `IDX_CA57A1C7E25D857E`(`context`) USING BTREE,
  CONSTRAINT `FK_CA57A1C7E25D857E` FOREIGN KEY (`context`) REFERENCES `classification__context` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for configuracion
-- ----------------------------
DROP TABLE IF EXISTS `configuracion`;
CREATE TABLE `configuracion`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `urlxmlphp` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `urlxmlclima` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `urlxmlcintillo` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sliderelemntTime` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of configuracion
-- ----------------------------
INSERT INTO `configuracion` VALUES (1, 'http://localhost:81/horarioxml/horarios.php?area=', 'http://localhost/tutiempo/xml/30994.xml', 'http://localhost/noticias/ultimasnoticias.xml', 4);

-- ----------------------------
-- Table structure for fos_user
-- ----------------------------
DROP TABLE IF EXISTS `fos_user`;
CREATE TABLE `fos_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(0) NULL DEFAULT NULL,
  `confirmation_token` varchar(180) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `password_requested_at` datetime(0) NULL DEFAULT NULL,
  `roles` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UNIQ_957A647992FC23A8`(`username_canonical`) USING BTREE,
  UNIQUE INDEX `UNIQ_957A6479A0D96FBF`(`email_canonical`) USING BTREE,
  UNIQUE INDEX `UNIQ_957A6479C05FB297`(`confirmation_token`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fos_user
-- ----------------------------
INSERT INTO `fos_user` VALUES (1, 'admin', 'admin', 'admin@admin.cu', 'admin@admin.cu', 1, NULL, '$2y$13$Z8pkUimpqL4PbgYmIeI87uqiLrCBc9n/wWjCv66ocf5isCaGxFxFa', '2018-05-29 20:00:49', NULL, NULL, 'a:1:{i:0;s:10:\"ROLE_ADMIN\";}');

-- ----------------------------
-- Table structure for media__gallery
-- ----------------------------
DROP TABLE IF EXISTS `media__gallery`;
CREATE TABLE `media__gallery`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `default_format` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `created_at` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for media__gallery_media
-- ----------------------------
DROP TABLE IF EXISTS `media__gallery_media`;
CREATE TABLE `media__gallery_media`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `gallery_id` int(11) NULL DEFAULT NULL,
  `media_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX_80D4C5414E7AF8F`(`gallery_id`) USING BTREE,
  INDEX `IDX_80D4C541EA9FDD75`(`media_id`) USING BTREE,
  CONSTRAINT `FK_80D4C5414E7AF8F` FOREIGN KEY (`gallery_id`) REFERENCES `media__gallery` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_80D4C541EA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media__media` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for media__media
-- ----------------------------
DROP TABLE IF EXISTS `media__media`;
CREATE TABLE `media__media`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `enabled` tinyint(1) NOT NULL,
  `provider_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `provider_status` int(11) NOT NULL,
  `provider_reference` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `provider_metadata` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '(DC2Type:json)',
  `width` int(11) NULL DEFAULT NULL,
  `height` int(11) NULL DEFAULT NULL,
  `length` decimal(10, 0) NULL DEFAULT NULL,
  `content_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `content_size` int(11) NULL DEFAULT NULL,
  `copyright` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `author_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `context` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `cdn_is_flushable` tinyint(1) NULL DEFAULT NULL,
  `cdn_flush_identifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `cdn_flush_at` datetime(0) NULL DEFAULT NULL,
  `cdn_status` int(11) NULL DEFAULT NULL,
  `updated_at` datetime(0) NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `category_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX_5C6DD74E12469DE2`(`category_id`) USING BTREE,
  CONSTRAINT `FK_5C6DD74E12469DE2` FOREIGN KEY (`category_id`) REFERENCES `classification__category` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of media__media
-- ----------------------------
INSERT INTO `media__media` VALUES (3, '1010 (Republic of Star ) Wallpapers telf.54325606.jpg', NULL, 0, 'sonata.media.provider.image', 1, '4702dc0953af58d00a018f5608937a620af00933.jpeg', '{\"filename\":\"1010 (Republic of Star ) Wallpapers telf.54325606.jpg\"}', 950, 900, NULL, 'image/jpeg', 177598, NULL, NULL, 'default', NULL, NULL, NULL, NULL, '2018-05-29 03:00:26', '2018-05-29 03:00:26', 1);
INSERT INTO `media__media` VALUES (4, '431864.jpg', NULL, 0, 'sonata.media.provider.image', 1, '2ac16bbe7d81892723c9459150090aecf6d0d707.jpeg', '{\"filename\":\"431864.jpg\"}', 950, 900, NULL, 'image/jpeg', 240360, NULL, NULL, 'default', NULL, NULL, NULL, NULL, '2018-05-29 03:00:59', '2018-05-29 03:00:59', 1);
INSERT INTO `media__media` VALUES (5, '767907.jpg', NULL, 0, 'sonata.media.provider.image', 1, 'f0f7a85f05018b501a62f89fadc560bc1c40f477.jpeg', '{\"filename\":\"767907.jpg\"}', 950, 900, NULL, 'image/jpeg', 354442, NULL, NULL, 'default', NULL, NULL, NULL, NULL, '2018-05-29 03:01:30', '2018-05-29 03:01:30', 1);

SET FOREIGN_KEY_CHECKS = 1;
