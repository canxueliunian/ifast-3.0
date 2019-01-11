/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50716
Source Host           : 192.168.10.18:3306
Source Database       : quotation_system

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2019-01-11 16:53:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for app_demo_base
-- ----------------------------
DROP TABLE IF EXISTS `app_demo_base`;
CREATE TABLE `app_demo_base` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `publish` datetime DEFAULT NULL COMMENT '发布时间',
  `content` mediumtext COMMENT '正文',
  `deleted` bit(1) DEFAULT b'0' COMMENT '删除',
  `version` smallint(6) DEFAULT '0' COMMENT '版本',
  `createAt` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateAt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `createBy` bigint(20) DEFAULT NULL COMMENT '创建者',
  `updateBy` bigint(20) DEFAULT NULL COMMENT '更新者',
  `price` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='基础表';

-- ----------------------------
-- Records of app_demo_base
-- ----------------------------
INSERT INTO `app_demo_base` VALUES ('1', '22', null, null, '\0', '0', '2018-12-27 00:14:06', null, null, null, null);

-- ----------------------------
-- Table structure for db_entry
-- ----------------------------
DROP TABLE IF EXISTS `db_entry`;
CREATE TABLE `db_entry` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '门店id',
  `parentId` bigint(20) DEFAULT NULL COMMENT '父id',
  `entryName` varchar(255) DEFAULT NULL COMMENT '项目名称',
  `packageType` int(11) DEFAULT NULL COMMENT '项目类型',
  `entryType` int(11) DEFAULT NULL COMMENT '条目类型',
  `cleanType` varchar(255) DEFAULT NULL COMMENT '清洁方式',
  `rateNum` int(11) DEFAULT '0' COMMENT '频率次数',
  `rateString` varchar(255) DEFAULT NULL COMMENT '频率',
  `rateType` int(11) DEFAULT '1' COMMENT '频率类型 1为每日, 2 为每周',
  `spendTime` double(16,2) DEFAULT '0.00' COMMENT '花费时间',
  `spendPay` decimal(20,2) DEFAULT '0.00' COMMENT '花费金额',
  `status` int(11) DEFAULT '0' COMMENT '0 正常 1冻结',
  `gmtCreate` datetime DEFAULT NULL COMMENT '创建时间',
  `gmtModify` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `in` (`entryName`,`packageType`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='条目信息\r\nrateString : 为通过上面的rate 两个字段生成的额每周一次, 每日一次的对应信息\r\n显示时,显示该字段, 在修改时同时维护该字段';

-- ----------------------------
-- Records of db_entry
-- ----------------------------
INSERT INTO `db_entry` VALUES ('1', null, '门锁', '1', '1', '擦洗', '1', '每日一次', '1', '12.00', '12.00', '0', '2019-01-07 11:24:21', '2019-01-08 16:12:31');
INSERT INTO `db_entry` VALUES ('2', null, '门磁', '1', '1', '擦洗', '1', '每日一次', '1', '12.00', '12.00', '0', '2019-01-07 11:24:21', '2019-01-08 16:45:16');
INSERT INTO `db_entry` VALUES ('7', null, '开关', '2', '1', '擦洗', '1', '每日一次', '1', '12.00', '12.00', '0', '2019-01-09 17:42:03', '2019-01-09 17:42:03');
INSERT INTO `db_entry` VALUES ('8', null, '试衣镜', '2', '1', '擦洗', '1', '每日一次', '1', '12.00', '12.00', '0', '2019-01-09 17:42:24', '2019-01-09 17:42:24');
INSERT INTO `db_entry` VALUES ('9', null, '床上清洁', '3', '1', '擦洗', '1', '每日一次', '1', '12.00', '12.00', '0', '2019-01-09 17:43:51', '2019-01-09 17:43:51');
INSERT INTO `db_entry` VALUES ('10', '9', '靠枕', '3', '2', '擦洗', '1', '每日一次', '1', '12.00', '12.00', '0', '2019-01-09 17:44:13', '2019-01-09 17:44:13');
INSERT INTO `db_entry` VALUES ('11', '9', '床上布草清洁', '3', '2', '擦洗', '1', '每日一次', '1', '12.00', '12.00', '0', '2019-01-09 17:44:13', '2019-01-09 17:44:13');

-- ----------------------------
-- Table structure for db_home_entry
-- ----------------------------
DROP TABLE IF EXISTS `db_home_entry`;
CREATE TABLE `db_home_entry` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '门店id',
  `parentId` bigint(20) DEFAULT NULL COMMENT '父id',
  `entryName` varchar(255) DEFAULT NULL COMMENT '项目名称',
  `packageType` int(11) DEFAULT NULL COMMENT '项目类型',
  `entryType` int(11) DEFAULT NULL COMMENT '条目类型',
  `cleanType` varchar(255) DEFAULT NULL COMMENT '清洁方式',
  `rateNum` int(11) DEFAULT '0' COMMENT '频率次数',
  `rateString` varchar(255) DEFAULT NULL COMMENT '频率',
  `rateType` int(11) DEFAULT '1' COMMENT '频率类型 1为每日, 2 为每周',
  `spendTime` double(16,2) DEFAULT '0.00' COMMENT '花费时间',
  `spendPay` decimal(20,2) DEFAULT '0.00' COMMENT '花费金额',
  `status` int(11) DEFAULT '0' COMMENT '0 正常 1冻结',
  `gmtCreate` datetime DEFAULT NULL COMMENT '创建时间',
  `gmtModify` datetime DEFAULT NULL COMMENT '修改时间',
  `onOff` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `in` (`entryName`,`packageType`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='条目信息\r\nrateString : 为通过上面的rate 两个字段生成的额每周一次, 每日一次的对应信息\r\n显示时,显示该字段, 在修改时同时维护该字段';

-- ----------------------------
-- Records of db_home_entry
-- ----------------------------
INSERT INTO `db_home_entry` VALUES ('34', null, '门锁', '1', '1', '擦洗', '1', '每日一次', '1', '12.00', '12.00', '0', '2019-01-07 11:24:21', '2019-01-08 16:12:31', '0');
INSERT INTO `db_home_entry` VALUES ('35', null, '门磁', '1', '1', '擦洗', '1', '每日一次', '1', '12.00', '12.00', '0', '2019-01-07 11:24:21', '2019-01-08 16:45:16', '0');
INSERT INTO `db_home_entry` VALUES ('36', null, '开关', '2', '1', '擦洗', '1', '每日一次', '1', '12.00', '12.00', '0', '2019-01-09 17:42:03', '2019-01-09 17:42:03', '0');
INSERT INTO `db_home_entry` VALUES ('37', null, '试衣镜', '2', '1', '擦洗', '1', '每日一次', '1', '12.00', '12.00', '0', '2019-01-09 17:42:24', '2019-01-09 17:42:24', '0');
INSERT INTO `db_home_entry` VALUES ('38', null, '床上清洁', '3', '1', '擦洗', '1', '每日一次', '1', '12.00', '12.00', '0', '2019-01-09 17:43:51', '2019-01-09 17:43:51', '0');

-- ----------------------------
-- Table structure for db_home_item
-- ----------------------------
DROP TABLE IF EXISTS `db_home_item`;
CREATE TABLE `db_home_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `itemName` varchar(255) DEFAULT NULL COMMENT '项目名称',
  `packageType` int(11) DEFAULT NULL COMMENT '项目类型',
  `onOff` int(11) DEFAULT '0' COMMENT '开关',
  `spendTime` double(16,2) DEFAULT NULL COMMENT '花费时间',
  `spendPay` decimal(20,2) DEFAULT NULL COMMENT '花费金额',
  `status` int(11) DEFAULT '0' COMMENT '状态',
  `gmtCreate` datetime DEFAULT NULL,
  `gmtModify` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `in` (`itemName`,`packageType`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COMMENT='条目表';

-- ----------------------------
-- Records of db_home_item
-- ----------------------------
INSERT INTO `db_home_item` VALUES ('60', '门清洁', '1', '0', '24.00', '24.00', '1', '2019-01-04 11:04:41', '2019-01-09 16:47:49');
INSERT INTO `db_home_item` VALUES ('61', '通道清洁', '1', '0', '24.00', '24.00', '0', '2019-01-09 16:48:00', '2019-01-09 18:26:04');
INSERT INTO `db_home_item` VALUES ('62', '卧室清洁', '3', '0', '24.00', '24.00', '0', '2019-01-09 16:55:39', '2019-01-09 16:55:39');

-- ----------------------------
-- Table structure for db_home_price
-- ----------------------------
DROP TABLE IF EXISTS `db_home_price`;
CREATE TABLE `db_home_price` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '门店id',
  `hotelId` bigint(20) NOT NULL COMMENT '门店id',
  `name` varchar(255) DEFAULT NULL COMMENT '房型名称',
  `spendTime` double(16,2) DEFAULT NULL COMMENT '花费时间',
  `spendPay` decimal(20,0) DEFAULT NULL COMMENT '花费金额',
  `status` int(11) DEFAULT '0' COMMENT '0 正常 1冻结',
  `gmtCreate` datetime DEFAULT NULL,
  `gmtModify` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='房型价格表';

-- ----------------------------
-- Records of db_home_price
-- ----------------------------
INSERT INTO `db_home_price` VALUES ('1', '1', '房型一', null, '12', '0', '2019-01-11 11:05:46', '2019-01-11 11:05:49');
INSERT INTO `db_home_price` VALUES ('2', '1', '房型二', null, '10', '0', '2019-01-11 16:04:43', '2019-01-11 16:04:45');
INSERT INTO `db_home_price` VALUES ('3', '1', '房型三', null, '14', '0', '2019-01-11 16:06:15', '2019-01-11 16:06:17');

-- ----------------------------
-- Table structure for db_hotel
-- ----------------------------
DROP TABLE IF EXISTS `db_hotel`;
CREATE TABLE `db_hotel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '门店id',
  `hotelName` varchar(255) DEFAULT NULL COMMENT '酒店名称',
  `hotelType` int(10) DEFAULT NULL COMMENT '酒店类型',
  `manageName` varchar(255) DEFAULT '' COMMENT '店主姓名',
  `managerPhone` varchar(255) DEFAULT NULL COMMENT '店长手机号码',
  `openingDate` date DEFAULT NULL COMMENT '开业时间',
  `provinceId` varchar(255) DEFAULT NULL COMMENT '省id',
  `provinceName` varchar(255) DEFAULT NULL COMMENT '省name',
  `cityId` varchar(255) DEFAULT NULL COMMENT '城市id',
  `cityName` varchar(255) DEFAULT NULL COMMENT '城市name',
  `districtId` varchar(255) DEFAULT NULL COMMENT '地区id',
  `districtName` varchar(255) DEFAULT NULL COMMENT '地区name',
  `detailAddress` varchar(255) DEFAULT NULL,
  `registTime` date DEFAULT NULL COMMENT '登记时间',
  `marketManId` bigint(20) DEFAULT NULL COMMENT '市场人员id',
  `marketManName` varchar(255) DEFAULT NULL COMMENT '市场人员名称',
  `status` int(11) DEFAULT '0',
  `gmtCreate` datetime DEFAULT NULL,
  `gmtModify` datetime DEFAULT NULL,
  `imgPath` varchar(255) DEFAULT NULL COMMENT '图片路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='酒店表 \r\n';

-- ----------------------------
-- Records of db_hotel
-- ----------------------------
INSERT INTO `db_hotel` VALUES ('1', '测试酒店', '1', '测试名称', '18769381830', '2019-01-08', null, null, null, null, null, null, null, null, '8', null, '0', null, null, null);
INSERT INTO `db_hotel` VALUES ('2', '测试酒店a', '3', 'aa', '1111', '2019-01-09', null, null, null, null, null, null, null, null, '8', null, '0', null, null, null);
INSERT INTO `db_hotel` VALUES ('3', 'ces', '2', 'ces', '12312313', null, null, null, null, null, null, null, 'cssdadwadad', '2019-09-01', '9', null, '0', null, null, null);
INSERT INTO `db_hotel` VALUES ('4', '1', '0', '1', '123321333', null, null, null, null, null, null, null, '213', '2018-09-01', '9', null, '0', null, null, null);
INSERT INTO `db_hotel` VALUES ('5', '3', '0', '3', '231313123', null, null, null, null, null, null, null, '3', '2018-09-01', '9', null, '0', null, null, null);
INSERT INTO `db_hotel` VALUES ('6', '3', '0', '3', '231313123', null, null, null, null, null, null, null, '3', '2018-09-01', '9', null, '0', null, null, null);
INSERT INTO `db_hotel` VALUES ('7', '333', '0', '3213', '13141231', null, null, null, null, null, null, null, '3333', '2018-09-01', '9', null, '0', null, null, null);
INSERT INTO `db_hotel` VALUES ('8', null, null, '', null, null, null, null, null, null, null, null, null, null, '9', null, '0', null, null, null);

-- ----------------------------
-- Table structure for db_item
-- ----------------------------
DROP TABLE IF EXISTS `db_item`;
CREATE TABLE `db_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `itemName` varchar(255) DEFAULT NULL COMMENT '项目名称',
  `packageType` int(11) DEFAULT NULL COMMENT '项目类型',
  `onOff` int(11) DEFAULT '0' COMMENT '开关',
  `spendTime` double(16,2) DEFAULT NULL COMMENT '花费时间',
  `spendPay` decimal(20,2) DEFAULT NULL COMMENT '花费金额',
  `status` int(11) DEFAULT '0' COMMENT '状态',
  `gmtCreate` datetime DEFAULT NULL,
  `gmtModify` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `in` (`itemName`,`packageType`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='条目表';

-- ----------------------------
-- Records of db_item
-- ----------------------------
INSERT INTO `db_item` VALUES ('1', '门清洁', '1', '0', '24.00', '24.00', '0', '2019-01-04 11:04:41', '2019-01-09 16:47:49');
INSERT INTO `db_item` VALUES ('12', '通道清洁', '1', '0', '24.00', '24.00', '0', '2019-01-09 16:48:00', '2019-01-09 18:26:04');
INSERT INTO `db_item` VALUES ('13', '客房面积', '2', '1', '24.00', '24.00', '0', '2019-01-09 16:51:56', '2019-01-09 16:51:56');
INSERT INTO `db_item` VALUES ('14', '清洁面积', '2', '1', '24.00', '24.00', '0', '2019-01-09 16:52:08', '2019-01-09 18:26:15');
INSERT INTO `db_item` VALUES ('15', '卫生间清洁', '3', '1', '24.00', '24.00', '0', '2019-01-09 16:55:23', '2019-01-09 18:25:45');
INSERT INTO `db_item` VALUES ('16', '卧室清洁', '3', '0', '24.00', '24.00', '0', '2019-01-09 16:55:39', '2019-01-09 16:55:39');

-- ----------------------------
-- Table structure for db_re_home_entry
-- ----------------------------
DROP TABLE IF EXISTS `db_re_home_entry`;
CREATE TABLE `db_re_home_entry` (
  `homeId` bigint(20) NOT NULL COMMENT '酒店id',
  `itemId` bigint(20) DEFAULT NULL COMMENT '项目id',
  `entryId` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of db_re_home_entry
-- ----------------------------
INSERT INTO `db_re_home_entry` VALUES ('2', '60', '34');
INSERT INTO `db_re_home_entry` VALUES ('2', '60', '35');
INSERT INTO `db_re_home_entry` VALUES ('2', '61', '36');
INSERT INTO `db_re_home_entry` VALUES ('2', '61', '37');
INSERT INTO `db_re_home_entry` VALUES ('2', '62', '38');

-- ----------------------------
-- Table structure for db_re_home_item
-- ----------------------------
DROP TABLE IF EXISTS `db_re_home_item`;
CREATE TABLE `db_re_home_item` (
  `homeId` bigint(20) NOT NULL COMMENT '酒店id',
  `itemId` bigint(20) DEFAULT NULL COMMENT '项目id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='房型--项目项关联表';

-- ----------------------------
-- Records of db_re_home_item
-- ----------------------------
INSERT INTO `db_re_home_item` VALUES ('2', '60');
INSERT INTO `db_re_home_item` VALUES ('2', '61');
INSERT INTO `db_re_home_item` VALUES ('2', '62');

-- ----------------------------
-- Table structure for db_re_home_item_entry
-- ----------------------------
DROP TABLE IF EXISTS `db_re_home_item_entry`;
CREATE TABLE `db_re_home_item_entry` (
  `itemId` varchar(255) NOT NULL COMMENT '项目id',
  `entryId` varchar(255) DEFAULT NULL COMMENT '条目id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of db_re_home_item_entry
-- ----------------------------
INSERT INTO `db_re_home_item_entry` VALUES ('60', '34');
INSERT INTO `db_re_home_item_entry` VALUES ('60', '35');
INSERT INTO `db_re_home_item_entry` VALUES ('61', '36');
INSERT INTO `db_re_home_item_entry` VALUES ('61', '37');
INSERT INTO `db_re_home_item_entry` VALUES ('62', '38');

-- ----------------------------
-- Table structure for db_re_item_entry
-- ----------------------------
DROP TABLE IF EXISTS `db_re_item_entry`;
CREATE TABLE `db_re_item_entry` (
  `itemId` varchar(255) NOT NULL COMMENT '项目id',
  `entryId` varchar(255) DEFAULT NULL COMMENT '条目id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of db_re_item_entry
-- ----------------------------
INSERT INTO `db_re_item_entry` VALUES ('1', '1');
INSERT INTO `db_re_item_entry` VALUES ('1', '2');
INSERT INTO `db_re_item_entry` VALUES ('12', '7');
INSERT INTO `db_re_item_entry` VALUES ('12', '8');
INSERT INTO `db_re_item_entry` VALUES ('16', '9');
INSERT INTO `db_re_item_entry` VALUES ('51', '24');
INSERT INTO `db_re_item_entry` VALUES ('51', '25');
INSERT INTO `db_re_item_entry` VALUES ('52', '26');
INSERT INTO `db_re_item_entry` VALUES ('52', '27');
INSERT INTO `db_re_item_entry` VALUES ('56', '28');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `k` varchar(100) DEFAULT NULL COMMENT '键',
  `v` varchar(1000) DEFAULT NULL COMMENT '值',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `kvType` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('2', 'oss_qiniu', '{\"AccessKey\" : \"8-HMj9EgGNIP-xuOCpSzTn-OMyGOFtR3TxLdn4Uu\",\"SecretKey\" : \"SjpGg3V6PsMdJgn42PeEd5Ik-6aNyuwdqV5CPM6A\",\"bucket\" : \"ifast\",\"AccessUrl\" : \"http://p6r7ke2jc.bkt.clouddn.com/\"}', '七牛对象存储配置', '2018-04-06 14:31:26', '4300');
INSERT INTO `sys_config` VALUES ('3', 'author', 'canxue', '代码生成器配置', '2018-05-27 19:57:04', '4401');
INSERT INTO `sys_config` VALUES ('4', 'email', 'canuxe@qq.com', '代码生成器配置', '2018-05-27 19:57:04', '4401');
INSERT INTO `sys_config` VALUES ('5', 'package', 'com.ifast.quotation', '代码生成器配置', '2018-05-27 19:57:04', '4401');
INSERT INTO `sys_config` VALUES ('6', 'autoRemovePre', 'true', '代码生成器配置', '2018-05-27 19:57:04', '4401');
INSERT INTO `sys_config` VALUES ('7', 'tablePrefix', 'db', '代码生成器配置', '2018-05-27 19:57:04', '4401');
INSERT INTO `sys_config` VALUES ('8', 'tinyint', 'Integer', '代码生成器配置', '2018-05-27 19:57:04', '4400');
INSERT INTO `sys_config` VALUES ('9', 'smallint', 'Integer', '代码生成器配置', '2018-05-27 19:57:04', '4400');
INSERT INTO `sys_config` VALUES ('10', 'mediumint', 'Integer', '代码生成器配置', '2018-05-27 19:57:04', '4400');
INSERT INTO `sys_config` VALUES ('11', 'int', 'Integer', '代码生成器配置', '2018-05-27 19:57:04', '4400');
INSERT INTO `sys_config` VALUES ('12', 'integer', 'Integer', '代码生成器配置', '2018-05-27 19:57:04', '4400');
INSERT INTO `sys_config` VALUES ('13', 'bigint', 'Long', '代码生成器配置', '2018-05-27 19:57:04', '4400');
INSERT INTO `sys_config` VALUES ('14', 'float', 'Float', '代码生成器配置', '2018-05-27 19:57:04', '4400');
INSERT INTO `sys_config` VALUES ('15', 'double', 'Double', '代码生成器配置', '2018-05-27 19:57:04', '4400');
INSERT INTO `sys_config` VALUES ('16', 'decimal', 'BigDecimal', '代码生成器配置', '2018-05-27 19:57:04', '4400');
INSERT INTO `sys_config` VALUES ('17', 'bit', 'Boolean', '代码生成器配置', '2018-05-27 19:57:04', '4400');
INSERT INTO `sys_config` VALUES ('18', 'char', 'String', '代码生成器配置', '2018-05-27 19:57:04', '4400');
INSERT INTO `sys_config` VALUES ('19', 'varchar', 'String', '代码生成器配置', '2018-05-27 19:57:04', '4400');
INSERT INTO `sys_config` VALUES ('20', 'tinytext', 'String', '代码生成器配置', '2018-05-27 19:57:04', '4400');
INSERT INTO `sys_config` VALUES ('21', 'text', 'String', '代码生成器配置', '2018-05-27 19:57:04', '4400');
INSERT INTO `sys_config` VALUES ('22', 'mediumtext', 'String', '代码生成器配置', '2018-05-27 19:57:04', '4400');
INSERT INTO `sys_config` VALUES ('23', 'longtext', 'String', '代码生成器配置', '2018-05-27 19:57:04', '4400');
INSERT INTO `sys_config` VALUES ('24', 'date', 'Date', '代码生成器配置', '2018-05-27 19:57:04', '4400');
INSERT INTO `sys_config` VALUES ('25', 'datetime', 'Date', '代码生成器配置', '2018-05-27 19:57:04', '4400');
INSERT INTO `sys_config` VALUES ('26', 'timestamp', 'Date', '代码生成器配置', '2018-05-27 19:57:04', '4400');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parentId` bigint(20) DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `orderNum` int(11) DEFAULT NULL COMMENT '排序',
  `delFlag` tinyint(4) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='部门管理';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('6', '0', '研发部', '1', '1');
INSERT INTO `sys_dept` VALUES ('7', '6', '研发一部', '1', '1');
INSERT INTO `sys_dept` VALUES ('8', '6', '研发二部', '2', '1');
INSERT INTO `sys_dept` VALUES ('9', '0', '销售部', '2', '1');
INSERT INTO `sys_dept` VALUES ('16', '9', '销售一部', '0', '1');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) DEFAULT NULL COMMENT '标签名',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '数据值',
  `type` varchar(100) DEFAULT NULL COMMENT '类型',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `parentId` bigint(64) DEFAULT '0' COMMENT '父级编号',
  `createBy` int(64) DEFAULT NULL COMMENT '创建者',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateBy` bigint(64) DEFAULT NULL COMMENT '更新者',
  `updateDate` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `delFlag` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`name`),
  KEY `sys_dict_del_flag` (`delFlag`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '正常', '0', 'del_flag', '测试', '10', '0', '1', null, '1', null, '正常', '0');
INSERT INTO `sys_dict` VALUES ('3', '显示', '1', 'show_hide', '显示/隐藏', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('4', '隐藏', '0', 'show_hide', '显示/隐藏', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('5', '是', '1', 'yes_no', '是/否', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('6', '否', '0', 'yes_no', '是/否', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('7', '红色', 'red', 'color', '颜色值', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('8', '绿色', 'green', 'color', '颜色值', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('9', '蓝色', 'blue', 'color', '颜色值', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('10', '黄色', 'yellow', 'color', '颜色值', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('11', '橙色', 'orange', 'color', '颜色值', '50', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('12', '默认主题', 'default', 'theme', '主题方案', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('13', '天蓝主题', 'cerulean', 'theme', '主题方案', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('14', '橙色主题', 'readable', 'theme', '主题方案', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('15', '红色主题', 'united', 'theme', '主题方案', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('16', 'Flat主题', 'flat', 'theme', '主题方案', '60', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('17', '国家', '1', 'sys_area_type', '区域类型', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('18', '省份、直辖市', '2', 'sys_area_type', '区域类型', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('19', '地市', '3', 'sys_area_type', '区域类型', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('20', '区县', '4', 'sys_area_type', '区域类型', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('21', '公司', '1', 'sys_office_type', '机构类型', '60', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('22', '部门', '2', 'sys_office_type', '机构类型', '70', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('23', '小组', '3', 'sys_office_type', '机构类型', '80', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('24', '其它', '4', 'sys_office_type', '机构类型', '90', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('25', '综合部', '1', 'sys_office_common', '快捷通用部门', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('26', '开发部', '2', 'sys_office_common', '快捷通用部门', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('27', '人力部', '3', 'sys_office_common', '快捷通用部门', '50', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('28', '一级', '1', 'sys_office_grade', '机构等级', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('29', '二级', '2', 'sys_office_grade', '机构等级', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('30', '三级', '3', 'sys_office_grade', '机构等级', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('31', '四级', '4', 'sys_office_grade', '机构等级', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('32', '所有数据', '1', 'sys_data_scope', '数据范围', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('33', '所在公司及以下数据', '2', 'sys_data_scope', '数据范围', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('34', '所在公司数据', '3', 'sys_data_scope', '数据范围', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('35', '所在部门及以下数据', '4', 'sys_data_scope', '数据范围', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('36', '所在部门数据', '5', 'sys_data_scope', '数据范围', '50', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('37', '仅本人数据', '8', 'sys_data_scope', '数据范围', '90', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('38', '按明细设置', '9', 'sys_data_scope', '数据范围', '100', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('39', '系统管理', '1', 'sys_user_type', '用户类型', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('40', '部门经理', '2', 'sys_user_type', '用户类型', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('41', '普通用户', '3', 'sys_user_type', '用户类型', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('42', '基础主题', 'basic', 'cms_theme', '站点主题', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('43', '蓝色主题', 'blue', 'cms_theme', '站点主题', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('44', '红色主题', 'red', 'cms_theme', '站点主题', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('45', '文章模型', 'article', 'cms_module', '栏目模型', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('46', '图片模型', 'picture', 'cms_module', '栏目模型', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('47', '下载模型', 'download', 'cms_module', '栏目模型', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('48', '链接模型', 'link', 'cms_module', '栏目模型', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('49', '专题模型', 'special', 'cms_module', '栏目模型', '50', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('50', '默认展现方式', '0', 'cms_show_modes', '展现方式', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('51', '首栏目内容列表', '1', 'cms_show_modes', '展现方式', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('52', '栏目第一条内容', '2', 'cms_show_modes', '展现方式', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('53', '发布', '0', 'cms_del_flag', '内容状态', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('54', '删除', '1', 'cms_del_flag', '内容状态', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('55', '审核', '2', 'cms_del_flag', '内容状态', '15', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('56', '首页焦点图', '1', 'cms_posid', '推荐位', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('57', '栏目页文章推荐', '2', 'cms_posid', '推荐位', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('58', '咨询', '1', 'cms_guestbook', '留言板分类', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('59', '建议', '2', 'cms_guestbook', '留言板分类', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('60', '投诉', '3', 'cms_guestbook', '留言板分类', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('61', '其它', '4', 'cms_guestbook', '留言板分类', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('62', '公休', '1', 'oa_leave_type', '请假类型', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('63', '病假', '2', 'oa_leave_type', '请假类型', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('64', '事假', '3', 'oa_leave_type', '请假类型', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('65', '调休', '4', 'oa_leave_type', '请假类型', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('66', '婚假', '5', 'oa_leave_type', '请假类型', '60', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('67', '接入日志', '1', 'sys_log_type', '日志类型', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('68', '异常日志', '2', 'sys_log_type', '日志类型', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('69', '请假流程', 'leave', 'act_type', '流程类型', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('70', '审批测试流程', 'test_audit', 'act_type', '流程类型', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('71', '分类1', '1', 'act_category', '流程分类', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('72', '分类2', '2', 'act_category', '流程分类', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('73', '增删改查', 'crud', 'gen_category', '代码生成分类', '10', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('74', '增删改查（包含从表）', 'crud_many', 'gen_category', '代码生成分类', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('75', '树结构', 'tree', 'gen_category', '代码生成分类', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('76', '=', '=', 'gen_query_type', '查询方式', '10', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('77', '!=', '!=', 'gen_query_type', '查询方式', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('78', '&gt;', '&gt;', 'gen_query_type', '查询方式', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('79', '&lt;', '&lt;', 'gen_query_type', '查询方式', '40', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('80', 'Between', 'between', 'gen_query_type', '查询方式', '50', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('81', 'Like', 'like', 'gen_query_type', '查询方式', '60', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('82', 'Left Like', 'left_like', 'gen_query_type', '查询方式', '70', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('83', 'Right Like', 'right_like', 'gen_query_type', '查询方式', '80', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('84', '文本框', 'input', 'gen_show_type', '字段生成方案', '10', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('85', '文本域', 'textarea', 'gen_show_type', '字段生成方案', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('86', '下拉框', 'select', 'gen_show_type', '字段生成方案', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('87', '复选框', 'checkbox', 'gen_show_type', '字段生成方案', '40', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('88', '单选框', 'radiobox', 'gen_show_type', '字段生成方案', '50', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('89', '日期选择', 'dateselect', 'gen_show_type', '字段生成方案', '60', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('90', '人员选择', 'userselect', 'gen_show_type', '字段生成方案', '70', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('91', '部门选择', 'officeselect', 'gen_show_type', '字段生成方案', '80', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('92', '区域选择', 'areaselect', 'gen_show_type', '字段生成方案', '90', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('93', 'String', 'String', 'gen_java_type', 'Java类型', '10', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('94', 'Long', 'Long', 'gen_java_type', 'Java类型', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('95', '仅持久层', 'dao', 'gen_category', '代码生成分类\0\0', '40', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('96', '男', '1', 'sex', '性别', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('97', '女', '2', 'sex', '性别', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('98', 'Integer', 'Integer', 'gen_java_type', 'Java类型', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('99', 'Double', 'Double', 'gen_java_type', 'Java类型', '40', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('100', 'Date', 'java.util.Date', 'gen_java_type', 'Java类型', '50', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('104', 'Custom', 'Custom', 'gen_java_type', 'Java类型', '90', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('105', '会议通告', '1', 'oa_notify_type', '通知通告类型', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('106', '奖惩通告', '2', 'oa_notify_type', '通知通告类型', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('107', '活动通告', '3', 'oa_notify_type', '通知通告类型', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('108', '草稿', '0', 'oa_notify_status', '通知通告状态', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('109', '发布', '1', 'oa_notify_status', '通知通告状态', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('110', '未读', '0', 'oa_notify_read', '通知通告状态', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('111', '已读', '1', 'oa_notify_read', '通知通告状态', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('112', '草稿', '0', 'oa_notify_status', '通知通告状态', '10', '0', '1', null, '1', null, '', '0');
INSERT INTO `sys_dict` VALUES ('113', '删除', '0', 'del_flag', '删除标记', null, null, null, null, null, null, '', '');
INSERT INTO `sys_dict` VALUES ('118', '关于', 'about', 'blog_type', '博客类型', null, null, null, null, null, null, '全url是:/blog/open/page/about', '');
INSERT INTO `sys_dict` VALUES ('119', '交流', 'communication', 'blog_type', '博客类型', null, null, null, null, null, null, '', '');
INSERT INTO `sys_dict` VALUES ('120', '文章', 'article', 'blog_type', '博客类型', null, null, null, null, null, null, '', '');
INSERT INTO `sys_dict` VALUES ('121', '我的测试内容', '3', 'del_flag', '测试', null, '0', null, null, null, null, '', '0');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL COMMENT '文件类型',
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1032165188309323778 DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_file
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL COMMENT '用户id',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `time` int(11) DEFAULT NULL COMMENT '响应时间',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `gmtCreate` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1080355631589777980 DEFAULT CHARSET=utf8mb4 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', '1', 'admin', '??', '136', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-12-26 13:55:19');
INSERT INTO `sys_log` VALUES ('2', '2', null, null, null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('1078856526661156866', '1', 'admin', '??', '237', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-12-29 11:33:35');
INSERT INTO `sys_log` VALUES ('1078856771658842114', '1', 'admin', '??', '40', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-12-29 11:34:33');
INSERT INTO `sys_log` VALUES ('1078857516579815426', '1', 'admin', '??', '94', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-12-29 11:37:31');
INSERT INTO `sys_log` VALUES ('1078857889591853057', '1', 'admin', '??', '78', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-12-29 11:39:00');
INSERT INTO `sys_log` VALUES ('1078859138294874114', '1', 'admin', '??', '72', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-12-29 11:43:57');
INSERT INTO `sys_log` VALUES ('1078860996593971202', '1', 'admin', '??', '112', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-12-29 11:51:20');
INSERT INTO `sys_log` VALUES ('1080308270901555201', '1', 'admin', '??????', '30', 'POST /common/sysDict/update', '{\"id\":[\"1\"],\"name\":[\"??\"],\"value\":[\"0\"],\"type\":[\"del_flag\"],\"description\":[\"????\"],\"sort\":[\"10\"],\"parentId\":[\"0\"],\"remarks\":[\"????\"]}', '127.0.0.1', '2019-01-02 11:42:18');
INSERT INTO `sys_log` VALUES ('1080308335841964034', '1', 'admin', '??????', '43', 'POST /common/sysDict/update', '{\"id\":[\"1\"],\"name\":[\"??\"],\"value\":[\"0\"],\"type\":[\"del_flag\"],\"description\":[\"????\"],\"sort\":[\"10\"],\"parentId\":[\"0\"],\"remarks\":[\"????\"]}', '127.0.0.1', '2019-01-02 11:42:33');
INSERT INTO `sys_log` VALUES ('1080308760519438338', '1', 'admin', '??????', '28', 'POST /common/sysDict/update', '{\"id\":[\"1\"],\"name\":[\"??\"],\"value\":[\"0\"],\"type\":[\"del_flag\"],\"description\":[\"??\"],\"sort\":[\"10\"],\"parentId\":[\"0\"],\"remarks\":[\"???\"]}', '127.0.0.1', '2019-01-02 11:44:14');
INSERT INTO `sys_log` VALUES ('1080309056234713090', '1', 'admin', '??', '80', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-02 11:45:25');
INSERT INTO `sys_log` VALUES ('1080309092943261698', '1', 'admin', '??????', '49', 'POST /common/sysDict/update', '{\"id\":[\"1\"],\"name\":[\"??\"],\"value\":[\"0\"],\"type\":[\"del_flag\"],\"description\":[\"??\"],\"sort\":[\"10\"],\"parentId\":[\"0\"],\"remarks\":[\"???\"]}', '127.0.0.1', '2019-01-02 11:45:34');
INSERT INTO `sys_log` VALUES ('1080309470355124226', '1', 'admin', '??????', '27', 'POST /common/sysDict/update', '{\"id\":[\"1\"],\"name\":[\"?????\"],\"value\":[\"0\"],\"type\":[\"del_flag\"],\"description\":[\"??\"],\"sort\":[\"10\"],\"parentId\":[\"0\"],\"remarks\":[\"???\"]}', '127.0.0.1', '2019-01-02 11:47:04');
INSERT INTO `sys_log` VALUES ('1080352458271645697', '1', 'admin', '登录', '76', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-02 14:37:53');
INSERT INTO `sys_log` VALUES ('1080352537762095105', '1', 'admin', '更新数据字典', '50', 'POST /common/sysDict/update', '{\"id\":[\"1\"],\"name\":[\"测试\"],\"value\":[\"0\"],\"type\":[\"del_flag\"],\"description\":[\"测试的相关内容\"],\"sort\":[\"10\"],\"parentId\":[\"0\"],\"remarks\":[\"测试\"]}', '127.0.0.1', '2019-01-02 14:38:12');
INSERT INTO `sys_log` VALUES ('1080352967841832961', '1', 'admin', '更新数据字典', '28', 'POST /common/sysDict/update', '{\"id\":[\"1\"],\"name\":[\"正常\"],\"value\":[\"0\"],\"type\":[\"del_flag\"],\"description\":[\"测试的相关内容\"],\"sort\":[\"10\"],\"parentId\":[\"0\"],\"remarks\":[\"正常\"]}', '127.0.0.1', '2019-01-02 14:39:54');
INSERT INTO `sys_log` VALUES ('1080354063779913730', '1', 'admin', '保存菜单', '14', 'POST /sys/menu/save', '{\"parentId\":[\"0\"],\"type\":[\"0\"],\"name\":[\"项目包\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"\"],\"icon\":[\"fa fa-camera-retro\"]}', '127.0.0.1', '2019-01-02 14:44:15');
INSERT INTO `sys_log` VALUES ('1080355631589777409', '1', 'admin', '保存菜单', '10', 'POST /sys/menu/save', '{\"parentId\":[\"0\"],\"type\":[\"0\"],\"name\":[\"ceshi\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"\"],\"icon\":[\"\"]}', '127.0.0.1', '2019-01-02 14:50:29');
INSERT INTO `sys_log` VALUES ('1080355631589777410', '1', 'admin', '登录', '91', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-02 15:15:26');
INSERT INTO `sys_log` VALUES ('1080355631589777411', '1', 'admin', '更新数据字典', '51', 'POST /common/sysDict/update', '{\"id\":[\"1\"],\"name\":[\"正常\"],\"value\":[\"0\"],\"type\":[\"del_flag\"],\"description\":[\"测试\"],\"sort\":[\"10\"],\"parentId\":[\"0\"],\"remarks\":[\"正常\"]}', '127.0.0.1', '2019-01-02 15:15:38');
INSERT INTO `sys_log` VALUES ('1080355631589777412', '1', 'admin', '添加数据字典', '37', 'POST /common/sysDict/save', '{\"name\":[\"我的测试内容\"],\"value\":[\"3\"],\"type\":[\"del_flag\"],\"description\":[\"测试\"],\"sort\":[\"\"],\"remarks\":[\"\"]}', '127.0.0.1', '2019-01-02 15:16:09');
INSERT INTO `sys_log` VALUES ('1080355631589777413', '1', 'admin', '登录', '18', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-02 15:20:55');
INSERT INTO `sys_log` VALUES ('1080355631589777414', '1', 'admin', '保存菜单', '18', 'POST /sys/menu/save', '{\"parentId\":[\"0\"],\"type\":[\"0\"],\"name\":[\"测试\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"\"],\"icon\":[\"\"]}', '127.0.0.1', '2019-01-02 15:21:12');
INSERT INTO `sys_log` VALUES ('1080355631589777415', '1', 'admin', '删除菜单', '21', 'POST /sys/menu/remove', '{\"id\":[\"212\"]}', '127.0.0.1', '2019-01-02 15:23:21');
INSERT INTO `sys_log` VALUES ('1080355631589777416', '1', 'admin', '登录', '89', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-02 15:26:37');
INSERT INTO `sys_log` VALUES ('1080355631589777417', '1', 'admin', '保存菜单', '17', 'POST /sys/menu/save', '{\"parentId\":[\"0\"],\"type\":[\"0\"],\"name\":[\"包管理\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"\"],\"icon\":[\"\"]}', '127.0.0.1', '2019-01-02 15:27:24');
INSERT INTO `sys_log` VALUES ('1080355631589777418', '1', 'admin', '删除菜单', '16', 'POST /sys/menu/remove', '{\"id\":[\"218\"]}', '127.0.0.1', '2019-01-02 15:28:57');
INSERT INTO `sys_log` VALUES ('1080355631589777419', '1', 'admin', '删除菜单', '15', 'POST /sys/menu/remove', '{\"id\":[\"217\"]}', '127.0.0.1', '2019-01-02 15:29:00');
INSERT INTO `sys_log` VALUES ('1080355631589777420', '1', 'admin', '删除菜单', '14', 'POST /sys/menu/remove', '{\"id\":[\"216\"]}', '127.0.0.1', '2019-01-02 15:29:03');
INSERT INTO `sys_log` VALUES ('1080355631589777421', '1', 'admin', '删除菜单', '12', 'POST /sys/menu/remove', '{\"id\":[\"215\"]}', '127.0.0.1', '2019-01-02 15:29:05');
INSERT INTO `sys_log` VALUES ('1080355631589777422', '1', 'admin', '删除菜单', '14', 'POST /sys/menu/remove', '{\"id\":[\"214\"]}', '127.0.0.1', '2019-01-02 15:29:08');
INSERT INTO `sys_log` VALUES ('1080355631589777423', '1', 'admin', '登录', '84', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-02 15:54:29');
INSERT INTO `sys_log` VALUES ('1080355631589777424', '1', 'admin', '更新角色', '59', 'POST /sys/role/update', '{\"id\":[\"1\"],\"menuIds\":[\"193,194,195,196,197,79,80,81,83,176,177,178,179,180,207,208,209,210,211,20,21,22,61,12,13,14,24,25,26,15,55,56,62,74,75,76,48,72,28,29,30,57,92,71,78,175,206,1,2,6,7,73,3,77,27,91,213,219,220,221,222,223,224,-1\"],\"roleName\":[\"超级用户角色\"],\"remark\":[\"超级管理员\"]}', '127.0.0.1', '2019-01-02 15:58:06');
INSERT INTO `sys_log` VALUES ('1080355631589777425', '1', 'admin', '登录', '156', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-03 13:37:20');
INSERT INTO `sys_log` VALUES ('1080355631589777426', '1', 'admin', '更新菜单', '90', 'POST /sys/menu/update', '{\"parentId\":[\"213\"],\"id\":[\"224\"],\"type\":[\"1\"],\"name\":[\"条目信息\"],\"url\":[\"/quotation/entry\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-file-code-o\"]}', '127.0.0.1', '2019-01-03 13:42:46');
INSERT INTO `sys_log` VALUES ('1080355631589777427', '1', 'admin', '登录', '71', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-03 13:44:08');
INSERT INTO `sys_log` VALUES ('1080355631589777428', '1', 'admin', '更新代码生成配置', '557', 'POST /common/generator/update', '{\"author\":[\"Aron\"],\"email\":[\"izenglong@163.com\"],\"package\":[\"com.ifast.quotation\"],\"autoRemovePre\":[\"on\"],\"tablePrefix\":[\"db\"],\"tinyint\":[\"Integer\"],\"smallint\":[\"Integer\"],\"mediumint\":[\"Integer\"],\"int\":[\"Integer\"],\"integer\":[\"Integer\"],\"bigint\":[\"Long\"],\"float\":[\"Float\"],\"double\":[\"Double\"],\"decimal\":[\"BigDecimal\"],\"bit\":[\"Boolean\"],\"char\":[\"String\"],\"varchar\":[\"String\"],\"tinytext\":[\"String\"],\"text\":[\"String\"],\"mediumtext\":[\"String\"],\"longtext\":[\"String\"],\"date\":[\"Date\"],\"datetime\":[\"Date\"],\"timestamp\":[\"Date\"]}', '127.0.0.1', '2019-01-03 13:47:04');
INSERT INTO `sys_log` VALUES ('1080355631589777429', '1', 'admin', '更新代码生成配置', '528', 'POST /common/generator/update', '{\"author\":[\"canxue\"],\"email\":[\"canuxe@qq.com\"],\"package\":[\"com.ifast.quotation\"],\"autoRemovePre\":[\"on\"],\"tablePrefix\":[\"db\"],\"tinyint\":[\"Integer\"],\"smallint\":[\"Integer\"],\"mediumint\":[\"Integer\"],\"int\":[\"Integer\"],\"integer\":[\"Integer\"],\"bigint\":[\"Long\"],\"float\":[\"Float\"],\"double\":[\"Double\"],\"decimal\":[\"BigDecimal\"],\"bit\":[\"Boolean\"],\"char\":[\"String\"],\"varchar\":[\"String\"],\"tinytext\":[\"String\"],\"text\":[\"String\"],\"mediumtext\":[\"String\"],\"longtext\":[\"String\"],\"date\":[\"Date\"],\"datetime\":[\"Date\"],\"timestamp\":[\"Date\"]}', '127.0.0.1', '2019-01-03 13:47:15');
INSERT INTO `sys_log` VALUES ('1080355631589777430', '1', 'admin', '根据数据表生成代码', '199', 'GET /common/generator/code/db_item', '{}', '127.0.0.1', '2019-01-03 13:47:22');
INSERT INTO `sys_log` VALUES ('1080355631589777431', '1', 'admin', '登录', '80', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-04 10:53:13');
INSERT INTO `sys_log` VALUES ('1080355631589777432', '1', 'admin', '更新角色', '84', 'POST /sys/role/update', '{\"id\":[\"1\"],\"menuIds\":[\"193,194,195,196,197,79,80,81,83,176,177,178,179,180,207,208,209,210,211,20,21,22,61,12,13,14,24,25,26,15,55,56,62,74,75,76,48,72,28,29,30,57,92,219,220,221,222,223,71,78,175,206,1,2,6,7,73,3,77,27,91,224,225,226,227,228,229,230,213,-1\"],\"roleName\":[\"超级用户角色\"],\"remark\":[\"超级管理员\"]}', '127.0.0.1', '2019-01-04 11:00:19');
INSERT INTO `sys_log` VALUES ('1080355631589777433', '1', 'admin', '更新菜单', '20', 'POST /sys/menu/update', '{\"parentId\":[\"225\"],\"id\":[\"226\"],\"type\":[\"2\"],\"name\":[\"查看\"],\"url\":[\"/quotation/item/list\"],\"perms\":[\"quotation:item:item\"],\"orderNum\":[\"6\"],\"icon\":[\"\"]}', '127.0.0.1', '2019-01-04 11:11:02');
INSERT INTO `sys_log` VALUES ('1080355631589777434', '1', 'admin', '登录', '27', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-04 11:14:43');
INSERT INTO `sys_log` VALUES ('1080355631589777435', '1', 'admin', '登录', '81', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-04 11:22:01');
INSERT INTO `sys_log` VALUES ('1080355631589777436', '1', 'admin', '登录', '22', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-04 11:37:46');
INSERT INTO `sys_log` VALUES ('1080355631589777437', '1', 'admin', '查询菜单树形数据', '26', 'GET /sys/menu/tree', '{}', '127.0.0.1', '2019-01-04 11:38:22');
INSERT INTO `sys_log` VALUES ('1080355631589777438', '1', 'admin', '启停定时任务', '55', 'POST /common/job/changeJobStatus', '{\"id\":[\"2\"],\"cmd\":[\"start\"]}', '127.0.0.1', '2019-01-04 11:41:13');
INSERT INTO `sys_log` VALUES ('1080355631589777439', '1', 'admin', '启停定时任务', '28', 'POST /common/job/changeJobStatus', '{\"id\":[\"2\"],\"cmd\":[\"stop\"]}', '127.0.0.1', '2019-01-04 11:41:25');
INSERT INTO `sys_log` VALUES ('1080355631589777440', '1', 'admin', '登录', '81', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-04 11:49:49');
INSERT INTO `sys_log` VALUES ('1080355631589777441', '1', 'admin', '登录', '77', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-04 11:52:32');
INSERT INTO `sys_log` VALUES ('1080355631589777442', '1', 'admin', '登录', '74', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-04 13:23:32');
INSERT INTO `sys_log` VALUES ('1080355631589777443', '1', 'admin', '登录', '81', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-04 13:29:04');
INSERT INTO `sys_log` VALUES ('1080355631589777444', '1', 'admin', '登录', '75', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-04 13:30:29');
INSERT INTO `sys_log` VALUES ('1080355631589777445', '1', 'admin', '更新菜单', '21', 'POST /sys/menu/update', '{\"parentId\":[\"225\"],\"id\":[\"228\"],\"type\":[\"2\"],\"name\":[\"修改\"],\"url\":[\"/quotation/item/edit\"],\"perms\":[\"quotation:item:edit\"],\"orderNum\":[\"6\"],\"icon\":[\"\"]}', '127.0.0.1', '2019-01-04 13:31:48');
INSERT INTO `sys_log` VALUES ('1080355631589777446', '1', 'admin', '登录', '32', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-04 13:33:41');
INSERT INTO `sys_log` VALUES ('1080355631589777447', '1', 'admin', '登录', '30', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-04 13:43:08');
INSERT INTO `sys_log` VALUES ('1080355631589777448', '1', 'admin', '修改条目表', '126934', 'POST /quotation/item/update', '{\"id\":[\"1\"],\"itemname\":[\"客房面积\"],\"packagetype\":[\"1\"],\"spendtime\":[\"12.02\"],\"spendpay\":[\"23\"]}', '127.0.0.1', '2019-01-04 13:45:26');
INSERT INTO `sys_log` VALUES ('1080355631589777449', '1', 'admin', '修改条目表', '26773', 'POST /quotation/item/update', '{\"id\":[\"1\"],\"itemname\":[\"客房面积为其\"],\"packagetype\":[\"1\"],\"spendtime\":[\"12.02\"],\"spendpay\":[\"23\"]}', '127.0.0.1', '2019-01-04 13:46:02');
INSERT INTO `sys_log` VALUES ('1080355631589777450', '1', 'admin', '登录', '84', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-04 13:49:18');
INSERT INTO `sys_log` VALUES ('1080355631589777451', '1', 'admin', '修改条目表', '114', 'POST /quotation/item/update', '{\"id\":[\"1\"],\"itemname\":[\"客房面积德萨\"],\"packagetype\":[\"1\"],\"spendtime\":[\"12.02\"],\"spendpay\":[\"23\"]}', '127.0.0.1', '2019-01-04 13:49:29');
INSERT INTO `sys_log` VALUES ('1080355631589777452', '1', 'admin', '修改条目表', '29', 'POST /quotation/item/update', '{\"id\":[\"1\"],\"itemname\":[\"客房面积\"],\"packagetype\":[\"1\"],\"spendtime\":[\"12.02\"],\"spendpay\":[\"23\"]}', '127.0.0.1', '2019-01-04 13:49:37');
INSERT INTO `sys_log` VALUES ('1080355631589777453', '1', 'admin', '登录', '18', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-04 14:09:14');
INSERT INTO `sys_log` VALUES ('1080355631589777454', '1', 'admin', '登录', '67', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-04 14:59:50');
INSERT INTO `sys_log` VALUES ('1080355631589777455', '1', 'admin', '登录', '78', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-04 15:00:59');
INSERT INTO `sys_log` VALUES ('1080355631589777456', '1', 'admin', '启停定时任务', '6781', 'POST /common/job/changeJobStatus', '{\"id\":[\"2\"],\"cmd\":[\"start\"]}', '127.0.0.1', '2019-01-04 15:08:10');
INSERT INTO `sys_log` VALUES ('1080355631589777457', '1', 'admin', '启停定时任务', '25', 'POST /common/job/changeJobStatus', '{\"id\":[\"2\"],\"cmd\":[\"stop\"]}', '127.0.0.1', '2019-01-04 15:10:52');
INSERT INTO `sys_log` VALUES ('1080355631589777458', '1', 'admin', '登录', '78', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-04 15:24:02');
INSERT INTO `sys_log` VALUES ('1080355631589777459', '1', 'admin', '登录', '20', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-04 15:34:20');
INSERT INTO `sys_log` VALUES ('1080355631589777460', '1', 'admin', '更新菜单', '23', 'POST /sys/menu/update', '{\"parentId\":[\"225\"],\"id\":[\"229\"],\"type\":[\"2\"],\"name\":[\"启用停用\"],\"url\":[\"/quotation/item/changeonOff\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"\"]}', '127.0.0.1', '2019-01-04 15:36:29');
INSERT INTO `sys_log` VALUES ('1080355631589777461', '1', 'admin', '启动停用条目', '47', 'POST /quotation/item/changeonOff', '{\"id\":[\"1\"],\"onoff\":[\"0\"]}', '127.0.0.1', '2019-01-04 15:37:26');
INSERT INTO `sys_log` VALUES ('1080355631589777462', '1', 'admin', '启动停用条目', '33', 'POST /quotation/item/changeonOff', '{\"id\":[\"1\"],\"onoff\":[\"0\"]}', '127.0.0.1', '2019-01-04 15:38:23');
INSERT INTO `sys_log` VALUES ('1080355631589777463', '1', 'admin', '登录', '35', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-04 15:40:45');
INSERT INTO `sys_log` VALUES ('1080355631589777464', '1', 'admin', '启动停用条目', '25353', 'POST /quotation/item/changeonOff', '{\"id\":[\"1\"],\"onoff\":[\"0\"]}', '127.0.0.1', '2019-01-04 15:41:18');
INSERT INTO `sys_log` VALUES ('1080355631589777465', '1', 'admin', '启动停用条目', '6574', 'POST /quotation/item/changeonOff', '{\"id\":[\"1\"],\"onoff\":[\"0\"]}', '127.0.0.1', '2019-01-04 15:41:49');
INSERT INTO `sys_log` VALUES ('1080355631589777466', '1', 'admin', '启动停用条目', '10596', 'POST /quotation/item/changeonOff', '{\"id\":[\"1\"],\"onoff\":[\"1\"]}', '127.0.0.1', '2019-01-04 15:44:20');
INSERT INTO `sys_log` VALUES ('1080355631589777467', '1', 'admin', '登录', '80', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-04 16:12:53');
INSERT INTO `sys_log` VALUES ('1080355631589777468', '1', 'admin', '根据数据表生成代码', '373', 'GET /common/generator/code/db_item', '{}', '127.0.0.1', '2019-01-04 16:12:59');
INSERT INTO `sys_log` VALUES ('1080355631589777469', '1', 'admin', '登录', '78', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-04 17:27:13');
INSERT INTO `sys_log` VALUES ('1080355631589777470', '-1', '', '登录', '19451', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-04 17:27:31');
INSERT INTO `sys_log` VALUES ('1080355631589777471', '1', 'admin', '登录', '107', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-04 18:08:02');
INSERT INTO `sys_log` VALUES ('1080355631589777472', '1', 'admin', '登录', '72', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-04 18:12:25');
INSERT INTO `sys_log` VALUES ('1080355631589777473', '1', 'admin', '根据数据表生成代码', '414084', 'GET /common/generator/code/db_item', '{}', '127.0.0.1', '2019-01-04 18:19:24');
INSERT INTO `sys_log` VALUES ('1080355631589777474', '1', 'admin', '登录', '140', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-07 10:18:33');
INSERT INTO `sys_log` VALUES ('1080355631589777475', '1', 'admin', '登录', '30', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-07 10:28:48');
INSERT INTO `sys_log` VALUES ('1080355631589777476', '1', 'admin', '更新菜单', '74', 'POST /sys/menu/update', '{\"parentId\":[\"224\"],\"id\":[\"219\"],\"type\":[\"2\"],\"name\":[\"查看\"],\"url\":[\"/quotation/entry/list\"],\"perms\":[\"quotation:entry:entry\"],\"orderNum\":[\"6\"],\"icon\":[\"\"]}', '127.0.0.1', '2019-01-07 10:29:48');
INSERT INTO `sys_log` VALUES ('1080355631589777477', '1', 'admin', '登录', '80', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-07 10:32:11');
INSERT INTO `sys_log` VALUES ('1080355631589777478', '1', 'admin', '登录', '83', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-07 10:57:46');
INSERT INTO `sys_log` VALUES ('1080355631589777479', '1', 'admin', '登录', '101', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-07 11:08:39');
INSERT INTO `sys_log` VALUES ('1080355631589777480', '1', 'admin', '登录', '21', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-07 11:21:06');
INSERT INTO `sys_log` VALUES ('1080355631589777481', '1', 'admin', '登录', '163', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-07 11:26:02');
INSERT INTO `sys_log` VALUES ('1080355631589777482', '1', 'admin', '登录', '102', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-07 11:28:12');
INSERT INTO `sys_log` VALUES ('1080355631589777483', '1', 'admin', '登录', '90', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-07 11:31:45');
INSERT INTO `sys_log` VALUES ('1080355631589777484', '1', 'admin', '登录', '87', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-07 11:35:33');
INSERT INTO `sys_log` VALUES ('1080355631589777485', '1', 'admin', '登录', '35', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-07 11:37:35');
INSERT INTO `sys_log` VALUES ('1080355631589777486', '1', 'admin', '更新菜单', '26', 'POST /sys/menu/update', '{\"parentId\":[\"224\"],\"id\":[\"221\"],\"type\":[\"2\"],\"name\":[\"修改\"],\"url\":[\"/quotation/entry/edit\"],\"perms\":[\"quotation:entry:edit\"],\"orderNum\":[\"6\"],\"icon\":[\"\"]}', '127.0.0.1', '2019-01-07 11:38:53');
INSERT INTO `sys_log` VALUES ('1080355631589777487', '1', 'admin', '登录', '84', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-07 11:40:05');
INSERT INTO `sys_log` VALUES ('1080355631589777488', '1', 'admin', '登录', '35', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-07 11:43:13');
INSERT INTO `sys_log` VALUES ('1080355631589777489', '1', 'admin', '登录', '83', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-07 11:50:50');
INSERT INTO `sys_log` VALUES ('1080355631589777490', '1', 'admin', '登录', '31', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-07 11:51:56');
INSERT INTO `sys_log` VALUES ('1080355631589777491', '1', 'admin', '登录', '75', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-07 13:35:44');
INSERT INTO `sys_log` VALUES ('1080355631589777492', '1', 'admin', '登录', '382', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-07 13:45:02');
INSERT INTO `sys_log` VALUES ('1080355631589777493', '1', 'admin', '登录', '98', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-07 14:58:16');
INSERT INTO `sys_log` VALUES ('1080355631589777494', '1', 'admin', '登录', '86', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-07 15:08:46');
INSERT INTO `sys_log` VALUES ('1080355631589777495', '1', 'admin', '登录', '141', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-07 15:11:12');
INSERT INTO `sys_log` VALUES ('1080355631589777496', '1', 'admin', '登录', '102', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-07 15:12:19');
INSERT INTO `sys_log` VALUES ('1080355631589777497', '1', 'admin', '登录', '119', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-07 15:27:18');
INSERT INTO `sys_log` VALUES ('1080355631589777498', '1', 'admin', '登录', '133', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-07 15:28:10');
INSERT INTO `sys_log` VALUES ('1080355631589777499', '1', 'admin', '登录', '116', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-07 17:10:22');
INSERT INTO `sys_log` VALUES ('1080355631589777500', '1', 'admin', '登录', '94', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-07 17:24:44');
INSERT INTO `sys_log` VALUES ('1080355631589777501', '1', 'admin', '登录', '76', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-07 17:26:35');
INSERT INTO `sys_log` VALUES ('1080355631589777502', '1', 'admin', '登录', '77', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-07 17:36:03');
INSERT INTO `sys_log` VALUES ('1080355631589777503', '1', 'admin', '登录', '80', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-07 17:47:29');
INSERT INTO `sys_log` VALUES ('1080355631589777504', '1', 'admin', '登录', '29', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-07 17:50:31');
INSERT INTO `sys_log` VALUES ('1080355631589777505', '1', 'admin', '登录', '72', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-07 17:53:43');
INSERT INTO `sys_log` VALUES ('1080355631589777506', '1', 'admin', '登录', '75', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-07 17:55:12');
INSERT INTO `sys_log` VALUES ('1080355631589777507', '1', 'admin', '保存菜单', '17', 'POST /sys/menu/save', '{\"parentId\":[\"0\"],\"type\":[\"0\"],\"name\":[\"酒店管理\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"\"],\"icon\":[\"\"]}', '127.0.0.1', '2019-01-07 17:58:00');
INSERT INTO `sys_log` VALUES ('1080355631589777508', '1', 'admin', '根据数据表生成代码', '142', 'GET /common/generator/code/db_hotel', '{}', '127.0.0.1', '2019-01-07 18:02:37');
INSERT INTO `sys_log` VALUES ('1080355631589777509', '1', 'admin', '登录', '75', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-07 18:14:10');
INSERT INTO `sys_log` VALUES ('1080355631589777510', '1', 'admin', '根据数据表生成代码', '166', 'GET /common/generator/code/db_hotel', '{}', '127.0.0.1', '2019-01-07 18:14:18');
INSERT INTO `sys_log` VALUES ('1080355631589777511', '1', 'admin', '登录', '353', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 10:11:57');
INSERT INTO `sys_log` VALUES ('1080355631589777512', '1', 'admin', '更新角色', '185', 'POST /sys/role/update', '{\"id\":[\"1\"],\"menuIds\":[\"193,194,195,196,197,79,80,81,83,176,177,178,179,180,207,208,209,210,211,20,21,22,61,12,13,14,24,25,26,15,55,56,62,74,75,76,48,72,28,29,30,57,92,219,220,221,222,223,226,227,228,229,230,71,78,175,206,1,2,6,7,73,3,77,27,91,224,225,213,231,239,240,241,242,243,238,-1\"],\"roleName\":[\"超级用户角色\"],\"remark\":[\"超级管理员\"]}', '127.0.0.1', '2019-01-08 10:16:41');
INSERT INTO `sys_log` VALUES ('1080355631589777513', '1', 'admin', '根据数据表生成代码', '435', 'GET /common/generator/code/db_hotel', '{}', '127.0.0.1', '2019-01-08 10:18:21');
INSERT INTO `sys_log` VALUES ('1080355631589777514', '1', 'admin', '登录', '95', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 10:24:45');
INSERT INTO `sys_log` VALUES ('1080355631589777515', '1', 'admin', '登录', '91', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 10:34:51');
INSERT INTO `sys_log` VALUES ('1080355631589777516', '1', 'admin', '登录', '83', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 10:43:11');
INSERT INTO `sys_log` VALUES ('1080355631589777517', '1', 'admin', '添加条目表', '47', 'POST /quotation/item/save', '{\"itemname\":[\"房间摆设\"],\"packagetype\":[\"2\"]}', '127.0.0.1', '2019-01-08 10:44:13');
INSERT INTO `sys_log` VALUES ('1080355631589777518', '1', 'admin', '启动停用条目', '49', 'POST /quotation/item/changeonOff', '{\"id\":[\"1\"],\"onoff\":[\"0\"]}', '127.0.0.1', '2019-01-08 10:44:25');
INSERT INTO `sys_log` VALUES ('1080355631589777519', '1', 'admin', '添加条目表', '31', 'POST /quotation/item/save', '{\"itemname\":[\"地面卫生\"],\"packagetype\":[\"3\"]}', '127.0.0.1', '2019-01-08 10:44:57');
INSERT INTO `sys_log` VALUES ('1080355631589777520', '1', 'admin', '登录', '18', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 11:00:53');
INSERT INTO `sys_log` VALUES ('1080355631589777521', '1', 'admin', '添加条目表', '63403', 'POST /quotation/item/save', '{\"itemname\":[\"客房面积测试\"],\"packagetype\":[\"1\"]}', '127.0.0.1', '2019-01-08 11:02:32');
INSERT INTO `sys_log` VALUES ('1080355631589777522', '1', 'admin', '登录', '110', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 11:05:48');
INSERT INTO `sys_log` VALUES ('1080355631589777523', '1', 'admin', '登录', '41', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 11:05:55');
INSERT INTO `sys_log` VALUES ('1080355631589777524', '1', 'admin', '添加条目表', '18869', 'POST /quotation/item/save', '{\"itemname\":[\"测试内容2\"],\"packagetype\":[\"1\"]}', '127.0.0.1', '2019-01-08 11:06:48');
INSERT INTO `sys_log` VALUES ('1080355631589777525', '1', 'admin', '添加条目表', '40785', 'POST /quotation/item/save', '{\"itemname\":[\"2435\"],\"packagetype\":[\"1\"]}', '127.0.0.1', '2019-01-08 11:08:21');
INSERT INTO `sys_log` VALUES ('1080355631589777526', '1', 'admin', '登录', '29', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 11:10:10');
INSERT INTO `sys_log` VALUES ('1080355631589777527', '1', 'admin', '添加条目表', '95789', 'POST /quotation/item/save', '{\"itemname\":[\"项目名称\"],\"packagetype\":[\"1\"]}', '127.0.0.1', '2019-01-08 11:12:02');
INSERT INTO `sys_log` VALUES ('1080355631589777528', '1', 'admin', '登录', '31', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 11:12:17');
INSERT INTO `sys_log` VALUES ('1080355631589777529', '1', 'admin', '登录', '69', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 11:12:30');
INSERT INTO `sys_log` VALUES ('1080355631589777530', '1', 'admin', '登录', '12', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 11:12:37');
INSERT INTO `sys_log` VALUES ('1080355631589777531', '1', 'admin', '添加条目表', '94356', 'POST /quotation/item/save', '{\"itemname\":[\"测试内容22\"],\"packagetype\":[\"1\"]}', '127.0.0.1', '2019-01-08 11:14:34');
INSERT INTO `sys_log` VALUES ('1080355631589777532', '1', 'admin', '登录', '30', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 11:14:56');
INSERT INTO `sys_log` VALUES ('1080355631589777533', '1', 'admin', '登录', '79', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 11:16:23');
INSERT INTO `sys_log` VALUES ('1080355631589777534', '1', 'admin', '添加条目表', '16267', 'POST /quotation/item/save', '{\"itemname\":[\"12122121\"],\"packagetype\":[\"1\"]}', '127.0.0.1', '2019-01-08 11:16:56');
INSERT INTO `sys_log` VALUES ('1080355631589777535', '1', 'admin', '登录', '76', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 11:29:39');
INSERT INTO `sys_log` VALUES ('1080355631589777536', '1', 'admin', '添加条目表', '15403', 'POST /quotation/item/save', '{\"itemname\":[\"暗示过的头发加一个好几款\"],\"packagetype\":[\"1\"]}', '127.0.0.1', '2019-01-08 11:30:13');
INSERT INTO `sys_log` VALUES ('1080355631589777537', '1', 'admin', '修改条目表', '17051', 'POST /quotation/item/update', '{\"id\":[\"11\"],\"itemname\":[\"暗示过的\"],\"packagetype\":[\"1\"],\"spendtime\":[\"\"],\"spendpay\":[\"\"]}', '127.0.0.1', '2019-01-08 11:32:03');
INSERT INTO `sys_log` VALUES ('1080355631589777538', '1', 'admin', '登录', '97', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 14:11:47');
INSERT INTO `sys_log` VALUES ('1080355631589777539', '1', 'admin', '登录', '524', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 14:22:48');
INSERT INTO `sys_log` VALUES ('1080355631589777540', '1', 'admin', '登录', '82', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 14:30:03');
INSERT INTO `sys_log` VALUES ('1080355631589777541', '1', 'admin', '登录', '82', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 14:40:45');
INSERT INTO `sys_log` VALUES ('1080355631589777542', '1', 'admin', '登录', '91', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 14:43:28');
INSERT INTO `sys_log` VALUES ('1080355631589777543', '1', 'admin', '查看条目细则', '22850', 'GET /quotation/item/viewdetail', '{\"itemId\":[\"1\"]}', '127.0.0.1', '2019-01-08 14:44:04');
INSERT INTO `sys_log` VALUES ('1080355631589777544', '1', 'admin', '查看条目细则', '14455', 'GET /quotation/item/viewdetail', '{\"itemId\":[\"1\"]}', '127.0.0.1', '2019-01-08 14:45:45');
INSERT INTO `sys_log` VALUES ('1080355631589777545', '1', 'admin', '登录', '82', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 14:48:16');
INSERT INTO `sys_log` VALUES ('1080355631589777546', '1', 'admin', '查看条目细则', '12086', 'GET /quotation/item/viewdetail', '{\"itemId\":[\"1\"]}', '127.0.0.1', '2019-01-08 14:48:33');
INSERT INTO `sys_log` VALUES ('1080355631589777547', '1', 'admin', '登录', '101', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 15:04:35');
INSERT INTO `sys_log` VALUES ('1080355631589777548', '1', 'admin', '登录', '83', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 15:18:07');
INSERT INTO `sys_log` VALUES ('1080355631589777549', '1', 'admin', '登录', '84', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 15:27:20');
INSERT INTO `sys_log` VALUES ('1080355631589777550', '1', 'admin', '登录', '35', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 15:30:28');
INSERT INTO `sys_log` VALUES ('1080355631589777551', '1', 'admin', '登录', '74', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 16:09:10');
INSERT INTO `sys_log` VALUES ('1080355631589777552', '1', 'admin', '登录', '34', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 16:11:19');
INSERT INTO `sys_log` VALUES ('1080355631589777553', '1', 'admin', '修改条目信息 ', '55864', 'POST /quotation/entry/update', '{\"id\":[\"1\"],\"entryname\":[\"客房面积1\"],\"packagetype\":[\"1\"],\"cleantype\":[\"擦洗\"],\"ratetype\":[\"1\",\"1\"],\"itemId\":[\"1\"],\"ratenum\":[\"0\"],\"spendtime\":[\"12.0\"],\"spendpay\":[\"13.00\"]}', '127.0.0.1', '2019-01-08 16:12:33');
INSERT INTO `sys_log` VALUES ('1080355631589777554', '1', 'admin', '登录', '242', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 16:22:18');
INSERT INTO `sys_log` VALUES ('1080355631589777555', '1', 'admin', '登录', '43', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 16:26:25');
INSERT INTO `sys_log` VALUES ('1080355631589777556', '1', 'admin', '更新代码生成配置', '647', 'POST /common/generator/update', '{\"author\":[\"canxue\"],\"email\":[\"canuxe@qq.com\"],\"package\":[\"com.ifast.unit\"],\"autoRemovePre\":[\"on\"],\"tablePrefix\":[\"db\"],\"tinyint\":[\"Integer\"],\"smallint\":[\"Integer\"],\"mediumint\":[\"Integer\"],\"int\":[\"Integer\"],\"integer\":[\"Integer\"],\"bigint\":[\"Long\"],\"float\":[\"Float\"],\"double\":[\"Double\"],\"decimal\":[\"BigDecimal\"],\"bit\":[\"Boolean\"],\"char\":[\"String\"],\"varchar\":[\"String\"],\"tinytext\":[\"String\"],\"text\":[\"String\"],\"mediumtext\":[\"String\"],\"longtext\":[\"String\"],\"date\":[\"Date\"],\"datetime\":[\"Date\"],\"timestamp\":[\"Date\"]}', '127.0.0.1', '2019-01-08 16:26:31');
INSERT INTO `sys_log` VALUES ('1080355631589777557', '1', 'admin', '根据数据表生成代码', '722', 'GET /common/generator/code/db_hotel', '{}', '127.0.0.1', '2019-01-08 16:26:48');
INSERT INTO `sys_log` VALUES ('1080355631589777558', '1', 'admin', '根据数据表生成代码', '86', 'GET /common/generator/code/db_hotel', '{}', '127.0.0.1', '2019-01-08 16:33:46');
INSERT INTO `sys_log` VALUES ('1080355631589777559', '1', 'admin', '登录', '92', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 16:35:51');
INSERT INTO `sys_log` VALUES ('1080355631589777560', '1', 'admin', '更新代码生成配置', '657', 'POST /common/generator/update', '{\"author\":[\"canxue\"],\"email\":[\"canuxe@qq.com\"],\"package\":[\"com.ifast.hotel\"],\"autoRemovePre\":[\"on\"],\"tablePrefix\":[\"db\"],\"tinyint\":[\"Integer\"],\"smallint\":[\"Integer\"],\"mediumint\":[\"Integer\"],\"int\":[\"Integer\"],\"integer\":[\"Integer\"],\"bigint\":[\"Long\"],\"float\":[\"Float\"],\"double\":[\"Double\"],\"decimal\":[\"BigDecimal\"],\"bit\":[\"Boolean\"],\"char\":[\"String\"],\"varchar\":[\"String\"],\"tinytext\":[\"String\"],\"text\":[\"String\"],\"mediumtext\":[\"String\"],\"longtext\":[\"String\"],\"date\":[\"Date\"],\"datetime\":[\"Date\"],\"timestamp\":[\"Date\"]}', '127.0.0.1', '2019-01-08 16:36:56');
INSERT INTO `sys_log` VALUES ('1080355631589777561', '1', 'admin', '根据数据表生成代码', '61', 'GET /common/generator/code/db_hotel', '{}', '127.0.0.1', '2019-01-08 16:37:02');
INSERT INTO `sys_log` VALUES ('1080355631589777562', '1', 'admin', '登录', '80', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 16:39:10');
INSERT INTO `sys_log` VALUES ('1080355631589777563', '1', 'admin', '登录', '80', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 16:43:14');
INSERT INTO `sys_log` VALUES ('1080355631589777564', '1', 'admin', '修改条目信息 ', '9822', 'POST /quotation/entry/update', '{\"id\":[\"2\"],\"entryname\":[\"客房面积2\"],\"packagetype\":[\"1\"],\"cleantype\":[\"擦洗\"],\"ratetype\":[\"1\",\"1\"],\"itemId\":[\"1\"],\"parentid\":[\"1\"],\"ratenum\":[\"0\"],\"spendtime\":[\"13.0\"],\"spendpay\":[\"14.00\"]}', '127.0.0.1', '2019-01-08 16:43:37');
INSERT INTO `sys_log` VALUES ('1080355631589777565', '1', 'admin', '登录', '36', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 16:44:29');
INSERT INTO `sys_log` VALUES ('1080355631589777566', '1', 'admin', '修改条目信息 ', '27450', 'POST /quotation/entry/update', '{\"id\":[\"2\"],\"entryname\":[\"客房面积2\"],\"packagetype\":[\"1\"],\"cleantype\":[\"擦洗\"],\"ratetype\":[\"1\",\"1\"],\"itemId\":[\"1\"],\"parentid\":[\"1\"],\"ratenum\":[\"0\"],\"spendtime\":[\"13.0\"],\"spendpay\":[\"14.00\"]}', '127.0.0.1', '2019-01-08 16:45:17');
INSERT INTO `sys_log` VALUES ('1080355631589777567', '1', 'admin', '登录', '24', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 17:03:06');
INSERT INTO `sys_log` VALUES ('1080355631589777568', '1', 'admin', '登录', '80', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 17:05:49');
INSERT INTO `sys_log` VALUES ('1080355631589777569', '1', 'admin', '登录', '35', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 17:09:46');
INSERT INTO `sys_log` VALUES ('1080355631589777570', '1', 'admin', '登录', '38', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 17:11:11');
INSERT INTO `sys_log` VALUES ('1080355631589777571', '1', 'admin', '登录', '83', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 17:14:09');
INSERT INTO `sys_log` VALUES ('1080355631589777572', '1', 'admin', '登录', '36', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 17:16:07');
INSERT INTO `sys_log` VALUES ('1080355631589777573', '1', 'admin', '登录', '83', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 17:24:14');
INSERT INTO `sys_log` VALUES ('1080355631589777574', '1', 'admin', '添加条目信息', '21544', 'POST /quotation/entry/save', '{\"entryname\":[\"阿斯蒂芬\"],\"packagetype\":[\"1\"],\"cleantype\":[\"擦洗\"],\"ratetype\":[\"\",\"1\"],\"ratenum\":[\"3\"],\"spendtime\":[\"13.0\"],\"spendpay\":[\"12\"]}', '127.0.0.1', '2019-01-08 17:24:51');
INSERT INTO `sys_log` VALUES ('1080355631589777575', '1', 'admin', '登录', '39', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 17:39:11');
INSERT INTO `sys_log` VALUES ('1080355631589777576', '1', 'admin', '登录', '35', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 17:40:46');
INSERT INTO `sys_log` VALUES ('1080355631589777577', '1', 'admin', '登录', '76', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 18:02:57');
INSERT INTO `sys_log` VALUES ('1080355631589777578', '1', 'admin', '登录', '29', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 18:05:49');
INSERT INTO `sys_log` VALUES ('1080355631589777579', '1', 'admin', '登录', '77', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 18:10:30');
INSERT INTO `sys_log` VALUES ('1080355631589777580', '1', 'admin', '登录', '76', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 18:12:42');
INSERT INTO `sys_log` VALUES ('1080355631589777581', '1', 'admin', '登录', '78', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 18:15:21');
INSERT INTO `sys_log` VALUES ('1080355631589777582', '1', 'admin', '登录', '276', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 18:16:08');
INSERT INTO `sys_log` VALUES ('1080355631589777583', '1', 'admin', '登录', '80', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 18:19:38');
INSERT INTO `sys_log` VALUES ('1080355631589777584', '1', 'admin', '登录', '28', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-08 18:22:07');
INSERT INTO `sys_log` VALUES ('1080355631589777585', '1', 'admin', '登录', '79', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 10:00:23');
INSERT INTO `sys_log` VALUES ('1080355631589777586', '1', 'admin', '登录', '21', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 10:11:11');
INSERT INTO `sys_log` VALUES ('1080355631589777587', '1', 'admin', '根据数据表生成代码', '280', 'GET /common/generator/code/db_hoom_price', '{}', '127.0.0.1', '2019-01-09 10:11:33');
INSERT INTO `sys_log` VALUES ('1080355631589777588', '1', 'admin', '登录', '135', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 10:12:20');
INSERT INTO `sys_log` VALUES ('1080355631589777589', '1', 'admin', '更新代码生成配置', '639', 'POST /common/generator/update', '{\"author\":[\"canxue\"],\"email\":[\"canuxe@qq.com\"],\"package\":[\"com.ifast.quotation\"],\"autoRemovePre\":[\"on\"],\"tablePrefix\":[\"db\"],\"tinyint\":[\"Integer\"],\"smallint\":[\"Integer\"],\"mediumint\":[\"Integer\"],\"int\":[\"Integer\"],\"integer\":[\"Integer\"],\"bigint\":[\"Long\"],\"float\":[\"Float\"],\"double\":[\"Double\"],\"decimal\":[\"BigDecimal\"],\"bit\":[\"Boolean\"],\"char\":[\"String\"],\"varchar\":[\"String\"],\"tinytext\":[\"String\"],\"text\":[\"String\"],\"mediumtext\":[\"String\"],\"longtext\":[\"String\"],\"date\":[\"Date\"],\"datetime\":[\"Date\"],\"timestamp\":[\"Date\"]}', '127.0.0.1', '2019-01-09 10:12:36');
INSERT INTO `sys_log` VALUES ('1080355631589777590', '1', 'admin', '根据数据表生成代码', '57', 'GET /common/generator/code/db_hoom_price', '{}', '127.0.0.1', '2019-01-09 10:12:39');
INSERT INTO `sys_log` VALUES ('1080355631589777591', '1', 'admin', '登录', '19', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 10:42:37');
INSERT INTO `sys_log` VALUES ('1080355631589777592', '1', 'admin', '登录', '23', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 13:38:18');
INSERT INTO `sys_log` VALUES ('1080355631589777593', '1', 'admin', '根据数据表生成代码', '1718', 'GET /common/generator/code/db_hotel', '{}', '127.0.0.1', '2019-01-09 13:42:18');
INSERT INTO `sys_log` VALUES ('1080355631589777594', '1', 'admin', '登录', '169', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 13:44:35');
INSERT INTO `sys_log` VALUES ('1080355631589777595', '1', 'admin', '登录', '27', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 14:09:03');
INSERT INTO `sys_log` VALUES ('1080355631589777596', '1', 'admin', '登录', '103', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 14:12:47');
INSERT INTO `sys_log` VALUES ('1080355631589777597', '1', 'admin', '登录', '29', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 14:21:21');
INSERT INTO `sys_log` VALUES ('1080355631589777598', '1', 'admin', '登录', '23', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 14:22:49');
INSERT INTO `sys_log` VALUES ('1080355631589777599', '1', 'admin', '登录', '33', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 15:20:35');
INSERT INTO `sys_log` VALUES ('1080355631589777600', '1', 'admin', '登录', '127', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 15:25:06');
INSERT INTO `sys_log` VALUES ('1080355631589777601', '1', 'admin', '登录', '103', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 15:29:56');
INSERT INTO `sys_log` VALUES ('1080355631589777602', '1', 'admin', '登录', '55', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 15:52:11');
INSERT INTO `sys_log` VALUES ('1080355631589777603', '1', 'admin', '登录', '31', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 15:56:55');
INSERT INTO `sys_log` VALUES ('1080355631589777604', '1', 'admin', '登录', '107', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 15:56:37');
INSERT INTO `sys_log` VALUES ('1080355631589777605', '1', 'admin', '登录', '26', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 16:19:02');
INSERT INTO `sys_log` VALUES ('1080355631589777606', '1', 'admin', '登录', '99', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 16:21:30');
INSERT INTO `sys_log` VALUES ('1080355631589777607', '1', 'admin', '登录', '32', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 16:22:28');
INSERT INTO `sys_log` VALUES ('1080355631589777608', '1', 'admin', '登录', '94', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 16:29:24');
INSERT INTO `sys_log` VALUES ('1080355631589777609', '1', 'admin', '登录', '45', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 16:29:35');
INSERT INTO `sys_log` VALUES ('1080355631589777610', '1', 'admin', '登录', '104', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 16:38:19');
INSERT INTO `sys_log` VALUES ('1080355631589777611', '1', 'admin', '登录', '131', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 16:41:28');
INSERT INTO `sys_log` VALUES ('1080355631589777612', '1', 'admin', '登录', '88', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 16:46:46');
INSERT INTO `sys_log` VALUES ('1080355631589777613', '1', 'admin', '修改条目表', '53', 'POST /quotation/item/update', '{\"id\":[\"1\"],\"itemname\":[\"门清洁\"],\"packagetype\":[\"1\"],\"spendtime\":[\"26.0\"],\"spendpay\":[\"28.00\"]}', '127.0.0.1', '2019-01-09 16:47:49');
INSERT INTO `sys_log` VALUES ('1080355631589777614', '1', 'admin', '添加条目表', '33', 'POST /quotation/item/save', '{\"itemname\":[\"通道清洁\"],\"packagetype\":[\"1\"]}', '127.0.0.1', '2019-01-09 16:48:00');
INSERT INTO `sys_log` VALUES ('1080355631589777615', '1', 'admin', '登录', '103', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 16:48:26');
INSERT INTO `sys_log` VALUES ('1080355631589777616', '1', 'admin', '添加条目表', '41', 'POST /quotation/item/save', '{\"itemname\":[\"客房面积\"],\"packagetype\":[\"2\"]}', '127.0.0.1', '2019-01-09 16:51:56');
INSERT INTO `sys_log` VALUES ('1080355631589777617', '1', 'admin', '登录', '144', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 16:51:55');
INSERT INTO `sys_log` VALUES ('1080355631589777618', '1', 'admin', '添加条目表', '32', 'POST /quotation/item/save', '{\"itemname\":[\"清洁面积\"],\"packagetype\":[\"2\"]}', '127.0.0.1', '2019-01-09 16:52:08');
INSERT INTO `sys_log` VALUES ('1080355631589777619', '1', 'admin', '登录', '92', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 16:53:08');
INSERT INTO `sys_log` VALUES ('1080355631589777620', '1', 'admin', '添加条目表', '41', 'POST /quotation/item/save', '{\"itemname\":[\"卫生间清洁\"],\"packagetype\":[\"3\"]}', '127.0.0.1', '2019-01-09 16:55:23');
INSERT INTO `sys_log` VALUES ('1080355631589777621', '1', 'admin', '添加条目表', '37', 'POST /quotation/item/save', '{\"itemname\":[\"卧室清洁\"],\"packagetype\":[\"3\"]}', '127.0.0.1', '2019-01-09 16:55:39');
INSERT INTO `sys_log` VALUES ('1080355631589777622', '1', 'admin', '查看条目细则', '40', 'GET /quotation/item/viewdetail', '{\"itemId\":[\"1\"]}', '127.0.0.1', '2019-01-09 16:55:49');
INSERT INTO `sys_log` VALUES ('1080355631589777623', '1', 'admin', '查看条目细则', '34', 'GET /quotation/item/viewdetail', '{\"itemId\":[\"1\"]}', '127.0.0.1', '2019-01-09 16:55:51');
INSERT INTO `sys_log` VALUES ('1080355631589777624', '1', 'admin', '查看条目细则', '10225', 'GET /quotation/item/viewdetail', '{\"itemId\":[\"1\"]}', '127.0.0.1', '2019-01-09 16:57:44');
INSERT INTO `sys_log` VALUES ('1080355631589777625', '1', 'admin', '登录', '25', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 17:01:04');
INSERT INTO `sys_log` VALUES ('1080355631589777626', '1', 'admin', '登录', '104', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 17:02:06');
INSERT INTO `sys_log` VALUES ('1080355631589777627', '1', 'admin', '登录', '28', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 17:03:42');
INSERT INTO `sys_log` VALUES ('1080355631589777628', '1', 'admin', '登录', '98', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 17:04:49');
INSERT INTO `sys_log` VALUES ('1080355631589777629', '1', 'admin', '登录', '17', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 17:17:42');
INSERT INTO `sys_log` VALUES ('1080355631589777630', '1', 'admin', '登录', '18', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 17:21:55');
INSERT INTO `sys_log` VALUES ('1080355631589777631', '1', 'admin', '登录', '105', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 17:22:31');
INSERT INTO `sys_log` VALUES ('1080355631589777632', '1', 'admin', '查看条目细则', '17699', 'GET /quotation/item/viewdetail', '{\"itemId\":[\"1\"]}', '127.0.0.1', '2019-01-09 17:26:13');
INSERT INTO `sys_log` VALUES ('1080355631589777633', '1', 'admin', '登录', '122', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 17:27:18');
INSERT INTO `sys_log` VALUES ('1080355631589777634', '1', 'admin', '查看条目细则', '58', 'GET /quotation/item/viewdetail', '{\"itemId\":[\"1\"]}', '127.0.0.1', '2019-01-09 17:27:36');
INSERT INTO `sys_log` VALUES ('1080355631589777635', '1', 'admin', '查看条目细则', '39', 'GET /quotation/item/viewdetail', '{\"itemId\":[\"1\"]}', '127.0.0.1', '2019-01-09 17:27:39');
INSERT INTO `sys_log` VALUES ('1080355631589777636', '1', 'admin', '查看条目细则', '67', 'GET /quotation/item/viewdetail', '{\"itemId\":[\"1\"]}', '127.0.0.1', '2019-01-09 17:27:40');
INSERT INTO `sys_log` VALUES ('1080355631589777637', '1', 'admin', '登录', '210', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 17:32:55');
INSERT INTO `sys_log` VALUES ('1080355631589777638', '1', 'admin', '查看条目细则', '374456', 'GET /quotation/item/viewdetail', '{\"itemId\":[\"1\"]}', '127.0.0.1', '2019-01-09 17:36:17');
INSERT INTO `sys_log` VALUES ('1080355631589777639', '1', 'admin', '登录', '12', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 17:37:52');
INSERT INTO `sys_log` VALUES ('1080355631589777640', '1', 'admin', '登录', '87', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 17:38:39');
INSERT INTO `sys_log` VALUES ('1080355631589777641', '1', 'admin', '登录', '95', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 17:39:44');
INSERT INTO `sys_log` VALUES ('1080355631589777642', '1', 'admin', '添加条目信息', '97', 'POST /quotation/entry/save', '{\"entryname\":[\"开关\"],\"packagetype\":[\"2\"],\"cleantype\":[\"擦洗\"],\"ratetype\":[\"\",\"1\"],\"ratenum\":[\"3\"],\"spendtime\":[\"12.0\"],\"spendpay\":[\"12.0\"]}', '127.0.0.1', '2019-01-09 17:42:03');
INSERT INTO `sys_log` VALUES ('1080355631589777643', '1', 'admin', '添加条目信息', '67', 'POST /quotation/entry/save', '{\"entryname\":[\"试衣镜\"],\"packagetype\":[\"2\"],\"cleantype\":[\"擦洗\"],\"ratetype\":[\"\",\"1\"],\"ratenum\":[\"3\"],\"spendtime\":[\"12.0\"],\"spendpay\":[\"12.00\"]}', '127.0.0.1', '2019-01-09 17:42:24');
INSERT INTO `sys_log` VALUES ('1080355631589777644', '1', 'admin', '登录', '93', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 17:42:26');
INSERT INTO `sys_log` VALUES ('1080355631589777645', '1', 'admin', '登录', '96', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 17:43:27');
INSERT INTO `sys_log` VALUES ('1080355631589777646', '1', 'admin', '添加条目信息', '65', 'POST /quotation/entry/save', '{\"entryname\":[\"床上布草\"],\"packagetype\":[\"2\"],\"cleantype\":[\"擦洗\"],\"ratetype\":[\"\",\"1\"],\"ratenum\":[\"3\"],\"spendtime\":[\"12.0\"],\"spendpay\":[\"13.00\"]}', '127.0.0.1', '2019-01-09 17:43:51');
INSERT INTO `sys_log` VALUES ('1080355631589777647', '1', 'admin', '添加条目信息', '65', 'POST /quotation/entry/save', '{\"entryname\":[\"靠枕\"],\"packagetype\":[\"2\"],\"cleantype\":[\"擦洗\"],\"ratetype\":[\"\",\"1\"],\"ratenum\":[\"3\"],\"spendtime\":[\"12.0\"],\"spendpay\":[\"13.00\"]}', '127.0.0.1', '2019-01-09 17:44:13');
INSERT INTO `sys_log` VALUES ('1080355631589777648', '1', 'admin', '登录', '110', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 17:45:27');
INSERT INTO `sys_log` VALUES ('1080355631589777649', '1', 'admin', '登录', '142', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 17:46:39');
INSERT INTO `sys_log` VALUES ('1080355631589777650', '1', 'admin', '登录', '20', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 17:57:53');
INSERT INTO `sys_log` VALUES ('1080355631589777651', '1', 'admin', '删除部门', '18', 'POST /sys/dept/remove', '{\"id\":[\"6\"]}', '127.0.0.1', '2019-01-09 17:58:45');
INSERT INTO `sys_log` VALUES ('1080355631589777652', '1', 'admin', '删除部门', '83', 'POST /sys/dept/remove', '{\"id\":[\"15\"]}', '127.0.0.1', '2019-01-09 17:58:53');
INSERT INTO `sys_log` VALUES ('1080355631589777653', '1', 'admin', '删除部门', '14', 'POST /sys/dept/remove', '{\"id\":[\"13\"]}', '127.0.0.1', '2019-01-09 17:58:55');
INSERT INTO `sys_log` VALUES ('1080355631589777654', '1', 'admin', '删除部门', '58', 'POST /sys/dept/remove', '{\"id\":[\"14\"]}', '127.0.0.1', '2019-01-09 17:59:00');
INSERT INTO `sys_log` VALUES ('1080355631589777655', '1', 'admin', '删除部门', '54', 'POST /sys/dept/remove', '{\"id\":[\"13\"]}', '127.0.0.1', '2019-01-09 17:59:03');
INSERT INTO `sys_log` VALUES ('1080355631589777656', '1', 'admin', '删除部门', '58', 'POST /sys/dept/remove', '{\"id\":[\"12\"]}', '127.0.0.1', '2019-01-09 18:00:05');
INSERT INTO `sys_log` VALUES ('1080355631589777657', '1', 'admin', '删除部门', '54', 'POST /sys/dept/remove', '{\"id\":[\"11\"]}', '127.0.0.1', '2019-01-09 18:00:10');
INSERT INTO `sys_log` VALUES ('1080355631589777658', '1', 'admin', '登录', '104', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 18:03:08');
INSERT INTO `sys_log` VALUES ('1080355631589777659', '1', 'admin', '登录', '84', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 18:25:28');
INSERT INTO `sys_log` VALUES ('1080355631589777660', '1', 'admin', '启动停用条目', '58', 'POST /quotation/item/changeonOff', '{\"id\":[\"15\"],\"onoff\":[\"1\"]}', '127.0.0.1', '2019-01-09 18:25:45');
INSERT INTO `sys_log` VALUES ('1080355631589777661', '1', 'admin', '启动停用条目', '8418', 'POST /quotation/item/changeonOff', '{\"id\":[\"15\"],\"onoff\":[\"1\"]}', '127.0.0.1', '2019-01-09 18:25:45');
INSERT INTO `sys_log` VALUES ('1080355631589777662', '1', 'admin', '启动停用条目', '35', 'POST /quotation/item/changeonOff', '{\"id\":[\"12\"],\"onoff\":[\"1\"]}', '127.0.0.1', '2019-01-09 18:26:04');
INSERT INTO `sys_log` VALUES ('1080355631589777663', '1', 'admin', '启动停用条目', '37', 'POST /quotation/item/changeonOff', '{\"id\":[\"14\"],\"onoff\":[\"1\"]}', '127.0.0.1', '2019-01-09 18:26:15');
INSERT INTO `sys_log` VALUES ('1080355631589777664', '1', 'admin', '登录', '140', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 18:38:39');
INSERT INTO `sys_log` VALUES ('1080355631589777665', '1', 'admin', '登录', '95', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 18:40:23');
INSERT INTO `sys_log` VALUES ('1080355631589777666', '1', 'admin', '登录', '22', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 18:41:50');
INSERT INTO `sys_log` VALUES ('1080355631589777667', '1', 'admin', '登录', '97', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 18:44:38');
INSERT INTO `sys_log` VALUES ('1080355631589777668', '1', 'admin', '登录', '98', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-09 18:46:00');
INSERT INTO `sys_log` VALUES ('1080355631589777669', '-1', '', '登录小程序', '15594', 'GET /api/users/login', '{}', '127.0.0.1', '2019-01-09 18:53:15');
INSERT INTO `sys_log` VALUES ('1080355631589777670', '-1', '', '登录小程序', '43102', 'GET /api/users/login', '{}', '127.0.0.1', '2019-01-09 18:54:23');
INSERT INTO `sys_log` VALUES ('1080355631589777671', '-1', '', '登录小程序', '15298', 'GET /api/users/login', '{}', '127.0.0.1', '2019-01-09 18:55:33');
INSERT INTO `sys_log` VALUES ('1080355631589777672', '-1', '', '登录小程序', '15185', 'GET /api/users/login', '{}', '127.0.0.1', '2019-01-09 18:56:26');
INSERT INTO `sys_log` VALUES ('1080355631589777673', '-1', '', '登录小程序', '58', 'GET /api/users/login', '{\"openId\":[\"aaaa\"]}', '127.0.0.1', '2019-01-09 19:00:26');
INSERT INTO `sys_log` VALUES ('1080355631589777674', '-1', '', '登录小程序', '19', 'GET /api/users/login', '{\"openId\":[\"aaa\"]}', '127.0.0.1', '2019-01-09 19:00:31');
INSERT INTO `sys_log` VALUES ('1080355631589777675', '-1', '', '登录小程序', '49', 'GET /api/users/login', '{\"openId\":[\"aaa\"]}', '127.0.0.1', '2019-01-09 19:01:24');
INSERT INTO `sys_log` VALUES ('1080355631589777676', '-1', '', '登录小程序', '18', 'GET /api/users/login', '{\"openId\":[\"aaa\"]}', '127.0.0.1', '2019-01-09 19:01:36');
INSERT INTO `sys_log` VALUES ('1080355631589777677', '-1', '', '登录小程序', '25', 'GET /api/users/login', '{\"openId\":[\"aaa\"]}', '127.0.0.1', '2019-01-09 19:01:58');
INSERT INTO `sys_log` VALUES ('1080355631589777678', '-1', '', '登录小程序', '26', 'GET /api/users/login', '{\"openId\":[\"aaa\"]}', '127.0.0.1', '2019-01-09 19:01:39');
INSERT INTO `sys_log` VALUES ('1080355631589777679', '-1', '', '登录小程序', '17', 'GET /api/users/login', '{\"openId\":[\"a\"]}', '127.0.0.1', '2019-01-09 19:02:17');
INSERT INTO `sys_log` VALUES ('1080355631589777680', '-1', '', '登录小程序', '41', 'GET /api/users/login', '{\"openId\":[\"aaa\"]}', '127.0.0.1', '2019-01-09 19:02:26');
INSERT INTO `sys_log` VALUES ('1080355631589777681', '-1', '', '登录小程序', '12', 'GET /api/users/login', '{\"openId\":[\"aa\"]}', '127.0.0.1', '2019-01-09 19:02:32');
INSERT INTO `sys_log` VALUES ('1080355631589777682', '-1', '', '登录小程序', '20', 'GET /api/users/login', '{\"openId\":[\"aaa\"]}', '127.0.0.1', '2019-01-09 19:21:58');
INSERT INTO `sys_log` VALUES ('1080355631589777683', '-1', '', '登录小程序', '43', 'GET /api/users/login', '{\"openId\":[\"aaa\"]}', '127.0.0.1', '2019-01-09 19:22:33');
INSERT INTO `sys_log` VALUES ('1080355631589777684', '-1', '', '登录小程序', '48', 'GET /api/users/login', '{\"openId\":[\"aaa\"]}', '127.0.0.1', '2019-01-10 09:54:29');
INSERT INTO `sys_log` VALUES ('1080355631589777685', '-1', '', '登录小程序', '63', 'GET /api/users/login', '{\"openId\":[\"aaa\"]}', '127.0.0.1', '2019-01-10 10:11:48');
INSERT INTO `sys_log` VALUES ('1080355631589777686', '-1', '', '登录小程序', '13', 'GET /api/users/login', '{\"openId\":[\"aaa1\"]}', '127.0.0.1', '2019-01-10 10:11:52');
INSERT INTO `sys_log` VALUES ('1080355631589777687', '-1', '', '登录小程序', '14', 'GET /api/users/login', '{\"openId\":[\"aaa\"]}', '127.0.0.1', '2019-01-10 10:11:58');
INSERT INTO `sys_log` VALUES ('1080355631589777688', '-1', '', '登录小程序', '142', 'GET /api/users/login', '{\"openId\":[\"aaa\"]}', '127.0.0.1', '2019-01-10 11:05:07');
INSERT INTO `sys_log` VALUES ('1080355631589777689', '-1', '', '登录小程序', '12', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 11:05:41');
INSERT INTO `sys_log` VALUES ('1080355631589777690', '-1', '', '登录小程序', '15', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 11:05:58');
INSERT INTO `sys_log` VALUES ('1080355631589777691', '-1', '', '登录小程序', '14', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 11:06:30');
INSERT INTO `sys_log` VALUES ('1080355631589777692', '-1', '', '登录小程序', '13', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 11:06:55');
INSERT INTO `sys_log` VALUES ('1080355631589777693', '-1', '', '绑定账户', '10685', 'GET /api/users/boundAccount', '{\"openId\":[\"123\"],\"mobile\":[\"15278792754\"]}', '127.0.0.1', '2019-01-10 11:09:31');
INSERT INTO `sys_log` VALUES ('1080355631589777694', '-1', '', '登录小程序', '20', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 11:09:29');
INSERT INTO `sys_log` VALUES ('1080355631589777695', '-1', '', '登录小程序', '12', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 11:09:30');
INSERT INTO `sys_log` VALUES ('1080355631589777696', '-1', '', '登录小程序', '13', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 11:09:35');
INSERT INTO `sys_log` VALUES ('1080355631589777697', '-1', '', '登录小程序', '12', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 11:09:39');
INSERT INTO `sys_log` VALUES ('1080355631589777698', '-1', '', '登录小程序', '12', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 11:09:58');
INSERT INTO `sys_log` VALUES ('1080355631589777699', '-1', '', '登录小程序', '15', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 11:10:20');
INSERT INTO `sys_log` VALUES ('1080355631589777700', '-1', '', '登录小程序', '14', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 11:10:40');
INSERT INTO `sys_log` VALUES ('1080355631589777701', '-1', '', '登录小程序', '17', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 11:11:48');
INSERT INTO `sys_log` VALUES ('1080355631589777702', '-1', '', '登录小程序', '14', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 11:12:06');
INSERT INTO `sys_log` VALUES ('1080355631589777703', '-1', '', '登录小程序', '16', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 11:15:08');
INSERT INTO `sys_log` VALUES ('1080355631589777704', '-1', '', '登录小程序', '18', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 11:17:28');
INSERT INTO `sys_log` VALUES ('1080355631589777705', '-1', '', '登录小程序', '14', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 11:18:42');
INSERT INTO `sys_log` VALUES ('1080355631589777706', '-1', '', '登录小程序', '12', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 11:18:58');
INSERT INTO `sys_log` VALUES ('1080355631589777707', '-1', '', '登录小程序', '11', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 11:19:26');
INSERT INTO `sys_log` VALUES ('1080355631589777708', '-1', '', '登录小程序', '12', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 11:19:48');
INSERT INTO `sys_log` VALUES ('1080355631589777709', '-1', '', '绑定账户', '7366', 'GET /api/users/boundAccount', '{\"openId\":[\"123\"],\"mobile\":[\"15278792752\"]}', '127.0.0.1', '2019-01-10 11:20:16');
INSERT INTO `sys_log` VALUES ('1080355631589777710', '-1', '', '登录小程序', '18', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 11:28:09');
INSERT INTO `sys_log` VALUES ('1080355631589777711', '1', 'admin', '登录', '2126', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '10.10.11.122', '2019-01-10 11:53:15');
INSERT INTO `sys_log` VALUES ('1080355631589777712', '-1', '', '登录小程序', '840', 'GET /api/users//login', '{\"openId\":[\"123\"]}', '127.0.0.1', '2019-01-10 12:32:45');
INSERT INTO `sys_log` VALUES ('1080355631589777713', '-1', '', '登录小程序', '23', 'GET /api/users//login', '{\"openId\":[\"123\"]}', '127.0.0.1', '2019-01-10 12:32:49');
INSERT INTO `sys_log` VALUES ('1080355631589777714', '-1', '', '登录小程序', '210', 'GET /api/users//login', '{\"openId\":[\"123\"]}', '127.0.0.1', '2019-01-10 12:44:14');
INSERT INTO `sys_log` VALUES ('1080355631589777715', '-1', '', '登录小程序', '223', 'GET /api/users//login', '{\"openId\":[\"123\"]}', '127.0.0.1', '2019-01-10 13:19:23');
INSERT INTO `sys_log` VALUES ('1080355631589777716', '-1', '', '登录小程序', '169', 'GET /api/users//login', '{\"openId\":[\"123\"]}', '127.0.0.1', '2019-01-10 13:24:08');
INSERT INTO `sys_log` VALUES ('1080355631589777717', '-1', '', '登录小程序', '146', 'GET /api/users/login', '{\"openId\":[\"aaa\"]}', '127.0.0.1', '2019-01-10 13:45:48');
INSERT INTO `sys_log` VALUES ('1080355631589777718', '-1', '', '登录小程序', '20', 'GET /api/users/login', '{\"openId\":[\"aaa1\"]}', '127.0.0.1', '2019-01-10 13:49:49');
INSERT INTO `sys_log` VALUES ('1080355631589777719', '-1', '', '登录小程序', '16', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 13:56:31');
INSERT INTO `sys_log` VALUES ('1080355631589777720', '-1', '', '登录小程序', '17', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 13:58:05');
INSERT INTO `sys_log` VALUES ('1080355631589777721', '-1', '', '登录小程序', '12', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 13:58:21');
INSERT INTO `sys_log` VALUES ('1080355631589777722', '-1', '', '登录小程序', '13', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 13:58:22');
INSERT INTO `sys_log` VALUES ('1080355631589777723', '1', 'admin', '登录', '83', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '10.10.11.122', '2019-01-10 14:12:45');
INSERT INTO `sys_log` VALUES ('1080355631589777724', '1', 'admin', '保存用户', '51', 'POST /sys/user/save', '{\"userId\":[\"\"],\"name\":[\"ces\"],\"username\":[\"cse\"],\"password\":[\"123456\"],\"deptId\":[\"\"],\"deptName\":[\"\"],\"email\":[\"12313131@qq.com\"],\"status\":[\"1\"],\"roleIds\":[\"56\"],\"role\":[\"56\"]}', '10.10.11.122', '2019-01-10 14:13:59');
INSERT INTO `sys_log` VALUES ('1080355631589777725', '-1', '', '登录小程序', '16', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 14:19:20');
INSERT INTO `sys_log` VALUES ('1080355631589777726', '-1', '', '登录小程序', '12', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 14:19:32');
INSERT INTO `sys_log` VALUES ('1080355631589777727', '1', 'admin', '登录', '165', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-10 15:10:38');
INSERT INTO `sys_log` VALUES ('1080355631589777728', '1', 'admin', '登录', '91', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-10 15:13:59');
INSERT INTO `sys_log` VALUES ('1080355631589777729', '1', 'admin', '登录', '93', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-10 15:19:28');
INSERT INTO `sys_log` VALUES ('1080355631589777730', '1', 'admin', '登录', '112', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-10 15:24:06');
INSERT INTO `sys_log` VALUES ('1080355631589777731', '-1', '', '登录小程序', '177', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 15:28:14');
INSERT INTO `sys_log` VALUES ('1080355631589777732', '-1', '', '绑定账户', '25', 'GET /api/users/boundAccount', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 15:28:16');
INSERT INTO `sys_log` VALUES ('1080355631589777733', '-1', '', '绑定账户', '25', 'GET /api/users/boundAccount', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 15:28:17');
INSERT INTO `sys_log` VALUES ('1080355631589777734', '-1', '', '登录小程序', '17', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 15:28:19');
INSERT INTO `sys_log` VALUES ('1080355631589777735', '-1', '', '绑定账户', '20', 'GET /api/users/boundAccount', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 15:28:21');
INSERT INTO `sys_log` VALUES ('1080355631589777736', '-1', '', '绑定账户', '20', 'GET /api/users/boundAccount', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 15:28:21');
INSERT INTO `sys_log` VALUES ('1080355631589777737', '-1', '', '绑定账户', '21', 'GET /api/users/boundAccount', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 15:28:22');
INSERT INTO `sys_log` VALUES ('1080355631589777738', '-1', '', '绑定账户', '27', 'GET /api/users/boundAccount', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 15:28:23');
INSERT INTO `sys_log` VALUES ('1080355631589777739', '-1', '', '绑定账户', '20', 'GET /api/users/boundAccount', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 15:28:24');
INSERT INTO `sys_log` VALUES ('1080355631589777740', '-1', '', '绑定账户', '24', 'GET /api/users/boundAccount', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 15:28:24');
INSERT INTO `sys_log` VALUES ('1080355631589777741', '-1', '', '绑定账户', '18', 'GET /api/users/boundAccount', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 15:28:26');
INSERT INTO `sys_log` VALUES ('1080355631589777742', '-1', '', '绑定账户', '21', 'GET /api/users/boundAccount', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 15:28:26');
INSERT INTO `sys_log` VALUES ('1080355631589777743', '-1', '', '绑定账户', '25', 'GET /api/users/boundAccount', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 15:28:28');
INSERT INTO `sys_log` VALUES ('1080355631589777744', '-1', '', '登录小程序', '23', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 15:29:06');
INSERT INTO `sys_log` VALUES ('1080355631589777745', '-1', '', '登录小程序', '23', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 15:29:26');
INSERT INTO `sys_log` VALUES ('1080355631589777746', '-1', '', '登录小程序', '18', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 15:29:52');
INSERT INTO `sys_log` VALUES ('1080355631589777747', '-1', '', '登录小程序', '28', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 15:35:31');
INSERT INTO `sys_log` VALUES ('1080355631589777748', '-1', '', '登录小程序', '15', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 15:35:46');
INSERT INTO `sys_log` VALUES ('1080355631589777749', '-1', '', '登录小程序', '25', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 15:38:29');
INSERT INTO `sys_log` VALUES ('1080355631589777750', '-1', '', '登录小程序', '20', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 15:39:09');
INSERT INTO `sys_log` VALUES ('1080355631589777751', '-1', '', '绑定账户', '19', 'GET /api/users/boundAccount', '{\"openId\":[\"wxd45681e2d1b4e5cd\"],\"mobile\":[\"undefined\"]}', '10.10.11.122', '2019-01-10 15:39:20');
INSERT INTO `sys_log` VALUES ('1080355631589777752', '-1', '', '绑定账户', '61458', 'GET /api/users/boundAccount', '{\"openId\":[\"wxd45681e2d1b4e5cd\"],\"mobile\":[\"undefined\"]}', '10.10.11.122', '2019-01-10 15:40:48');
INSERT INTO `sys_log` VALUES ('1080355631589777753', '-1', '', '登录小程序', '53', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 15:40:48');
INSERT INTO `sys_log` VALUES ('1080355631589777754', '-1', '', '登录小程序', '51', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 15:40:49');
INSERT INTO `sys_log` VALUES ('1080355631589777755', '-1', '', '绑定账户', '167', 'GET /api/users/boundAccount', '{\"openId\":[\"wxd45681e2d1b4e5cd\"],\"mobile\":[\"17706437133\"]}', '10.10.11.122', '2019-01-10 15:41:00');
INSERT INTO `sys_log` VALUES ('1080355631589777756', '-1', '', '绑定账户', '25074', 'GET /api/users/boundAccount', '{\"openId\":[\"wxd45681e2d1b4e5cd\"],\"mobile\":[\"17706437133\"]}', '10.10.11.122', '2019-01-10 15:41:43');
INSERT INTO `sys_log` VALUES ('1080355631589777757', '-1', '', '登录小程序', '29', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 15:43:03');
INSERT INTO `sys_log` VALUES ('1080355631589777758', '-1', '', '登录小程序', '31', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 15:44:06');
INSERT INTO `sys_log` VALUES ('1080355631589777759', '-1', '', '绑定账户', '2045', 'GET /api/users/boundAccount', '{\"openId\":[\"wxd45681e2d1b4e5cd\"],\"mobile\":[\"17706437133\"],\"password\":[\"123321\"]}', '10.10.11.122', '2019-01-10 15:45:07');
INSERT INTO `sys_log` VALUES ('1080355631589777760', '1', 'admin', '登录小程序', '1068', 'GET /api/users/login', '{\"openId\":[\"123\"]}', '127.0.0.1', '2019-01-10 15:45:32');
INSERT INTO `sys_log` VALUES ('1080355631589777761', '-1', '', '绑定账户', '3034', 'GET /api/users/boundAccount', '{\"openId\":[\"wxd45681e2d1b4e5cd\"],\"mobile\":[\"17706437133\"],\"password\":[\"123321\"]}', '10.10.11.122', '2019-01-10 15:45:24');
INSERT INTO `sys_log` VALUES ('1080355631589777762', '1', 'admin', '绑定账户', '160', 'GET /api/users/boundAccount', '{\"openId\":[\"wxd45681e2d1b4e5cd\"],\"mobile\":[\"17706437133\"],\"password\":[\"123321\"]}', '127.0.0.1', '2019-01-10 15:46:54');
INSERT INTO `sys_log` VALUES ('1080355631589777763', '1', 'admin', '绑定账户', '32', 'GET /api/users/boundAccount', '{\"openId\":[\"wxd45681e2d1b4e5cd\"],\"mobile\":[\"17706437133\"],\"password\":[\"123321\"]}', '127.0.0.1', '2019-01-10 15:47:11');
INSERT INTO `sys_log` VALUES ('1080355631589777764', '1', 'admin', '绑定账户', '35', 'GET /api/users/boundAccount', '{\"openId\":[\"wxd45681e2d1b4e5cd\"],\"mobile\":[\"17706437133\"],\"password\":[\"123321\"]}', '127.0.0.1', '2019-01-10 15:47:33');
INSERT INTO `sys_log` VALUES ('1080355631589777765', '1', 'admin', '登录小程序', '15', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"],\"mobile\":[\"17706437133\"],\"password\":[\"123321\"]}', '127.0.0.1', '2019-01-10 15:47:45');
INSERT INTO `sys_log` VALUES ('1080355631589777766', '1', 'admin', '登录小程序', '21', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '127.0.0.1', '2019-01-10 15:47:55');
INSERT INTO `sys_log` VALUES ('1080355631589777767', '1', 'admin', '绑定账户', '30', 'GET /api/users/boundAccount', '{\"openId\":[\"123\"],\"mobile\":[\"15278792752\"]}', '127.0.0.1', '2019-01-10 15:48:49');
INSERT INTO `sys_log` VALUES ('1080355631589777768', '1', 'admin', '登录小程序', '17', 'GET /api/users/login', '{\"openId\":[\"123\"]}', '127.0.0.1', '2019-01-10 15:49:24');
INSERT INTO `sys_log` VALUES ('1080355631589777769', '1', 'admin', '登录小程序', '15', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '127.0.0.1', '2019-01-10 15:49:43');
INSERT INTO `sys_log` VALUES ('1080355631589777770', '-1', '', '登录小程序', '160', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '127.0.0.1', '2019-01-10 15:51:28');
INSERT INTO `sys_log` VALUES ('1080355631589777771', '-1', '', '登录小程序', '28', 'GET /api/users/login', '{\"openId\":[\"123\"]}', '127.0.0.1', '2019-01-10 15:51:42');
INSERT INTO `sys_log` VALUES ('1080355631589777772', '-1', '', '登录小程序', '30', 'GET /api/users/login', '{\"openId\":[\"123\"]}', '127.0.0.1', '2019-01-10 15:51:44');
INSERT INTO `sys_log` VALUES ('1080355631589777773', '-1', '', '登录小程序', '21', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '127.0.0.1', '2019-01-10 15:51:57');
INSERT INTO `sys_log` VALUES ('1080355631589777774', '-1', '', '登录小程序', '16', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '127.0.0.1', '2019-01-10 15:52:01');
INSERT INTO `sys_log` VALUES ('1080355631589777775', '-1', '', '登录小程序', '18', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '127.0.0.1', '2019-01-10 15:52:28');
INSERT INTO `sys_log` VALUES ('1080355631589777776', '-1', '', '登录小程序', '14696', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '127.0.0.1', '2019-01-10 15:53:13');
INSERT INTO `sys_log` VALUES ('1080355631589777777', '-1', '', '登录小程序', '70688', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '127.0.0.1', '2019-01-10 15:54:29');
INSERT INTO `sys_log` VALUES ('1080355631589777778', '-1', '', '登录小程序', '12098', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '127.0.0.1', '2019-01-10 15:55:17');
INSERT INTO `sys_log` VALUES ('1080355631589777779', '-1', '', '登录小程序', '33', 'GET /api/users/login', '{\"openId\":[\"123\"]}', '127.0.0.1', '2019-01-10 15:57:48');
INSERT INTO `sys_log` VALUES ('1080355631589777780', '-1', '', '登录小程序', '22', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '127.0.0.1', '2019-01-10 15:57:56');
INSERT INTO `sys_log` VALUES ('1080355631589777781', '-1', '', '登录小程序', '15854', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '127.0.0.1', '2019-01-10 15:58:20');
INSERT INTO `sys_log` VALUES ('1080355631589777782', '-1', '', '登录小程序', '118', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '127.0.0.1', '2019-01-10 16:00:01');
INSERT INTO `sys_log` VALUES ('1080355631589777783', '-1', '', '登录小程序', '63336', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '127.0.0.1', '2019-01-10 16:02:03');
INSERT INTO `sys_log` VALUES ('1080355631589777784', '-1', '', '登录小程序', '150', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '127.0.0.1', '2019-01-10 16:02:04');
INSERT INTO `sys_log` VALUES ('1080355631589777785', '-1', '', '登录小程序', '26', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '127.0.0.1', '2019-01-10 16:02:46');
INSERT INTO `sys_log` VALUES ('1080355631589777786', '-1', '', '登录小程序', '24', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '127.0.0.1', '2019-01-10 16:02:51');
INSERT INTO `sys_log` VALUES ('1080355631589777787', '-1', '', '登录小程序', '14974', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '127.0.0.1', '2019-01-10 16:03:18');
INSERT INTO `sys_log` VALUES ('1080355631589777788', '-1', '', '登录小程序', '6259', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '127.0.0.1', '2019-01-10 16:04:13');
INSERT INTO `sys_log` VALUES ('1080355631589777789', '-1', '', '登录小程序', '11546', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '127.0.0.1', '2019-01-10 16:04:33');
INSERT INTO `sys_log` VALUES ('1080355631589777790', '-1', '', '登录小程序', '67', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '127.0.0.1', '2019-01-10 16:06:34');
INSERT INTO `sys_log` VALUES ('1080355631589777791', '1', 'admin', '登录', '75', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-10 16:10:36');
INSERT INTO `sys_log` VALUES ('1080355631589777792', '1', 'admin', '保存用户', '56', 'POST /sys/user/save', '{\"userId\":[\"\"],\"name\":[\"zuohao\"],\"username\":[\"17600137378\"],\"password\":[\"123456\"],\"deptId\":[\"\"],\"deptName\":[\"\"],\"email\":[\"17600137378@163.com\"],\"status\":[\"1\"],\"roleIds\":[\"1\"],\"role\":[\"1\"]}', '127.0.0.1', '2019-01-10 16:11:16');
INSERT INTO `sys_log` VALUES ('1080355631589777793', '-1', '', '绑定账户', '225', 'GET /api/users/boundAccount', '{\"openId\":[\"wxd45681e2d1b4e5cd\"],\"mobile\":[\"17706437133\"],\"password\":[\"123321\"]}', '10.10.11.122', '2019-01-10 16:13:08');
INSERT INTO `sys_log` VALUES ('1080355631589777794', '-1', '', '登录小程序', '27', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 16:13:23');
INSERT INTO `sys_log` VALUES ('1080355631589777795', '-1', '', '绑定账户', '32', 'GET /api/users/boundAccount', '{\"openId\":[\"wxd45681e2d1b4e5cd\"],\"mobile\":[\"17706437133\"],\"password\":[\"123321\"]}', '10.10.11.122', '2019-01-10 16:14:14');
INSERT INTO `sys_log` VALUES ('1080355631589777796', '-1', '', '登录小程序', '20', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 16:17:56');
INSERT INTO `sys_log` VALUES ('1080355631589777797', '-1', '', '登录小程序', '21', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 16:18:31');
INSERT INTO `sys_log` VALUES ('1080355631589777798', '-1', '', '登录小程序', '18', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 16:19:35');
INSERT INTO `sys_log` VALUES ('1080355631589777799', '-1', '', '登录小程序', '15', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 16:19:54');
INSERT INTO `sys_log` VALUES ('1080355631589777800', '1', 'admin', '登录', '92', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-10 16:20:49');
INSERT INTO `sys_log` VALUES ('1080355631589777801', '-1', '', '登录小程序', '13', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 16:20:30');
INSERT INTO `sys_log` VALUES ('1080355631589777802', '1', 'admin', '登录', '98', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-10 16:30:59');
INSERT INTO `sys_log` VALUES ('1080355631589777803', '1', 'admin', '保存用户', '59', 'POST /sys/user/save', '{\"userId\":[\"\"],\"name\":[\"zuohao\"],\"username\":[\"17600137378\"],\"password\":[\"123456\"],\"deptId\":[\"\"],\"deptName\":[\"\"],\"email\":[\"17600137378@163.com\"],\"status\":[\"1\"],\"roleIds\":[\"1\"],\"role\":[\"1\"]}', '127.0.0.1', '2019-01-10 16:32:50');
INSERT INTO `sys_log` VALUES ('1080355631589777804', '-1', '', '登录', '81', 'POST /login', '{\"username\":[\"zuohao\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-10 16:35:12');
INSERT INTO `sys_log` VALUES ('1080355631589777805', '-1', '', '登录', '50', 'POST /login', '{\"username\":[\"zuohao\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-10 16:35:14');
INSERT INTO `sys_log` VALUES ('1080355631589777806', '-1', '', '登录', '19', 'POST /login', '{\"username\":[\"zuohao\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-10 16:35:15');
INSERT INTO `sys_log` VALUES ('1080355631589777807', '-1', '', '登录', '20', 'POST /login', '{\"username\":[\"zuohao\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-10 16:35:15');
INSERT INTO `sys_log` VALUES ('1080355631589777808', '-1', '', '登录', '12', 'POST /login', '{\"username\":[\"zuohao\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-10 16:35:16');
INSERT INTO `sys_log` VALUES ('1080355631589777809', '-1', '', '登录', '15', 'POST /login', '{\"username\":[\"zuohao\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-10 16:35:16');
INSERT INTO `sys_log` VALUES ('1080355631589777810', '-1', '', '登录', '13', 'POST /login', '{\"username\":[\"zuohao\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-10 16:35:17');
INSERT INTO `sys_log` VALUES ('1080355631589777811', '-1', '', '登录', '20', 'POST /login', '{\"username\":[\"zuohao\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-10 16:35:21');
INSERT INTO `sys_log` VALUES ('1080355631589777812', '-1', '', '登录', '14', 'POST /login', '{\"username\":[\"zuohao\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-10 16:35:22');
INSERT INTO `sys_log` VALUES ('1080355631589777813', '-1', '', '登录', '115', 'POST /login', '{\"username\":[\"zuohao\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-10 16:35:23');
INSERT INTO `sys_log` VALUES ('1080355631589777814', '-1', '', '登录', '13', 'POST /login', '{\"username\":[\"zuohao\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-10 16:35:23');
INSERT INTO `sys_log` VALUES ('1080355631589777815', '-1', '', '登录', '18', 'POST /login', '{\"username\":[\"zuohao\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-10 16:35:22');
INSERT INTO `sys_log` VALUES ('1080355631589777816', '-1', '', '登录', '13', 'POST /login', '{\"username\":[\"zuohao\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-10 16:35:23');
INSERT INTO `sys_log` VALUES ('1080355631589777817', '-1', '', '登录', '12', 'POST /login', '{\"username\":[\"zuohao\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-10 16:35:24');
INSERT INTO `sys_log` VALUES ('1080355631589777818', '-1', '', '登录', '19', 'POST /login', '{\"username\":[\"zuohao\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-10 16:35:24');
INSERT INTO `sys_log` VALUES ('1080355631589777819', '-1', '', '登录', '83', 'POST /login', '{\"mobile\":[\"13000000001\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-10 16:45:35');
INSERT INTO `sys_log` VALUES ('1080355631589777820', '-1', '', '登录', '20', 'POST /login', '{\"mobile\":[\"13000000001\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-10 16:45:36');
INSERT INTO `sys_log` VALUES ('1080355631589777821', '-1', '', '登录', '17', 'POST /login', '{\"mobile\":[\"13000000001\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-10 16:45:36');
INSERT INTO `sys_log` VALUES ('1080355631589777822', '1', 'admin', '登录', '100', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-10 16:49:53');
INSERT INTO `sys_log` VALUES ('1080355631589777823', '1', 'admin', '保存用户', '63', 'POST /sys/user/save', '{\"userId\":[\"\"],\"name\":[\"zuohao\"],\"username\":[\"zuohao_dada\",\"17600137378\"],\"password\":[\"123456\"],\"deptId\":[\"\"],\"deptName\":[\"\"],\"email\":[\"17600137378@163.com\"],\"status\":[\"1\"],\"roleIds\":[\"1\"],\"role\":[\"1\"]}', '127.0.0.1', '2019-01-10 16:50:28');
INSERT INTO `sys_log` VALUES ('1080355631589777824', '1', 'admin', '登录', '90', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-10 16:52:49');
INSERT INTO `sys_log` VALUES ('1080355631589777825', '1', 'admin', '保存用户', '48', 'POST /sys/user/save', '{\"userId\":[\"\"],\"name\":[\"zuohao\"],\"username\":[\"zuohao_dada\"],\"mobile\":[\"13000000001\"],\"password\":[\"123456\"],\"deptId\":[\"\"],\"deptName\":[\"\"],\"email\":[\"17600137378@163.com\"],\"status\":[\"1\"],\"roleIds\":[\"1\"],\"role\":[\"1\"]}', '127.0.0.1', '2019-01-10 16:53:48');
INSERT INTO `sys_log` VALUES ('1080355631589777826', '-1', '', '登录', '105', 'POST /login', '{\"mobile\":[\"13000000001\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-10 16:56:35');
INSERT INTO `sys_log` VALUES ('1080355631589777827', '-1', '', '登录', '61108', 'POST /login', '{\"mobile\":[\"13000000001\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-10 16:58:36');
INSERT INTO `sys_log` VALUES ('1080355631589777828', '-1', '', '登录', '132995', 'POST /login', '{\"mobile\":[\"13000000001\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-10 17:02:46');
INSERT INTO `sys_log` VALUES ('1080355631589777829', '-1', '', '登录', '163345', 'POST /login', '{\"mobile\":[\"13000000001\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-10 17:06:31');
INSERT INTO `sys_log` VALUES ('1080355631589777830', '-1', '', '登录', '19354', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-10 17:17:06');
INSERT INTO `sys_log` VALUES ('1080355631589777831', '1', 'admin', '登录', '47', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-10 17:17:06');
INSERT INTO `sys_log` VALUES ('1080355631589777832', '1', 'admin', '登录', '19', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-10 17:17:20');
INSERT INTO `sys_log` VALUES ('1080355631589777833', '7', 'zuohao_dada', '登录', '5668', 'POST /login', '{\"mobile\":[\"13000000001\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-10 17:19:45');
INSERT INTO `sys_log` VALUES ('1080355631589777834', '7', 'Admin', '登录', '98', 'POST /login', '{\"mobile\":[\"13000000001\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-10 17:22:43');
INSERT INTO `sys_log` VALUES ('1080355631589777835', '-1', '', '绑定账户', '65399', 'GET /api/users/boundAccount', '{\"openId\":[\"17600137378\"],\"mobile\":[\"17600137378\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-10 17:27:55');
INSERT INTO `sys_log` VALUES ('1080355631589777836', '-1', '', '绑定账户', '29394', 'GET /api/users/boundAccount', '{\"openId\":[\"13000000001\"],\"mobile\":[\"17600137378\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-10 17:28:34');
INSERT INTO `sys_log` VALUES ('1080355631589777837', '-1', '', '绑定账户', '35104', 'GET /api/users/boundAccount', '{\"openId\":[\"13000000001\"],\"mobile\":[\"13000000001\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-10 17:29:13');
INSERT INTO `sys_log` VALUES ('1080355631589777838', '-1', '', '绑定账户', '10868', 'GET /api/users/boundAccount', '{\"openId\":[\"13000000001\"],\"mobile\":[\"13000000001\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-10 17:29:52');
INSERT INTO `sys_log` VALUES ('1080355631589777839', '-1', '', '绑定账户', '6988', 'GET /api/users/boundAccount', '{\"openId\":[\"13000000001\"],\"mobile\":[\"13000000001\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-10 17:30:17');
INSERT INTO `sys_log` VALUES ('1080355631589777840', '7', 'Admin', '登录', '62', 'POST /login', '{\"mobile\":[\"13000000001\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-10 17:32:41');
INSERT INTO `sys_log` VALUES ('1080355631589777841', '-1', '', '登录', '120', 'POST /login', '{\"mobile\":[\"13000000001\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-10 17:39:25');
INSERT INTO `sys_log` VALUES ('1080355631589777842', '7', 'Admin', '登录', '26', 'POST /login', '{\"mobile\":[\"13000000001\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-10 17:39:29');
INSERT INTO `sys_log` VALUES ('1080355631589777843', '7', 'Admin', '登录', '96', 'POST /login', '{\"mobile\":[\"13000000001\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-10 17:45:31');
INSERT INTO `sys_log` VALUES ('1080355631589777844', '7', 'Admin', '保存用户', '52', 'POST /sys/user/save', '{\"userId\":[\"\"],\"name\":[\"zuo\"],\"username\":[\"zuo_data\"],\"mobile\":[\"13966664444\"],\"password\":[\"123456\"],\"deptId\":[\"\"],\"deptName\":[\"\"],\"email\":[\"canuxe@qq.com\"],\"status\":[\"1\"],\"roleIds\":[\"56\"],\"role\":[\"56\"]}', '127.0.0.1', '2019-01-10 17:46:40');
INSERT INTO `sys_log` VALUES ('1080355631589777845', '7', 'Admin', '登录', '97', 'POST /login', '{\"mobile\":[\"13000000001\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-10 17:54:13');
INSERT INTO `sys_log` VALUES ('1080355631589777846', '7', 'Admin', 'admin提交更改用户密码', '12609', 'POST /sys/user/adminResetPwd', '{\"userDO.id\":[\"8\"],\"pwdNew\":[\"456789\"]}', '127.0.0.1', '2019-01-10 17:54:42');
INSERT INTO `sys_log` VALUES ('1080355631589777847', '8', 'zuo_data', '登录', '14', 'POST /login', '{\"mobile\":[\"13966664444\"],\"password\":[\"456789\"]}', '127.0.0.1', '2019-01-10 17:55:12');
INSERT INTO `sys_log` VALUES ('1080355631589777848', '7', 'Admin', '登录', '25', 'POST /login', '{\"mobile\":[\"13000000001\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-10 18:00:55');
INSERT INTO `sys_log` VALUES ('1080355631589777849', '-1', '', '登录小程序', '81', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 18:35:05');
INSERT INTO `sys_log` VALUES ('1080355631589777850', '-1', '', '登录', '85', 'POST /login', '{\"mobile\":[\"13000000001\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-10 18:37:08');
INSERT INTO `sys_log` VALUES ('1080355631589777851', '7', 'Admin', '登录', '24', 'POST /login', '{\"mobile\":[\"13000000001\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-10 18:37:12');
INSERT INTO `sys_log` VALUES ('1080355631589777852', '-1', '', '登录小程序', '19', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-10 18:45:18');
INSERT INTO `sys_log` VALUES ('1080355631589777853', '7', 'Admin', '登录', '100', 'POST /login', '{\"mobile\":[\"13000000001\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-10 18:51:15');
INSERT INTO `sys_log` VALUES ('1080355631589777854', '-1', '', '登录小程序', '63', 'GET /api/users/login', '{\"openId\":[\"wxd45681e2d1b4e5cd\"]}', '10.10.11.122', '2019-01-11 10:19:04');
INSERT INTO `sys_log` VALUES ('1080355631589777855', '-1', '', '登录小程序', '51', 'GET /api/users/login', '{\"openId\":[\"\"]}', '10.10.11.122', '2019-01-11 10:30:14');
INSERT INTO `sys_log` VALUES ('1080355631589777856', '7', 'Admin', '登录', '84', 'POST /login', '{\"mobile\":[\"13000000001\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-11 10:33:47');
INSERT INTO `sys_log` VALUES ('1080355631589777857', '7', 'Admin', '保存用户', '91', 'POST /sys/user/save', '{\"userId\":[\"\"],\"name\":[\"测试\"],\"username\":[\"测试\"],\"mobile\":[\"18668151155\"],\"password\":[\"123456\"],\"deptId\":[\"\"],\"deptName\":[\"\"],\"email\":[\"213@qq.com\"],\"status\":[\"1\"],\"roleIds\":[\"56\"],\"role\":[\"56\"]}', '127.0.0.1', '2019-01-11 10:34:26');
INSERT INTO `sys_log` VALUES ('1080355631589777858', '-1', '', '绑定账户', '30', 'GET /api/users/boundAccount', '{\"openId\":[\"wxd45681e2d1b4e5cd\"],\"mobile\":[\"18668151155\"],\"password\":[\"123321\"]}', '10.10.11.122', '2019-01-11 10:34:43');
INSERT INTO `sys_log` VALUES ('1080355631589777859', '-1', '', '绑定账户', '32', 'GET /api/users/boundAccount', '{\"openId\":[\"wxd45681e2d1b4e5cd\"],\"mobile\":[\"18668151155\"],\"password\":[\"123321\"]}', '10.10.11.122', '2019-01-11 10:35:27');
INSERT INTO `sys_log` VALUES ('1080355631589777860', '-1', '', '绑定账户', '33', 'GET /api/users/boundAccount', '{\"openId\":[\"wxd45681e2d1b4e5cd\"],\"mobile\":[\"18668151155\"],\"password\":[\"123321\"]}', '10.10.11.122', '2019-01-11 10:36:00');
INSERT INTO `sys_log` VALUES ('1080355631589777861', '-1', '', '绑定账户', '42', 'GET /api/users/boundAccount', '{\"openId\":[\"wxd45681e2d1b4e5cd\"],\"mobile\":[\"18668151155\"],\"password\":[\"123321\"]}', '10.10.11.122', '2019-01-11 10:36:46');
INSERT INTO `sys_log` VALUES ('1080355631589777862', '-1', '', '绑定账户', '78867', 'GET /api/users/boundAccount', '{\"openId\":[\"wxd45681e2d1b4e5cd\"],\"mobile\":[\"18668151155\"],\"password\":[\"123321\"]}', '10.10.11.122', '2019-01-11 10:39:27');
INSERT INTO `sys_log` VALUES ('1080355631589777863', '-1', '', '登录小程序', '15', 'GET /api/users/login', '{\"openId\":[\"\"]}', '10.10.11.122', '2019-01-11 10:39:27');
INSERT INTO `sys_log` VALUES ('1080355631589777864', '-1', '', '根据酒店id查询详细信息', '72', 'GET /api/users/queryHotel', '{\"marketmanid\":[\"8\"]}', '127.0.0.1', '2019-01-11 10:40:13');
INSERT INTO `sys_log` VALUES ('1080355631589777865', '-1', '', '绑定账户', '36176', 'GET /api/users/boundAccount', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"],\"mobile\":[\"18668151155\"],\"password\":[\"123321\"]}', '10.10.11.122', '2019-01-11 10:40:17');
INSERT INTO `sys_log` VALUES ('1080355631589777866', '-1', '', '根据酒店id查询详细信息', '20', 'GET /api/users/detail', '{\"id\":[\"1\"]}', '127.0.0.1', '2019-01-11 10:40:54');
INSERT INTO `sys_log` VALUES ('1080355631589777867', '-1', '', '登录小程序', '25', 'GET /api/users/login', '{\"openId\":[\"\"]}', '10.10.11.122', '2019-01-11 10:44:53');
INSERT INTO `sys_log` VALUES ('1080355631589777868', '-1', '', '登录小程序', '16', 'GET /api/users/login', '{\"openId\":[\"\"]}', '10.10.11.122', '2019-01-11 10:49:22');
INSERT INTO `sys_log` VALUES ('1080355631589777869', '7', 'admin', '登录', '19', 'POST /login', '{\"mobile\":[\"13000000001\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-11 10:49:40');
INSERT INTO `sys_log` VALUES ('1080355631589777870', '7', 'admin', 'admin提交更改用户密码', '53', 'POST /sys/user/adminResetPwd', '{\"userDO.id\":[\"9\"],\"pwdNew\":[\"123456\"]}', '127.0.0.1', '2019-01-11 10:50:06');
INSERT INTO `sys_log` VALUES ('1080355631589777871', '-1', '', '绑定账户', '141490', 'GET /api/users/boundAccount', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"],\"mobile\":[\"18668151155\"],\"password\":[\"e10adc3949ba59abbe56e057f20f883e\"]}', '10.10.11.122', '2019-01-11 10:53:20');
INSERT INTO `sys_log` VALUES ('1080355631589777872', '-1', '', '登录小程序', '44', 'GET /api/users/login', '{\"openId\":[\"\"]}', '10.10.11.122', '2019-01-11 10:54:38');
INSERT INTO `sys_log` VALUES ('1080355631589777873', '-1', '', '绑定账户', '42448', 'GET /api/users/boundAccount', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"],\"mobile\":[\"18668151155\"],\"password\":[\"123456\"]}', '10.10.11.122', '2019-01-11 10:55:30');
INSERT INTO `sys_log` VALUES ('1080355631589777874', '-1', '', '登录小程序', '52', 'GET /api/users/login', '{\"openId\":[\"\"]}', '10.10.11.122', '2019-01-11 10:56:18');
INSERT INTO `sys_log` VALUES ('1080355631589777875', '-1', '', '绑定账户', '27', 'GET /api/users/boundAccount', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"],\"mobile\":[\"18668151155\"],\"password\":[\"277f04432888f1d2ad45ba953751e2c5\"]}', '10.10.11.122', '2019-01-11 10:56:31');
INSERT INTO `sys_log` VALUES ('1080355631589777876', '-1', '', '绑定账户', '20279', 'GET /api/users/boundAccount', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"],\"mobile\":[\"18668151155\"],\"password\":[\"277f04432888f1d2ad45ba953751e2c5\"]}', '10.10.11.122', '2019-01-11 10:57:11');
INSERT INTO `sys_log` VALUES ('1080355631589777877', '-1', '', '登录小程序', '54', 'GET /api/users/login', '{\"openId\":[\"\"]}', '10.10.11.122', '2019-01-11 10:59:00');
INSERT INTO `sys_log` VALUES ('1080355631589777878', '-1', '', '绑定账户', '5561', 'GET /api/users/boundAccount', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"],\"mobile\":[\"18668151155\"],\"password\":[\"123456\"]}', '10.10.11.122', '2019-01-11 10:59:18');
INSERT INTO `sys_log` VALUES ('1080355631589777879', '-1', '', '绑定账户', '47537', 'GET /api/users/boundAccount', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"],\"mobile\":[\"18668151155\"],\"password\":[\"123456\"]}', '10.10.11.122', '2019-01-11 11:00:24');
INSERT INTO `sys_log` VALUES ('1080355631589777880', '-1', '', '绑定账户', '26832', 'GET /api/users/boundAccount', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"],\"mobile\":[\"18668151155\"],\"password\":[\"123456\"]}', '10.10.11.122', '2019-01-11 11:01:05');
INSERT INTO `sys_log` VALUES ('1080355631589777881', '-1', '', '登录小程序', '16', 'GET /api/users/login', '{\"openId\":[\"\"]}', '10.10.11.122', '2019-01-11 11:01:12');
INSERT INTO `sys_log` VALUES ('1080355631589777882', '-1', '', '登录小程序', '12', 'GET /api/users/login', '{\"openId\":[\"\"]}', '10.10.11.122', '2019-01-11 11:01:32');
INSERT INTO `sys_log` VALUES ('1080355631589777883', '-1', '', '登录小程序', '23726', 'GET /api/users/login', '{\"openId\":[\"\"]}', '10.10.11.122', '2019-01-11 11:02:26');
INSERT INTO `sys_log` VALUES ('1080355631589777884', '-1', '', '登录小程序', '11', 'GET /api/users/login', '{\"openId\":[\"\"]}', '10.10.11.122', '2019-01-11 11:03:08');
INSERT INTO `sys_log` VALUES ('1080355631589777885', '-1', '', '登录小程序', '17', 'GET /api/users/login', '{\"openId\":[\"null\"]}', '10.10.11.122', '2019-01-11 11:04:43');
INSERT INTO `sys_log` VALUES ('1080355631589777886', '-1', '', '登录小程序', '14', 'GET /api/users/login', '{\"openId\":[\"null\"]}', '10.10.11.122', '2019-01-11 11:04:45');
INSERT INTO `sys_log` VALUES ('1080355631589777887', '-1', '', '登录小程序', '15', 'GET /api/users/login', '{\"openId\":[\"null\"]}', '10.10.11.122', '2019-01-11 11:05:03');
INSERT INTO `sys_log` VALUES ('1080355631589777888', '-1', '', '登录小程序', '18', 'GET /api/users/login', '{\"openId\":[\"null\"]}', '10.10.11.122', '2019-01-11 11:05:14');
INSERT INTO `sys_log` VALUES ('1080355631589777889', '-1', '', '登录小程序', '20', 'GET /api/users/login', '{\"openId\":[\"null\"]}', '10.10.11.122', '2019-01-11 11:05:44');
INSERT INTO `sys_log` VALUES ('1080355631589777890', '-1', '', '登录小程序', '15', 'GET /api/users/login', '{\"openId\":[\"null\"]}', '10.10.11.122', '2019-01-11 11:06:06');
INSERT INTO `sys_log` VALUES ('1080355631589777891', '-1', '', '登录小程序', '13', 'GET /api/users/login', '{\"openId\":[\"null\"]}', '10.10.11.122', '2019-01-11 11:06:40');
INSERT INTO `sys_log` VALUES ('1080355631589777892', '-1', '', '登录小程序', '12', 'GET /api/users/login', '{\"openId\":[\"undefined\"]}', '10.10.11.122', '2019-01-11 11:07:01');
INSERT INTO `sys_log` VALUES ('1080355631589777893', '-1', '', '登录小程序', '12', 'GET /api/users/login', '{\"openId\":[\"undefined\"]}', '10.10.11.122', '2019-01-11 11:07:44');
INSERT INTO `sys_log` VALUES ('1080355631589777894', '-1', '', '登录小程序', '13', 'GET /api/users/login', '{\"openId\":[\"undefined\"]}', '10.10.11.122', '2019-01-11 11:08:23');
INSERT INTO `sys_log` VALUES ('1080355631589777895', '-1', '', '登录小程序', '14', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 11:08:35');
INSERT INTO `sys_log` VALUES ('1080355631589777896', '-1', '', '登录小程序', '17', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 11:09:00');
INSERT INTO `sys_log` VALUES ('1080355631589777897', '-1', '', '根据酒店id查询详细信息', '829', 'GET /api/users/detail', '{\"id\":[\"1\"]}', '127.0.0.1', '2019-01-11 11:14:06');
INSERT INTO `sys_log` VALUES ('1080355631589777898', '-1', '', '根据酒店id查询详细信息', '50', 'GET /api/users/detail', '{\"id\":[\"1\"]}', '127.0.0.1', '2019-01-11 11:14:16');
INSERT INTO `sys_log` VALUES ('1080355631589777899', '-1', '', '根据酒店id查询详细信息', '28899', 'GET /api/users/detail', '{\"id\":[\"1\"]}', '127.0.0.1', '2019-01-11 11:14:50');
INSERT INTO `sys_log` VALUES ('1080355631589777900', '-1', '', '根据酒店id查询详细信息', '5716', 'GET /api/users/detail', '{\"id\":[\"1\"]}', '127.0.0.1', '2019-01-11 11:15:50');
INSERT INTO `sys_log` VALUES ('1080355631589777901', '-1', '', '登录小程序', '16', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 11:15:56');
INSERT INTO `sys_log` VALUES ('1080355631589777902', '-1', '', '根据酒店id查询详细信息', '4447', 'GET /api/users/detail', '{\"id\":[\"1\"]}', '127.0.0.1', '2019-01-11 11:29:36');
INSERT INTO `sys_log` VALUES ('1080355631589777903', '-1', '', '登录小程序', '27', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 11:48:38');
INSERT INTO `sys_log` VALUES ('1080355631589777904', '-1', '', '登录小程序', '14', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 11:49:05');
INSERT INTO `sys_log` VALUES ('1080355631589777905', '-1', '', '登录小程序', '12', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 11:49:50');
INSERT INTO `sys_log` VALUES ('1080355631589777906', '-1', '', '登录小程序', '37', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 13:55:00');
INSERT INTO `sys_log` VALUES ('1080355631589777907', '-1', '', '登录小程序', '19', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 13:56:02');
INSERT INTO `sys_log` VALUES ('1080355631589777908', '-1', '', '登录小程序', '18', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 14:03:14');
INSERT INTO `sys_log` VALUES ('1080355631589777909', '-1', '', '登录小程序', '27', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 14:03:36');
INSERT INTO `sys_log` VALUES ('1080355631589777910', '-1', '', '登录小程序', '14', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 14:04:30');
INSERT INTO `sys_log` VALUES ('1080355631589777911', '-1', '', '登录', '77', 'POST /login', '{\"mobile\":[\"13000000001\"],\"password\":[\"1234567\"]}', '127.0.0.1', '2019-01-11 14:05:51');
INSERT INTO `sys_log` VALUES ('1080355631589777912', '7', 'admin', '登录', '34', 'POST /login', '{\"mobile\":[\"13000000001\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-11 14:05:56');
INSERT INTO `sys_log` VALUES ('1080355631589777913', '-1', '', '登录小程序', '35', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 14:15:58');
INSERT INTO `sys_log` VALUES ('1080355631589777914', '-1', '', '登录小程序', '12', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 14:16:35');
INSERT INTO `sys_log` VALUES ('1080355631589777915', '-1', '', '登录小程序', '15', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 14:16:55');
INSERT INTO `sys_log` VALUES ('1080355631589777916', '-1', '', '登录小程序', '10', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 14:17:16');
INSERT INTO `sys_log` VALUES ('1080355631589777917', '-1', '', '登录小程序', '15', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 14:22:11');
INSERT INTO `sys_log` VALUES ('1080355631589777918', '-1', '', '登录小程序', '14', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 14:23:17');
INSERT INTO `sys_log` VALUES ('1080355631589777919', '-1', '', '登录小程序', '19', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 14:25:04');
INSERT INTO `sys_log` VALUES ('1080355631589777920', '-1', '', '登录小程序', '18', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 14:26:20');
INSERT INTO `sys_log` VALUES ('1080355631589777921', '-1', '', '登录小程序', '16', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 14:30:42');
INSERT INTO `sys_log` VALUES ('1080355631589777922', '-1', '', '登录小程序', '12', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 14:31:16');
INSERT INTO `sys_log` VALUES ('1080355631589777923', '-1', '', '登录小程序', '11', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 14:31:27');
INSERT INTO `sys_log` VALUES ('1080355631589777924', '-1', '', '登录小程序', '15', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 14:33:05');
INSERT INTO `sys_log` VALUES ('1080355631589777925', '-1', '', '登录小程序', '28', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 14:34:06');
INSERT INTO `sys_log` VALUES ('1080355631589777926', '-1', '', '登录小程序', '17', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 14:51:05');
INSERT INTO `sys_log` VALUES ('1080355631589777927', '7', 'admin', '登录', '277', 'POST /login', '{\"mobile\":[\"13000000001\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-11 14:51:35');
INSERT INTO `sys_log` VALUES ('1080355631589777928', '7', 'admin', '登录', '113', 'POST /login', '{\"mobile\":[\"13000000001\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-11 14:54:48');
INSERT INTO `sys_log` VALUES ('1080355631589777929', '-1', '', '添加酒店表 ', '73', 'GET /api/users/save', '{\"hotelname\":[\"ces\"],\"managename\":[\"ces\"],\"managerphone\":[\"12312313\"],\"detailaddress\":[\"cssdadwadad\"],\"hoteltype\":[\"2\"],\"registtime\":[\"2019-09-01\"]}', '10.10.11.122', '2019-01-11 14:54:42');
INSERT INTO `sys_log` VALUES ('1080355631589777930', '-1', '', '登录', '121', 'POST /login', '{\"mobile\":[\"13000000001\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-11 14:56:28');
INSERT INTO `sys_log` VALUES ('1080355631589777931', '7', 'admin', '登录', '27', 'POST /login', '{\"mobile\":[\"13000000001\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-11 14:56:32');
INSERT INTO `sys_log` VALUES ('1080355631589777932', '7', 'admin', '登录', '102', 'POST /login', '{\"mobile\":[\"13000000001\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-11 14:58:11');
INSERT INTO `sys_log` VALUES ('1080355631589777933', '-1', '', '登录小程序', '25', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 14:59:37');
INSERT INTO `sys_log` VALUES ('1080355631589777934', '-1', '', '登录小程序', '18', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 15:48:47');
INSERT INTO `sys_log` VALUES ('1080355631589777935', '-1', '', '添加酒店表 ', '35', 'GET /api/users/save', '{\"hotelname\":[\"1\"],\"managename\":[\"1\"],\"managerphone\":[\"123321333\"],\"detailaddress\":[\"213\"],\"hoteltype\":[\"0\"],\"registtime\":[\"2018-09-01\"]}', '10.10.11.122', '2019-01-11 15:49:06');
INSERT INTO `sys_log` VALUES ('1080355631589777936', '-1', '', '登录小程序', '17', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 15:54:38');
INSERT INTO `sys_log` VALUES ('1080355631589777937', '7', 'admin', '登录', '105', 'POST /login', '{\"mobile\":[\"13000000001\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-11 15:55:36');
INSERT INTO `sys_log` VALUES ('1080355631589777938', '-1', '', '添加酒店表 ', '37', 'GET /api/users/save', '{\"hotelname\":[\"3\"],\"managename\":[\"3\"],\"managerphone\":[\"231313123\"],\"detailaddress\":[\"3\"],\"hoteltype\":[\"0\"],\"registtime\":[\"2018-09-01\"]}', '10.10.11.122', '2019-01-11 15:55:24');
INSERT INTO `sys_log` VALUES ('1080355631589777939', '-1', '', '添加酒店表 ', '38', 'GET /api/users/save', '{\"hotelname\":[\"3\"],\"managename\":[\"3\"],\"managerphone\":[\"231313123\"],\"detailaddress\":[\"3\"],\"hoteltype\":[\"0\"],\"registtime\":[\"2018-09-01\"]}', '10.10.11.122', '2019-01-11 15:55:46');
INSERT INTO `sys_log` VALUES ('1080355631589777940', '-1', '', '登录', '119', 'POST /login', '{\"mobile\":[\"13000000001\"],\"password\":[\"1\"]}', '127.0.0.1', '2019-01-11 15:58:15');
INSERT INTO `sys_log` VALUES ('1080355631589777941', '7', 'admin', '登录', '25', 'POST /login', '{\"mobile\":[\"13000000001\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-11 15:58:23');
INSERT INTO `sys_log` VALUES ('1080355631589777942', '-1', '', '登录小程序', '16', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 15:58:01');
INSERT INTO `sys_log` VALUES ('1080355631589777943', '-1', '', '添加酒店表 ', '38', 'GET /api/users/save', '{\"hotelname\":[\"333\"],\"managename\":[\"3213\"],\"managerphone\":[\"13141231\"],\"detailaddress\":[\"3333\"],\"hoteltype\":[\"0\"],\"registtime\":[\"2018-09-01\"]}', '10.10.11.122', '2019-01-11 15:58:15');
INSERT INTO `sys_log` VALUES ('1080355631589777944', '7', 'admin', '登录', '106', 'POST /login', '{\"mobile\":[\"13000000001\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-11 16:00:45');
INSERT INTO `sys_log` VALUES ('1080355631589777945', '-1', '', '登录小程序', '18', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 16:00:32');
INSERT INTO `sys_log` VALUES ('1080355631589777946', '-1', '', '登录小程序', '14', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 16:01:39');
INSERT INTO `sys_log` VALUES ('1080355631589777947', '7', 'admin', '登录', '92', 'POST /login', '{\"mobile\":[\"13000000001\"],\"password\":[\"123456\"]}', '127.0.0.1', '2019-01-11 16:03:49');
INSERT INTO `sys_log` VALUES ('1080355631589777948', '-1', '', '登录小程序', '15', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 16:03:42');
INSERT INTO `sys_log` VALUES ('1080355631589777949', '-1', '', '登录小程序', '15', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 16:04:25');
INSERT INTO `sys_log` VALUES ('1080355631589777950', '-1', '', '登录小程序', '12', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 16:04:42');
INSERT INTO `sys_log` VALUES ('1080355631589777951', '-1', '', '登录小程序', '20', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 16:09:43');
INSERT INTO `sys_log` VALUES ('1080355631589777952', '7', 'admin', '根据市场人员id查询详细信息', '33', 'GET /api/users/queryHotel', '{\"marketmanid\":[\"9\"]}', '127.0.0.1', '2019-01-11 16:17:19');
INSERT INTO `sys_log` VALUES ('1080355631589777953', '-1', '', '登录小程序', '15', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 16:18:22');
INSERT INTO `sys_log` VALUES ('1080355631589777954', '-1', '', '登录小程序', '20', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 16:21:01');
INSERT INTO `sys_log` VALUES ('1080355631589777955', '-1', '', '登录小程序', '17', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 16:25:26');
INSERT INTO `sys_log` VALUES ('1080355631589777956', '-1', '', '登录小程序', '12', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 16:25:32');
INSERT INTO `sys_log` VALUES ('1080355631589777957', '-1', '', '登录小程序', '10', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 16:26:23');
INSERT INTO `sys_log` VALUES ('1080355631589777958', '-1', '', '登录小程序', '14', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 16:28:30');
INSERT INTO `sys_log` VALUES ('1080355631589777959', '-1', '', '登录小程序', '12', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 16:29:05');
INSERT INTO `sys_log` VALUES ('1080355631589777960', '-1', '', '登录小程序', '12', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 16:29:45');
INSERT INTO `sys_log` VALUES ('1080355631589777961', '-1', '', '登录小程序', '13', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 16:30:33');
INSERT INTO `sys_log` VALUES ('1080355631589777962', '-1', '', '登录小程序', '16', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 16:31:18');
INSERT INTO `sys_log` VALUES ('1080355631589777963', '-1', '', '登录小程序', '12', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 16:31:36');
INSERT INTO `sys_log` VALUES ('1080355631589777964', '-1', '', '登录小程序', '17627', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 16:32:21');
INSERT INTO `sys_log` VALUES ('1080355631589777965', '-1', '', '登录小程序', '33118', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 16:33:00');
INSERT INTO `sys_log` VALUES ('1080355631589777966', '7', 'admin', '登录小程序', '252', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '127.0.0.1', '2019-01-11 16:33:00');
INSERT INTO `sys_log` VALUES ('1080355631589777967', '-1', '', '登录小程序', '13', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 16:33:32');
INSERT INTO `sys_log` VALUES ('1080355631589777968', '-1', '', '登录小程序', '13', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 16:34:20');
INSERT INTO `sys_log` VALUES ('1080355631589777969', '-1', '', '根据市场人员id查询详细信息', '25', 'GET /api/users/queryHotel', '{\"marketmanid\":[\"9\"]}', '10.10.11.122', '2019-01-11 16:34:21');
INSERT INTO `sys_log` VALUES ('1080355631589777970', '-1', '', '登录小程序', '17', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 16:37:20');
INSERT INTO `sys_log` VALUES ('1080355631589777971', '-1', '', '根据市场人员id查询详细信息', '28', 'GET /api/users/queryHotel', '{\"marketmanid\":[\"9\"]}', '10.10.11.122', '2019-01-11 16:37:20');
INSERT INTO `sys_log` VALUES ('1080355631589777972', '-1', '', '登录小程序', '14', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 16:39:47');
INSERT INTO `sys_log` VALUES ('1080355631589777973', '-1', '', '根据市场人员id查询详细信息', '24', 'GET /api/users/queryHotel', '{\"marketmanid\":[\"9\"]}', '10.10.11.122', '2019-01-11 16:39:48');
INSERT INTO `sys_log` VALUES ('1080355631589777974', '-1', '', '登录小程序', '16', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 16:43:42');
INSERT INTO `sys_log` VALUES ('1080355631589777975', '-1', '', '根据市场人员id查询详细信息', '20', 'GET /api/users/queryHotel', '{\"marketmanid\":[\"9\"]}', '10.10.11.122', '2019-01-11 16:43:43');
INSERT INTO `sys_log` VALUES ('1080355631589777976', '-1', '', '登录小程序', '12', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 16:44:17');
INSERT INTO `sys_log` VALUES ('1080355631589777977', '-1', '', '根据市场人员id查询详细信息', '17', 'GET /api/users/queryHotel', '{\"marketmanid\":[\"9\"]}', '10.10.11.122', '2019-01-11 16:44:23');
INSERT INTO `sys_log` VALUES ('1080355631589777978', '-1', '', '登录小程序', '11', 'GET /api/users/login', '{\"openId\":[\"o8biA4kY3eiTslzn5tVaDAMIoq3Y\"]}', '10.10.11.122', '2019-01-11 16:44:33');
INSERT INTO `sys_log` VALUES ('1080355631589777979', '-1', '', '根据市场人员id查询详细信息', '18', 'GET /api/users/queryHotel', '{\"marketmanid\":[\"9\"]}', '10.10.11.122', '2019-01-11 16:44:33');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parentId` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `orderNum` int(11) DEFAULT NULL COMMENT '排序',
  `gmtCreate` datetime DEFAULT NULL COMMENT '创建时间',
  `gmtModified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '基础管理', '', '', '0', 'fa fa-bars', '0', '2017-08-09 22:49:47', null);
INSERT INTO `sys_menu` VALUES ('2', '3', '系统菜单', 'sys/menu/', 'sys:menu:menu', '1', 'fa fa-th-list', '2', '2017-08-09 22:55:15', null);
INSERT INTO `sys_menu` VALUES ('3', '0', '系统管理', null, null, '0', 'fa fa-desktop', '1', '2017-08-09 23:06:55', '2017-08-14 14:13:43');
INSERT INTO `sys_menu` VALUES ('6', '3', '用户管理', 'sys/user/', 'sys:user:user', '1', 'fa fa-user', '0', '2017-08-10 14:12:11', null);
INSERT INTO `sys_menu` VALUES ('7', '3', '角色管理', 'sys/role', 'sys:role:role', '1', 'fa fa-paw', '1', '2017-08-10 14:13:19', null);
INSERT INTO `sys_menu` VALUES ('12', '6', '新增', '', 'sys:user:add', '2', '', '0', '2017-08-14 10:51:35', null);
INSERT INTO `sys_menu` VALUES ('13', '6', '编辑', '', 'sys:user:edit', '2', '', '0', '2017-08-14 10:52:06', null);
INSERT INTO `sys_menu` VALUES ('14', '6', '删除', null, 'sys:user:remove', '2', null, '0', '2017-08-14 10:52:24', null);
INSERT INTO `sys_menu` VALUES ('15', '7', '新增', '', 'sys:role:add', '2', '', '0', '2017-08-14 10:56:37', null);
INSERT INTO `sys_menu` VALUES ('20', '2', '新增', '', 'sys:menu:add', '2', '', '0', '2017-08-14 10:59:32', null);
INSERT INTO `sys_menu` VALUES ('21', '2', '编辑', '', 'sys:menu:edit', '2', '', '0', '2017-08-14 10:59:56', null);
INSERT INTO `sys_menu` VALUES ('22', '2', '删除', '', 'sys:menu:remove', '2', '', '0', '2017-08-14 11:00:26', null);
INSERT INTO `sys_menu` VALUES ('24', '6', '批量删除', '', 'sys:user:batchRemove', '2', '', '0', '2017-08-14 17:27:18', null);
INSERT INTO `sys_menu` VALUES ('25', '6', '停用', null, 'sys:user:disable', '2', null, '0', '2017-08-14 17:27:43', null);
INSERT INTO `sys_menu` VALUES ('26', '6', '重置密码', '', 'sys:user:resetPwd', '2', '', '0', '2017-08-14 17:28:34', null);
INSERT INTO `sys_menu` VALUES ('27', '91', '系统日志', 'common/log', 'common:log', '1', 'fa fa-warning', '0', '2017-08-14 22:11:53', null);
INSERT INTO `sys_menu` VALUES ('28', '27', '刷新', null, 'sys:log:list', '2', null, '0', '2017-08-14 22:30:22', null);
INSERT INTO `sys_menu` VALUES ('29', '27', '删除', null, 'sys:log:remove', '2', null, '0', '2017-08-14 22:30:43', null);
INSERT INTO `sys_menu` VALUES ('30', '27', '清空', null, 'sys:log:clear', '2', null, '0', '2017-08-14 22:31:02', null);
INSERT INTO `sys_menu` VALUES ('48', '77', '代码生成', 'common/generator', 'common:generator', '1', 'fa fa-code', '3', null, null);
INSERT INTO `sys_menu` VALUES ('55', '7', '编辑', '', 'sys:role:edit', '2', '', null, null, null);
INSERT INTO `sys_menu` VALUES ('56', '7', '删除', '', 'sys:role:remove', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('57', '91', '运行监控', '/druid/index.html', '', '1', 'fa fa-caret-square-o-right', '1', null, null);
INSERT INTO `sys_menu` VALUES ('61', '2', '批量删除', '', 'sys:menu:batchRemove', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('62', '7', '批量删除', '', 'sys:role:batchRemove', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('71', '1', '文件管理', '/common/sysFile', 'oss:file:file', '1', 'fa fa-folder-open', '2', null, null);
INSERT INTO `sys_menu` VALUES ('72', '77', '计划任务', 'common/job', 'common:taskScheduleJob', '1', 'fa fa-hourglass-1', '4', null, null);
INSERT INTO `sys_menu` VALUES ('73', '3', '部门管理', '/sys/dept', 'system:sysDept:sysDept', '1', 'fa fa-users', '3', null, null);
INSERT INTO `sys_menu` VALUES ('74', '73', '增加', '/sys/dept/add', 'system:sysDept:add', '2', null, '1', null, null);
INSERT INTO `sys_menu` VALUES ('75', '73', '刪除', 'sys/dept/remove', 'system:sysDept:remove', '2', null, '2', null, null);
INSERT INTO `sys_menu` VALUES ('76', '73', '编辑', '/sys/dept/edit', 'system:sysDept:edit', '2', null, '3', null, null);
INSERT INTO `sys_menu` VALUES ('77', '0', '系统工具', '', '', '0', 'fa fa-gear', '4', null, null);
INSERT INTO `sys_menu` VALUES ('78', '1', '数据字典', '/common/sysDict', 'common:sysDict:sysDict', '1', 'fa fa-book', '1', null, null);
INSERT INTO `sys_menu` VALUES ('79', '78', '增加', '/common/sysDict/add', 'common:sysDict:add', '2', null, '2', null, null);
INSERT INTO `sys_menu` VALUES ('80', '78', '编辑', '/common/sysDict/edit', 'common:sysDict:edit', '2', null, '2', null, null);
INSERT INTO `sys_menu` VALUES ('81', '78', '删除', '/common/sysDict/remove', 'common:sysDict:remove', '2', '', '3', null, null);
INSERT INTO `sys_menu` VALUES ('83', '78', '批量删除', '/common/sysDict/batchRemove', 'common:sysDict:batchRemove', '2', '', '4', null, null);
INSERT INTO `sys_menu` VALUES ('91', '0', '系统监控', '', '', '0', 'fa fa-video-camera', '5', null, null);
INSERT INTO `sys_menu` VALUES ('92', '91', '在线用户', 'sys/online', '', '1', 'fa fa-user', null, null, null);
INSERT INTO `sys_menu` VALUES ('97', '0', '图表管理', '', '', '0', 'fa fa-bar-chart', '7', null, null);
INSERT INTO `sys_menu` VALUES ('98', '97', '百度chart', '/chart/graph_echarts.html', '', '1', 'fa fa-area-chart', null, null, null);
INSERT INTO `sys_menu` VALUES ('175', '1', '系统配置', '/common/config', null, '1', 'fa fa-file-code-o', '6', null, null);
INSERT INTO `sys_menu` VALUES ('176', '175', '查看', null, 'common:config:config', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('177', '175', '新增', null, 'common:config:add', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('178', '175', '修改', null, 'common:config:edit', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('179', '175', '删除', null, 'common:config:remove', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('180', '175', '批量删除', null, 'common:config:batchRemove', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('181', '199', '公众号管理', '/wxmp/mpConfig', null, '1', 'fa fa-file-code-o', '6', null, null);
INSERT INTO `sys_menu` VALUES ('182', '181', '查看', null, 'wxmp:mpConfig:mpConfig', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('183', '181', '新增', null, 'wxmp:mpConfig:add', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('184', '181', '修改', null, 'wxmp:mpConfig:edit', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('185', '181', '删除', null, 'wxmp:mpConfig:remove', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('186', '181', '批量删除', null, 'wxmp:mpConfig:batchRemove', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('187', '199', '微信粉丝表', '/wxmp/mpFans', null, '1', 'fa fa-file-code-o', '6', null, null);
INSERT INTO `sys_menu` VALUES ('188', '187', '查看', null, 'wxmp:mpFans:mpFans', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('189', '187', '新增', null, 'wxmp:mpFans:add', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('190', '187', '修改', null, 'wxmp:mpFans:edit', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('191', '187', '删除', null, 'wxmp:mpFans:remove', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('192', '187', '批量删除', null, 'wxmp:mpFans:batchRemove', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('193', '71', '增加', '/common/sysFile/add', 'oss:file:add', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('194', '71', '列表', '/common/sysFile/list', 'oss:file:list', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('195', '71', '编辑', '/common/sysFile/edit', 'oss:file:update', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('196', '71', '查询', '/common/sysFile/info', 'oss:file:info', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('197', '71', '删除', '/common/sysFile/remove', 'oss:file:remove', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('199', '0', '微信公众号', null, null, '0', 'fa fa-file-code-o', '3', null, null);
INSERT INTO `sys_menu` VALUES ('205', '187', '同步', null, 'wxmp:mpFans:sync', '2', 'fa fa-refresh', '5', null, null);
INSERT INTO `sys_menu` VALUES ('206', '1', '[Demo]基础表', '/demo/demoBase', '', '1', 'fa fa-file-code-o', '6', null, null);
INSERT INTO `sys_menu` VALUES ('207', '206', '查看', null, 'demo:demoBase:demoBase', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('208', '206', '新增', null, 'demo:demoBase:add', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('209', '206', '修改', null, 'demo:demoBase:edit', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('210', '206', '删除', null, 'demo:demoBase:remove', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('211', '206', '批量删除', null, 'demo:demoBase:batchRemove', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('213', '0', '包管理', '', '', '0', '', null, null, null);
INSERT INTO `sys_menu` VALUES ('219', '224', '查看', '/quotation/entry/list', 'quotation:entry:entry', '2', '', '6', null, null);
INSERT INTO `sys_menu` VALUES ('220', '224', '新增', null, 'quotation:entry:add', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('221', '224', '修改', '/quotation/entry/edit', 'quotation:entry:edit', '2', '', '6', null, null);
INSERT INTO `sys_menu` VALUES ('222', '224', '删除', null, 'quotation:entry:remove', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('223', '224', '批量删除', null, 'quotation:entry:batchRemove', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('224', '213', '条目信息', '/quotation/entry', '', '1', 'fa fa-file-code-o', '6', null, null);
INSERT INTO `sys_menu` VALUES ('225', '213', '项目信息', '/quotation/item', null, '1', 'fa fa-file-code-o', '6', null, null);
INSERT INTO `sys_menu` VALUES ('226', '225', '查看', '/quotation/item/list', 'quotation:item:item', '2', '', '6', null, null);
INSERT INTO `sys_menu` VALUES ('227', '225', '新增', null, 'quotation:item:add', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('228', '225', '修改', '/quotation/item/edit', 'quotation:item:edit', '2', '', '6', null, null);
INSERT INTO `sys_menu` VALUES ('229', '225', '启用停用', '/quotation/item/changeonOff', '', '2', '', '6', null, null);
INSERT INTO `sys_menu` VALUES ('230', '225', '批量删除', null, 'quotation:item:batchRemove', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('231', '0', '酒店管理', '', '', '0', '', null, null, null);
INSERT INTO `sys_menu` VALUES ('238', '231', '酒店表 \r\n', '/quotation/hotel', null, '1', 'fa fa-file-code-o', '6', null, null);
INSERT INTO `sys_menu` VALUES ('239', '238', '查看', null, 'quotation:hotel:hotel', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('240', '238', '新增', null, 'quotation:hotel:add', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('241', '238', '修改', null, 'quotation:hotel:edit', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('242', '238', '删除', null, 'quotation:hotel:remove', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('243', '238', '批量删除', null, 'quotation:hotel:batchRemove', '2', null, '6', null, null);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `roleSign` varchar(100) DEFAULT NULL COMMENT '角色标识',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `userIdCreate` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `gmtCreate` datetime DEFAULT NULL COMMENT '创建时间',
  `gmtModified` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级用户角色', 'adminRole', '超级管理员', '2', '2017-08-12 00:43:52', '2017-08-12 19:14:59');
INSERT INTO `sys_role` VALUES ('56', '普通用户', null, '普通用户', null, null, null);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleId` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menuId` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4755 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('367', '44', '1');
INSERT INTO `sys_role_menu` VALUES ('368', '44', '32');
INSERT INTO `sys_role_menu` VALUES ('369', '44', '33');
INSERT INTO `sys_role_menu` VALUES ('370', '44', '34');
INSERT INTO `sys_role_menu` VALUES ('371', '44', '35');
INSERT INTO `sys_role_menu` VALUES ('372', '44', '28');
INSERT INTO `sys_role_menu` VALUES ('373', '44', '29');
INSERT INTO `sys_role_menu` VALUES ('374', '44', '30');
INSERT INTO `sys_role_menu` VALUES ('375', '44', '38');
INSERT INTO `sys_role_menu` VALUES ('376', '44', '4');
INSERT INTO `sys_role_menu` VALUES ('377', '44', '27');
INSERT INTO `sys_role_menu` VALUES ('378', '45', '38');
INSERT INTO `sys_role_menu` VALUES ('379', '46', '3');
INSERT INTO `sys_role_menu` VALUES ('380', '46', '20');
INSERT INTO `sys_role_menu` VALUES ('381', '46', '21');
INSERT INTO `sys_role_menu` VALUES ('382', '46', '22');
INSERT INTO `sys_role_menu` VALUES ('383', '46', '23');
INSERT INTO `sys_role_menu` VALUES ('384', '46', '11');
INSERT INTO `sys_role_menu` VALUES ('385', '46', '12');
INSERT INTO `sys_role_menu` VALUES ('386', '46', '13');
INSERT INTO `sys_role_menu` VALUES ('387', '46', '14');
INSERT INTO `sys_role_menu` VALUES ('388', '46', '24');
INSERT INTO `sys_role_menu` VALUES ('389', '46', '25');
INSERT INTO `sys_role_menu` VALUES ('390', '46', '26');
INSERT INTO `sys_role_menu` VALUES ('391', '46', '15');
INSERT INTO `sys_role_menu` VALUES ('392', '46', '2');
INSERT INTO `sys_role_menu` VALUES ('393', '46', '6');
INSERT INTO `sys_role_menu` VALUES ('394', '46', '7');
INSERT INTO `sys_role_menu` VALUES ('598', '50', '38');
INSERT INTO `sys_role_menu` VALUES ('632', '38', '42');
INSERT INTO `sys_role_menu` VALUES ('737', '51', '38');
INSERT INTO `sys_role_menu` VALUES ('738', '51', '39');
INSERT INTO `sys_role_menu` VALUES ('739', '51', '40');
INSERT INTO `sys_role_menu` VALUES ('740', '51', '41');
INSERT INTO `sys_role_menu` VALUES ('741', '51', '4');
INSERT INTO `sys_role_menu` VALUES ('742', '51', '32');
INSERT INTO `sys_role_menu` VALUES ('743', '51', '33');
INSERT INTO `sys_role_menu` VALUES ('744', '51', '34');
INSERT INTO `sys_role_menu` VALUES ('745', '51', '35');
INSERT INTO `sys_role_menu` VALUES ('746', '51', '27');
INSERT INTO `sys_role_menu` VALUES ('747', '51', '28');
INSERT INTO `sys_role_menu` VALUES ('748', '51', '29');
INSERT INTO `sys_role_menu` VALUES ('749', '51', '30');
INSERT INTO `sys_role_menu` VALUES ('750', '51', '1');
INSERT INTO `sys_role_menu` VALUES ('1064', '54', '53');
INSERT INTO `sys_role_menu` VALUES ('1095', '55', '2');
INSERT INTO `sys_role_menu` VALUES ('1096', '55', '6');
INSERT INTO `sys_role_menu` VALUES ('1097', '55', '7');
INSERT INTO `sys_role_menu` VALUES ('1098', '55', '3');
INSERT INTO `sys_role_menu` VALUES ('1099', '55', '50');
INSERT INTO `sys_role_menu` VALUES ('1100', '55', '49');
INSERT INTO `sys_role_menu` VALUES ('1101', '55', '1');
INSERT INTO `sys_role_menu` VALUES ('1856', '53', '28');
INSERT INTO `sys_role_menu` VALUES ('1857', '53', '29');
INSERT INTO `sys_role_menu` VALUES ('1858', '53', '30');
INSERT INTO `sys_role_menu` VALUES ('1859', '53', '27');
INSERT INTO `sys_role_menu` VALUES ('1860', '53', '57');
INSERT INTO `sys_role_menu` VALUES ('1861', '53', '71');
INSERT INTO `sys_role_menu` VALUES ('1862', '53', '48');
INSERT INTO `sys_role_menu` VALUES ('1863', '53', '72');
INSERT INTO `sys_role_menu` VALUES ('1864', '53', '1');
INSERT INTO `sys_role_menu` VALUES ('1865', '53', '7');
INSERT INTO `sys_role_menu` VALUES ('1866', '53', '55');
INSERT INTO `sys_role_menu` VALUES ('1867', '53', '56');
INSERT INTO `sys_role_menu` VALUES ('1868', '53', '62');
INSERT INTO `sys_role_menu` VALUES ('1869', '53', '15');
INSERT INTO `sys_role_menu` VALUES ('1870', '53', '2');
INSERT INTO `sys_role_menu` VALUES ('1871', '53', '61');
INSERT INTO `sys_role_menu` VALUES ('1872', '53', '20');
INSERT INTO `sys_role_menu` VALUES ('1873', '53', '21');
INSERT INTO `sys_role_menu` VALUES ('1874', '53', '22');
INSERT INTO `sys_role_menu` VALUES ('2247', '63', '-1');
INSERT INTO `sys_role_menu` VALUES ('2248', '63', '84');
INSERT INTO `sys_role_menu` VALUES ('2249', '63', '85');
INSERT INTO `sys_role_menu` VALUES ('2250', '63', '88');
INSERT INTO `sys_role_menu` VALUES ('2251', '63', '87');
INSERT INTO `sys_role_menu` VALUES ('2252', '64', '84');
INSERT INTO `sys_role_menu` VALUES ('2253', '64', '89');
INSERT INTO `sys_role_menu` VALUES ('2254', '64', '88');
INSERT INTO `sys_role_menu` VALUES ('2255', '64', '87');
INSERT INTO `sys_role_menu` VALUES ('2256', '64', '86');
INSERT INTO `sys_role_menu` VALUES ('2257', '64', '85');
INSERT INTO `sys_role_menu` VALUES ('2258', '65', '89');
INSERT INTO `sys_role_menu` VALUES ('2259', '65', '88');
INSERT INTO `sys_role_menu` VALUES ('2260', '65', '86');
INSERT INTO `sys_role_menu` VALUES ('2262', '67', '48');
INSERT INTO `sys_role_menu` VALUES ('2263', '68', '88');
INSERT INTO `sys_role_menu` VALUES ('2264', '68', '87');
INSERT INTO `sys_role_menu` VALUES ('2265', '69', '89');
INSERT INTO `sys_role_menu` VALUES ('2266', '69', '88');
INSERT INTO `sys_role_menu` VALUES ('2267', '69', '86');
INSERT INTO `sys_role_menu` VALUES ('2268', '69', '87');
INSERT INTO `sys_role_menu` VALUES ('2269', '69', '85');
INSERT INTO `sys_role_menu` VALUES ('2270', '69', '84');
INSERT INTO `sys_role_menu` VALUES ('2271', '70', '85');
INSERT INTO `sys_role_menu` VALUES ('2272', '70', '89');
INSERT INTO `sys_role_menu` VALUES ('2273', '70', '88');
INSERT INTO `sys_role_menu` VALUES ('2274', '70', '87');
INSERT INTO `sys_role_menu` VALUES ('2275', '70', '86');
INSERT INTO `sys_role_menu` VALUES ('2276', '70', '84');
INSERT INTO `sys_role_menu` VALUES ('2277', '71', '87');
INSERT INTO `sys_role_menu` VALUES ('2278', '72', '59');
INSERT INTO `sys_role_menu` VALUES ('2279', '73', '48');
INSERT INTO `sys_role_menu` VALUES ('2280', '74', '88');
INSERT INTO `sys_role_menu` VALUES ('2281', '74', '87');
INSERT INTO `sys_role_menu` VALUES ('2282', '75', '88');
INSERT INTO `sys_role_menu` VALUES ('2283', '75', '87');
INSERT INTO `sys_role_menu` VALUES ('2284', '76', '85');
INSERT INTO `sys_role_menu` VALUES ('2285', '76', '89');
INSERT INTO `sys_role_menu` VALUES ('2286', '76', '88');
INSERT INTO `sys_role_menu` VALUES ('2287', '76', '87');
INSERT INTO `sys_role_menu` VALUES ('2288', '76', '86');
INSERT INTO `sys_role_menu` VALUES ('2289', '76', '84');
INSERT INTO `sys_role_menu` VALUES ('2292', '78', '88');
INSERT INTO `sys_role_menu` VALUES ('2293', '78', '87');
INSERT INTO `sys_role_menu` VALUES ('2294', '78', null);
INSERT INTO `sys_role_menu` VALUES ('2295', '78', null);
INSERT INTO `sys_role_menu` VALUES ('2296', '78', null);
INSERT INTO `sys_role_menu` VALUES ('2308', '80', '87');
INSERT INTO `sys_role_menu` VALUES ('2309', '80', '86');
INSERT INTO `sys_role_menu` VALUES ('2310', '80', '-1');
INSERT INTO `sys_role_menu` VALUES ('2311', '80', '84');
INSERT INTO `sys_role_menu` VALUES ('2312', '80', '85');
INSERT INTO `sys_role_menu` VALUES ('2328', '79', '72');
INSERT INTO `sys_role_menu` VALUES ('2329', '79', '48');
INSERT INTO `sys_role_menu` VALUES ('2330', '79', '77');
INSERT INTO `sys_role_menu` VALUES ('2331', '79', '84');
INSERT INTO `sys_role_menu` VALUES ('2332', '79', '89');
INSERT INTO `sys_role_menu` VALUES ('2333', '79', '88');
INSERT INTO `sys_role_menu` VALUES ('2334', '79', '87');
INSERT INTO `sys_role_menu` VALUES ('2335', '79', '86');
INSERT INTO `sys_role_menu` VALUES ('2336', '79', '85');
INSERT INTO `sys_role_menu` VALUES ('2337', '79', '-1');
INSERT INTO `sys_role_menu` VALUES ('2338', '77', '89');
INSERT INTO `sys_role_menu` VALUES ('2339', '77', '88');
INSERT INTO `sys_role_menu` VALUES ('2340', '77', '87');
INSERT INTO `sys_role_menu` VALUES ('2341', '77', '86');
INSERT INTO `sys_role_menu` VALUES ('2342', '77', '85');
INSERT INTO `sys_role_menu` VALUES ('2343', '77', '84');
INSERT INTO `sys_role_menu` VALUES ('2344', '77', '72');
INSERT INTO `sys_role_menu` VALUES ('2345', '77', '-1');
INSERT INTO `sys_role_menu` VALUES ('2346', '77', '77');
INSERT INTO `sys_role_menu` VALUES ('3178', '56', '68');
INSERT INTO `sys_role_menu` VALUES ('3179', '56', '60');
INSERT INTO `sys_role_menu` VALUES ('3180', '56', '59');
INSERT INTO `sys_role_menu` VALUES ('3181', '56', '58');
INSERT INTO `sys_role_menu` VALUES ('3182', '56', '51');
INSERT INTO `sys_role_menu` VALUES ('3183', '56', '50');
INSERT INTO `sys_role_menu` VALUES ('3184', '56', '49');
INSERT INTO `sys_role_menu` VALUES ('3185', '56', '-1');
INSERT INTO `sys_role_menu` VALUES ('4678', '1', '193');
INSERT INTO `sys_role_menu` VALUES ('4679', '1', '194');
INSERT INTO `sys_role_menu` VALUES ('4680', '1', '195');
INSERT INTO `sys_role_menu` VALUES ('4681', '1', '196');
INSERT INTO `sys_role_menu` VALUES ('4682', '1', '197');
INSERT INTO `sys_role_menu` VALUES ('4683', '1', '79');
INSERT INTO `sys_role_menu` VALUES ('4684', '1', '80');
INSERT INTO `sys_role_menu` VALUES ('4685', '1', '81');
INSERT INTO `sys_role_menu` VALUES ('4686', '1', '83');
INSERT INTO `sys_role_menu` VALUES ('4687', '1', '176');
INSERT INTO `sys_role_menu` VALUES ('4688', '1', '177');
INSERT INTO `sys_role_menu` VALUES ('4689', '1', '178');
INSERT INTO `sys_role_menu` VALUES ('4690', '1', '179');
INSERT INTO `sys_role_menu` VALUES ('4691', '1', '180');
INSERT INTO `sys_role_menu` VALUES ('4692', '1', '207');
INSERT INTO `sys_role_menu` VALUES ('4693', '1', '208');
INSERT INTO `sys_role_menu` VALUES ('4694', '1', '209');
INSERT INTO `sys_role_menu` VALUES ('4695', '1', '210');
INSERT INTO `sys_role_menu` VALUES ('4696', '1', '211');
INSERT INTO `sys_role_menu` VALUES ('4697', '1', '20');
INSERT INTO `sys_role_menu` VALUES ('4698', '1', '21');
INSERT INTO `sys_role_menu` VALUES ('4699', '1', '22');
INSERT INTO `sys_role_menu` VALUES ('4700', '1', '61');
INSERT INTO `sys_role_menu` VALUES ('4701', '1', '12');
INSERT INTO `sys_role_menu` VALUES ('4702', '1', '13');
INSERT INTO `sys_role_menu` VALUES ('4703', '1', '14');
INSERT INTO `sys_role_menu` VALUES ('4704', '1', '24');
INSERT INTO `sys_role_menu` VALUES ('4705', '1', '25');
INSERT INTO `sys_role_menu` VALUES ('4706', '1', '26');
INSERT INTO `sys_role_menu` VALUES ('4707', '1', '15');
INSERT INTO `sys_role_menu` VALUES ('4708', '1', '55');
INSERT INTO `sys_role_menu` VALUES ('4709', '1', '56');
INSERT INTO `sys_role_menu` VALUES ('4710', '1', '62');
INSERT INTO `sys_role_menu` VALUES ('4711', '1', '74');
INSERT INTO `sys_role_menu` VALUES ('4712', '1', '75');
INSERT INTO `sys_role_menu` VALUES ('4713', '1', '76');
INSERT INTO `sys_role_menu` VALUES ('4714', '1', '48');
INSERT INTO `sys_role_menu` VALUES ('4715', '1', '72');
INSERT INTO `sys_role_menu` VALUES ('4716', '1', '28');
INSERT INTO `sys_role_menu` VALUES ('4717', '1', '29');
INSERT INTO `sys_role_menu` VALUES ('4718', '1', '30');
INSERT INTO `sys_role_menu` VALUES ('4719', '1', '57');
INSERT INTO `sys_role_menu` VALUES ('4720', '1', '92');
INSERT INTO `sys_role_menu` VALUES ('4721', '1', '219');
INSERT INTO `sys_role_menu` VALUES ('4722', '1', '220');
INSERT INTO `sys_role_menu` VALUES ('4723', '1', '221');
INSERT INTO `sys_role_menu` VALUES ('4724', '1', '222');
INSERT INTO `sys_role_menu` VALUES ('4725', '1', '223');
INSERT INTO `sys_role_menu` VALUES ('4726', '1', '226');
INSERT INTO `sys_role_menu` VALUES ('4727', '1', '227');
INSERT INTO `sys_role_menu` VALUES ('4728', '1', '228');
INSERT INTO `sys_role_menu` VALUES ('4729', '1', '229');
INSERT INTO `sys_role_menu` VALUES ('4730', '1', '230');
INSERT INTO `sys_role_menu` VALUES ('4731', '1', '71');
INSERT INTO `sys_role_menu` VALUES ('4732', '1', '78');
INSERT INTO `sys_role_menu` VALUES ('4733', '1', '175');
INSERT INTO `sys_role_menu` VALUES ('4734', '1', '206');
INSERT INTO `sys_role_menu` VALUES ('4735', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('4736', '1', '2');
INSERT INTO `sys_role_menu` VALUES ('4737', '1', '6');
INSERT INTO `sys_role_menu` VALUES ('4738', '1', '7');
INSERT INTO `sys_role_menu` VALUES ('4739', '1', '73');
INSERT INTO `sys_role_menu` VALUES ('4740', '1', '3');
INSERT INTO `sys_role_menu` VALUES ('4741', '1', '77');
INSERT INTO `sys_role_menu` VALUES ('4742', '1', '27');
INSERT INTO `sys_role_menu` VALUES ('4743', '1', '91');
INSERT INTO `sys_role_menu` VALUES ('4744', '1', '224');
INSERT INTO `sys_role_menu` VALUES ('4745', '1', '225');
INSERT INTO `sys_role_menu` VALUES ('4746', '1', '213');
INSERT INTO `sys_role_menu` VALUES ('4747', '1', '231');
INSERT INTO `sys_role_menu` VALUES ('4748', '1', '239');
INSERT INTO `sys_role_menu` VALUES ('4749', '1', '240');
INSERT INTO `sys_role_menu` VALUES ('4750', '1', '241');
INSERT INTO `sys_role_menu` VALUES ('4751', '1', '242');
INSERT INTO `sys_role_menu` VALUES ('4752', '1', '243');
INSERT INTO `sys_role_menu` VALUES ('4753', '1', '238');
INSERT INTO `sys_role_menu` VALUES ('4754', '1', '-1');

-- ----------------------------
-- Table structure for sys_task
-- ----------------------------
DROP TABLE IF EXISTS `sys_task`;
CREATE TABLE `sys_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cronExpression` varchar(255) DEFAULT NULL COMMENT 'cron表达式',
  `methodName` varchar(255) DEFAULT NULL COMMENT '任务调用的方法名',
  `isConcurrent` varchar(255) DEFAULT NULL COMMENT '任务是否有状态',
  `description` varchar(255) DEFAULT NULL COMMENT '任务描述',
  `updateBy` varchar(64) DEFAULT NULL COMMENT '更新者',
  `beanClass` varchar(255) DEFAULT NULL COMMENT '任务执行时调用哪个类的方法 包名+类名',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `jobStatus` varchar(255) DEFAULT NULL COMMENT '任务状态',
  `jobGroup` varchar(255) DEFAULT NULL COMMENT '任务分组',
  `updateDate` datetime DEFAULT NULL COMMENT '更新时间',
  `createBy` varchar(64) DEFAULT NULL COMMENT '创建者',
  `springBean` varchar(255) DEFAULT NULL COMMENT 'Spring bean',
  `jobName` varchar(255) DEFAULT NULL COMMENT '任务名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1020572889410367491 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_task
-- ----------------------------
INSERT INTO `sys_task` VALUES ('2', '0/10 * * * * ?', 'run1', '1', '', '4028ea815a3d2a8c015a3d2f8d2a0002', 'com.ifast.job.TestJob', '2017-05-19 18:30:56', '0', 'group1', '2017-05-19 18:31:07', null, '', 'TestJob');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `name` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `deptId` bigint(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(255) DEFAULT NULL COMMENT '状态 0:禁用，1:正常',
  `userIdCreate` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `gmtCreate` datetime DEFAULT NULL COMMENT '创建时间',
  `gmtModified` datetime DEFAULT NULL COMMENT '修改时间',
  `sex` bigint(32) DEFAULT NULL COMMENT '性别',
  `birth` datetime DEFAULT NULL COMMENT '出身日期',
  `picId` bigint(32) DEFAULT NULL,
  `liveAddress` varchar(500) DEFAULT NULL COMMENT '现居住地',
  `hobby` varchar(255) DEFAULT NULL COMMENT '爱好',
  `province` varchar(255) DEFAULT NULL COMMENT '省份',
  `city` varchar(255) DEFAULT NULL COMMENT '所在城市',
  `district` varchar(255) DEFAULT NULL COMMENT '所在地区',
  `openId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('3', 'cse', 'ces', '123321', null, '12313131@qq.com', '17706437133', '1', null, null, null, null, null, null, null, null, null, null, null, 'wxd45681e2d1b4e5cd');
INSERT INTO `sys_user` VALUES ('7', 'admin', '超级管理员', '24e3333890048d82367597dc9dbccf13', null, '13000000001@163.com', '13000000001', '1', null, null, null, null, null, null, null, null, null, null, null, '13000000001');
INSERT INTO `sys_user` VALUES ('8', 'zuo_data', 'zuo', '123321', null, 'canuxe@qq.com', '13966664444', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('9', '测试', '测试', '138a008ef1a853d0c5017b7a0737a82b', null, '213@qq.com', '18668151155', '1', null, null, null, null, null, null, null, null, null, null, null, 'o8biA4kY3eiTslzn5tVaDAMIoq3Y');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `roleId` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('73', '30', '48');
INSERT INTO `sys_user_role` VALUES ('74', '30', '49');
INSERT INTO `sys_user_role` VALUES ('75', '30', '50');
INSERT INTO `sys_user_role` VALUES ('76', '31', '48');
INSERT INTO `sys_user_role` VALUES ('77', '31', '49');
INSERT INTO `sys_user_role` VALUES ('78', '31', '52');
INSERT INTO `sys_user_role` VALUES ('79', '32', '48');
INSERT INTO `sys_user_role` VALUES ('80', '32', '49');
INSERT INTO `sys_user_role` VALUES ('81', '32', '50');
INSERT INTO `sys_user_role` VALUES ('82', '32', '51');
INSERT INTO `sys_user_role` VALUES ('83', '32', '52');
INSERT INTO `sys_user_role` VALUES ('84', '33', '38');
INSERT INTO `sys_user_role` VALUES ('85', '33', '49');
INSERT INTO `sys_user_role` VALUES ('86', '33', '52');
INSERT INTO `sys_user_role` VALUES ('87', '34', '50');
INSERT INTO `sys_user_role` VALUES ('88', '34', '51');
INSERT INTO `sys_user_role` VALUES ('89', '34', '52');
INSERT INTO `sys_user_role` VALUES ('110', '1', '1');
INSERT INTO `sys_user_role` VALUES ('117', '135', '1');
INSERT INTO `sys_user_role` VALUES ('120', '134', '1');
INSERT INTO `sys_user_role` VALUES ('121', '134', '48');
INSERT INTO `sys_user_role` VALUES ('124', null, '48');
INSERT INTO `sys_user_role` VALUES ('127', null, '1');
INSERT INTO `sys_user_role` VALUES ('128', null, '1');
INSERT INTO `sys_user_role` VALUES ('129', null, '1');
INSERT INTO `sys_user_role` VALUES ('131', '137', '57');
INSERT INTO `sys_user_role` VALUES ('134', '3', '56');
INSERT INTO `sys_user_role` VALUES ('138', '7', '1');
INSERT INTO `sys_user_role` VALUES ('139', '8', '56');
INSERT INTO `sys_user_role` VALUES ('140', '9', '56');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) unsigned NOT NULL,
  `work_number` bigint(20) DEFAULT NULL,
  `work_name` varchar(255) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `open_id` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for worker
-- ----------------------------
DROP TABLE IF EXISTS `worker`;
CREATE TABLE `worker` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '员工id',
  `work_number` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '工牌号',
  `work_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '员工姓名',
  `password` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '密码',
  `phone` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '手机',
  `open_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'openid',
  `status` int(11) DEFAULT '0',
  `gmt_create` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `gmt_modify` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `wechat` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1126 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of worker
-- ----------------------------

-- ----------------------------
-- Table structure for wx_mp_config
-- ----------------------------
DROP TABLE IF EXISTS `wx_mp_config`;
CREATE TABLE `wx_mp_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `token` varchar(120) DEFAULT NULL,
  `appId` varchar(64) NOT NULL COMMENT 'APPID',
  `appSecret` varchar(128) NOT NULL COMMENT 'AppSecret',
  `msgMode` int(11) DEFAULT NULL COMMENT '1加密 0不加密',
  `msgSecret` varchar(128) DEFAULT NULL,
  `mpName` varchar(250) DEFAULT NULL COMMENT '公众号名字',
  `appType` int(11) NOT NULL COMMENT '公众号类型： 1.订阅号 2.服务号 3.企业号 4.小程序 5. 测试号',
  `isAuth` int(11) DEFAULT NULL COMMENT '认证授权：1已认证 0未认证',
  `subscribeUrl` varchar(500) DEFAULT NULL COMMENT '提示订阅URL',
  `appKey` varchar(100) DEFAULT NULL COMMENT '开放的公众号key',
  `logo` varchar(255) DEFAULT NULL,
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='微信配置表';

-- ----------------------------
-- Records of wx_mp_config
-- ----------------------------

-- ----------------------------
-- Table structure for wx_mp_fans
-- ----------------------------
DROP TABLE IF EXISTS `wx_mp_fans`;
CREATE TABLE `wx_mp_fans` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mpId` bigint(11) NOT NULL COMMENT '公众号id',
  `openid` varchar(100) DEFAULT NULL COMMENT '用户的标识，对当前公众号唯一',
  `nickname` varchar(100) DEFAULT NULL COMMENT '昵称',
  `subscribe` tinyint(4) DEFAULT NULL COMMENT '用户是否订阅该公众号标识，值为0时，代表此用户没有关注该公众号，拉取不到其余信息。0未关注，1已关注',
  `subscribeTime` datetime DEFAULT NULL COMMENT '用户关注时间，为时间戳。如果用户曾多次关注，则取最后关注时间',
  `subscribeKey` varchar(100) DEFAULT NULL COMMENT '关注来源',
  `sex` tinyint(4) DEFAULT NULL COMMENT '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
  `city` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL COMMENT '语言',
  `headimgurl` varchar(500) DEFAULT NULL COMMENT '用户头像，最后一个数值代表正方形头像大小（有0、46、64、96、132数值可选，0代表640*640正方形头像），用户没有头像时该项为空。若用户更换头像，原有头像URL将失效。',
  `unionid` varchar(125) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL COMMENT '公众号运营者对粉丝的备注，公众号运营者可在微信公众平台用户管理界面对粉丝添加备注',
  `groupid` int(20) DEFAULT NULL COMMENT '分组ID',
  `status` tinyint(11) DEFAULT NULL COMMENT '用户状态 1:正常，0：禁用',
  `tagidList` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2905 DEFAULT CHARSET=utf8mb4 COMMENT='微信粉丝表';

-- ----------------------------
-- Records of wx_mp_fans
-- ----------------------------
INSERT INTO `wx_mp_fans` VALUES ('2899', '5', 'oorK7v4LWw3GMbwt_Ck6PuQ_8_D8', '你是我的眼', '0', null, null, '2', '广州', '中国', '广东', 'zh_CN', 'http://wx.qlogo.cn/mmopen/A7sq8BD8oewx50myY72SwetEVkBXbXDvT5jj6ytorRxqyGwtBu1XTnWGohGXhdTtTwh6VSAbUEUSWpibddJDChg/0', 'oI55m1o8VxrTFvV57WkzEFTHLRIM', null, null, '0', null);
INSERT INTO `wx_mp_fans` VALUES ('2902', '7', 'otO0P09bRa-YRLNlPbJEL1bdDjkQ', 'Aron', '1', '2017-11-24 11:14:28', '', '1', '广州', '中国', '广东', 'zh_CN', 'http://wx.qlogo.cn/mmopen/BQD9yxMcK6CicIrF6tU8Pqucb2VgYicn1iaTMTwm9war1KLT9RlibbsJ9cYal7yypERODjt6XGXC4dVJdVs9woJZBHwI0ibmaGQxY/0', 'oVzGa0kCIhSXljL9wDALjN00ylOs', '', '0', '0', null);
INSERT INTO `wx_mp_fans` VALUES ('2904', '9', 'ozbGr0vZhCS8Pe1lpTuy1tq9Wlls', 'SuSu', '0', '2017-11-26 21:03:25', '', '1', '江北', '中国', '重庆', 'zh_CN', 'http://wx.qlogo.cn/mmopen/8o7KgbIM6ibFyF3coD1mMMdm91kic6Tb68P0hq9lDccec0TllUm5MnBa4WEesfiaW1HUXWqNqCTNUsrYM5iceq9gnesbSPSaE0Yw/0', 'oJitl0bd590o0ONtSt1nB7hFh0Bo', '', '0', null, null);

-- ----------------------------
-- Table structure for wx_mp_menu
-- ----------------------------
DROP TABLE IF EXISTS `wx_mp_menu`;
CREATE TABLE `wx_mp_menu` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `parentIdx` bigint(20) DEFAULT NULL,
  `menuType` varchar(50) NOT NULL COMMENT '菜单类型：1主菜单，2链接，3文本，4关键字，5扫码，6发图，7发送位置',
  `menuName` varchar(128) NOT NULL,
  `menuKey` varchar(64) DEFAULT NULL,
  `menuUrl` varchar(500) DEFAULT NULL COMMENT '菜单链接',
  `replyContent` varchar(500) DEFAULT NULL,
  `scanType` int(4) DEFAULT NULL COMMENT '扫码类型：1扫码带事件，2扫码带提示',
  `pictureType` int(4) DEFAULT NULL COMMENT '发图类型：1，系统拍照发图；2,，拍照或者相册发图；3，微信相册发图',
  `location` varchar(255) DEFAULT NULL COMMENT '发送位置',
  `sort` int(11) DEFAULT NULL COMMENT '菜单排序',
  `status` int(4) DEFAULT NULL COMMENT '菜单状态',
  `createBy` bigint(20) DEFAULT NULL COMMENT '创建人',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateBy` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  `mpId` bigint(20) NOT NULL COMMENT '微信配置ID',
  `idx` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信菜单表';

-- ----------------------------
-- Records of wx_mp_menu
-- ----------------------------

-- ----------------------------
-- Table structure for wx_mp_wechat_keys
-- ----------------------------
DROP TABLE IF EXISTS `wx_mp_wechat_keys`;
CREATE TABLE `wx_mp_wechat_keys` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mpId` bigint(20) NOT NULL COMMENT '公众号id',
  `mediaId` varchar(50) DEFAULT NULL COMMENT '素材Id',
  `keyword` varchar(200) DEFAULT NULL COMMENT '关键字，以#,#隔开',
  `type` tinyint(4) DEFAULT NULL COMMENT '回复类型，1：关键字 2：关注自动回复 3：默认回复',
  `replyType` varchar(20) DEFAULT NULL COMMENT '回复类型，文字：text 图文：news 图片： image 语音：voice 音乐：music 视频：video',
  `content` text COMMENT '内容',
  `newsId` bigint(20) DEFAULT NULL COMMENT '图文素材Id',
  `musicTitle` varchar(100) DEFAULT NULL COMMENT '音乐标题',
  `musicCover` varchar(255) DEFAULT NULL COMMENT '音乐封面',
  `musicUrl` varchar(255) DEFAULT NULL COMMENT '音乐url',
  `musicDesc` varchar(255) DEFAULT NULL COMMENT '音乐描述',
  `imageUrl` varchar(255) DEFAULT NULL COMMENT '图片URL',
  `voiceUrl` varchar(255) DEFAULT NULL COMMENT '音频URL',
  `videoTitle` varchar(100) DEFAULT NULL COMMENT '视频标题',
  `videoUrl` varchar(255) DEFAULT NULL COMMENT '视频url',
  `videoDesc` varchar(255) DEFAULT NULL COMMENT '视频描述',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 0：禁用 1：启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信-关键字回复';

-- ----------------------------
-- Records of wx_mp_wechat_keys
-- ----------------------------
