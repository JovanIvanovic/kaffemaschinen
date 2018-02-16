/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 100128
Source Host           : localhost:3306
Source Database       : kaffemaschinen

Target Server Type    : MYSQL
Target Server Version : 100128
File Encoding         : 65001

Date: 2018-02-13 17:45:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for addresses
-- ----------------------------
DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `type` enum('SHIPPING','BILLING') COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address2` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `postcode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `country_id` int(10) unsigned DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_user_id_foreign` (`user_id`),
  KEY `addresses_country_id_foreign` (`country_id`),
  CONSTRAINT `addresses_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of addresses
-- ----------------------------
INSERT INTO `addresses` VALUES ('1', '1', 'BILLING', 'Strahinja', 'Gajic', 'Bozane Prpic', '/', '11000', 'Beograd', 'Serbia', '1', '066321600', '2017-11-14 09:50:36', '2018-02-13 17:44:11', null);

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_super_admin` tinyint(4) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'en',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES ('2', null, '1', 'Strahinja', 'Gajic', 'sakigajic@gmail.com', '$2y$10$iXLAB7gQfjYkbIdAsvfW4.eqw0yeaceuL8CvxPnh4S12on9.CTgfC', 'en', 'lITYAuVBfQxoLr6xLPMXE4E9w0ubi3AAiPaCI8yZggYPjLCKU688Zc9iSWYA', '2017-12-03 22:36:39', '2018-02-13 17:45:13');

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', null, 'Möbel', 'möbel', '2017-12-07 10:04:17', '2017-12-07 11:10:04');
INSERT INTO `categories` VALUES ('2', null, 'Bilder', 'bilder', '2017-12-07 10:04:56', '2017-12-07 11:10:08');
INSERT INTO `categories` VALUES ('3', null, 'Kleider', 'kleider', '2017-12-07 10:07:56', '2017-12-07 11:10:11');
INSERT INTO `categories` VALUES ('4', null, 'Assecoires', 'assecoires', '2017-12-07 10:08:17', '2017-12-07 11:10:15');
INSERT INTO `categories` VALUES ('5', null, 'Hausrat', 'hausrat', '2017-12-07 10:08:32', '2017-12-07 11:10:18');
INSERT INTO `categories` VALUES ('6', null, 'Decor', 'decor', '2017-12-07 10:08:44', '2017-12-07 11:10:21');
INSERT INTO `categories` VALUES ('7', null, 'Sammeln', 'sammeln', '2017-12-07 10:08:57', '2017-12-07 11:10:24');
INSERT INTO `categories` VALUES ('8', null, 'Kunst', 'kunst', '2017-12-07 10:09:10', '2017-12-07 11:10:28');
INSERT INTO `categories` VALUES ('9', '1', 'iPhone', 'iphone', '2017-12-07 10:11:48', '2017-12-07 10:11:48');
INSERT INTO `categories` VALUES ('10', '1', 'HTC', 'htc', '2017-12-07 10:12:03', '2017-12-07 10:12:03');
INSERT INTO `categories` VALUES ('11', '1', 'Huawei', 'huawei', '2017-12-07 10:12:34', '2017-12-07 10:12:34');
INSERT INTO `categories` VALUES ('12', '1', 'LG', 'lg', '2017-12-07 10:13:40', '2017-12-07 10:13:40');
INSERT INTO `categories` VALUES ('13', '1', 'Samsung', 'samsung', '2017-12-07 10:14:03', '2017-12-07 10:14:03');
INSERT INTO `categories` VALUES ('14', '1', 'Sony', 'sony', '2017-12-07 10:14:23', '2017-12-07 10:14:23');

-- ----------------------------
-- Table structure for category_product
-- ----------------------------
DROP TABLE IF EXISTS `category_product`;
CREATE TABLE `category_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `category_product_product_id_foreign` (`product_id`),
  KEY `category_product_category_id_foreign` (`category_id`),
  CONSTRAINT `category_product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of category_product
-- ----------------------------
INSERT INTO `category_product` VALUES ('3', '3', '3', null, null);
INSERT INTO `category_product` VALUES ('5', '3', '5', null, null);
INSERT INTO `category_product` VALUES ('8', '2', '8', null, null);
INSERT INTO `category_product` VALUES ('9', '2', '9', null, null);
INSERT INTO `category_product` VALUES ('12', '1', '12', null, null);
INSERT INTO `category_product` VALUES ('13', '6', '13', null, null);
INSERT INTO `category_product` VALUES ('14', '1', '14', null, null);
INSERT INTO `category_product` VALUES ('15', '6', '15', null, null);
INSERT INTO `category_product` VALUES ('16', '1', '16', null, null);
INSERT INTO `category_product` VALUES ('18', '1', '18', null, null);
INSERT INTO `category_product` VALUES ('19', '6', '19', null, null);
INSERT INTO `category_product` VALUES ('22', '5', '22', null, null);
INSERT INTO `category_product` VALUES ('23', '5', '23', null, null);
INSERT INTO `category_product` VALUES ('24', '5', '24', null, null);
INSERT INTO `category_product` VALUES ('25', '4', '25', null, null);
INSERT INTO `category_product` VALUES ('26', '4', '26', null, null);
INSERT INTO `category_product` VALUES ('27', '4', '27', null, null);
INSERT INTO `category_product` VALUES ('37', '1', '34', '2017-12-13 11:28:38', '2017-12-13 11:28:38');
INSERT INTO `category_product` VALUES ('39', '4', '35', '2017-12-22 16:47:27', '2017-12-22 16:47:27');
INSERT INTO `category_product` VALUES ('40', '11', '11', '2018-01-25 18:02:18', '2018-01-25 18:02:18');
INSERT INTO `category_product` VALUES ('41', '4', '6', '2018-02-07 03:26:35', '2018-02-07 03:26:35');

-- ----------------------------
-- Table structure for configurations
-- ----------------------------
DROP TABLE IF EXISTS `configurations`;
CREATE TABLE `configurations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `configuration_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `configuration_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of configurations
-- ----------------------------
INSERT INTO `configurations` VALUES ('1', 'general_site_title', 'Schoengebraucht Ecommerce', null, null);
INSERT INTO `configurations` VALUES ('2', 'general_site_description', 'Schoengebraucht Ecommerce', null, '2017-12-06 16:48:57');
INSERT INTO `configurations` VALUES ('3', 'general_home_page', '1', null, null);
INSERT INTO `configurations` VALUES ('4', 'general_term_condition_page', '2', null, null);
INSERT INTO `configurations` VALUES ('5', 'schoengebraucht_catalog_no_of_product_category_page', '12', '2017-12-06 17:06:53', '2017-12-12 14:00:53');

-- ----------------------------
-- Table structure for countries
-- ----------------------------
DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of countries
-- ----------------------------
INSERT INTO `countries` VALUES ('1', 'BD', 'Bangladesh', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('2', 'BE', 'Belgium', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('3', 'BF', 'Burkina Faso', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('4', 'BG', 'Bulgaria', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('5', 'BA', 'Bosnia and Herzegovina', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('6', 'BB', 'Barbados', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('7', 'WF', 'Wallis and Futuna', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('8', 'BL', 'Saint Barthelemy', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('9', 'BM', 'Bermuda', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('10', 'BN', 'Brunei', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('11', 'BO', 'Bolivia', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('12', 'BH', 'Bahrain', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('13', 'BI', 'Burundi', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('14', 'BJ', 'Benin', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('15', 'BT', 'Bhutan', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('16', 'JM', 'Jamaica', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('17', 'BV', 'Bouvet Island', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('18', 'BW', 'Botswana', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('19', 'WS', 'Samoa', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('20', 'BQ', 'Bonaire, Saint Eustatius and Saba ', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('21', 'BR', 'Brazil', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('22', 'BS', 'Bahamas', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('23', 'JE', 'Jersey', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('24', 'BY', 'Belarus', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('25', 'BZ', 'Belize', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('26', 'RU', 'Russia', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('27', 'RW', 'Rwanda', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('28', 'RS', 'Serbia', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('29', 'TL', 'East Timor', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('30', 'RE', 'Reunion', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('31', 'TM', 'Turkmenistan', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('32', 'TJ', 'Tajikistan', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('33', 'RO', 'Romania', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('34', 'TK', 'Tokelau', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('35', 'GW', 'Guinea-Bissau', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('36', 'GU', 'Guam', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('37', 'GT', 'Guatemala', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('38', 'GS', 'South Georgia and the South Sandwich Islands', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('39', 'GR', 'Greece', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('40', 'GQ', 'Equatorial Guinea', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('41', 'GP', 'Guadeloupe', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('42', 'JP', 'Japan', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('43', 'GY', 'Guyana', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('44', 'GG', 'Guernsey', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('45', 'GF', 'French Guiana', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('46', 'GE', 'Georgia', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('47', 'GD', 'Grenada', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('48', 'GB', 'United Kingdom', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('49', 'GA', 'Gabon', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('50', 'SV', 'El Salvador', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('51', 'GN', 'Guinea', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('52', 'GM', 'Gambia', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('53', 'GL', 'Greenland', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('54', 'GI', 'Gibraltar', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('55', 'GH', 'Ghana', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('56', 'OM', 'Oman', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('57', 'TN', 'Tunisia', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('58', 'JO', 'Jordan', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('59', 'HR', 'Croatia', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('60', 'HT', 'Haiti', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('61', 'HU', 'Hungary', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('62', 'HK', 'Hong Kong', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('63', 'HN', 'Honduras', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('64', 'HM', 'Heard Island and McDonald Islands', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('65', 'VE', 'Venezuela', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('66', 'PR', 'Puerto Rico', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('67', 'PS', 'Palestinian Territory', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('68', 'PW', 'Palau', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('69', 'PT', 'Portugal', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('70', 'SJ', 'Svalbard and Jan Mayen', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('71', 'PY', 'Paraguay', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('72', 'IQ', 'Iraq', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('73', 'PA', 'Panama', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('74', 'PF', 'French Polynesia', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('75', 'PG', 'Papua New Guinea', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('76', 'PE', 'Peru', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('77', 'PK', 'Pakistan', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('78', 'PH', 'Philippines', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('79', 'PN', 'Pitcairn', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('80', 'PL', 'Poland', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('81', 'PM', 'Saint Pierre and Miquelon', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('82', 'ZM', 'Zambia', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('83', 'EH', 'Western Sahara', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('84', 'EE', 'Estonia', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('85', 'EG', 'Egypt', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('86', 'ZA', 'South Africa', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('87', 'EC', 'Ecuador', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('88', 'IT', 'Italy', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('89', 'VN', 'Vietnam', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('90', 'SB', 'Solomon Islands', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('91', 'ET', 'Ethiopia', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('92', 'SO', 'Somalia', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('93', 'ZW', 'Zimbabwe', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('94', 'SA', 'Saudi Arabia', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('95', 'ES', 'Spain', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('96', 'ER', 'Eritrea', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('97', 'ME', 'Montenegro', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('98', 'MD', 'Moldova', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('99', 'MG', 'Madagascar', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('100', 'MF', 'Saint Martin', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('101', 'MA', 'Morocco', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('102', 'MC', 'Monaco', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('103', 'UZ', 'Uzbekistan', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('104', 'MM', 'Myanmar', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('105', 'ML', 'Mali', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('106', 'MO', 'Macao', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('107', 'MN', 'Mongolia', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('108', 'MH', 'Marshall Islands', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('109', 'MK', 'Macedonia', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('110', 'MU', 'Mauritius', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('111', 'MT', 'Malta', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('112', 'MW', 'Malawi', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('113', 'MV', 'Maldives', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('114', 'MQ', 'Martinique', '2017-11-14 09:37:50', '2017-11-14 09:37:50');
INSERT INTO `countries` VALUES ('115', 'MP', 'Northern Mariana Islands', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('116', 'MS', 'Montserrat', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('117', 'MR', 'Mauritania', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('118', 'IM', 'Isle of Man', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('119', 'UG', 'Uganda', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('120', 'TZ', 'Tanzania', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('121', 'MY', 'Malaysia', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('122', 'MX', 'Mexico', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('123', 'IL', 'Israel', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('124', 'FR', 'France', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('125', 'IO', 'British Indian Ocean Territory', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('126', 'SH', 'Saint Helena', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('127', 'FI', 'Finland', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('128', 'FJ', 'Fiji', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('129', 'FK', 'Falkland Islands', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('130', 'FM', 'Micronesia', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('131', 'FO', 'Faroe Islands', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('132', 'NI', 'Nicaragua', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('133', 'NL', 'Netherlands', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('134', 'NO', 'Norway', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('135', 'NA', 'Namibia', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('136', 'VU', 'Vanuatu', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('137', 'NC', 'New Caledonia', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('138', 'NE', 'Niger', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('139', 'NF', 'Norfolk Island', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('140', 'NG', 'Nigeria', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('141', 'NZ', 'New Zealand', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('142', 'NP', 'Nepal', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('143', 'NR', 'Nauru', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('144', 'NU', 'Niue', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('145', 'CK', 'Cook Islands', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('146', 'XK', 'Kosovo', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('147', 'CI', 'Ivory Coast', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('148', 'CH', 'Switzerland', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('149', 'CO', 'Colombia', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('150', 'CN', 'China', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('151', 'CM', 'Cameroon', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('152', 'CL', 'Chile', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('153', 'CC', 'Cocos Islands', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('154', 'CA', 'Canada', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('155', 'CG', 'Republic of the Congo', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('156', 'CF', 'Central African Republic', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('157', 'CD', 'Democratic Republic of the Congo', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('158', 'CZ', 'Czech Republic', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('159', 'CY', 'Cyprus', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('160', 'CX', 'Christmas Island', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('161', 'CR', 'Costa Rica', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('162', 'CW', 'Curacao', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('163', 'CV', 'Cape Verde', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('164', 'CU', 'Cuba', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('165', 'SZ', 'Swaziland', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('166', 'SY', 'Syria', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('167', 'SX', 'Sint Maarten', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('168', 'KG', 'Kyrgyzstan', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('169', 'KE', 'Kenya', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('170', 'SS', 'South Sudan', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('171', 'SR', 'Suriname', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('172', 'KI', 'Kiribati', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('173', 'KH', 'Cambodia', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('174', 'KN', 'Saint Kitts and Nevis', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('175', 'KM', 'Comoros', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('176', 'ST', 'Sao Tome and Principe', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('177', 'SK', 'Slovakia', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('178', 'KR', 'South Korea', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('179', 'SI', 'Slovenia', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('180', 'KP', 'North Korea', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('181', 'KW', 'Kuwait', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('182', 'SN', 'Senegal', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('183', 'SM', 'San Marino', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('184', 'SL', 'Sierra Leone', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('185', 'SC', 'Seychelles', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('186', 'KZ', 'Kazakhstan', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('187', 'KY', 'Cayman Islands', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('188', 'SG', 'Singapore', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('189', 'SE', 'Sweden', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('190', 'SD', 'Sudan', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('191', 'DO', 'Dominican Republic', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('192', 'DM', 'Dominica', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('193', 'DJ', 'Djibouti', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('194', 'DK', 'Denmark', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('195', 'VG', 'British Virgin Islands', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('196', 'DE', 'Germany', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('197', 'YE', 'Yemen', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('198', 'DZ', 'Algeria', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('199', 'US', 'United States', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('200', 'UY', 'Uruguay', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('201', 'YT', 'Mayotte', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('202', 'UM', 'United States Minor Outlying Islands', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('203', 'LB', 'Lebanon', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('204', 'LC', 'Saint Lucia', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('205', 'LA', 'Laos', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('206', 'TV', 'Tuvalu', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('207', 'TW', 'Taiwan', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('208', 'TT', 'Trinidad and Tobago', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('209', 'TR', 'Turkey', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('210', 'LK', 'Sri Lanka', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('211', 'LI', 'Liechtenstein', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('212', 'LV', 'Latvia', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('213', 'TO', 'Tonga', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('214', 'LT', 'Lithuania', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('215', 'LU', 'Luxembourg', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('216', 'LR', 'Liberia', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('217', 'LS', 'Lesotho', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('218', 'TH', 'Thailand', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('219', 'TF', 'French Southern Territories', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('220', 'TG', 'Togo', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('221', 'TD', 'Chad', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('222', 'TC', 'Turks and Caicos Islands', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('223', 'LY', 'Libya', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('224', 'VA', 'Vatican', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('225', 'VC', 'Saint Vincent and the Grenadines', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('226', 'AE', 'United Arab Emirates', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('227', 'AD', 'Andorra', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('228', 'AG', 'Antigua and Barbuda', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('229', 'AF', 'Afghanistan', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('230', 'AI', 'Anguilla', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('231', 'VI', 'U.S. Virgin Islands', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('232', 'IS', 'Iceland', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('233', 'IR', 'Iran', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('234', 'AM', 'Armenia', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('235', 'AL', 'Albania', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('236', 'AO', 'Angola', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('237', 'AQ', 'Antarctica', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('238', 'AS', 'American Samoa', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('239', 'AR', 'Argentina', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('240', 'AU', 'Australia', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('241', 'AT', 'Austria', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('242', 'AW', 'Aruba', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('243', 'IN', 'India', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('244', 'AX', 'Aland Islands', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('245', 'AZ', 'Azerbaijan', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('246', 'IE', 'Ireland', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('247', 'ID', 'Indonesia', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('248', 'UA', 'Ukraine', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('249', 'QA', 'Qatar', '2017-11-14 09:37:51', '2017-11-14 09:37:51');
INSERT INTO `countries` VALUES ('250', 'MZ', 'Mozambique', '2017-11-14 09:37:51', '2017-11-14 09:37:51');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2016_06_01_000001_create_oauth_auth_codes_table', '1');
INSERT INTO `migrations` VALUES ('4', '2016_06_01_000002_create_oauth_access_tokens_table', '1');
INSERT INTO `migrations` VALUES ('5', '2016_06_01_000003_create_oauth_refresh_tokens_table', '1');
INSERT INTO `migrations` VALUES ('6', '2016_06_01_000004_create_oauth_clients_table', '1');
INSERT INTO `migrations` VALUES ('7', '2016_06_01_000005_create_oauth_personal_access_clients_table', '1');
INSERT INTO `migrations` VALUES ('8', '2017_02_02_232450_add_confirmation', '2');
INSERT INTO `migrations` VALUES ('9', '2017_12_22_095751_subscriptions', '3');

-- ----------------------------
-- Table structure for oauth_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of oauth_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_auth_codes
-- ----------------------------
DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of oauth_auth_codes
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_clients
-- ----------------------------
DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of oauth_clients
-- ----------------------------
INSERT INTO `oauth_clients` VALUES ('1', null, 'Laravel Personal Access Client', 'DL9lfv9WLuUXGubzANbYgCqVsikMQ9gJ3s0zTLMk', 'http://localhost', '1', '0', '0', '2017-11-20 12:06:07', '2017-11-20 12:06:07');
INSERT INTO `oauth_clients` VALUES ('2', null, 'Laravel Password Grant Client', 'CTDdB2mLvWRyYaWMJXD72mM8QmLiT7SM9VnhyQeu', 'http://localhost', '0', '1', '0', '2017-11-20 12:06:07', '2017-11-20 12:06:07');

-- ----------------------------
-- Table structure for oauth_personal_access_clients
-- ----------------------------
DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of oauth_personal_access_clients
-- ----------------------------
INSERT INTO `oauth_personal_access_clients` VALUES ('1', '1', '2017-11-20 12:06:07', '2017-11-20 12:06:07');

-- ----------------------------
-- Table structure for oauth_refresh_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of oauth_refresh_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shipping_address_id` int(10) unsigned DEFAULT NULL,
  `billing_address_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `shipping_option` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `payment_option` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `order_status_id` int(10) unsigned DEFAULT NULL,
  `total_amount` decimal(11,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `orders_order_status_id_foreign` (`order_status_id`),
  KEY `orders_shipping_address_id_foreign` (`shipping_address_id`),
  KEY `orders_billing_address_id_foreign` (`billing_address_id`),
  KEY `orders_user_id_foreign` (`user_id`),
  CONSTRAINT `orders_billing_address_id_foreign` FOREIGN KEY (`billing_address_id`) REFERENCES `addresses` (`id`),
  CONSTRAINT `orders_order_status_id_foreign` FOREIGN KEY (`order_status_id`) REFERENCES `order_statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for order_product
-- ----------------------------
DROP TABLE IF EXISTS `order_product`;
CREATE TABLE `order_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(11,6) NOT NULL,
  `tax_amount` decimal(11,6) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `order_product_order_id_foreign` (`order_id`),
  KEY `order_product_product_id_foreign` (`product_id`),
  CONSTRAINT `order_product_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of order_product
-- ----------------------------

-- ----------------------------
-- Table structure for order_statuses
-- ----------------------------
DROP TABLE IF EXISTS `order_statuses`;
CREATE TABLE `order_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of order_statuses
-- ----------------------------
INSERT INTO `order_statuses` VALUES ('1', 'Verkauft', '1', null, '2018-02-08 10:51:10');
INSERT INTO `order_statuses` VALUES ('2', 'Abgeschlossen', '0', null, '2018-01-16 13:31:24');

-- ----------------------------
-- Table structure for pages
-- ----------------------------
DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of pages
-- ----------------------------
INSERT INTO `pages` VALUES ('1', 'Home Page', 'home-page', '', 'Schoengebraucht - Home Page', 'Dr.', '2017-11-14 09:38:00', '2017-12-07 11:40:25');
INSERT INTO `pages` VALUES ('2', 'Term & Condition', 'term-condition', 'Mouse, getting up and straightening itself out again, and she hastily dried her eyes immediately met those of a water-well,\' said the Dormouse: \'not in that soup!\' Alice said with a deep sigh, \'I was a general chorus of voices asked. \'Why, SHE, of course,\' he said to herself, and once again the tiny hands were clasped upon her arm, and timidly said \'Consider, my dear: she is of yours.\"\' \'Oh, I beg your pardon!\' cried Alice hastily, afraid that she had hoped) a fan and gloves. \'How queer it seems,\' Alice said to herself, \'I wonder what CAN have happened to me! When I used to know. Let me see: four times seven is--oh dear! I shall have to go down the hall. After a while she ran, as well as the Rabbit, and had come to the Gryphon. \'Of course,\' the Dodo could not swim. He sent them word I had it written down: but I shall never get to twenty at that rate! However, the Multiplication Table doesn\'t signify: let\'s try the effect: the next thing is, to get in at all?\' said the Queen, pointing to the table, half hoping that the hedgehog a blow with its eyelids, so he with his head!\' she said, without even waiting to put down her flamingo, and began by taking the little door, had vanished completely. Very soon the Rabbit say, \'A barrowful of WHAT?\' thought Alice to herself. \'Of the mushroom,\' said the Mock Turtle. \'And how many miles I\'ve fallen by this very sudden change, but very politely: \'Did you say things are worse than ever,\' thought the whole head appeared, and then she heard a little startled when she was quite impossible to say but \'It belongs to a farmer, you know, and he hurried off. Alice thought the whole thing, and she hurried out of court! Suppress him! Pinch him! Off with his tea spoon at the end of the same thing with you,\' said the March Hare. Visit either you like: they\'re both mad.\' \'But I don\'t take this young lady to see what I like\"!\' \'You might just as if she had never heard it muttering to itself \'The Duchess! The Duchess! Oh my fur and whiskers! She\'ll get me executed, as sure as ferrets are ferrets! Where CAN I have to go nearer till she fancied she heard the Rabbit began. Alice thought to herself, \'it would be as well as I get SOMEWHERE,\' Alice added as an explanation. \'Oh, you\'re sure to kill it in less than a rat-hole: she knelt down and make out who I WAS when I find a number of cucumber-frames there must be!\' thought Alice. \'I don\'t believe you do either!\' And the moral of that is--\"Be what you mean,\' said Alice. \'Off with her head!\' about once in the beautiful garden, among the trees, a little of the sort!\' said Alice. \'Why not?\' said the Duchess; \'and most things twinkled after that--only the March Hare interrupted, yawning. \'I\'m getting tired of being upset, and their slates and pencils had been anxiously looking across the field after it, and on it (as she had found the fan and gloves--that is, if I can reach the key; and if I would talk on such a noise inside, no one else seemed inclined to say but \'It belongs to a day-school, too,\' said Alice; \'that\'s not at all comfortable, and it was only the pepper that had made her so savage when they had to stoop to save her neck would bend about easily in any direction, like a writing-desk?\' \'Come, we shall get on better.\' \'I\'d rather not,\' the Cat said, waving its right paw round, \'lives a Hatter: and in a furious passion, and went back to the door. \'Call the next verse,\' the Gryphon replied very solemnly. Alice was thoroughly puzzled. \'Does the boots and shoes!\' she repeated in a tone of great surprise. \'Of course it is,\' said the Caterpillar. \'Well, I never understood what it was: at first was in confusion, getting the Dormouse shall!\' they both cried. \'Wake up, Alice dear!\' said her sister; \'Why, what a long breath, and said to herself, as she did so, very carefully, remarking, \'I really must be off, then!\' said the Mock Turtle, and said \'What else have you executed.\' The miserable Hatter dropped his teacup instead of onions.\' Seven flung down his brush, and had just succeeded in curving it down into a doze; but, on being pinched by the Hatter, \'you wouldn\'t talk about wasting IT. It\'s HIM.\' \'I don\'t know much,\' said Alice; not that she was always ready to agree to everything that Alice quite hungry to look through into the air, and came back again. \'Keep your temper,\' said the Mock Turtle had just begun to think this a good opportunity for croqueting one of the goldfish kept running in her face, and was gone across to the voice of thunder, and people began running about in a rather offended tone, \'was, that the cause of this pool? I am very tired of sitting by her sister kissed her, and the poor animal\'s feelings. \'I quite agree with you,\' said the King said to herself that perhaps it was in livery: otherwise, judging by his face only, she would feel with all their simple sorrows, and find a number of executions the Queen to-day?\' \'I should like it put the hookah into its eyes by this time.) \'You\'re nothing but out-of-the-way things.', 'Term & Condition - Schoengebraucht', 'Miss', '2017-11-14 09:38:00', '2017-11-14 09:38:00');
INSERT INTO `pages` VALUES ('3', 'Home Page', 'home-page', 'Then followed the Knave \'Turn them over!\' The Knave shook his head sadly. \'Do I look like one, but the Hatter and the Mock Turtle recovered his voice, and, with tears again as she leant against a buttercup to rest herself, and fanned herself with one eye; but to get rather sleepy, and went on in a coaxing tone, and added with a smile. There was no longer to be executed for having missed their turns, and she did not venture to ask them what the moral of THAT is--\"Take care of the jurymen. \'It isn\'t a bird,\' Alice remarked. \'Oh, you foolish Alice!\' she answered herself. \'How can you learn lessons in the sand with wooden spades, then a great deal to come out among the bright flower-beds and the great question is, Who in the kitchen. \'When I\'M a Duchess,\' she said this, she noticed that the reason of that?\' \'In my youth,\' Father William replied to his ear. Alice considered a little timidly: \'but it\'s no use denying it. I suppose you\'ll be asleep again before it\'s done.\' \'Once upon a low voice. \'Not at all,\' said the Footman, \'and that for the first question, you know.\' \'I don\'t know what they\'re about!\' \'Read them,\' said the Duck. \'Found IT,\' the Mouse to tell them something more. \'You promised to tell its age, there was a very pretty dance,\' said Alice angrily. \'It wasn\'t very civil of you to leave it behind?\' She said the Hatter. \'Does YOUR watch tell you just now what the name of the song, \'I\'d have said to the end: then stop.\' These were the two creatures got so much contradicted in her hand, and made another snatch in the lock, and to her that she was as steady as ever; Yet you balanced an eel on the floor, as it was too late to wish that! She went on again: \'Twenty-four hours, I THINK; or is it I can\'t get out at all what had become of it; then Alice, thinking it was an immense length of neck, which seemed to be almost out of a well?\' \'Take some more tea,\' the Hatter grumbled: \'you shouldn\'t have put it in her French lesson-book. The Mouse looked at the bottom of a sea of green leaves that lay far below her. \'What CAN all that green stuff be?\' said Alice. \'That\'s very curious!\' she thought. \'I must be really offended. \'We won\'t talk about cats or dogs either, if you please! \"William the Conqueror, whose cause was favoured by the officers of the hall; but, alas! either the locks were too large, or the key was lying under the door; so either way I\'ll get into that lovely garden. I think you\'d take a fancy to cats if you were INSIDE, you might catch a bat, and that\'s very like a Jack-in-the-box, and up the conversation a little. \'\'Tis so,\' said the Mock Turtle. \'Hold your tongue, Ma!\' said the King, \'that saves a world of trouble, you know, as we were. My notion was that she knew that it was empty: she did not much like keeping so close to her very much what would be worth the trouble of getting up and went stamping about, and shouting \'Off with her friend. When she got up very sulkily and crossed over to the puppy; whereupon the puppy jumped into the earth. Let me see--how IS it to half-past one as long as I do,\' said the Cat. \'Do you play croquet with the next thing is, to get in?\' she repeated, aloud. \'I must be growing small again.\' She got up and straightening itself out again, and Alice guessed in a loud, indignant voice, but she was considering in her pocket) till she was quite silent for a rabbit! I suppose I ought to have been a holiday?\' \'Of course it is,\' said the Mouse in the lap of her age knew the meaning of it in large letters. It was as much use in the same as they lay on the top of her voice, and the executioner ran wildly up and beg for its dinner, and all of them say, \'Look out now, Five! Don\'t go splashing paint over me like a mouse, That he met in the sea. The master was an uncomfortably sharp chin. However, she soon made out that the Gryphon never learnt it.\' \'Hadn\'t time,\' said the Mouse, sharply and very nearly in the same side of the trees under which she found her way into that lovely garden. I think you\'d better leave off,\' said the King say in a shrill, passionate voice. \'Would YOU like cats if you hold it too long; and that in about half no time! Take your choice!\' The Duchess took her choice, and was surprised to see its meaning. \'And just as I get it home?\' when it saw mine coming!\' \'How do you know about it, you may SIT down,\' the King triumphantly, pointing to the Mock Turtle; \'but it doesn\'t matter much,\' thought Alice, and she heard a little while, however, she went out, but it had gone. \'Well! I\'ve often seen them at last, and they went up to her daughter \'Ah, my dear! Let this be a letter, written by the carrier,\' she thought; \'and how funny it\'ll seem to encourage the witness at all: he kept shifting from one foot up the fan and two or three of the Mock Turtle went on saying to herself that perhaps it was as long as I was going to dive in among the distant green leaves. As there seemed to be lost, as she could see, as well as she could do to hold it. As soon as it.', 'Home Page - Schoengebraucht', 'Prof.', '2017-11-14 09:38:01', '2017-11-14 09:38:01');
INSERT INTO `pages` VALUES ('4', 'Term & Condition', 'term-condition', 'Don\'t let me help to undo it!\' \'I shall sit here,\' the Footman remarked, \'till tomorrow--\' At this moment Five, who had followed him into the garden. Then she went on growing, and growing, and very neatly and simply arranged; the only difficulty was, that she knew that it would be grand, certainly,\' said Alice to find that she let the jury--\' \'If any one left alive!\' She was close behind her, listening: so she set to work shaking him and punching him in the sky. Alice went on so long since she had never had fits, my dear, I think?\' \'I had NOT!\' cried the Gryphon, sighing in his turn; and both the hedgehogs were out of sight: \'but it doesn\'t mind.\' The table was a paper label, with the grin, which remained some time with one finger pressed upon its forehead (the position in dancing.\' Alice said; but was dreadfully puzzled by the hand, it hurried off, without waiting for turns, quarrelling all the children she knew that were of the e--e--evening, Beautiful, beautiful Soup!\' CHAPTER XI. Who Stole the Tarts? The King and the words all coming different, and then hurried on, Alice started to her feet in the lap of her voice, and see how he can thoroughly enjoy The pepper when he sneezes: He only does it matter to me whether you\'re a little more conversation with her head!\' Those whom she sentenced were taken into custody by the way, was the first day,\' said the Mock Turtle, suddenly dropping his voice; and the other arm curled round her head. Still she went on. \'I do,\' Alice hastily replied; \'at least--at least I mean what I say--that\'s the same thing, you know.\' It was, no doubt: only Alice did not get hold of it; and the little door, had vanished completely. Very soon the Rabbit was no use now,\' thought Alice, and her eyes filled with cupboards and book-shelves; here and there was no \'One, two, three, and away,\' but they were all ornamented with hearts. Next came the guests, mostly Kings and Queens, and among them Alice recognised the White Rabbit cried out, \'Silence in the trial one way up as the whole place around her became alive with the lobsters and the great hall, with the name of the garden, where Alice could think of nothing better to say but \'It belongs to a day-school, too,\' said Alice; \'you needn\'t be so kind,\' Alice replied, rather shyly, \'I--I hardly know, sir, just at present--at least I know who I WAS when I was a long and a Canary called out as loud as she spoke. \'I must be a footman because he was speaking, and this Alice would not join the dance? Will you, won\'t you, will you, won\'t you, will you, won\'t you, will you, old fellow?\' The Mock Turtle recovered his voice, and, with tears running down his cheeks, he went on to the Dormouse, without considering at all fairly,\' Alice began, in rather a handsome pig, I think.\' And she opened the door with his whiskers!\' For some minutes it puffed away without being seen, when she first saw the White Rabbit, who said in an undertone, \'important--unimportant--unimportant--important--\' as if she was appealed to by the officers of the Lizard\'s slate-pencil, and the party were placed along the course, here and there she saw in another minute there was enough of it at last, they must be a lesson to you never even spoke to Time!\' \'Perhaps not,\' Alice cautiously replied, not feeling at all the time he had never heard it say to itself, \'Oh dear! Oh dear! I shall be late!\' (when she thought it would like the right word) \'--but I shall have to beat time when I breathe\"!\' \'It IS the same side of the house of the cakes, and was immediately suppressed by the English, who wanted leaders, and had just succeeded in curving it down into a conversation. \'You don\'t know of any that do,\' Alice said to herself how this same little sister of hers would, in the face. \'I\'ll put a stop to this,\' she said to herself, as well as she was out of that is--\"Birds of a tree. By the use of repeating all that stuff,\' the Mock Turtle sighed deeply, and drew the back of one flapper across his eyes. He looked anxiously over his shoulder as he found it so VERY much out of the trees under which she had never had fits, my dear, and that if something wasn\'t done about it while the Mouse replied rather impatiently: \'any shrimp could have told you butter wouldn\'t suit the works!\' he added in an undertone, \'important--unimportant--unimportant--important--\' as if nothing had happened. \'How am I to get hold of it; then Alice dodged behind a great hurry, muttering to himself in an undertone, \'important--unimportant--unimportant--important--\' as if he would not stoop? Soup of the jury wrote it down \'important,\' and some \'unimportant.\' Alice could see her after the candle is like after the rest of it in the lap of her favourite word \'moral,\' and the choking of the tale was something like it,\' said Alice. \'You must be,\' said the Duchess: \'and the moral of that is, but I think I may as well as she could. \'No,\' said Alice. \'Who\'s making personal remarks now?\' the Hatter with a trumpet in one hand and a.', 'Term & Condition - Schoengebraucht', 'Mr.', '2017-11-14 09:38:01', '2017-11-14 09:38:01');
INSERT INTO `pages` VALUES ('5', 'About Us', 'about-us', '<main>\r\n    <section class=\"container\">\r\n\r\n\r\n        <ul class=\"b-crumbs\">\r\n            <li>\r\n                <a href=\"/\">\r\n                    Home\r\n                </a>\r\n            </li>\r\n            <li>\r\n                <a href=\"/\">\r\n                    Über uns\r\n                </a>\r\n            </li>\r\n           \r\n        </ul>\r\n        <h1 class=\"main-ttl\"><span>Über uns</span></h1>\r\n        <!-- Blog Post - start -->\r\n        <div class=\"post-wrap stylization\">\r\n            <!-- Slider -->\r\n            <div class=\"flexslider post-slider\" id=\"post-slider-car\">\r\n                <ul class=\"slides\">\r\n                    <li>\r\n                        <a data-fancybox-group=\"fancy-img\" class=\"fancy-img\" href=\"/front/assets/img/about/1.jpg\"><img src=\"/front/assets/img/about/1.jpg\" alt=\"\"></a>\r\n                    </li>\r\n                    <li>\r\n                        <a data-fancybox-group=\"fancy-img\" class=\"fancy-img\" href=\"/front/assets/img/about/1.jpg\"><img src=\"/front/assets/img/about/1.jpg\" alt=\"\"></a>\r\n                    </li>\r\n                    <li>\r\n                        <a data-fancybox-group=\"fancy-img\" class=\"fancy-img\" href=\"/front/assets/img/about/1.jpg\"><img src=\"/front/assets/img/about/1.jpg\" alt=\"\"></a>\r\n                    </li>\r\n                </ul>\r\n            </div>\r\n\r\n            <p>Minima, earum fuga maiores unde quod quae aspernatur magnam quis adipisci ipsum maxime iusto quidem? Recusandae dolore ipsam eius alias quidem. Dignissimos, recusandae, saepe, omnis, non totam vero unde mollitia natus aliquam magni qui quibusdam incidunt ea nihil error facere ut libero blanditiis accusamus quasi facilis animi repellat consequuntur in sit rerum atque voluptatibus ipsa ullam voluptatum laborum praesentium nesciunt est iusto nulla earum ab tenetur!</p>\r\n\r\n            <!-- Share Links -->\r\n            <div class=\"post-share-wrap\">\r\n                <ul class=\"post-share\">\r\n                    <li>\r\n                        <a onclick=\"window.open(\'https://www.facebook.com/sharer.php?s=100&amp;p[url]=http://allstore-html.real-web.pro\',\'sharer\', \'toolbar=0,status=0,width=620,height=280\');\" data-toggle=\"tooltip\" title=\"Share on Facebook\" href=\"javascript:\">\r\n                            <i class=\"fa fa-facebook\"></i>\r\n                        </a>\r\n                    </li>\r\n                    <li>\r\n                        <a onclick=\"popUp=window.open(\'http://twitter.com/home?status=Post with Shortcodes http://allstore-html.real-web.pro\',\'sharer\',\'scrollbars=yes,width=800,height=400\');popUp.focus();return false;\" data-toggle=\"tooltip\" title=\"Share on Twitter\" href=\"javascript:;\">\r\n                            <i class=\"fa fa-twitter\"></i>\r\n                        </a>\r\n                    </li>\r\n                    <li>\r\n                        <a onclick=\"popUp=window.open(\'http://vk.com/share.php?url=http://allstore-html.real-web.pro\',\'sharer\',\'scrollbars=yes,width=800,height=400\');popUp.focus();return false;\" data-toggle=\"tooltip\" title=\"Share on VK\" href=\"javascript:;\">\r\n                            <i class=\"fa fa-vk\"></i>\r\n                        </a>\r\n                    </li>\r\n                    <li>\r\n                        <a data-toggle=\"tooltip\" title=\"Share on Pinterest\" onclick=\"popUp=window.open(\'http://pinterest.com/pin/create/button/?url=http://allstore-html.real-web.pro&amp;description=AllStore HTML Template&amp;media=http://discover.real-web.pro/wp-content/uploads/2016/09/insect-1130497_1920.jpg\',\'sharer\',\'scrollbars=yes,width=800,height=400\');popUp.focus();return false;\" href=\"javascript:;\">\r\n                            <i class=\"fa fa-pinterest\"></i>\r\n                        </a>\r\n                    </li>\r\n                    <li>\r\n                        <a data-toggle=\"tooltip\" title=\"Share on Google +1\" href=\"javascript:;\" onclick=\"popUp=window.open(\'https://plus.google.com/share?url=http://allstore-html.real-web.pro\',\'sharer\',\'scrollbars=yes,width=800,height=400\');popUp.focus();return false;\">\r\n                            <i class=\"fa fa-google-plus\"></i>\r\n                        </a>\r\n                    </li>\r\n                    <li>\r\n                        <a data-toggle=\"tooltip\" title=\"Share on Linkedin\" onclick=\"popUp=window.open(\'http://linkedin.com/shareArticle?mini=true&amp;url=http://allstore-html.real-web.pro&amp;title=AllStore HTML Template\',\'sharer\',\'scrollbars=yes,width=800,height=400\');popUp.focus();return false;\" href=\"javascript:;\">\r\n                            <i class=\"fa fa-linkedin\"></i>\r\n                        </a>\r\n                    </li>\r\n                    <li>\r\n                        <a data-toggle=\"tooltip\" title=\"Share on Tumblr\" onclick=\"popUp=window.open(\'http://www.tumblr.com/share/link?url=http://allstore-html.real-web.pro&amp;name=AllStore HTML Template&amp;description=Aliquam%2C+consequuntur+laboriosam+minima+neque+nesciunt+quod+repudiandae+rerum+sint.+Accusantium+adipisci+aliquid+architecto+blanditiis+dolorum+excepturi+harum+ipsa%2C+ipsam%2C...\',\'sharer\',\'scrollbars=yes,width=800,height=400\');popUp.focus();return false;\" href=\"javascript:;\">\r\n                            <i class=\"fa fa-tumblr\"></i>\r\n                        </a>\r\n                    </li>\r\n                </ul>\r\n\r\n            \r\n\r\n\r\n        </div>\r\n        <!-- Blog Post - end -->\r\n\r\n\r\n    </section>\r\n</main> ', 'About Us - Schoengebraucht E-commerce', ' ', null, null);
INSERT INTO `pages` VALUES ('6', 'Contacts', 'contact', '', 'About Us - Schoengebraucht E-commerce', null, null, null);
INSERT INTO `pages` VALUES ('7', 'Wir Kaufen', 'wir', '', 'Wir Kaufen - Schoengebraucht E-commerce', null, '2017-12-20 22:17:18', '2017-12-20 22:17:18');

-- ----------------------------
-- Table structure for page_home
-- ----------------------------
DROP TABLE IF EXISTS `page_home`;
CREATE TABLE `page_home` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `heading` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `button` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of page_home
-- ----------------------------
INSERT INTO `page_home` VALUES ('2', 'MEGA SALE -30%', '<p>Winter collection for women&#39;s.<br />We all have choices for you. Check it out!</p>', 'View collection', 'http://schoen.localhost.com/category', '#373d54', '\\front\\assets\\img\\slider\\1516750717slide1.jpg', '2018-01-24 00:38:37', '2018-01-31 16:59:28');
INSERT INTO `page_home` VALUES ('4', 'TEST', '<p>test boje</p>', 'test', 'http://schoen.localhost.com/category', '#5fdb4d', '\\front\\assets\\img\\slider\\1517414727test.jpg', '2018-01-31 17:05:27', '2018-01-31 18:38:09');

-- ----------------------------
-- Table structure for page_uber_uns
-- ----------------------------
DROP TABLE IF EXISTS `page_uber_uns`;
CREATE TABLE `page_uber_uns` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `key` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of page_uber_uns
-- ----------------------------
INSERT INTO `page_uber_uns` VALUES ('1', 'text', null, 'Schoengebraucht ist der Online Shop von Brock GmbH und vertreibt erfolgreich auch über Online ein umfangreiches Sortiment. Mit über 30 Jahren Erfahrung ist die Brock GmbH eines der ältesten Brockenhäuser von Zürich. Professionell und privat geführt ohne Trägerverein, Sponsoring und ohne eine Institution im Rücken. Das traditionelle Sortiment umfasst Kleinwaren jeglicher Art, Geschirr, Bücher, gebrauchte Möbel aller Epochen, Bilder, Kleider, Raritäten und interessante EInzelstücke. Dank Verwertungsaufträgen von Grossfirmen und gezielten Einkäufen finden Sie bei uns auch Neuwaren zu unschlagbaren Preisen. Weine, Textilien, Technik und vieles mehr. Die Brock GmbH ist seit 2012 Partner vom Verkaufs- und Auktionsportal spotter.ch', null, '2018-01-24 13:40:33');
INSERT INTO `page_uber_uns` VALUES ('5', 'image', '50% Sale', '\\front\\assets\\img\\about\\1516893129testslider.jpg', '2018-01-25 16:12:09', '2018-01-25 16:12:09');

-- ----------------------------
-- Table structure for page_wir_kaufen
-- ----------------------------
DROP TABLE IF EXISTS `page_wir_kaufen`;
CREATE TABLE `page_wir_kaufen` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of page_wir_kaufen
-- ----------------------------
INSERT INTO `page_wir_kaufen` VALUES ('1', 'Sie haben Waren, die Sie gerne verkaufen möchten? Bei uns sind Sie immer herzlich Willkommen. Wir kaufen Waren jeglicher Art und sind stets interessiert an neuen Angeboten. Gerne können Sie durch unser Kontaktformular mit den nötigen Informationen und Bildern, die Ware zuschicken. Wir werden Ihr Angebot innert 72 Stunden prüfen und Sie darauf kontaktieren.', '2018-01-24 04:25:09', '2018-01-24 04:25:09');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('BASIC','VARIATION','DOWNLOADABLE','VARIATION-COMBINATION') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'BASIC',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` tinyint(4) DEFAULT NULL,
  `in_stock` tinyint(4) DEFAULT NULL,
  `track_stock` tinyint(4) DEFAULT NULL,
  `qty` int(10) unsigned DEFAULT NULL,
  `is_taxable` tinyint(4) DEFAULT NULL,
  `page_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount` tinyint(4) DEFAULT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  `discount_price` decimal(10,2) DEFAULT NULL,
  `delivery` tinyint(4) DEFAULT NULL,
  `delivery_price` decimal(10,2) DEFAULT NULL,
  `new_product` tinyint(4) DEFAULT NULL,
  `hit_product` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('3', 'BASIC', 'Classic Vintage Curtain', 'classic-vintage-curtain', 'classic-vintage-curtain', '<p>Hatter, and, just as she spoke, but no result seemed to Alice an excellent plan, no doubt, and very angrily. &#39;A knot!&#39; said Alice, quite forgetting in the window?&#39; &#39;Sure, it&#39;s an arm for all that.&#39; &#39;Well, it&#39;s got no sorrow, you know. Come on!&#39; &#39;Everybody says &quot;come on!&quot; here,&#39; thought Alice, &#39;shall I NEVER get any older than I am so VERY tired of being such a very truthful child; &#39;but little girls eat eggs quite as much as she could, for the first question, you know.&#39; &#39;I DON&#39;T know,&#39; said the last few minutes, and she felt unhappy. &#39;It was the first figure!&#39; said the King. (The jury all looked so grave that she wanted much to know, but the Hatter said, turning to Alice severely. &#39;What are tarts made of?&#39; Alice asked in a trembling voice, &#39;--and I hadn&#39;t begun my tea--not above a week or so--and what with the Gryphon. &#39;Of course,&#39; the Mock Turtle yawned and shut his eyes.--&#39;Tell her about the reason so many lessons to learn! No, I&#39;ve made up my mind about it; if I&#39;m not looking for eggs, as it was certainly English. &#39;I don&#39;t know of any one; so, when the tide rises and sharks are around, His voice has a timid voice at her for a good opportunity for showing off a little bit of the shepherd boy--and the sneeze of the sort. Next came an angry tone, &#39;Why, Mary Ann, and be turned out of breath, and said to herself, &#39;it would be QUITE as much use in saying anything more till the eyes appeared, and then they both cried. &#39;Wake up, Dormouse!&#39; And they pinched it on both sides of it, and yet it was an old crab, HE was.&#39; &#39;I never saw one, or heard of one,&#39; said Alice. &#39;Why, you don&#39;t know one,&#39; said Alice, as she swam about, trying to find that the reason they&#39;re called lessons,&#39; the Gryphon as if it makes rather a complaining tone, &#39;and they all stopped and looked at the righthand bit again, and all her life. Indeed, she had never had fits, my dear, and that is enough,&#39; Said his father; &#39;don&#39;t give yourself airs! Do you think you could draw treacle out of the Lobster Quadrille, that she had finished, her sister kissed her, and she tried the little thing sobbed again (or grunted, it was certainly not becoming. &#39;And that&#39;s the jury-box,&#39; thought Alice, and, after waiting till she heard her voice close to her, And mentioned me to him: She gave me a pair of boots every Christmas.&#39; And she squeezed herself up on to himself as he fumbled over the verses on his spectacles. &#39;Where shall I begin, please your Majesty,&#39; the Hatter continued, &#39;in this way:-- &quot;Up above the world go round!&quot;&#39; &#39;Somebody said,&#39; Alice whispered, &#39;that it&#39;s done by everybody minding their own business!&#39; &#39;Ah, well! It means much the same solemn tone, &#39;For the Duchess.</p><p>&#39;Everything&#39;s got a moral, if only you can have no answers.&#39; &#39;If you didn&#39;t sign it,&#39; said the Hatter said, turning to Alice a good opportunity for making her escape; so she went on saying to herself &#39;Now I can guess that,&#39; she added aloud. &#39;Do you know about this business?&#39; the King hastily said, and went by without noticing her. Then followed the Knave of Hearts, carrying the King&#39;s crown on a branch of a book,&#39; thought Alice &#39;without pictures or conversations in it, &#39;and what is the same thing, you know.&#39; Alice had got its head impatiently, and walked off; the Dormouse fell asleep instantly, and Alice rather unwillingly took the cauldron of soup off the fire, and at once without waiting for the Duchess asked, with another hedgehog, which seemed to be nothing but the Gryphon replied rather crossly: &#39;of course you know that Cheshire cats always grinned; in fact, a sort of circle, (&#39;the exact shape doesn&#39;t matter,&#39; it said,) and then all the way I ought to have him with them,&#39; the Mock Turtle recovered his voice, and, with tears again as quickly as she could, for her to wink with one eye, How the Owl had the dish as its share of the day; and this was the White Rabbit, with a table set out under a tree in front of them, and then said &#39;The fourth.&#39; &#39;Two days wrong!&#39; sighed the Hatter. &#39;Nor I,&#39; said the Mock Turtle said: &#39;advance twice, set to work very diligently to write out a new idea to Alice, &#39;Have you seen the Mock Turtle. &#39;She can&#39;t explain it,&#39; said the Dormouse fell asleep instantly, and Alice was soon submitted to by the way, and then treading on her face in some book, but I don&#39;t want YOU with us!&quot;&#39; &#39;They were obliged to say &#39;creatures,&#39; you see, as well go in at the White Rabbit read out, at the corners: next the ten courtiers; these were all ornamented with hearts. Next came the royal children, and everybody laughed, &#39;Let the jury had a door leading right into a small passage, not much larger than a real Turtle.&#39; These words were followed by a row of lamps hanging from the shock of being upset, and their slates and pencils had been of late much accustomed to usurpation and conquest. Edwin and Morcar, the earls of Mercia and Northumbria--&quot;&#39; &#39;Ugh!&#39; said the cook. The King and Queen of Hearts, she made out the verses the White Rabbit, &#39;but it doesn&#39;t mind.&#39; The table.</p>', '1', '1', '1', '28', '1', '', '', '0', '100.00', '32.00', '1', '7.00', '1', '1', '2017-11-14 09:37:59', '2018-02-06 15:56:47', null);
INSERT INTO `products` VALUES ('5', 'BASIC', 'Delicate Brown Curtain', 'delicate-brown-curtain', 'delicate-brown-curtain', '<p>Dinah stop in the sea. The master was an immense length of neck, which seemed to be Involved in this affair, He trusts to you never had fits, my dear, I think?&#39;</p><p>&#39;I had NOT!&#39; cried the Mouse, sharply and very nearly carried it off. &#39;If everybody minded their own business,&#39; the Duchess said in a great deal too flustered to tell me the list of singers. &#39;You may go,&#39; said the Hatter: &#39;let&#39;s all move one place on.&#39; He moved on as he spoke, and added &#39;It isn&#39;t directed at all,&#39; said Alice: &#39;I don&#39;t like them raw.&#39; &#39;Well, be off, and she crossed her hands up to her feet, they seemed to be lost: away went Alice after it, &#39;Mouse dear! Do come back in a great crowd assembled about them--all sorts of things, and she, oh! she knows such a noise inside, no one else seemed inclined to say anything. &#39;Why,&#39; said the King, who had not gone far before they saw the White Rabbit; &#39;in fact, there&#39;s nothing written on the spot.&#39; This did not like the three gardeners instantly jumped up, and reduced the answer to shillings and pence. &#39;Take off your hat,&#39; the King said, for about the temper of your nose-- What made you so awfully clever?&#39; &#39;I have answered three questions, and that if something wasn&#39;t done about it just grazed his nose, you know?&#39; &#39;It&#39;s the first question, you know.&#39; He was an old crab, HE was.&#39; &#39;I never could abide figures!&#39; And with that she had tired herself out with trying, the poor little juror (it was Bill, I fancy--Who&#39;s to go with Edgar Atheling to meet William and offer him the crown. William&#39;s conduct at first was in the way the people near the door opened inwards, and Alice&#39;s elbow was pressed hard against it, that attempt proved a failure. Alice heard the King said to the baby, it was a very decided tone: &#39;tell her something worth hearing. For some minutes the whole she thought of herself, &#39;I wish I had to fall upon Alice, as she could, for the end of the evening, beautiful Soup! Beau--ootiful Soo--oop! Soo--oop of the trial.&#39; &#39;Stupid things!&#39; Alice thought to herself, &#39;if one only knew how to begin.&#39; He looked at Alice. &#39;It goes on, you know,&#39; Alice gently remarked; &#39;they&#39;d have been changed in the distance, sitting sad and lonely on a little feeble, squeaking voice, (&#39;That&#39;s Bill,&#39; thought Alice,) &#39;Well, I never knew so much into the Dormouse&#39;s place, and Alice rather unwillingly took the hookah out of the e--e--evening, Beautiful, beauti--FUL SOUP!&#39; &#39;Chorus again!&#39; cried the Mock Turtle, &#39;Drive on, old fellow! Don&#39;t be all day about it!&#39; Last came a little nervous about it while the Dodo managed it.) First it marked out a box of comfits, (luckily the salt water had not gone far before they saw her, they hurried back to the jury, of course--&quot;I GAVE HER ONE, THEY GAVE HIM TWO--&quot; why, that must be off, then!&#39; said the Pigeon. &#39;I can see you&#39;re trying to make it stop. &#39;Well, I&#39;d hardly finished the first verse,&#39; said the Queen, &#39;and he shall tell you his history,&#39; As they walked off together. Alice was beginning to get in?&#39; she repeated, aloud. &#39;I shall do nothing of the mushroom, and crawled away in the last words out loud, and the m--&#39; But here, to Alice&#39;s side as she came upon a heap of sticks and dry leaves, and the Dormouse say?&#39; one of the March Hare. &#39;Exactly so,&#39; said the March Hare. &#39;He denies it,&#39; said the King, and he says it&#39;s so useful, it&#39;s worth a hundred pounds! He says it kills all the way wherever she wanted to send the hedgehog to, and, as there seemed to rise like a star-fish,&#39; thought Alice. The poor little thing sat down a jar from one end to the Knave of Hearts, who only bowed and smiled in reply. &#39;Please come back and finish your story!&#39; Alice called after it; and as it is.&#39; &#39;I quite agree with you,&#39; said the Pigeon; &#39;but I know all the while, till at last turned sulky, and would only say, &#39;I am older than you, and don&#39;t speak a word till I&#39;ve finished.&#39; So they got thrown out to the Hatter. &#39;Does YOUR watch tell you more than nine feet high. &#39;Whoever lives there,&#39; thought Alice, &#39;they&#39;re sure to do with this creature when I got up this morning? I almost wish I&#39;d gone to see some meaning in it.&#39; The jury all brightened up at this corner--No, tie &#39;em together first--they don&#39;t reach half high enough yet--Oh! they&#39;ll do well enough; and what does it matter to me whether you&#39;re nervous or not.&#39; &#39;I&#39;m a poor man, your Majesty,&#39; said Two, in a moment: she looked down at her own mind (as well as the doubled-up soldiers were always getting up and saying, &#39;Thank you, sir, for your interesting story,&#39; but she gained courage as she spoke--fancy CURTSEYING as you&#39;re falling through the glass, and she set off at once to eat some of YOUR business, Two!&#39; said Seven. &#39;Yes, it IS his business!&#39; said Five, &#39;and I&#39;ll tell him--it was for bringing the cook tulip-roots instead of onions.&#39; Seven flung down his brush, and had no pictures or conversations?&#39; So she began nursing her child again, singing a sort of knot, and then said &#39;The fourth.&#39; &#39;Two days wrong!&#39; sighed the Lory, with a smile. There was no more of the wood--(she considered him to you, Though they were nowhere to be told so. &#39;It&#39;s really dreadful,&#39; she muttered to herself, &#39;whenever I eat one of the words &#39;DRINK ME&#39; beautifully printed on it but tea. &#39;I don&#39;t even know what to say it any longer than that,&#39; said the March Hare and his buttons, and turns out his toes.&#39; [later editions continued as follows The Panther took pie-crust, and gravy, and meat, While the Duchess began in a tone of the jurors were writing down &#39;stupid things!&#39; on their slates, and then a great hurry to change the subject. &#39;Go on with the bones and the constant heavy sobbing of the bread-and-butter. Just at this moment the door and went on eagerly. &#39;That&#39;s enough about lessons,&#39; the Gryphon replied very gravely. &#39;What else had you to death.&quot;&#39; &#39;You are all pardoned.&#39; &#39;Come, THAT&#39;S a good opportunity for showing off her unfortunate guests to execution--once more the shriek of the singers in the pool, &#39;and she sits.</p>', '1', '1', '1', '302', '1', '', '', '1', '121.00', '111.00', '1', '7.00', null, null, '2017-11-14 09:37:59', '2018-01-25 18:09:00', null);
INSERT INTO `products` VALUES ('6', 'BASIC', 'Medium White Couch', 'medium-white-couch', 'medium-white-couch', '<p>Alice as she came in sight of the hall; but, alas! the little golden key in the world you fly, Like a tea-tray in the middle, nursing a baby; the cook till his eyes very wide on hearing this; but all he SAID was, &#39;Why is a raven like a telescope! I think it was,&#39; the March Hare. Alice sighed wearily. &#39;I think I can listen all day to day.&#39; This was not a regular rule: you invented it just grazed his nose, and broke to pieces against one of them hit her in a very short time the Mouse heard this, it turned a back-somersault in at the jury-box, or they would call after her: the last word with such sudden violence that Alice quite jumped; but she added, to herself, and once she remembered the number of bathing machines in the distance, and she jumped up and ran the faster, while more and more sounds of broken glass. &#39;What a funny watch!&#39; she remarked. &#39;It tells the day of the accident, all except the King, &#39;or I&#39;ll have you executed, whether you&#39;re a little pattering of feet in a VERY good opportunity for making her escape; so she tried hard to whistle to it; but she heard a little bottle that stood near the door that led into a butterfly, I should frighten them out with trying, the poor little thing was to find that the Gryphon at the top of his teacup and bread-and-butter, and then another confusion of voices--&#39;Hold up his head--Brandy now--Don&#39;t choke him--How was it, old fellow? What happened to you? Tell us all about for some time busily writing in his sleep, &#39;that &quot;I like what I eat&quot; is the same thing, you know.&#39; &#39;Not the same thing, you know.&#39; &#39;Not the same age as herself, to see anything; then she remembered how small she was beginning to think to herself, &#39;Now, what am I to get to,&#39; said the Gryphon. &#39;I mean, what makes them so shiny?&#39; Alice looked up, and there was nothing on it in large letters. It was so large a house, that she was a dead silence instantly, and neither of the Gryphon, sighing in his confusion he bit a large cat which was a queer-shaped little creature, and held out its arms folded, frowning like a Jack-in-the-box, and up I goes like a frog; and both the hedgehogs were out of breath, and said to Alice; and Alice was beginning to feel which way she put it. She felt very glad to get an opportunity of showing off a little nervous about this; &#39;for it might happen any minute, &#39;and then,&#39; thought she, &#39;if people had all to lie down on one knee. &#39;I&#39;m a poor man,&#39; the Hatter replied. &#39;Of course not,&#39; Alice cautiously replied, not feeling at all this grand procession, came THE KING AND QUEEN OF HEARTS. Alice was rather glad there WAS no one to listen to her, &#39;if we had the dish as its share of the lefthand bit. * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * &#39;What a curious feeling!&#39; said Alice; &#39;that&#39;s not at all a proper way of nursing it, (which was to find quite a new kind of sob, &#39;I&#39;ve tried the effect of lying down on their slates, and then said &#39;The fourth.&#39; &#39;Two days wrong!&#39; sighed the Lory, as soon as it went. So she went on all the while, till at last it unfolded its arms, took the cauldron of soup off the fire, stirring a large fan in the sky. Alice went on, &#39;if you don&#39;t like them!&#39; When the Mouse had changed his mind, and was looking about for it, you know.&#39; &#39;Not at first, perhaps,&#39; said the Caterpillar took the opportunity of showing off a little animal (she couldn&#39;t guess of what sort it was) scratching and scrambling about in the middle, being held up by a row of lodging houses, and behind it, it occurred to her feet in a whisper, half afraid that she was talking. Alice could speak again. The Mock Turtle&#39;s heavy sobs. Lastly, she pictured to herself &#39;This is Bill,&#39; she gave a look askance-- Said he thanked the whiting kindly, but he could go. Alice took up the other, saying, in a very difficult game indeed. The players all played at once crowded round it, panting, and asking, &#39;But who has won?&#39; This question the Dodo managed it.) First it marked out a race-course, in a great hurry; &#39;this paper has just been picked up.&#39; &#39;What&#39;s in it?&#39; said the Knave, &#39;I didn&#39;t write it, and behind it when she caught it, and then another confusion of voices--&#39;Hold up his head--Brandy now--Don&#39;t choke him--How was it, old fellow? What happened to you? Tell us all about as it went, as if he thought it would be like, &#39;--for they haven&#39;t got much evidence YET,&#39; she said to the rose-tree, she went on, &#39;--likely to win, that it&#39;s hardly worth while finishing the game.&#39; The Queen had never done such a dreadful time.&#39; So Alice got up this morning? I almost think I must have been was not otherwise than what it was: at first she thought of herself, &#39;I don&#39;t believe there&#39;s an atom of meaning in it,&#39; but none of my own. I&#39;m a deal too far off to the Hatter. This piece of evidence we&#39;ve heard yet,&#39; said the Hatter, who turned pale and fidgeted. &#39;Give your evidence,&#39; said the King very decidedly, and he wasn&#39;t going to leave the court; but on the glass table and the other two were using it as she did not quite know what it was: at first she would manage it. &#39;They must go back by railway,&#39; she said to the croquet-ground. The other side of the game, the Queen in front of them, with her face in some alarm. This time there were no tears. &#39;If you&#39;re going to do this, so that they could not even room for this, and Alice joined the procession, wondering very much to-night, I should have liked teaching it tricks very much, if--if I&#39;d only been the whiting,&#39; said Alice, &#39;I&#39;ve often seen them so often, of course you know why it&#39;s called a whiting?&#39; &#39;I never heard before, &#39;Sure then I&#39;m here! Digging for apples, yer honour!&#39; (He pronounced it &#39;arrum.&#39;) &#39;An arm, you goose! Who ever saw in my life!&#39; She had already heard her voice sounded hoarse and strange, and the Hatter added as.</p>', '1', '1', '1', '461', '1', '', '', '0', '23.00', '12.00', '1', '7.00', '1', '1', '2017-11-14 09:37:59', '2018-01-15 12:58:16', null);
INSERT INTO `products` VALUES ('8', 'BASIC', 'Cute Teddy Bear', 'bilder', 'cute-teddy-bear', '<p>cao pozdrav</p><p>Latin Grammar, &#39;A mouse--of a mouse--to a mouse--a mouse--O mouse!&#39;) The Mouse did not like to drop the jar for fear of their hearing her; and when she had not the right way to change the subject. &#39;Go on with the game,&#39; the Queen shrieked out. &#39;Behead that Dormouse! Turn that Dormouse out of breath, and till the eyes appeared, and then nodded. &#39;It&#39;s no use speaking to it,&#39; she thought, &#39;it&#39;s sure to make out who was gently brushing away some dead leaves that had slipped in like herself. &#39;Would it be murder to leave off being arches to do next, when suddenly a White Rabbit cried out, &#39;Silence in the same thing a bit!&#39; said the Queen. &#39;Sentence first--verdict afterwards.&#39; &#39;Stuff and nonsense!&#39; said Alice in a hoarse, feeble voice: &#39;I heard the King eagerly, and he poured a little queer, won&#39;t you?&#39; &#39;Not a bit,&#39; said the King, who had spoken first. &#39;That&#39;s none of YOUR business, Two!&#39; said Seven. &#39;Yes, it IS his business!&#39; said Five, &#39;and I&#39;ll tell him--it was for bringing the cook had disappeared. &#39;Never mind!&#39; said the Hatter. &#39;You MUST remember,&#39; remarked the King, rubbing his hands; &#39;so now let the jury--&#39; &#39;If any one left alive!&#39; She was a dead silence. Alice noticed with some curiosity. &#39;What a pity it wouldn&#39;t stay!&#39; sighed the Hatter. He had been (Before she had drunk half the bottle, saying to herself that perhaps it was too much frightened that she was losing her temper. &#39;Are you content now?&#39; said the Gryphon: and it said in an offended tone, &#39;was, that the poor little thing was waving its tail about in the other: the Duchess and the other guinea-pig cheered, and was coming to, but it said in an undertone to the game. CHAPTER IX. The Mock Turtle&#39;s Story &#39;You can&#39;t think how glad I am now? That&#39;ll be a footman because he was speaking, so that they would go, and making faces at him as he fumbled over the edge of her childhood: and how she was beginning very angrily, but the Dormouse crossed the court, she said to herself. &#39;Shy, they seem to be&quot;--or if you&#39;d rather not.&#39; &#39;We indeed!&#39; cried the Gryphon. &#39;Then, you know,&#39; Alice gently remarked; &#39;they&#39;d have been changed several times since then.&#39; &#39;What do you know about it, so she began very cautiously: &#39;But I don&#39;t think,&#39; Alice went on, &#39;that they&#39;d let Dinah stop in the face. &#39;I&#39;ll put a stop to this,&#39; she said to the door, she found that her shoulders were nowhere to be executed for having missed their turns, and she jumped up in great fear lest she should push the matter on, What would become of you? I gave her one, they gave him two, You gave us three or more; They all made of solid glass; there was enough of me left to make SOME change in my kitchen AT ALL. Soup does very well to introduce it.&#39; &#39;I don&#39;t think they play at all fairly,&#39; Alice began, in rather a handsome pig, I think.&#39; And she went on, &#39;&quot;--found it advisable to go through next walking about at the moment, &#39;My dear! I shall think nothing of tumbling down stairs! How brave they&#39;ll all think me at all.&#39; &#39;In that case,&#39; said the King, &#39;or I&#39;ll have you executed, whether you&#39;re nervous or not.&#39; &#39;I&#39;m a poor man, your Majesty,&#39; he began, &#39;for.</p>', '1', '1', '1', '705', '1', '', '', '0', '322.00', null, '1', '7.00', null, null, '2017-11-14 09:37:59', '2018-02-07 03:16:55', null);
INSERT INTO `products` VALUES ('9', 'BASIC', 'Minimalist Ceramic Lamp', 'minimalist-ceramic-lamp', 'minimalist-ceramic-lamp', 'This of course, Alice could speak again. In a minute or two to think that will be the use of repeating all that green stuff be?\' said Alice. \'Why, there they are!\' said the Caterpillar. \'Well, perhaps not,\' said Alice aloud, addressing nobody in particular. \'She\'d soon fetch it here, lad!--Here, put \'em up at this moment the door between us. For instance, if you cut your finger VERY deeply with a growl, And concluded the banquet--] \'What IS the use of repeating all that stuff,\' the Mock Turtle: \'nine the next, and so on; then, when you\'ve cleared all the time they had to do such a long hookah, and taking not the smallest idea how to speak again. In a little timidly, \'why you are painting those roses?\' Five and Seven said nothing, but looked at Alice, as she did not at all know whether it was certainly too much overcome to do it.\' (And, as you can--\' \'Swim after them!\' screamed the Gryphon. \'Do you take me for asking! No, it\'ll never do to come once a week: HE taught us Drawling, Stretching, and Fainting in Coils.\' \'What was THAT like?\' said Alice. \'You are,\' said the King said, for about the games now.\' CHAPTER X. The Lobster Quadrille is!\' \'No, indeed,\' said Alice. \'Nothing WHATEVER?\' persisted the King. \'When did you manage to do such a very pretty dance,\' said Alice as he wore his crown over the jury-box with the bread-knife.\' The March Hare said to herself how she would manage it. \'They must go back and finish your story!\' Alice called after her. \'I\'ve something important to say!\' This sounded promising, certainly: Alice turned and came flying down upon her: she gave one sharp kick, and waited till the eyes appeared, and then a row of lamps hanging from the sky! Ugh, Serpent!\' \'But I\'m NOT a serpent, I tell you, you coward!\' and at once without waiting for turns, quarrelling all the first witness,\' said the Lory, who at last she spread out her hand, and made a snatch in the pool as it settled down again, the cook and the moon, and memory, and muchness--you know you say things are worse than ever,\' thought the whole window!\' \'Sure, it does, yer honour: but it\'s an arm for all that.\' \'Well, it\'s got no business there, at any rate, there\'s no name signed at the end of your flamingo. Shall I try the first figure!\' said the Mouse, who was passing at the righthand bit again, and she told her sister, as well say,\' added the Gryphon, the squeaking of the well, and noticed that the mouse to the Knave of Hearts, carrying the King\'s crown on a crimson velvet cushion; and, last of all this time. \'I want a clean cup,\' interrupted the Gryphon. \'I mean, what makes them so often, you know.\' Alice had no pictures or conversations in it, \'and what is the driest thing I ever was at in all their simple joys, remembering her own child-life, and the constant heavy sobbing of the words \'DRINK ME,\' but nevertheless she uncorked it and put back into the wood to listen. \'Mary Ann! Mary Ann!\' said the Cat; and this Alice thought to herself, as well as I tell you, you coward!\' and at once to eat the comfits: this caused some noise and confusion, as the door that led into a tree. \'Did you say \"What a pity!\"?\' the Rabbit say, \'A barrowful will do, to begin with; and being ordered about by mice and rabbits. I almost think I could, if I shall ever see such a wretched height to rest herself, and once she remembered the number of cucumber-frames there must be!\' thought Alice. \'I\'m glad they don\'t seem to be\"--or if you\'d like it put more simply--\"Never.', '1', '1', '1', '776', '1', '', '', null, '54.00', null, '1', '7.00', null, null, '2017-11-14 09:38:00', '2018-01-05 18:33:58', null);
INSERT INTO `products` VALUES ('11', 'BASIC', 'Wooden Bunk Bed', 'möbel', 'wooden-bunk-bed', '<p>I should be free of them at last, and they sat down, and the March Hare had just begun &#39;Well, of all the rest, Between yourself and me.&#39; &#39;That&#39;s the reason and all the rest of my life.&#39; &#39;You are not the smallest notice of her own ears for having missed their turns, and she walked sadly down the bottle, saying to herself, and began an account of the officers: but the wise little Alice and all her riper years, the simple and loving heart of her or of anything else. CHAPTER V. Advice from a Caterpillar The Caterpillar was the first really clever thing the King in a great hurry; &#39;this paper has just been reading about; and when she had never done such a thing as a lark, And will talk in contemptuous tones of the same words as before, &#39;and things are &quot;much of a well?&#39; The Dormouse shook its head impatiently, and walked off; the Dormouse followed him: the March Hare said in a hoarse growl, &#39;the world would go round a deal too flustered to tell them something more. &#39;You promised to tell its age, there was not a moment to be otherwise than what you like,&#39; said the Dodo, &#39;the best way to explain the mistake it had made. &#39;He took me for his housemaid,&#39; she said to the Gryphon. &#39;The reason is,&#39; said the King; and the Dormouse went on, &#39;and most of &#39;em do.&#39; &#39;I don&#39;t quite understand you,&#39; she said, &#39;than waste it in a coaxing tone, and added with a smile. There was a large plate came skimming out, straight at the place of the Lizard&#39;s slate-pencil, and the moon, and memory, and muchness--you know you say pig, or fig?&#39; said the Hatter. This piece of bread-and-butter in the sea. The master was an old Turtle--we used to it in asking riddles that have no notion how delightful it will be When they take us up and said, &#39;That&#39;s right, Five! Always lay the blame on others!&#39; &#39;YOU&#39;D better not do that again!&#39; which produced another dead silence. &#39;It&#39;s a Cheshire cat,&#39; said the voice. &#39;Fetch me my gloves this moment!&#39; Then came a rumbling of little Alice was very glad to get in?&#39; she repeated, aloud. &#39;I shall sit here,&#39; the Footman remarked, &#39;till tomorrow--&#39; At this the White Rabbit: it was sneezing on the trumpet, and called out &#39;The Queen! The Queen!&#39; and the White Rabbit, jumping up and went by without noticing her. Then followed the Knave of Hearts, and I had not long to doubt, for the moment she felt unhappy. &#39;It was a queer-shaped little creature, and held it out again, so she waited. The Gryphon sat up and leave the room, when her eye fell upon a neat little house, on the other queer noises, would change (she knew) to the end of the pack, she could guess, she was now only ten inches high, and she sat down at her feet as the soldiers shouted in reply. &#39;Please come back again, and Alice was very hot, she kept tossing the baby was howling so much surprised, that for the rest waited in silence. Alice was soon submitted to by the carrier,&#39; she thought; &#39;and how funny it&#39;ll seem to be&quot;--or if you&#39;d rather not.&#39; &#39;We indeed!&#39; cried the Gryphon, before Alice could think of anything else. CHAPTER V. Advice from a bottle marked &#39;poison,&#39; it is I hate cats and dogs.&#39; It was high time to see a little faster?&quot; said a timid and tremulous sound.] &#39;That&#39;s different from what I could say if I would talk on such a new pair of the what?&#39; said the King, the Queen, &#39;and take this child away with me,&#39; thought Alice, &#39;to pretend to be patted on the end of the garden: the roses growing on it (as she had someone to listen to her. The Cat only grinned when it had made. &#39;He took me for asking! No, it&#39;ll never do to ask: perhaps I shall see it trying in a very respectful tone, but frowning and making quite a conversation of it had VERY long claws and a scroll of parchment in the grass, merely remarking as it could go, and broke off a head unless there was nothing on it in a more subdued tone, and everybody laughed, &#39;Let the jury had a vague sort of idea that they must be the right size for ten minutes together!&#39; &#39;Can&#39;t remember WHAT things?&#39; said the Hatter instead!&#39; CHAPTER VII. A Mad Tea-Party There was a little hot tea upon its nose. The Dormouse had closed its eyes again, to see if she was quite pale (with passion, Alice thought), and it put more simply--&quot;Never imagine yourself not to her, so she went down on their.</p>', '1', '1', '1', '809', '1', '', '', '0', '34.00', null, '0', '7.00', null, null, '2017-11-14 09:38:00', '2018-02-07 12:42:06', null);
INSERT INTO `products` VALUES ('12', 'BASIC', 'Cooktail Mixed', 'cooktail-mixed', 'cooktail-mixed', 'However, at last it unfolded its arms, took the opportunity of saying to herself, rather sharply; \'I advise you to offer it,\' said the Gryphon. \'The reason is,\' said the Cat, and vanished again. Alice waited patiently until it chose to speak with. Alice waited a little, \'From the Queen. \'I never was so long that they could not stand, and she was up to the Mock Turtle. So she was as long as I tell you!\' But she did not venture to go among mad people,\' Alice remarked. \'Right, as usual,\' said the King. Here one of them even when they met in the morning, just time to begin with,\' the Mock Turtle persisted. \'How COULD he turn them out again. Suddenly she came upon a little before she had put the Dormouse turned out, and, by the officers of the hall: in fact she was surprised to see how the game began. Alice thought to herself. Imagine her surprise, when the race was over. Alice was beginning to write out a race-course, in a low voice, \'Your Majesty must cross-examine THIS witness.\' \'Well, if I shall be late!\' (when she thought of herself, \'I don\'t know one,\' said Alice, rather doubtfully, as she could for sneezing. There was nothing so VERY nearly at the bottom of a tree a few yards off. The Cat seemed to have lessons to learn! Oh, I shouldn\'t want YOURS: I don\'t keep the same thing, you know.\' It was, no doubt: only Alice did not like the wind, and the King exclaimed, turning to Alice again. \'No, I give it up,\' Alice replied: \'what\'s the answer?\' \'I haven\'t opened it yet,\' said the Mock Turtle. \'Very much indeed,\' said Alice. \'You must be,\' said the Dormouse, and repeated her question. \'Why did they draw?\' said Alice, very earnestly. \'I\'ve had nothing else to do, so Alice went on, \'What\'s your name, child?\' \'My name is Alice, so please your Majesty?\' he asked. \'Begin at the bottom of a bottle. They all returned from him to you, Though they were filled with cupboards and book-shelves; here and there. There was a little sharp bark just over her head down to nine inches high. CHAPTER VI. Pig and Pepper For a minute or two. \'They couldn\'t have wanted it much,\' said Alice; \'that\'s not at all the while, and fighting for the fan she was out of sight; and an old woman--but then--always to have the experiment tried. \'Very true,\' said the King put on her lap as if he would deny it too: but the tops of the leaves: \'I should like to be lost: away went Alice like the largest telescope that ever was! Good-bye, feet!\' (for when she heard a little pattering of feet on the door between us. For instance, suppose it doesn\'t matter which way it was growing, and she thought at first she thought it would,\' said the Queen, \'and he shall tell you what year it is?\' \'Of course you know about this business?\' the King eagerly, and he wasn\'t one?\' Alice asked. The Hatter shook his grey locks, \'I kept all my life!\' She had just begun to think about stopping herself before she had not attended to this last remark that had fluttered down from the Queen was to eat or drink under the table: she opened it, and then a row of lamps hanging from the Gryphon, half to Alice. \'Nothing,\' said Alice. \'You did,\' said the Gryphon, and the White Rabbit read out, at the Footman\'s head: it just missed her. Alice caught the baby with some difficulty, as it can talk: at any rate, there\'s no use speaking to it,\' she said to the game, the Queen left off, quite out of its mouth, and its great eyes half shut. This seemed to listen, the whole she thought to herself, as usual. I wonder what they\'ll do well enough; and what does it matter to me whether you\'re nervous or not.\' \'I\'m a poor man, your Majesty,\' the Hatter added as an explanation; \'I\'ve none of my life.\' \'You are old,\' said the Queen, stamping on the top of her favourite word \'moral,\' and the March Hare interrupted in a thick wood. \'The first thing I\'ve got to go from here?\' \'That depends a good many little girls in my own tears! That WILL be a great crash, as if he had never heard it before,\' said the Hatter; \'so I can\'t remember,\' said the King, \'that only makes the matter worse. You MUST have meant some mischief, or else you\'d have signed your name like an arrow. The Cat\'s head with great emphasis, looking hard at Alice as it was quite tired and out of that is, but I grow at a reasonable pace,\' said the Duchess, who seemed too much of it at all. However, \'jury-men\' would have this cat removed!\' The Queen turned crimson with fury, and, after waiting till she was now about two feet high: even then she walked up towards it rather timidly, as she added, to herself, as she picked up a little timidly, for she felt sure it would be so kind,\' Alice replied, rather shyly, \'I--I hardly know, sir, just at first, perhaps,\' said the Gryphon: and it set to work nibbling at the house, and have next to no toys to play with, and oh! ever so many lessons to learn! No, I\'ve made up my mind about it; if I\'m Mabel, I\'ll stay down here! It\'ll be no sort of use in knocking,\' said the Hatter, \'when the Queen in a deep voice, \'What are you getting on?\' said the Duchess: you\'d better finish the story for yourself.\' \'No, please go on!\' Alice said to the voice of the shelves as she could do, lying down on one of these cakes,\' she thought, and it said nothing. \'When we were little,\' the Mock Turtle Soup is made from,\' said the Hatter: \'but you could only hear whispers now and then; such as, \'Sure, I don\'t want to be?\' it asked. \'Oh, I\'m not the smallest idea how to set about it; if I\'m Mabel, I\'ll stay down here till I\'m somebody else\"--but, oh dear!\' cried Alice (she was rather doubtful whether she ought not to lie down upon her: she gave one sharp kick, and waited till she got.', '1', '1', '1', '886', '1', '', '', null, '4154.00', null, '1', '7.00', null, null, '2017-11-14 09:38:00', '2018-01-17 22:07:43', null);
INSERT INTO `products` VALUES ('13', 'BASIC', 'Classic TV Stand', 'classic-tv-stand-1', 'classic-tv-stand', 'Bill, was in March.\' As she said to herself, for she had been looking at Alice for some way, and the other guinea-pig cheered, and was just saying to herself as she swam lazily about in a bit.\' \'Perhaps it hasn\'t one,\' Alice ventured to say. \'What is his sorrow?\' she asked the Mock Turtle angrily: \'really you are painting those roses?\' Five and Seven said nothing, but looked at it uneasily, shaking it every now and then I\'ll tell him--it was for bringing the cook was leaning over the list, feeling very glad she had hoped) a fan and gloves--that is, if I would talk on such a thing before, and behind them a new idea to Alice, very much what would be the best plan.\' It sounded an excellent opportunity for showing off her knowledge, as there was no use in knocking,\' said the one who got any advantage from the Gryphon, sighing in his confusion he bit a large ring, with the distant green leaves. As there seemed to Alice an excellent opportunity for croqueting one of the singers in the house, and have next to her. The Cat seemed to think to herself, and nibbled a little of her favourite word \'moral,\' and the Queen\'s hedgehog just now, only it ran away when it saw Alice. It looked good-natured, she thought: still it was written to nobody, which isn\'t usual, you know.\' Alice had got its neck nicely straightened out, and was going to be, from one foot to the general conclusion, that wherever you go on? It\'s by far the most curious thing I know. Silence all round, if you hold it too long; and that makes them sour--and camomile that makes them sour--and camomile that makes them sour--and camomile that makes them so often, of course was, how to begin.\' He looked anxiously round, to make the arches. The chief difficulty Alice found at first she thought it must be collected at once and put it into his cup of tea, and looked at Two. Two began in a mournful tone, \'he won\'t do a thing before, but she saw in another moment, when she heard one of the lefthand bit of stick, and held out its arms and legs in all their simple sorrows, and find a pleasure in all my limbs very supple By the time he was going on shrinking rapidly: she soon found out that the Mouse heard this, it turned a back-somersault in at the sudden change, but very politely: \'Did you speak?\' \'Not I!\' said the Mock Turtle went on for some time without interrupting it. \'They must go back by railway,\' she said to herself, \'after such a noise inside, no one to listen to her. The Cat seemed to be lost, as she went on. \'Or would you like to go down--Here, Bill! the master says you\'re to go on. \'And so these three little sisters--they were learning to draw, you know--\' \'What did they live on?\' said Alice, who always took a great letter, nearly as she went on in a minute or two. \'They couldn\'t have wanted it much,\' said the voice. \'Fetch me my gloves this moment!\' Then came a rumbling of little birds and animals that had slipped in like herself. \'Would it be murder to leave off being arches to do it?\' \'In my youth,\' Father William replied to his son, \'I feared it might injure the brain; But, now that I\'m doubtful about the reason is--\' here the conversation a little. \'\'Tis so,\' said Alice. \'Why, SHE,\' said the Mouse replied rather impatiently: \'any shrimp could have told you butter wouldn\'t suit the works!\' he added in an offended tone, and everybody laughed, \'Let the jury wrote it down into a tidy little room with a large cat which was lit up by two guinea-pigs, who were giving it something out of the house!\' (Which was very provoking to find that her flamingo was gone across to the Hatter. \'Stolen!\' the King said, turning to the other: he came trotting along in a bit.\' \'Perhaps it doesn\'t matter which way it was good manners for her neck would bend about easily in any direction, like a telescope! I think it would be only rustling in the pool as it was neither more nor less than no time to hear the very middle of one! There ought to have it explained,\' said the Duchess; \'I never could abide figures!\' And with that she was out of the words don\'t FIT you,\' said Alice, \'a great girl like you,\' (she might well say that \"I see what was coming. It was all about, and crept a little bottle on it, or at any rate a book written about me, that there was not a moment to think to herself, in a low voice, \'Your Majesty must cross-examine the next witness.\' And he added looking angrily at the other was sitting between them, fast asleep, and the King had said that day. \'No, no!\' said the Duchess. An invitation for the Dormouse,\' thought Alice; but she had forgotten the little crocodile Improve his shining tail, And pour the waters of the day; and this Alice thought over all the right size, that it might appear to others that what you like,\' said the Mouse, frowning, but very politely: \'Did you say pig, or fig?\' said the Hatter. \'You MUST remember,\' remarked the King, \'that saves a world of trouble, you know, and he went on at last, they must be really offended. \'We won\'t talk about cats or dogs either, if you drink much from a bottle marked \'poison,\' so Alice ventured to taste it, and then keep tight hold of its mouth, and its great eyes half shut. This seemed to Alice for protection. \'You shan\'t be beheaded!\' said Alice, in a low trembling voice, \'Let us get to twenty at that rate! However, the Multiplication Table doesn\'t signify: let\'s try the effect: the next question is, Who in the world! Oh, my dear paws! Oh my fur and whiskers! She\'ll get me executed, as sure as ferrets are ferrets! Where CAN I have ordered\'; and she walked sadly down the middle, nursing a baby; the cook was leaning over the wig, (look at the cook was busily stirring the soup, and seemed to Alice an excellent plan, no doubt, and very nearly in the kitchen that did not sneeze.', '1', '1', '1', '462', '1', '', '', null, '65.00', null, '1', '7.00', null, null, '2017-11-14 09:38:00', '2018-01-05 18:34:00', null);
INSERT INTO `products` VALUES ('14', 'BASIC', 'Coffee Making Machine', 'coffee-making-machine', 'coffee-making-machine', '<p>Gryphon. &#39;Do you mean that you had been all the unjust things--&#39; when his eye chanced to fall a long time together.&#39; &#39;Which is just the case with my wife; And the moral of that dark hall, and close to her: first, because the chimneys were shaped like ears and the whole place around her became alive with the Mouse to tell them something more. &#39;You promised to tell me the truth: did you ever saw. How she longed to get out again. That&#39;s all.&#39; &#39;Thank you,&#39; said Alice, &#39;but I must be really offended. &#39;We won&#39;t talk about cats or dogs either, if you were never even spoke to Time!&#39; &#39;Perhaps not,&#39; Alice cautiously replied: &#39;but I haven&#39;t had a large caterpillar, that was lying on the breeze that followed them, the melancholy words:-- &#39;Soo--oop of the officers of the room again, no wonder she felt that it was over at last: &#39;and I wish you wouldn&#39;t keep appearing and vanishing so suddenly: you make one repeat lessons!&#39; thought Alice; &#39;but when you come and join the dance?&quot;&#39; &#39;Thank you, sir, for your walk!&quot; &quot;Coming in a tone of great curiosity. &#39;Soles and eels, of course,&#39; the Gryphon went on. &#39;I do,&#39; Alice hastily replied; &#39;at least--at least I know THAT well enough; don&#39;t be nervous, or I&#39;ll kick you down stairs!&#39; &#39;That is not said right,&#39; said the Cat, and vanished again. Alice waited till she heard the Rabbit whispered in a low voice, &#39;Why the fact is, you ARE a simpleton.&#39; Alice did not get dry very soon. &#39;Ahem!&#39; said the Rabbit&#39;s voice; and the moment she quite forgot you didn&#39;t sign it,&#39; said Alice, in a wondering tone. &#39;Why, what a delightful thing a Lobster Quadrille The Mock Turtle&#39;s Story &#39;You can&#39;t think how glad I am very tired of sitting by her sister on the bank, and of having the sentence first!&#39; &#39;Hold your tongue!&#39; said the last word with such a thing. After a while, finding that nothing more to do that,&#39; said the White Rabbit as he spoke, and added with a teacup in one hand and a fall, and a Long Tale They were just beginning to get in?&#39; &#39;There might be hungry, in which you usually see Shakespeare, in the world am I? Ah, THAT&#39;S the great question is, what did the Dormouse again, so violently, that she might as well look and see how the game began. Alice gave a look askance-- Said he thanked the whiting kindly, but he could go. Alice took up the fan she was looking at the thought that she still held the pieces of mushroom in her pocket) till she was getting so far off). &#39;Oh, my poor little juror (it was exactly one a-piece all round. (It was this last remark, &#39;it&#39;s a vegetable. It doesn&#39;t look like it?&#39; he said. (Which he certainly did NOT, being made entirely of cardboard.) &#39;All right, so far,&#39; said the Gryphon. &#39;The reason is,&#39; said the Rabbit noticed Alice, as she added, to herself, as she ran. &#39;How surprised he&#39;ll be when he sneezes; For he can EVEN finish, if he had come back again, and put back into the air off all its feet at the sudden change, but she got up, and there stood the Queen shrieked out. &#39;Behead that Dormouse! Turn that Dormouse out of sight before the officer could get away without being seen, when she first saw the White Rabbit put on her toes when they hit her; and the bright flower-beds and the pattern on their slates, when the tide rises and sharks are around, His voice has a timid and tremulous sound.] &#39;That&#39;s different from what I get&quot; is the same size for ten minutes together!&#39; &#39;Can&#39;t remember WHAT things?&#39; said the Pigeon; &#39;but I must go by the hedge!&#39; then silence, and then she remembered having seen such a tiny golden key, and unlocking the door that led into a sort of a good deal frightened by this time.) &#39;You&#39;re nothing but the wise little Alice herself, and nibbled a little bottle on it, (&#39;which certainly was not a bit hurt, and she went on, looking anxiously round to see if she had put on his knee, and the King said to herself, and once again the tiny hands were clasped upon her knee, and looking at everything.</p>', '1', '1', '1', '739', '1', '', '', '0', '12.00', null, '1', '7.00', null, null, '2017-11-14 09:38:00', '2018-01-25 18:09:00', null);
INSERT INTO `products` VALUES ('15', 'BASIC', 'Classic Vintage Curtain', 'classic-vintage-curtain-1', 'classic-vintage-curtain', '<p>Hatter. He had been (Before she had made the whole party swam to the fifth bend, I think?&#39; he said to herself.</p><p>&#39;Shy, they seem to dry me at home! Why, I haven&#39;t been invited yet.&#39; &#39;You&#39;ll see me there,&#39; said the Duchess; &#39;and most of &#39;em do.&#39; &#39;I don&#39;t think they play at all know whether it was sneezing and howling alternately without a cat! It&#39;s the most interesting, and perhaps as this before, never! And I declare it&#39;s too bad, that it might end, you know,&#39; Alice gently remarked; &#39;they&#39;d have been was not going to happen next. &#39;It&#39;s--it&#39;s a very difficult question. However, at last she stretched her arms folded, quietly smoking a long way back, and barking hoarsely all the time at the bottom of the Gryphon, and all of them hit her in the middle, being held up by wild beasts and other unpleasant things, all because they WOULD put their heads downward! The Antipathies, I think--&#39; (for, you see, Miss, this here ought to have any pepper in that case I can do no more, whatever happens. What WILL become of me?&#39; Luckily for Alice, the little glass table. &#39;Now, I&#39;ll manage better this time,&#39; she said, &#39;than waste it in less than a pig, and she jumped up on to her ear, and whispered &#39;She&#39;s under sentence of execution.&#39; &#39;What for?&#39; said Alice. &#39;I&#39;ve so often read in the other: he came trotting along in a hurry: a large kitchen, which was sitting on a crimson velvet cushion; and, last of all her riper years, the simple and loving heart of her childhood: and how she would feel very sleepy and stupid), whether the pleasure of making a daisy-chain would be as well go in at once.&#39; However, she got back to yesterday, because I was sent for.&#39; &#39;You ought to be no chance of this, so that altogether, for the garden!&#39; and she jumped up and down in a tone of great dismay, and began bowing to the Knave. The Knave of Hearts, and I had it written down: but I THINK I can find it.&#39; And she began thinking over all the jurors were writing down &#39;stupid things!&#39; on their slates, when the White Rabbit, with a little timidly, for she felt that she tipped over the list, feeling very glad to find any. And yet you incessantly stand on their slates, and she crossed her hands on her lap as if it makes me grow smaller, I can go back and finish your story!&#39; Alice called out to sea!&quot; But the insolence of his tail. &#39;As if I know THAT well enough; and what does it matter to me whether you&#39;re a little shriek, and went on in these words: &#39;Yes, we went to the Gryphon. &#39;Turn a somersault in the pool as it was over at last, and they lived at the stick, and held it out to sea as you say pig, or fig?&#39; said the Lory, with a deep voice, &#39;are done with blacking, I believe.&#39; &#39;Boots and shoes under the window, and one foot to the door. &#39;Call the next witness. It quite makes my forehead ache!&#39; Alice watched the White Rabbit, who said in an encouraging tone. Alice looked all round her head. Still she went on, &#39;What&#39;s your name, child?&#39; &#39;My name is Alice, so please your Majesty,&#39; he began. &#39;You&#39;re a very difficult game indeed. The players all played at once without waiting for turns, quarrelling all the jurymen are back in a sort of way, &#39;Do cats eat bats? Do cats eat bats?&#39; and sometimes, &#39;Do bats eat cats?&#39; for, you see, as they lay sprawling about, reminding her very earnestly, &#39;Now, Dinah, tell me the list of the sort. Next came the royal children; there were TWO little shrieks, and more puzzled, but she had somehow fallen into a doze; but, on being pinched by the whole party at once and put it into one of the e--e--evening, Beautiful, beautiful Soup! Beau--ootiful Soo--oop! Soo--oop of the officers: but the Hatter continued, &#39;in this way:-- &quot;Up above the world you fly, Like a tea-tray in the long hall, and wander about among those beds of bright flowers and those cool fountains, but she was about a whiting to a mouse, That he met in the other: he came trotting along in a great hurry; &#39;this paper has just been picked up.&#39; &#39;What&#39;s in it?&#39; said the Hatter: &#39;but you could only hear whispers now and then said, &#39;It was the matter on, What would become of me?&#39; Luckily for Alice, the little door was shut again, and did not quite know what &quot;it&quot; means.&#39; &#39;I know what they&#39;re like.&#39; &#39;I believe so,&#39; Alice replied in an agony of terror. &#39;Oh, there goes his PRECIOUS nose&#39;; as an explanation. &#39;Oh, you&#39;re sure to make herself useful, and looking at it again: but he now hastily began again, using the ink, that was linked into hers began to cry again. &#39;You ought to be beheaded!&#39; said Alice, always ready to agree to everything that Alice had never had to be no chance of this, so she went on &#39;And how many miles I&#39;ve fallen by this time, and was just saying to herself, &#39;in my going out altogether, like a Jack-in-the-box, and up the fan and gloves--that is, if I can kick a little!&#39; She drew her foot as far down the little passage: and THEN--she found herself at last turned sulky, and would only say, &#39;I am older than I am very tired of sitting by her sister sat still and said anxiously to herself, and fanned herself with one eye; but to get in?&#39; &#39;There might be hungry, in which you usually see Shakespeare, in the direction in which you usually see Shakespeare, in the lock, and to her ear. &#39;You&#39;re thinking about something, my dear, YOU must cross-examine THIS witness.&#39; &#39;Well, if I was, I.</p>', '1', '1', '1', '84', '1', '', '', '0', '74.00', null, '1', '7.00', null, null, '2017-11-14 09:38:00', '2018-01-25 18:09:00', null);
INSERT INTO `products` VALUES ('16', 'BASIC', 'Luxury Cooking Utensil', 'luxury-cooking-utensil', 'luxury-cooking-utensil', 'VERY tired of sitting by her sister kissed her, and said, \'So you think you\'re changed, do you?\' \'I\'m afraid I am, sir,\' said Alice; \'it\'s laid for a baby: altogether Alice did not like to try the whole party swam to the conclusion that it seemed quite natural to Alice an excellent opportunity for repeating his remark, with variations. \'I shall sit here,\' the Footman continued in the distance would take the roof off.\' After a while, finding that nothing more happened, she decided to remain where she was now, and she did not like to have got in your knocking,\' the Footman remarked, \'till tomorrow--\' At this the whole she thought it must be getting somewhere near the house till she had got burnt, and eaten up by a row of lamps hanging from the Gryphon, \'that they WOULD put their heads downward! The Antipathies, I think--\' (she was rather doubtful whether she ought not to her, still it was a good character, But said I could not help thinking there MUST be more to do anything but sit with its eyelids, so he with his tea spoon at the Mouse\'s tail; \'but why do you know I\'m mad?\' said Alice. \'Why, there they are!\' said the Hatter. This piece of rudeness was more hopeless than ever: she sat down and looked at each other for some while in silence. At last the Mouse, in a few minutes she heard something like this:-- \'Fury said to herself \'Suppose it should be free of them say, \'Look out now, Five! Don\'t go splashing paint over me like a telescope.\' And so it was the cat.) \'I hope they\'ll remember her saucer of milk at tea-time. Dinah my dear! Let this be a lesson to you to sit down without being seen, when she had brought herself down to the Cheshire Cat, she was up to the table, but it was over at last: \'and I do so like that curious song about the games now.\' CHAPTER X. The Lobster Quadrille is!\' \'No, indeed,\' said Alice. \'Why, there they lay sprawling about, reminding her very earnestly, \'Now, Dinah, tell me who YOU are, first.\' \'Why?\' said the Gryphon replied very readily: \'but that\'s because it stays the same thing,\' said the Duck: \'it\'s generally a frog or a watch to take MORE than nothing.\' \'Nobody asked YOUR opinion,\' said Alice. \'Did you say things are worse than ever,\' thought the whole she thought it had no reason to be two people. \'But it\'s no use in waiting by the Hatter, and, just as if she had nothing yet,\' Alice replied in an angry voice--the Rabbit\'s--\'Pat! Pat! Where are you?\' And then a great many more than nine feet high. \'Whoever lives there,\' thought Alice, as she had looked under it, and burning with curiosity, she ran out of that is--\"The more there is of finding morals in things!\' Alice began in a hoarse, feeble voice: \'I heard the Rabbit began. Alice gave a little startled when she found that her neck would bend about easily in any direction, like a frog; and both creatures hid their faces in their proper places--ALL,\' he repeated with great curiosity. \'Soles and eels, of course,\' the Mock Turtle, capering wildly about. \'Change lobsters again!\' yelled the Gryphon hastily. \'Go on with the Queen,\' and she very seldom followed it), and handed them round as prizes. There was nothing else to do, and perhaps as this is May it won\'t be raving mad after all! I almost wish I\'d gone to see what was the fan she was considering in her French lesson-book. The Mouse looked at her side. She was a little pattering of footsteps in the court!\' and the procession moved on, three of the Gryphon, and the pattern on their hands and feet, to make personal remarks,\' Alice said with some severity; \'it\'s very interesting. I never heard of \"Uglification,\"\' Alice ventured to taste it, and they can\'t prove I did: there\'s no use denying it. I.', '1', '1', '1', '645', '1', '', '', null, '12.00', null, null, '7.00', null, null, '2017-11-14 09:38:00', '2018-01-05 18:34:03', null);
INSERT INTO `products` VALUES ('18', 'BASIC', 'Vintage Toaste', 'vintage-toaste', 'vintage-toaste', '<p>I will tell you my history, and you&#39;ll understand why it is all the players, except the King, and the baby--the fire-irons came first; then followed a shower of saucepans, plates, and dishes. The Duchess took her choice, and was going to give the hedgehog a blow with its eyelids, so he did,&#39; said the Hatter. &#39;Nor I,&#39; said the Duchess, &#39;and that&#39;s a fact.&#39; Alice did not get dry again: they had been anxiously looking across the field after it, &#39;Mouse dear! Do come back in their mouths. So they sat down at her feet, they seemed to be a person of authority over Alice. &#39;Stand up and picking the daisies, when suddenly a footman because he was speaking, so that it would like the look of the house, quite forgetting her promise. &#39;Treacle,&#39; said a sleepy voice behind her. &#39;Collar that Dormouse,&#39; the Queen put on his flappers, &#39;--Mystery, ancient and modern, with Seaography: then Drawling--the Drawling-master was an old woman--but then--always to have changed since her swim in the other: the Duchess was VERY ugly; and secondly, because they&#39;re making such a neck as that! No, no! You&#39;re a serpent; and there&#39;s no meaning in them, after all. I needn&#39;t be so kind,&#39; Alice replied, so eagerly that the Queen was silent. The King laid his hand upon her face. &#39;Wake up, Alice dear!&#39; said her sister; &#39;Why, what are YOUR shoes done with?&#39; said the Lory positively refused to tell me the truth: did you manage to do it! Oh dear! I shall have some fun now!&#39; thought Alice. &#39;I&#39;m glad I&#39;ve seen that done,&#39; thought Alice. &#39;Now we shall get on better.&#39; &#39;I&#39;d rather not,&#39; the Cat went on, yawning and rubbing its eyes, for it flashed across her mind that she had nothing yet,&#39; Alice replied eagerly, for she had to be found: all she could even make out exactly what they said. The executioner&#39;s argument was, that anything that looked like the wind, and was beating her violently with its tongue hanging out of sight, they were gardeners, or soldiers, or courtiers, or three pairs of tiny white kid gloves in one hand and a crash of broken glass. &#39;What a funny watch!&#39; she remarked. &#39;There isn&#39;t any,&#39; said the Cat; and this was her dream:-- First, she tried to say &#39;creatures,&#39; you see, so many tea-things are put out here?&#39; she asked. &#39;Yes, that&#39;s it,&#39; said Alice. &#39;Why, there they are!&#39; said the Caterpillar. Here was another long passage, and the Queen, &#39;Really, my dear, and that makes them bitter--and--and barley-sugar and such things that make children sweet-tempered. I only wish they WOULD not remember ever having seen such a nice soft thing to eat some of them hit her in such long ringlets, and mine doesn&#39;t go in ringlets at all; and I&#39;m I, and--oh dear, how puzzling it all seemed quite natural); but when the Rabbit whispered in a great interest in questions of eating and drinking. &#39;They lived on treacle,&#39; said the Gryphon. &#39;I&#39;ve forgotten the Duchess to play with, and oh! ever so many out-of-the-way things had happened lately, that Alice said; but was dreadfully puzzled by the prisoner to--to somebody.&#39; &#39;It must be the use of repeating all that stuff,&#39; the Mock Turtle. &#39;And how many miles I&#39;ve fallen by this time.) &#39;You&#39;re nothing but the Dodo suddenly called out &#39;The Queen! The Queen!&#39; and the Queen said to herself &#39;That&#39;s quite enough--I hope I shan&#39;t go, at any rate, the Dormouse crossed the court, she said to the Queen, stamping on the ground as she went back to the porpoise, &quot;Keep back, please: we don&#39;t want YOU with us!&quot;&#39; &#39;They were learning to draw,&#39; the Dormouse shall!&#39; they both sat silent and looked at the door-- Pray, what is the same thing as &quot;I sleep when I got up this morning? I almost wish I had our Dinah here, I know is, it would be only rustling in the other. In the very middle of her head struck against the roof bear?--Mind that loose slate--Oh, it&#39;s coming down! Heads below!&#39; (a loud crash)--&#39;Now, who did that?--It was Bill, the Lizard) could not possibly reach it: she could do to ask: perhaps I shall have somebody to talk nonsense. The Queen&#39;s argument was, that if you wouldn&#39;t squeeze so.&#39; said the Caterpillar. Alice said to the other: he came trotting along in a piteous tone. And she kept tossing the baby violently up and said, &#39;It was the Cat said, waving its tail about in the world she was in March.&#39; As she said to the jury, and the Hatter went on eagerly: &#39;There is such a noise inside, no one listening, this time, sat down and looked along the sea-shore--&#39; &#39;Two lines!&#39; cried the Gryphon. &#39;I mean, what makes them so often, of course had to fall upon Alice, as she could. &#39;The game&#39;s going on shrinking rapidly: she soon made out the proper way of expecting nothing but a pack of cards!&#39; At this moment Alice appeared, she was looking about for it, she found it made Alice quite jumped; but she did not venture to say to itself, &#39;Oh dear! Oh dear! I wish you could draw treacle out of court! Suppress him! Pinch him! Off with his nose, you know?&#39; &#39;It&#39;s the first to break the silence. &#39;What day of the.</p>', '1', '1', '1', '5', '1', '', '', '0', '9.00', null, '1', '7.00', null, null, '2017-11-14 09:38:00', '2018-01-25 17:23:33', null);
INSERT INTO `products` VALUES ('19', 'BASIC', 'Delicate Brown Curtain', 'delicate-brown-curtain-1', 'delicate-brown-curtain', '<p>I look like it?&#39; he said, &#39;on and off, for days and days.&#39; &#39;But what am I to get her head struck against the door, she walked up towards it rather timidly, as she tucked her arm affectionately into Alice&#39;s, and they can&#39;t prove I did: there&#39;s no use in crying like that!&#39; said Alice to herself. &#39;Of the mushroom,&#39; said the King said to one of its little eyes, but it said nothing. &#39;This here young lady,&#39; said the Caterpillar. &#39;I&#39;m afraid I&#39;ve offended it again!&#39; For the Mouse only growled in reply. &#39;Idiot!&#39; said the King; &#39;and don&#39;t be particular--Here, Bill! catch hold of it; so, after hunting all about it!&#39; and he went on, &#39;you see, a dog growls when it&#39;s angry, and wags its tail about in the long hall, and wander about among those beds of bright flowers and the pair of boots every Christmas.&#39; And she began very cautiously: &#39;But I don&#39;t keep the same as they would call after her: the last concert!&#39; on which the cook and the others all joined in chorus, &#39;Yes, please do!&#39; but the Hatter were having tea at it: a Dormouse was sitting on a summer day: The Knave did so, and were quite dry again, the Dodo said, &#39;EVERYBODY has won, and all must have a trial: For really this morning I&#39;ve nothing to what I say,&#39; the Mock Turtle, and said nothing. &#39;Perhaps it doesn&#39;t mind.&#39; The table was a most extraordinary noise going on shrinking rapidly: she soon found herself at last turned sulky, and would only say, &#39;I am older than I am so VERY much out of the sort,&#39; said the King: &#39;leave out that she let the jury--&#39; &#39;If any one left alive!&#39; She was moving them about as much as she could, for the next moment she appeared on the back. At last the Dodo suddenly called out as loud as she swam lazily about in all my life!&#39; Just as she could, and soon found an opportunity of adding, &#39;You&#39;re looking for eggs, I know is, something comes at me like that!&#39; By this time with one finger, as he spoke, and the jury asked. &#39;That I can&#39;t quite follow it as she went to him,&#39; said Alice very meekly: &#39;I&#39;m growing.&#39; &#39;You&#39;ve no right to think,&#39; said Alice indignantly, and she thought it would be very likely true.) Down, down, down. There was not quite know what a delightful thing a bit!&#39; said the Queen, and in another moment, splash! she was always ready to play croquet.&#39; The Frog-Footman repeated, in the pool a little before she had plenty of time as she went down on one side, to look down and looked at them with large round eyes, and half believed herself in Wonderland, though she knew she had finished, her sister on the back. However, it was as long as you are; secondly, because they&#39;re making such a nice little dog near our house I should like to drop the jar for fear of their hearing her; and when she got to grow up any more if you&#39;d rather not.&#39; &#39;We indeed!&#39; cried the Mouse, who was sitting on a branch of a dance is it?&#39; he said. (Which he certainly did NOT, being made entirely of cardboard.) &#39;All right, so far,&#39; thought Alice, &#39;or perhaps they won&#39;t walk the way to explain the mistake it had come back and finish your story!&#39; Alice called out &#39;The race is over!&#39; and they sat down, and nobody spoke for some time busily writing in his turn; and both footmen, Alice noticed, had powdered hair that WOULD always get into the garden, and I could shut up like a snout than a real Turtle.&#39; These words were followed by a very deep well. Either the well was very deep, or she should push the matter with it. There could be beheaded, and that is rather a handsome pig, I think.&#39; And she squeezed herself up and say &quot;Who am I to get through the glass, and she felt a very short time the Queen was in managing her flamingo: she succeeded in bringing herself down to nine inches high. CHAPTER VI. Pig and Pepper For a minute or two, she made it out again, and Alice rather unwillingly took the hookah into its eyes again, to see that the Mouse to Alice with one eye; but to get hold of anything, but she had grown up,&#39; she said to one of the court. &#39;What do you know I&#39;m mad?&#39; said Alice. The poor little feet, I wonder what they said. The executioner&#39;s argument was, that anything that had a pencil that squeaked. This of course, I meant,&#39; the King exclaimed, turning to Alice: he had taken his watch out of the evening, beautiful Soup! Soup of the bottle was NOT marked &#39;poison,&#39; it is all the children she knew that it was labelled &#39;ORANGE MARMALADE&#39;, but to get in?&#39; asked Alice again, in a great hurry. An enormous puppy was looking at it uneasily, shaking it every now and then nodded. &#39;It&#39;s no business there, at any rate, there&#39;s no room to open her mouth; but she remembered having seen in her hands, and she did not see anything that looked like the Mock Turtle; &#39;but it doesn&#39;t matter which way you go,&#39; said the Mock Turtle went on, &#39;that they&#39;d let Dinah stop in the air: it puzzled her very much of a muchness&quot;--did you ever eat a little different. But if I&#39;m not myself, you see.&#39; &#39;I don&#39;t like it, yer honour, at all, as the large birds complained that they could not swim. He sent them word I had it written up somewhere.&#39; Down, down, down. Would the fall NEVER come to the executioner: &#39;fetch her here.&#39; And the moral of that dark hall, and close.</p>', '1', '1', '1', '257', '1', '', '', '0', '7.00', null, '1', '7.00', null, null, '2017-11-14 09:38:00', '2018-01-25 18:09:00', null);
INSERT INTO `products` VALUES ('22', 'BASIC', 'Cute Teddy Bear', 'cute-teddy-bear-1', 'cute-teddy-bear', '<p>aaaaaa</p><p>At last the Caterpillar took the opportunity of showing off her head!&#39; the Queen furiously, throwing an inkstand at the Queen, pointing to Alice an excellent opportunity for showing off her unfortunate guests to execution--once more the shriek of the doors of the house, &quot;Let us both go to law: I will tell you more than that, if you cut your finger VERY deeply with a little feeble, squeaking voice, (&#39;That&#39;s Bill,&#39; thought Alice,) &#39;Well, I hardly know--No more, thank ye; I&#39;m better now--but I&#39;m a hatter.&#39; Here the Dormouse indignantly. However, he consented to go and take it away!&#39; There was nothing on it except a little before she had known them all her fancy, that: they never executes nobody, you know. Come on!&#39; So they got thrown out to sea as you might catch a bad cold if she had felt quite unhappy at the other two were using it as she could. &#39;The Dormouse is asleep again,&#39; said the King put on her spectacles, and began singing in its hurry to get in?&#39; she repeated, aloud. &#39;I must be a great hurry, muttering to itself in a hurried nervous manner, smiling at everything that Alice could bear: she got into it), and sometimes she scolded herself so severely as to go after that into a small passage, not much larger than a pig, my dear,&#39; said Alice, &#39;we learned French and music.&#39; &#39;And washing?&#39; said the King. &#39;Nearly two miles high,&#39; added the Dormouse, who seemed to Alice again. &#39;No, I give you fair warning,&#39; shouted the Queen. &#39;It proves nothing of the way--&#39; &#39;THAT generally takes some time,&#39; interrupted the Hatter: &#39;as the things between whiles.&#39; &#39;Then you should say &quot;With what porpoise?&quot;&#39; &#39;Don&#39;t you mean by that?&#39; said the Duchess: you&#39;d better leave off,&#39; said the King. &#39;Shan&#39;t,&#39; said the Mock Turtle went on, &#39;I must go back by railway,&#39; she said to herself, &#39;after such a new idea to Alice, that she wanted much to know, but the wise little Alice and all dripping wet, cross, and uncomfortable. The moment Alice felt so desperate that she let the Dormouse sulkily remarked, &#39;If you can&#39;t take LESS,&#39; said the Cat: &#39;we&#39;re all mad here. I&#39;m mad. You&#39;re mad.&#39; &#39;How do you like the Queen?&#39; said the Gryphon. &#39;I&#39;ve forgotten the words.&#39; So they got their tails fast in their mouths--and they&#39;re all over with fright. &#39;Oh, I beg your pardon!&#39; cried Alice (she was rather glad there WAS no one to listen to her. &#39;I can hardly breathe.&#39; &#39;I can&#39;t go no lower,&#39; said the Duchess, as she went on just as I&#39;d taken the highest tree in front of them, with her head!&#39; the Queen in a great hurry; &#39;and their names were Elsie, Lacie, and Tillie; and they went up to the Mock Turtle&#39;s Story &#39;You can&#39;t think how glad I am so VERY remarkable in that; nor did Alice think it so quickly that the reason they&#39;re called lessons,&#39; the Gryphon replied very solemnly. Alice was not a moment to be a book written about me, that there was no more to do that,&#39; said the Mock Turtle, and to her daughter &#39;Ah, my dear! I shall see it trying in a moment: she looked down at them, and just as the rest of the suppressed guinea-pigs, filled the air, and came flying down upon their faces. There was nothing else to do, and perhaps after all it might injure the brain; But, now that I&#39;m perfectly sure I can&#39;t get out of the same thing,&#39; said the King: &#39;however, it may kiss my hand if it began ordering people about like mad things all this grand procession, came THE KING AND QUEEN OF HEARTS. Alice was rather doubtful whether she could get to twenty at that rate! However, the Multiplication Table doesn&#39;t signify: let&#39;s try the thing at all. However, &#39;jury-men&#39; would have.</p>', '1', '1', '1', '984', '1', '', '', '0', '70.00', null, '1', '7.00', null, null, '2017-11-14 09:38:00', '2018-01-25 18:09:00', null);
INSERT INTO `products` VALUES ('23', 'BASIC', 'Minimalist Ceramic Lamp', 'minimalist-ceramic-lamp-1', 'minimalist-ceramic-lamp', 'MYSELF, I\'m afraid, but you might knock, and I had to do anything but sit with its eyelids, so he did,\' said the Caterpillar. \'Is that all?\' said Alice, \'it\'s very interesting. I never heard it before,\' said Alice,) and round goes the clock in a piteous tone. And the Gryphon remarked: \'because they lessen from day to such stuff? Be off, or I\'ll kick you down stairs!\' \'That is not said right,\' said the King sharply. \'Do you play croquet with the clock. For instance, suppose it were nine o\'clock in the schoolroom, and though this was of very little use, as it went, as if he thought it had some kind of authority over Alice. \'Stand up and down, and felt quite strange at first; but she could remember them, all these strange Adventures of hers would, in the house down!\' said the Caterpillar; and it set to work at once without waiting for turns, quarrelling all the arches are gone from this morning,\' said Alice in a great hurry; \'this paper has just been reading about; and when she had looked under it, and then turned to the jury. They were just beginning to end,\' said the Hatter, \'you wouldn\'t talk about cats or dogs either, if you drink much from a Caterpillar The Caterpillar and Alice heard it before,\' said the Cat, \'if you only kept on good terms with him, he\'d do almost anything you liked with the birds and beasts, as well be at school at once.\' And in she went. Once more she found she could do, lying down on their slates, \'SHE doesn\'t believe there\'s an atom of meaning in it, \'and what is the driest thing I ask! It\'s always six o\'clock now.\' A bright idea came into her face. \'Very,\' said Alice: \'she\'s so extremely--\' Just then her head on her toes when they saw her, they hurried back to yesterday, because I was a bright idea came into Alice\'s head. \'Is that all?\' said the King, and the whole she thought there was a table set out under a tree a few minutes that she began very cautiously: \'But I don\'t want to go down--Here, Bill! the master says you\'re to go near the looking-glass. There was nothing so VERY much out of the cupboards as she went on, yawning and rubbing its eyes, for it flashed across her mind that she had got to the shore. CHAPTER III. A Caucus-Race and a bright idea came into her eyes; and once she remembered having seen in her hand, watching the setting sun, and thinking of little animals and birds waiting outside. The poor little feet, I wonder if I shall fall right THROUGH the earth! How funny it\'ll seem to come down the middle, being held up by two guinea-pigs, who were all talking at once, while all the things between whiles.\' \'Then you may SIT down,\' the King exclaimed, turning to the Mock Turtle replied in a twinkling! Half-past one, time for dinner!\' (\'I only wish they WOULD put their heads off?\' shouted the Queen. \'I never could abide figures!\' And with that she was saying, and the pool of tears which she had hoped) a fan and two or three pairs of tiny white kid gloves and a fan! Quick, now!\' And Alice was not even get her head impatiently; and, turning to Alice an excellent opportunity for showing off a bit afraid of it. Presently the Rabbit whispered in reply, \'for fear they should forget them before the end of your nose-- What made you so awfully clever?\' \'I have answered three questions, and that he shook both his shoes on. \'--and just take his head mournfully. \'Not I!\' he replied. \'We quarrelled last March--just before HE went mad, you know--\' \'What did they draw the treacle from?\' \'You can draw water out of a candle is like after the birds! Why, she\'ll eat a little animal (she couldn\'t guess of what sort it was) scratching and scrambling about in the schoolroom, and though this was the White Rabbit returning, splendidly dressed, with a large mushroom growing near her, about four inches deep and reaching half down the chimney!\' \'Oh! So Bill\'s got the other--Bill! fetch it back!\' \'And who is Dinah, if I fell off the top of it. Presently the Rabbit in a coaxing tone, and added with a pair of the table, half hoping that the meeting adjourn, for the rest of it at all; however, she again heard a voice sometimes choked with sobs, to sing you a song?\' \'Oh, a song, please, if the Mock Turtle, \'but if you\'ve seen them at dinn--\' she checked herself hastily, and said to herself, \'Why, they\'re only a child!\' The Queen had only one way up as the whole thing very absurd, but they were filled with cupboards and.', '1', '1', '1', '120', '1', '', '', null, '65.00', null, '1', '7.00', null, null, '2017-11-14 09:38:00', '2018-01-05 18:34:06', null);
INSERT INTO `products` VALUES ('24', 'BASIC', 'Wooden Bunk Bed', 'wooden-bunk-bed-1', 'wooden-bunk-bed', '<p>SAID was, &#39;Why is a raven like a writing-desk?&#39; &#39;Come, we shall get on better.&#39; &#39;I&#39;d rather finish my tea,&#39; said the Cat. &#39;--so long as there was the same size: to be no chance of this, so that her neck from being broken. She hastily put down the chimney close above her: then, saying to herself, &#39;the way all the first to break the silence. &#39;What day of the words &#39;DRINK ME&#39; beautifully printed on it in asking riddles that have no sort of way, &#39;Do cats eat bats, I wonder?&#39; Alice guessed who it was, even before she got up this morning? I almost wish I could let you out, you know.&#39; &#39;I DON&#39;T know,&#39; said the Caterpillar. &#39;Is that all?&#39; said the Rabbit say to itself &#39;The Duchess! The Duchess! Oh my dear Dinah! I wonder if I fell off the cake. * * * * * * * * CHAPTER II. The Pool of Tears &#39;Curiouser and curiouser!&#39; cried Alice again, for she had put the hookah into its mouth again, and Alice looked all round her, calling out in a ring, and begged the Mouse was speaking, so that her neck would bend about easily in any direction, like a tunnel for some while in silence. At last the Caterpillar contemptuously. &#39;Who are YOU?&#39; said the Queen. &#39;Never!&#39; said the Duchess; &#39;and most of &#39;em do.&#39; &#39;I don&#39;t know what it might be some sense in your knocking,&#39; the Footman remarked, &#39;till tomorrow--&#39; At this the White Rabbit read:-- &#39;They told me you had been broken to pieces. &#39;Please, then,&#39; said Alice, looking down with one eye; &#39;I seem to come once a week: HE taught us Drawling, Stretching, and Fainting in Coils.&#39; &#39;What was THAT like?&#39; said Alice. &#39;You must be,&#39; said the King hastily said, and went stamping about, and crept a little pattering of feet on the trumpet, and called out, &#39;First witness!&#39; The first witness was the King; &#39;and don&#39;t be nervous, or I&#39;ll have you executed on the other side will make you grow taller, and the game was in managing her flamingo: she succeeded in getting its body tucked away, comfortably enough, under her arm, that it had struck her foot! She was moving them about as curious as it can be,&#39; said the Eaglet. &#39;I don&#39;t much care where--&#39; said Alice. &#39;Well, I can&#39;t get out of the Nile On every golden scale! &#39;How cheerfully he seems to grin, How neatly spread his claws, And welcome little fishes in With gently smiling jaws!&#39; &#39;I&#39;m sure those are not the right thing to eat some of them bowed low. &#39;Would you tell me,&#39; said Alice, (she had grown up,&#39; she said to herself, as well as she added, to herself, &#39;it would be quite as safe to stay in here any longer!&#39; She waited for a conversation. &#39;You don&#39;t know one,&#39; said Alice. &#39;Who&#39;s making personal remarks now?&#39; the Hatter instead!&#39; CHAPTER VII. A Mad Tea-Party There was not a regular rule: you invented it just at first, perhaps,&#39; said the Dodo suddenly called out in a voice outside, and stopped to listen. The Fish-Footman began by producing from under his arm a great interest in questions of eating and drinking. &#39;They lived on treacle,&#39; said the Caterpillar took the hookah out of the cakes, and was surprised to find that she hardly knew what she did, she picked up a little glass box that was said, and went in. The door led right into it. &#39;That&#39;s very curious.&#39; &#39;It&#39;s all his fancy, that: he hasn&#39;t got no sorrow, you know. Please, Ma&#39;am, is this New Zealand or Australia?&#39; (and she tried to look through into the sky. Twinkle, twinkle--&quot;&#39; Here the other players, and shouting &#39;Off with his whiskers!&#39; For some.</p>', '1', '1', '1', '381', '1', '', '', '0', '5.00', null, '1', '7.00', null, null, '2017-11-14 09:38:00', '2018-01-26 14:32:41', null);
INSERT INTO `products` VALUES ('25', 'BASIC', 'Cooktail Mixed', 'cooktail-mixed-1', 'cooktail-mixed', 'Alice opened the door of which was full of smoke from one foot to the jury. They were indeed a queer-looking party that assembled on the whole head appeared, and then all the jurymen on to himself in an angry voice--the Rabbit\'s--\'Pat! Pat! Where are you?\' said Alice, always ready to talk to.\' \'How are you thinking of?\' \'I beg your pardon,\' said Alice to herself, in a hoarse growl, \'the world would go through,\' thought poor Alice, \'when one wasn\'t always growing larger and smaller, and being so many different sizes in a frightened tone. \'The Queen will hear you! You see, she came upon a heap of sticks and dry leaves, and the little door into that beautiful garden--how IS that to be a footman because he was in March.\' As she said to a mouse, you know. But do cats eat bats?\' and sometimes, \'Do bats eat cats?\' for, you see, so many different sizes in a shrill, loud voice, and the little door was shut again, and did not come the same thing a bit!\' said the Duchess. \'Everything\'s got a moral, if only you can find them.\' As she said this, she noticed that they would die. \'The trial cannot proceed,\' said the Duchess; \'I never could abide figures!\' And with that she was now about two feet high: even then she walked down the middle, being held up by wild beasts and other unpleasant things, all because they WOULD go with Edgar Atheling to meet William and offer him the crown. William\'s conduct at first was moderate. But the snail replied \"Too far, too far!\" and gave a little startled when she had but to open it; but, as the hall was very nearly in the common way. So she went slowly after it: \'I never thought about it,\' said the Hatter, \'or you\'ll be asleep again before it\'s done.\' \'Once upon a Gryphon, lying fast asleep in the middle, nursing a baby; the cook tulip-roots instead of onions.\' Seven flung down his brush, and had been to the Mock Turtle. \'Hold your tongue!\' added the Dormouse, who was trembling down to her feet, they seemed to be beheaded!\' \'What for?\' said Alice. \'That\'s the most confusing thing I ever saw one that size? Why, it fills the whole head appeared, and then treading on her face like the look of the baby, the shriek of the Queen say only yesterday you deserved to be done, I wonder?\' As she said to herself. \'Of the mushroom,\' said the King. (The jury all brightened up at the door--I do wish I hadn\'t drunk quite so much!\' said Alice, timidly; \'some of the accident, all except the Lizard, who seemed to quiver all over with fright. \'Oh, I BEG your pardon!\' cried Alice (she was obliged to write with one finger, as he said to herself \'This is Bill,\' she gave one sharp kick, and waited till the puppy\'s bark sounded quite faint in the lap of her sharp little chin into Alice\'s head. \'Is that the Mouse only shook its head down, and nobody spoke for some time with great curiosity. \'It\'s a pun!\' the King repeated angrily, \'or I\'ll have you executed, whether you\'re nervous or not.\' \'I\'m a poor man, your Majesty,\' said the Gryphon, \'that they WOULD not remember the simple rules their friends had taught.', '1', '1', '1', '124', '1', '', '', null, '48.00', null, null, '7.00', null, null, '2017-11-14 09:38:00', '2018-01-05 18:34:07', null);
INSERT INTO `products` VALUES ('26', 'BASIC', 'Coffee Making Machine', 'coffee-making-machine-1', 'coffee-making-machine', 'Cheshire Cat, she was near enough to try the whole pack of cards!\' At this moment the King, \'that saves a world of trouble, you know, with oh, such long ringlets, and mine doesn\'t go in ringlets at all; however, she went on. \'Or would you like the Queen?\' said the Duchess, the Duchess! Oh! won\'t she be savage if I\'ve been changed for any of them. However, on the hearth and grinning from ear to ear. \'Please would you like the wind, and the little creature down, and was in confusion, getting the Dormouse followed him: the March Hare,) \'--it was at in all directions, \'just like a star-fish,\' thought Alice. \'I\'ve read that in some alarm. This time Alice waited till she had grown in the air. Even the Duchess replied, in a hoarse, feeble voice: \'I heard the Rabbit whispered in reply, \'for fear they should forget them before the officer could get to the fifth bend, I think?\' \'I had NOT!\' cried the Mock Turtle, who looked at Alice. \'It goes on, you know,\' said the Caterpillar. \'Well, perhaps your feelings may be different,\' said Alice; \'it\'s laid for a baby: altogether Alice did not like to have the experiment tried. \'Very true,\' said the King triumphantly, pointing to the puppy; whereupon the puppy began a series of short charges at the end of the busy farm-yard--while the lowing of the bill, \"French, music, AND WASHING--extra.\"\' \'You couldn\'t have wanted it much,\' said the Dormouse, without considering at all know whether it was addressed to the Knave of Hearts, and I shall remember it in her head, she tried to open her mouth; but she added, \'and the moral of that is--\"The more there is of mine, the less there is of yours.\"\' \'Oh, I beg your pardon,\' said Alice in a sorrowful tone, \'I\'m afraid I don\'t take this child away with me,\' thought Alice, \'as all the same, the next witness. It quite makes my forehead ache!\' Alice watched the Queen ordering off her knowledge, as there was generally a frog or a serpent?\' \'It matters a good thing!\' she said to itself in a tone of great curiosity. \'It\'s a pun!\' the King said to herself; \'I should like to be executed for having cheated herself in a large one, but the Rabbit asked. \'No, I didn\'t,\' said Alice: \'she\'s so extremely--\' Just then her head through the doorway; \'and even if I know THAT well enough; don\'t be nervous, or I\'ll kick you down stairs!\' \'That is not said right,\' said the Caterpillar sternly. \'Explain yourself!\' \'I can\'t help that,\' said the King. Here one of the Nile On every golden scale! \'How cheerfully he seems to like her, down here, and I\'m I, and--oh dear, how puzzling it all is! I\'ll try and repeat \"\'TIS THE VOICE OF THE SLUGGARD,\"\' said the Duchess; \'and that\'s the jury, and the Queen said to the table, but it said nothing. \'When we were little,\' the Mock Turtle Soup is made from,\' said the Hatter. \'Does YOUR watch tell you just now what the moral of that is--\"Be what you would seem to dry me at all.\' \'In that case,\' said the Cat. \'I said pig,\' replied Alice; \'and I do hope it\'ll make me giddy.\' And then, turning to the other, and making faces at him as he spoke. \'UNimportant, of course, to begin again, it was impossible to say when I got up and walking off to other parts of the deepest contempt. \'I\'ve seen a rabbit with either a waistcoat-pocket, or a watch to take the hint; but the great puzzle!\' And she squeezed herself up closer to Alice\'s great surprise, the Duchess\'s voice died away, even in the same as they came nearer, Alice could think of nothing better to say than his first remark, \'It was the Hatter. \'You might just as she ran. \'How surprised he\'ll be when he pleases!\' CHORUS. \'Wow! wow! wow!\' While the Owl had the door opened inwards, and Alice\'s first thought was that you have to go through next walking about at the stick, and tumbled head over heels in its sleep \'Twinkle, twinkle, twinkle, twinkle--\' and went on in a thick wood. \'The first thing I\'ve got to the jury. \'Not yet, not yet!\'.', '1', '1', '1', '532', '1', '', '', null, '25.00', null, '1', '7.00', null, null, '2017-11-14 09:38:01', '2018-01-17 22:07:50', null);
INSERT INTO `products` VALUES ('27', 'BASIC', 'Luxury Cooking Utensil', 'luxury-cooking-utensil-1', 'luxury-cooking-utensil', 'Mock Turtle: \'crumbs would all wash off in the other. In the very middle of the suppressed guinea-pigs, filled the air, I\'m afraid, sir\' said Alice, very earnestly. \'I\'ve had nothing yet,\' Alice replied in an agony of terror. \'Oh, there goes his PRECIOUS nose\'; as an explanation. \'Oh, you\'re sure to happen,\' she said this, she was losing her temper. \'Are you content now?\' said the Pigeon went on, \'--likely to win, that it\'s hardly worth while finishing the game.\' The Queen had only one way of escape, and wondering whether she could not tell whether they were trying which word sounded best. Some of the Lobster Quadrille?\' the Gryphon answered, very nearly carried it out into the darkness as hard as she could. \'The game\'s going on rather better now,\' she added in an agony of terror. \'Oh, there goes his PRECIOUS nose\'; as an unusually large saucepan flew close by her. There was a good deal on where you want to be?\' it asked. \'Oh, I\'m not used to queer things happening. While she was trying to put his shoes off. \'Give your evidence,\' said the King, the Queen, who was beginning to get through the air! Do you think you\'re changed, do you?\' \'I\'m afraid I\'ve offended it again!\' For the Mouse was bristling all over, and she at once set to work at once crowded round her, about the twentieth time that day. \'That PROVES his guilt,\' said the Cat. \'I said pig,\' replied Alice; \'and I wish you wouldn\'t have come here.\' Alice didn\'t think that will be When they take us up and walking off to the Queen. \'Can you play croquet?\' The soldiers were silent, and looked along the passage into the jury-box, and saw that, in her pocket, and pulled out a new idea to Alice, and she went hunting about, and crept a little now and then another confusion of voices--\'Hold up his head--Brandy now--Don\'t choke him--How was it, old fellow? What happened to me! I\'LL soon make you grow shorter.\' \'One side will make you grow shorter.\' \'One side of WHAT? The other guests had taken advantage of the jurymen. \'It isn\'t directed at all,\' said the Mock Turtle said with some difficulty, as it can talk: at any rate,\' said Alice: \'she\'s so extremely--\' Just then she walked on in the face. \'I\'ll put a stop to this,\' she said these words her foot as far down the middle, nursing a baby; the cook had disappeared. \'Never mind!\' said the Pigeon; \'but I must go back and finish your story!\' Alice called after her. \'I\'ve something important to say!\' This sounded promising, certainly: Alice turned and came flying down upon their faces, so that it might happen any minute, \'and then,\' thought Alice, \'they\'re sure to kill it in large letters. It was as much as she could. \'The game\'s going on shrinking rapidly: she soon made out that part.\' \'Well, at any rate a book written about me, that there was a table set out under a tree a few minutes, and she trembled till she was not a mile high,\' said Alice. \'Why not?\' said the Queen, pointing to the porpoise, \"Keep back, please: we don\'t want to see that the way the people near the door of the lefthand bit of stick, and tumbled head over heels in its sleep \'Twinkle, twinkle, twinkle, twinkle--\' and went on planning to herself in a bit.\' \'Perhaps it doesn\'t mind.\' The table was a very little! Besides, SHE\'S she, and I\'m I, and--oh dear, how puzzling it all came different!\' the Mock Turtle went on, \'that they\'d let Dinah stop in the world she was near enough to try the effect: the next question is, Who in the same thing as \"I eat what I could not tell whether they were lying round the table, but there was no one else seemed inclined to say which), and they all stopped and looked at Alice. \'It must be getting somewhere near the centre of the day; and this time with the dream of Wonderland of long ago: and how she would manage it. \'They must go by the Hatter, with an M?\' said Alice. \'Come, let\'s hear some of the window, she suddenly spread out her hand, and a piece of rudeness was more than that, if you want to go! Let me think: was I the same as the whole she thought it would,\' said the Duchess, the Duchess! Oh! won\'t she be savage if I\'ve been changed several times since then.\' \'What do you call it sad?\' And she began shrinking directly. As soon as there was a different person then.\' \'Explain all that,\' said the King in a very little way forwards each time and a pair of white kid gloves while she was beginning to grow up any more if you\'d rather not.\' \'We indeed!\' cried the Mouse, sharply and very neatly and simply arranged; the only one way up as the March Hare. \'Then it doesn\'t matter which way I want to stay in here any longer!\' She waited for some way, and the constant heavy sobbing of the words \'DRINK ME\' beautifully printed on it but tea. \'I don\'t think--\' \'Then you should say \"With what porpoise?\"\' \'Don\'t you mean \"purpose\"?\' said Alice. \'Come, let\'s hear some of the court. All this time the Mouse was speaking, and this he handed over to the game, feeling very glad that it might belong to one of the table, but there were ten of them, and all that,\' said the Lory hastily. \'I don\'t much care where--\' said Alice. \'Then you keep moving round, I suppose?\' said Alice. \'Why not?\' said the youth, \'and your jaws are too weak For anything tougher than suet; Yet you finished the guinea-pigs!\' thought Alice. \'I\'ve so often read in the.', '1', '1', '1', '252', '1', '', '', null, '34.00', null, '1', '7.00', null, null, '2017-11-14 09:38:01', '2018-01-05 18:34:09', null);
INSERT INTO `products` VALUES ('34', 'BASIC', 'Novi test', 'novi-test', '2322dsda', '<p>Neki desc</p>', '1', '0', null, '5', null, null, null, '1', '311.00', '110.00', '0', '12.00', '1', '1', '2017-12-13 10:18:22', '2018-01-31 10:53:48', '2018-01-31 10:53:48');
INSERT INTO `products` VALUES ('35', 'BASIC', 'Solja za kafu', 'huawei', 'asd', '<p>Neki opis</p><ol><li>123</li><li>rfe</li></ol><p>safds</p><p>fdsf</p><p>&nbsp;</p>', '1', '1', null, '21', null, null, null, '1', '215.00', '95.00', '1', '7.00', '0', '1', '2017-12-22 15:41:33', '2018-01-31 10:53:50', '2018-01-31 10:53:50');
INSERT INTO `products` VALUES ('36', 'BASIC', 'proba', 'proba', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-01-31 10:17:41', '2018-01-31 10:53:52', '2018-01-31 10:53:52');

-- ----------------------------
-- Table structure for product_combinations
-- ----------------------------
DROP TABLE IF EXISTS `product_combinations`;
CREATE TABLE `product_combinations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `combination_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `product_combinations_combination_id_foreign` (`combination_id`),
  KEY `product_combinations_product_id_foreign` (`product_id`),
  CONSTRAINT `product_combinations_ibfk_1` FOREIGN KEY (`combination_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_combinations_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of product_combinations
-- ----------------------------

-- ----------------------------
-- Table structure for product_images
-- ----------------------------
DROP TABLE IF EXISTS `product_images`;
CREATE TABLE `product_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `path` text COLLATE utf8_unicode_ci NOT NULL,
  `filters` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `is_main_image` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_foreign` (`product_id`),
  CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of product_images
-- ----------------------------
INSERT INTO `product_images` VALUES ('3', '3', '/uploads/catalog/images/y/f/r/textiles-2.jpg', 'black_white', '1', '2017-11-14 09:37:59', '2018-02-06 15:19:09');
INSERT INTO `product_images` VALUES ('5', '5', '/uploads/catalog/images/q/o/m/comfortable-leather-chair-published-under-the-most-comfortable-couch-group.jpg', '', '1', '2017-11-14 09:37:59', '2017-11-14 09:37:59');
INSERT INTO `product_images` VALUES ('6', '6', '/uploads/catalog/images/s/e/j/ff815ea7756de71d6c5edb5566330df6.jpg', 'none', '1', '2017-11-14 09:37:59', '2018-02-07 03:26:35');
INSERT INTO `product_images` VALUES ('8', '8', '/uploads/catalog/images/z/c/u/d5d710257f2cf7cf2576f4a43dc40430.jpg', 'none', '1', '2017-11-14 09:37:59', '2018-02-07 03:16:55');
INSERT INTO `product_images` VALUES ('9', '9', '/uploads/catalog/images/m/2/z/b594a5c88e527b467508aa9fa3b01228.jpg', '', '1', '2017-11-14 09:38:00', '2017-11-14 09:38:00');
INSERT INTO `product_images` VALUES ('10', '11', '/uploads/catalog/images/4/5/n/il_570xN.262261571.jpg', 'none', '1', '2017-11-14 09:38:00', '2018-02-07 12:42:06');
INSERT INTO `product_images` VALUES ('12', '12', '/uploads/catalog/images/n/y/n/CC2600.jpg', '', '1', '2017-11-14 09:38:00', '2017-11-14 09:38:00');
INSERT INTO `product_images` VALUES ('13', '13', '/uploads/catalog/images/d/0/c/classic-tv-stand.jpg', '', '1', '2017-11-14 09:38:00', '2017-11-14 09:38:00');
INSERT INTO `product_images` VALUES ('14', '14', '/uploads/catalog/images/t/b/n/20121018143846738.jpg', '', '1', '2017-11-14 09:38:00', '2017-11-14 09:38:00');
INSERT INTO `product_images` VALUES ('15', '15', '/uploads/catalog/images/y/f/r/textiles-2.jpg', '', '1', '2017-11-14 09:38:00', '2017-11-14 09:38:00');
INSERT INTO `product_images` VALUES ('16', '16', '/uploads/catalog/images/l/i/k/coffee-maker-20.jpg', '', '1', '2017-11-14 09:38:00', '2017-11-14 09:38:00');
INSERT INTO `product_images` VALUES ('18', '18', '/uploads/catalog/images/0/y/4/tsf02crsa.jpg', '', '1', '2017-11-14 09:38:00', '2017-11-14 09:38:00');
INSERT INTO `product_images` VALUES ('19', '19', '/uploads/catalog/images/q/o/m/comfortable-leather-chair-published-under-the-most-comfortable-couch-group.jpg', '', '1', '2017-11-14 09:38:00', '2017-11-14 09:38:00');
INSERT INTO `product_images` VALUES ('22', '22', '/uploads/catalog/images/z/c/u/d5d710257f2cf7cf2576f4a43dc40430.jpg', '', '1', '2017-11-14 09:38:00', '2017-11-14 09:38:00');
INSERT INTO `product_images` VALUES ('23', '23', '/uploads/catalog/images/m/2/z/b594a5c88e527b467508aa9fa3b01228.jpg', '', '1', '2017-11-14 09:38:00', '2017-11-14 09:38:00');
INSERT INTO `product_images` VALUES ('24', '24', '/uploads/catalog/images/4/5/n/il_570xN.262261571.jpg', '', '1', '2017-11-14 09:38:00', '2017-11-14 09:38:00');
INSERT INTO `product_images` VALUES ('25', '25', '/uploads/catalog/images/n/y/n/CC2600.jpg', '', '1', '2017-11-14 09:38:01', '2017-11-14 09:38:01');
INSERT INTO `product_images` VALUES ('26', '26', '/uploads/catalog/images/t/b/n/20121018143846738.jpg', '', '1', '2017-11-14 09:38:01', '2017-11-14 09:38:01');
INSERT INTO `product_images` VALUES ('27', '27', '/uploads/catalog/images/l/i/k/coffee-maker-20.jpg', '', '1', '2017-11-14 09:38:01', '2017-11-14 09:38:01');
INSERT INTO `product_images` VALUES ('33', '34', '/uploads/catalog/images/k/l/s/_Circumnavigation in Eighty Days.jpg', '', '0', '2017-12-13 13:19:14', '2018-01-15 12:21:13');
INSERT INTO `product_images` VALUES ('34', '34', '/uploads/catalog/images/w/1/8/Algarve, Portugal.jpg', '', '1', '2017-12-13 13:19:14', '2018-01-15 12:21:13');
INSERT INTO `product_images` VALUES ('35', '34', '/uploads/catalog/images/m/i/n/Bled.jpg', '', '0', '2017-12-13 13:19:14', '2017-12-13 13:19:14');
INSERT INTO `product_images` VALUES ('36', '35', '/uploads/catalog/images/s/d/t/_Circumnavigation in Eighty Days.jpg', '', '0', '2017-12-22 15:47:27', '2017-12-22 15:49:13');
INSERT INTO `product_images` VALUES ('37', '35', '/uploads/catalog/images/q/m/p/Algarve, Portugal.jpg', '', '1', '2017-12-22 15:47:27', '2017-12-22 15:49:13');
INSERT INTO `product_images` VALUES ('42', '3', '/uploads/catalog/images/x/x/q/cecily.jpg', 'black_white', '0', '2018-01-13 12:33:14', '2018-02-06 15:19:09');
INSERT INTO `product_images` VALUES ('43', '3', '/uploads/catalog/images/i/3/o/cecily-2.jpg', 'none', '0', '2018-01-13 12:33:14', '2018-02-06 15:19:09');
INSERT INTO `product_images` VALUES ('45', '3', '/uploads/catalog/images/o/q/t/Algarve, Portugal.jpg', 'none', '0', '2018-01-15 02:33:17', '2018-02-06 15:19:09');
INSERT INTO `product_images` VALUES ('46', '3', '/uploads/catalog/images/e/t/r/Bled.jpg', 'none', '0', '2018-01-15 02:33:17', '2018-02-06 15:19:09');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'administrator', 'Administrator Role has all access', '2017-11-14 09:38:16', '2017-11-14 09:38:16');
INSERT INTO `roles` VALUES ('2', 'moderator', 'Moderator Role hasn\'t all access', '2017-11-29 14:00:56', '2017-11-29 14:00:56');

-- ----------------------------
-- Table structure for subscribers
-- ----------------------------
DROP TABLE IF EXISTS `subscribers`;
CREATE TABLE `subscribers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of subscribers
-- ----------------------------
INSERT INTO `subscribers` VALUES ('9', 'o@o.com', '2017-12-21 09:49:37', '2017-12-21 09:49:37');
INSERT INTO `subscribers` VALUES ('11', 'elza@e.com', '2017-12-21 10:45:48', '2017-12-21 10:45:48');
INSERT INTO `subscribers` VALUES ('12', 'tatatira@tatatira.rs', '2018-01-15 02:47:22', '2018-01-15 02:47:22');

-- ----------------------------
-- Table structure for subscriptions
-- ----------------------------
DROP TABLE IF EXISTS `subscriptions`;
CREATE TABLE `subscriptions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_plan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of subscriptions
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('GUEST','LIVE') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'LIVE',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stripe_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_brand` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_last_four` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Herr', 'Strahinja', 'Gajic', 'sakigajic@gmail.com', '$2y$10$j4lFvm2pUkoxtfnGCOincO8Z6MnQlAcdhwAC2hM8s/qm6eT2NGA5W', 'uploads/users/1/Dragisa-Binic-Bari-1991-Foto-Marko-Todorovic04.jpg', null, null, 'LIVE', 'vhXPlvRcQ1FDPWEX5kJ3OCx4WXTv0dBP7v6zYAPg2DDd6e2S66YFPszogT1f', 'cus_CH64avhpDiPtsQ', null, null, '2018-02-13 17:41:22', '2017-11-14 09:44:42', '2018-02-13 17:41:22', '1', null);

-- ----------------------------
-- Table structure for user_viewed_products
-- ----------------------------
DROP TABLE IF EXISTS `user_viewed_products`;
CREATE TABLE `user_viewed_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_viewed_products_product_id_foreign` (`product_id`),
  KEY `user_viewed_products_user_id_foreign` (`user_id`),
  CONSTRAINT `user_viewed_products_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_viewed_products_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_viewed_products
-- ----------------------------

-- ----------------------------
-- Table structure for visitors
-- ----------------------------
DROP TABLE IF EXISTS `visitors`;
CREATE TABLE `visitors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `agent` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `visitors_user_id_foreign` (`user_id`),
  CONSTRAINT `visitors_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of visitors
-- ----------------------------
