/*
 Navicat Premium Data Transfer

 Source Server         : 法务测试
 Source Server Type    : MySQL
 Source Server Version : 50644
 Source Host           : 192.168.4.26:3306
 Source Schema         : yboot

 Target Server Type    : MySQL
 Target Server Version : 50644
 File Encoding         : 65001

 Date: 30/06/2020 11:43:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for jdbc
-- ----------------------------
DROP TABLE IF EXISTS `jdbc`;
CREATE TABLE `jdbc`  (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jdbc
-- ----------------------------
INSERT INTO `jdbc` VALUES (1);

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details`  (
  `client_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `resource_ids` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `client_secret` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码',
  `scope` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `authorized_grant_types` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '支持的授权方式',
  `web_server_redirect_uri` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `authorities` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL COMMENT 'access_token有效期（单位秒）',
  `refresh_token_validity` int(11) DEFAULT NULL COMMENT 'refresh_token有效期（单位秒）',
  `additional_information` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `autoapprove` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'oauth2的client表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------
INSERT INTO `oauth_client_details` VALUES ('baseServer', 'base-server,business-server', '$2a$10$MGN6fWATnbOLU.zIvT2d1u9BPWJGQeJDx6qZ.H9HZ8bU3KLWNVQpK', 'read,write,all', 'authorization_code,password,refresh_token', NULL, NULL, 28800, 864000, NULL, NULL);
INSERT INTO `oauth_client_details` VALUES ('gateway', 'base-server,business-server', '$2a$10$MGN6fWATnbOLU.zIvT2d1u9BPWJGQeJDx6qZ.H9HZ8bU3KLWNVQpK', 'read,write,all', 'authorization_code,password,refresh_token', NULL, NULL, 28800, 864000, NULL, NULL);
INSERT INTO `oauth_client_details` VALUES ('system', NULL, '$2a$10$QN9vg9iX3WFovHnDX7bJO.rWWDkS0VP7HYhV.HDiVEE56xPwZfjKe', 'app', 'authorization_code,password,refresh_token', NULL, NULL, 28800, NULL, NULL, NULL);
INSERT INTO `oauth_client_details` VALUES ('yboot', 'base-server,business-server', '$2a$10$MGN6fWATnbOLU.zIvT2d1u9BPWJGQeJDx6qZ.H9HZ8bU3KLWNVQpK', 'read,write,all', 'authorization_code,password,refresh_token', NULL, NULL, 28800, 864000, NULL, NULL);

-- ----------------------------
-- Table structure for rocketmq_transaction_log
-- ----------------------------
DROP TABLE IF EXISTS `rocketmq_transaction_log`;
CREATE TABLE `rocketmq_transaction_log`  (
  `id` int(11) NOT NULL,
  `log` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `transaction_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_act_business
-- ----------------------------
DROP TABLE IF EXISTS `t_act_business`;
CREATE TABLE `t_act_business`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `proc_def_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `proc_inst_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `result` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `table_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `apply_time` datetime(0) DEFAULT NULL,
  `is_history` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_act_category
-- ----------------------------
DROP TABLE IF EXISTS `t_act_category`;
CREATE TABLE `t_act_category`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `is_parent` bit(1) DEFAULT NULL,
  `parent_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sort_order` decimal(10, 2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_act_category
-- ----------------------------
INSERT INTO `t_act_category` VALUES ('80540745236221952', 'admin', '2018-11-29 20:12:31', 0, 'admin', '2018-11-29 22:28:09', b'1', '0', 1.00, 0, '人事相关', 0);
INSERT INTO `t_act_category` VALUES ('80544250063753216', 'admin', '2018-11-29 20:26:27', 0, 'admin', '2018-11-29 22:27:45', b'0', '80540745236221952', 0.00, 0, '请假申请', 1);
INSERT INTO `t_act_category` VALUES ('80574743098429440', 'admin', '2018-11-29 22:27:37', 0, 'admin', '2018-11-29 22:27:37', b'0', '80540745236221952', 0.00, 0, '报销申请', 1);
INSERT INTO `t_act_category` VALUES ('80574860496998400', 'admin', '2018-11-29 22:28:05', 0, 'admin', '2018-11-29 22:29:03', b'1', '0', 0.00, 0, '工作审核', 0);
INSERT INTO `t_act_category` VALUES ('80575104039260160', 'admin', '2018-11-29 22:29:03', 0, 'admin', '2018-11-29 22:29:03', b'0', '80574860496998400', 0.00, 0, '合同审批', 1);
INSERT INTO `t_act_category` VALUES ('80575163153780736', 'admin', '2018-11-29 22:29:17', 0, 'admin', '2018-11-29 22:29:17', b'0', '80574860496998400', 0.00, 0, '订单审批', 1);

-- ----------------------------
-- Table structure for t_act_model
-- ----------------------------
DROP TABLE IF EXISTS `t_act_model`;
CREATE TABLE `t_act_model`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `model_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_act_model
-- ----------------------------
INSERT INTO `t_act_model` VALUES ('12501', '682265633886208', '2020-04-20 16:53:09', 0, '682265633886208', '2020-04-20 17:37:32', '', 'Leave', '请假流程', 2);

-- ----------------------------
-- Table structure for t_act_node
-- ----------------------------
DROP TABLE IF EXISTS `t_act_node`;
CREATE TABLE `t_act_node`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `node_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `relate_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_act_node
-- ----------------------------
INSERT INTO `t_act_node` VALUES ('264600313976066048', '682265633886208', '2020-04-20 17:59:32', 0, '682265633886208', '2020-04-20 17:59:32', 'sid-386656E5-CCE7-4927-A5DC-FFAEF3409E0C', '1', '682265633886208');
INSERT INTO `t_act_node` VALUES ('264601038906986496', '682265633886208', '2020-04-20 18:02:25', 0, '682265633886208', '2020-04-20 18:02:25', 'sid-DDA0EFCB-9CD3-4838-8048-D3444C8DA4A9', '1', '682265633886208');
INSERT INTO `t_act_node` VALUES ('264601039070564352', '682265633886208', '2020-04-20 18:02:25', 0, '682265633886208', '2020-04-20 18:02:25', 'sid-DDA0EFCB-9CD3-4838-8048-D3444C8DA4A9', '1', '4363087427670016');

-- ----------------------------
-- Table structure for t_act_process
-- ----------------------------
DROP TABLE IF EXISTS `t_act_process`;
CREATE TABLE `t_act_process`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `category_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deployment_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `diagram_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `latest` bit(1) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `process_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `xml_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `business_table` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `route_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_act_process
-- ----------------------------
INSERT INTO `t_act_process` VALUES ('Leave:1:12507', '682265633886208', '2020-04-20 17:41:11', 0, '682265633886208', '2020-04-20 18:00:09', '80544250063753216', '12504', '', '请假流程.Leave.png', b'1', '请假流程', 'Leave', 1, 1, '请假流程.bpmn20.xml', 't_leave', 'leave');

-- ----------------------------
-- Table structure for t_client
-- ----------------------------
DROP TABLE IF EXISTS `t_client`;
CREATE TABLE `t_client`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `client_secret` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `home_uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `redirect_uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_department
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `parent_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父id',
  `sort_order` decimal(10, 2) DEFAULT NULL COMMENT '排序值',
  `status` int(11) DEFAULT NULL COMMENT '是否启用 0启用 -1禁用',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'title',
  `is_parent` bit(1) DEFAULT NULL COMMENT '是否为父节点(含子节点) 默认false',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_department
-- ----------------------------
INSERT INTO `t_department` VALUES ('40322777781112832', '', '2018-08-10 20:40:40', 0, '', '2018-08-11 00:03:06', '0', 1.00, 0, '总部', b'1');
INSERT INTO `t_department` VALUES ('40322811096469504', '', '2018-08-10 20:40:48', 0, '', '2018-08-11 00:27:05', '40322777781112832', 1.00, 0, '技术部', b'1');
INSERT INTO `t_department` VALUES ('40322852833988608', '', '2018-08-10 20:40:58', 0, '', '2018-08-11 01:29:42', '40322811096469504', 1.00, 0, '研发中心', NULL);
INSERT INTO `t_department` VALUES ('40327204755738624', '', '2018-08-10 20:58:15', 0, '', '2018-08-10 22:02:15', '40322811096469504', 2.00, 0, '大数据', NULL);
INSERT INTO `t_department` VALUES ('40327253309001728', '', '2018-08-10 20:58:27', 0, '', '2018-08-11 17:26:38', '40322811096469504', 3.00, -1, '人工智障', NULL);
INSERT INTO `t_department` VALUES ('40343262766043136', '', '2018-08-10 22:02:04', 0, '', '2018-08-11 00:02:53', '0', 2.00, 0, '成都分部', b'1');
INSERT INTO `t_department` VALUES ('40344005342400512', '', '2018-08-10 22:05:01', 0, '', '2018-08-11 17:48:44', '40343262766043136', 2.00, 0, 'Vue', NULL);
INSERT INTO `t_department` VALUES ('40389030113710080', '', '2018-08-11 01:03:56', 0, '', '2018-08-11 17:50:04', '40343262766043136', 1.00, 0, 'JAVA', b'0');
INSERT INTO `t_department` VALUES ('40652270295060480', '', '2018-08-11 18:29:57', 0, '', '2018-08-12 18:45:01', '0', 3.00, 0, '人事部', b'1');
INSERT INTO `t_department` VALUES ('40652338142121984', NULL, '2018-08-11 18:30:13', 0, NULL, '2018-08-11 18:30:13', '40652270295060480', 1.00, 0, '游客', b'0');
INSERT INTO `t_department` VALUES ('40681289119961088', '', '2018-08-11 20:25:16', 0, '', '2018-08-11 22:47:48', '40652270295060480', 2.00, 0, 'VIP', b'0');

-- ----------------------------
-- Table structure for t_department_header
-- ----------------------------
DROP TABLE IF EXISTS `t_department_header`;
CREATE TABLE `t_department_header`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `department_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '关联部门id',
  `type` int(11) DEFAULT NULL COMMENT '负责人类型 默认0主要 1副职',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '关联部门负责人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_dict`;
CREATE TABLE `t_dict`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sort_order` decimal(10, 2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_dict
-- ----------------------------
INSERT INTO `t_dict` VALUES ('75135930788220928', 'admin', '2018-11-14 22:15:43', 0, 'admin', '2018-11-27 01:39:06', '', '性别', 'sex', 0.00);
INSERT INTO `t_dict` VALUES ('75383353938808832', 'admin', '2018-11-15 14:38:53', 0, 'admin', '2018-11-27 01:39:15', '', '消息类型', 'message_type', 1.00);
INSERT INTO `t_dict` VALUES ('75388696739713024', 'admin', '2018-11-15 15:00:07', 0, 'admin', '2018-11-27 01:39:22', '', '按钮权限类型', 'permission_type', 2.00);
INSERT INTO `t_dict` VALUES ('75392985935646720', 'admin', '2018-11-15 15:17:10', 0, 'admin', '2018-11-27 01:39:29', '', '腾讯云对象存储区域', 'tencent_bucket_region', 3.00);
INSERT INTO `t_dict` VALUES ('79717732567748608', 'admin', '2018-11-27 13:42:10', 0, 'admin', '2018-11-27 13:42:10', '', '流程节点类型', 'process_node_type', 4.00);
INSERT INTO `t_dict` VALUES ('81843858882695168', 'admin', '2018-12-03 10:30:38', 0, 'admin', '2018-12-03 10:30:49', '', '优先级', 'priority', 5.00);
INSERT INTO `t_dict` VALUES ('82236987314016256', 'admin', '2018-12-04 12:32:47', 0, 'admin', '2018-12-04 12:32:47', '', '业务表', 'business_table', 6.00);
INSERT INTO `t_dict` VALUES ('82236987314016257', 'admin', '2018-12-04 12:32:47', 0, 'admin', '2018-12-04 12:32:47', '', '业务表单路由', 'business_form', 7.00);
INSERT INTO `t_dict` VALUES ('99020862912466944', 'admin', '2019-01-19 20:05:54', 0, 'admin', '2019-01-19 20:06:10', '', '请假类型', 'leave_type', 8.00);

-- ----------------------------
-- Table structure for t_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `t_dict_data`;
CREATE TABLE `t_dict_data`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `dict_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sort_order` decimal(10, 2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_dict_data
-- ----------------------------
INSERT INTO `t_dict_data` VALUES ('125170157323554816', 'admin', '2019-04-01 23:53:52', 0, 'admin', '2019-04-01 23:53:52', '', '75383353938808832', 3.00, 0, '工作流', '工作流');
INSERT INTO `t_dict_data` VALUES ('75158227712479232', 'admin', '2018-11-14 23:44:19', 0, 'admin', '2019-04-01 23:53:13', '', '75135930788220928', 0.00, 0, '男', '男');
INSERT INTO `t_dict_data` VALUES ('75159254272577536', 'admin', '2018-11-14 23:48:24', 0, 'admin', '2019-04-01 23:53:17', '', '75135930788220928', 1.00, 0, '女', '女');
INSERT INTO `t_dict_data` VALUES ('75159898425397248', 'admin', '2018-11-14 23:50:57', 0, 'admin', '2019-04-01 23:53:22', '', '75135930788220928', 2.00, -1, '保密', '保密');
INSERT INTO `t_dict_data` VALUES ('75385648017575936', 'admin', '2018-11-15 14:48:00', 0, 'admin', '2019-04-02 00:10:36', '', '75383353938808832', 0.00, 0, '系统公告', '系统公告');
INSERT INTO `t_dict_data` VALUES ('75385706913992704', 'admin', '2018-11-15 14:48:14', 0, 'admin', '2019-04-02 00:10:32', '', '75383353938808832', 1.00, 0, '提醒', '提醒');
INSERT INTO `t_dict_data` VALUES ('75385774274514944', 'admin', '2018-11-15 14:48:30', 0, 'admin', '2019-04-02 00:10:28', '', '75383353938808832', 2.00, 0, '私信', '私信');
INSERT INTO `t_dict_data` VALUES ('75390787835138048', 'admin', '2018-11-15 15:08:26', 0, 'admin', '2018-11-15 15:08:26', '', '75388696739713024', 0.00, 0, '查看操作(view)', 'view');
INSERT INTO `t_dict_data` VALUES ('75390886501945344', 'admin', '2018-11-15 15:08:49', 0, 'admin', '2018-11-15 15:08:57', '', '75388696739713024', 1.00, 0, '添加操作(add)', 'add');
INSERT INTO `t_dict_data` VALUES ('75390993939042304', 'admin', '2018-11-15 15:09:15', 0, 'admin', '2018-11-15 15:09:15', '', '75388696739713024', 2.00, 0, '编辑操作(edit)', 'edit');
INSERT INTO `t_dict_data` VALUES ('75391067532300288', 'admin', '2018-11-15 15:09:32', 0, 'admin', '2018-11-15 15:09:32', '', '75388696739713024', 3.00, 0, '删除操作(delete)', 'delete');
INSERT INTO `t_dict_data` VALUES ('75391126902673408', 'admin', '2018-11-15 15:09:46', 0, 'admin', '2018-11-15 15:09:46', '', '75388696739713024', 4.00, 0, '清空操作(clear)', 'clear');
INSERT INTO `t_dict_data` VALUES ('75391192883269632', 'admin', '2018-11-15 15:10:02', 0, 'admin', '2018-11-15 15:10:02', '', '75388696739713024', 5.00, 0, '启用操作(enable)', 'enable');
INSERT INTO `t_dict_data` VALUES ('75391251024711680', 'admin', '2018-11-15 15:10:16', 0, 'admin', '2018-11-15 15:10:16', '', '75388696739713024', 6.00, 0, '禁用操作(disable)', 'disable');
INSERT INTO `t_dict_data` VALUES ('75391297124306944', 'admin', '2018-11-15 15:10:27', 0, 'admin', '2018-11-15 15:10:27', '', '75388696739713024', 7.00, 0, '搜索操作(search)', 'search');
INSERT INTO `t_dict_data` VALUES ('75391343379091456', 'admin', '2018-11-15 15:10:38', 0, 'admin', '2018-11-15 15:10:38', '', '75388696739713024', 8.00, 0, '上传文件(upload)', 'upload');
INSERT INTO `t_dict_data` VALUES ('75391407526776832', 'admin', '2018-11-15 15:10:53', 0, 'admin', '2018-11-15 15:10:53', '', '75388696739713024', 9.00, 0, '导出操作(output)', 'output');
INSERT INTO `t_dict_data` VALUES ('75391475042488320', 'admin', '2018-11-15 15:11:09', 0, 'admin', '2018-11-15 15:11:09', '', '75388696739713024', 10.00, 0, '导入操作(input)', 'input');
INSERT INTO `t_dict_data` VALUES ('75391522182270976', 'admin', '2018-11-15 15:11:21', 0, 'admin', '2018-11-15 15:11:21', '', '75388696739713024', 11.00, 0, '分配权限(editPerm)', 'editPerm');
INSERT INTO `t_dict_data` VALUES ('75391576364290048', 'admin', '2018-11-15 15:11:34', 0, 'admin', '2018-11-15 15:11:34', '', '75388696739713024', 12.00, 0, '设为默认(setDefault)', 'setDefault');
INSERT INTO `t_dict_data` VALUES ('75391798033256448', 'admin', '2018-11-15 15:12:26', 0, 'admin', '2018-11-15 15:12:26', '', '75388696739713024', 13.00, 0, '其他操作(other)', 'other');
INSERT INTO `t_dict_data` VALUES ('75393605291741184', 'admin', '2018-11-15 15:19:37', 0, 'admin', '2018-11-15 15:19:37', '', '75392985935646720', 0.00, 0, '北京一区（华北）', 'ap-beijing-1');
INSERT INTO `t_dict_data` VALUES ('75393681254780928', 'admin', '2018-11-15 15:19:55', 0, 'admin', '2018-11-15 15:19:55', '', '75392985935646720', 1.00, 0, '北京', 'ap-beijing');
INSERT INTO `t_dict_data` VALUES ('75393767619694592', 'admin', '2018-11-15 15:20:16', 0, 'admin', '2018-11-15 15:20:16', '', '75392985935646720', 2.00, 0, '上海（华东）', 'ap-shanghai');
INSERT INTO `t_dict_data` VALUES ('75393851484803072', 'admin', '2018-11-15 15:20:36', 0, 'admin', '2018-11-15 15:20:36', '', '75392985935646720', 3.00, 0, '广州（华南）', 'ap-guangzhou');
INSERT INTO `t_dict_data` VALUES ('75393961887272960', 'admin', '2018-11-15 15:21:02', 0, 'admin', '2018-11-15 15:21:02', '', '75392985935646720', 4.00, 0, '成都（西南）', 'ap-chengdu');
INSERT INTO `t_dict_data` VALUES ('75394053969022976', 'admin', '2018-11-15 15:21:24', 0, 'admin', '2018-11-15 15:21:24', '', '75392985935646720', 5.00, 0, '重庆', 'ap-chongqing');
INSERT INTO `t_dict_data` VALUES ('75394122474590208', 'admin', '2018-11-15 15:21:41', 0, 'admin', '2018-11-15 15:21:41', '', '75392985935646720', 6.00, 0, '新加坡', 'ap-singapore');
INSERT INTO `t_dict_data` VALUES ('75394186202845184', 'admin', '2018-11-15 15:21:56', 0, 'admin', '2018-11-15 15:21:56', '', '75392985935646720', 7.00, 0, '香港', 'ap-hongkong');
INSERT INTO `t_dict_data` VALUES ('75394254255427584', 'admin', '2018-11-15 15:22:12', 0, 'admin', '2018-11-15 15:22:12', '', '75392985935646720', 8.00, 0, '多伦多', 'na-toronto');
INSERT INTO `t_dict_data` VALUES ('75394309125312512', 'admin', '2018-11-15 15:22:25', 0, 'admin', '2018-11-15 15:22:25', '', '75392985935646720', 9.00, 0, '法兰克福', 'eu-frankfurt');
INSERT INTO `t_dict_data` VALUES ('75394367044456448', 'admin', '2018-11-15 15:22:39', 0, 'admin', '2018-11-15 15:22:39', '', '75392985935646720', 10.00, 0, '孟买', 'ap-mumbai');
INSERT INTO `t_dict_data` VALUES ('75394448523005952', 'admin', '2018-11-15 15:22:58', 0, 'admin', '2018-11-15 15:22:58', '', '75392985935646720', 11.00, 0, '首尔', 'ap-seoul');
INSERT INTO `t_dict_data` VALUES ('75394604765024256', 'admin', '2018-11-15 15:23:36', 0, 'admin', '2018-11-15 15:23:36', '', '75392985935646720', 12.00, 0, '硅谷', 'na-siliconvalley');
INSERT INTO `t_dict_data` VALUES ('75394659299364864', 'admin', '2018-11-15 15:23:49', 0, 'admin', '2018-11-15 15:23:49', '', '75392985935646720', 13.00, 0, '弗吉尼亚', 'na-ashburn');
INSERT INTO `t_dict_data` VALUES ('75394705700950016', 'admin', '2018-11-15 15:24:00', 0, 'admin', '2018-11-15 15:24:00', '', '75392985935646720', 14.00, 0, '曼谷', 'ap-bangkok');
INSERT INTO `t_dict_data` VALUES ('75394759287377920', 'admin', '2018-11-15 15:24:12', 0, 'admin', '2018-11-15 15:24:12', '', '75392985935646720', 15.00, 0, '莫斯科', 'eu-moscow');
INSERT INTO `t_dict_data` VALUES ('79717808262352896', 'admin', '2018-11-27 13:42:28', 0, 'admin', '2018-11-27 13:42:28', '', '79717732567748608', 0.00, 0, '开始节点', '0');
INSERT INTO `t_dict_data` VALUES ('79717858308788224', 'admin', '2018-11-27 13:42:40', 0, 'admin', '2018-11-27 13:42:40', '', '79717732567748608', 1.00, 0, '审批节点', '1');
INSERT INTO `t_dict_data` VALUES ('79717920061526016', 'admin', '2018-11-27 13:42:54', 0, 'admin', '2018-12-08 20:35:39', '', '79717732567748608', 2.00, 0, '结束节点', '2');
INSERT INTO `t_dict_data` VALUES ('81843987719131136', 'admin', '2018-12-03 10:31:08', 0, 'admin', '2018-12-03 10:31:08', '', '81843858882695168', 0.00, 0, '普通', '0');
INSERT INTO `t_dict_data` VALUES ('81844044015079424', 'admin', '2018-12-03 10:31:22', 0, 'admin', '2018-12-03 10:31:22', '', '81843858882695168', 1.00, 0, '重要', '1');
INSERT INTO `t_dict_data` VALUES ('81844100705292288', 'admin', '2018-12-03 10:31:35', 0, 'admin', '2018-12-03 10:31:35', '', '81843858882695168', 2.00, 0, '紧急', '2');
INSERT INTO `t_dict_data` VALUES ('82237106587439104', 'admin', '2018-12-04 12:33:15', 0, 'admin', '2018-12-04 12:33:15', '', '82236987314016256', 0.00, 0, '请假申请表', 't_leave');
INSERT INTO `t_dict_data` VALUES ('82237106587439105', 'admin', '2018-12-04 12:33:15', 0, 'admin', '2018-12-04 12:33:15', '', '82236987314016257', 0.00, 0, '请假申请表', 'leave');
INSERT INTO `t_dict_data` VALUES ('99020985985929216', 'admin', '2019-01-19 20:06:23', 0, 'admin', '2019-04-01 23:55:48', '', '99020862912466944', 0.00, 0, '年假', '年假');
INSERT INTO `t_dict_data` VALUES ('99021020739932160', 'admin', '2019-01-19 20:06:32', 0, 'admin', '2019-04-01 23:55:52', '', '99020862912466944', 1.00, 0, '事假', '事假');
INSERT INTO `t_dict_data` VALUES ('99021195566911488', 'admin', '2019-01-19 20:07:13', 0, 'admin', '2019-04-01 23:55:56', '', '99020862912466944', 2.00, 0, '病假', '病假');
INSERT INTO `t_dict_data` VALUES ('99021242476007424', 'admin', '2019-01-19 20:07:24', 0, 'admin', '2019-04-01 23:56:01', '', '99020862912466944', 3.00, 0, '调休', '调休');
INSERT INTO `t_dict_data` VALUES ('99021300730695680', 'admin', '2019-01-19 20:07:38', 0, 'admin', '2019-04-01 23:56:05', '', '99020862912466944', 4.00, 0, '产假', '产假');
INSERT INTO `t_dict_data` VALUES ('99021341889400832', 'admin', '2019-01-19 20:07:48', 0, 'admin', '2019-04-01 23:56:10', '', '99020862912466944', 5.00, 0, '陪产假', '陪产假');
INSERT INTO `t_dict_data` VALUES ('99021382393794560', 'admin', '2019-01-19 20:07:58', 0, 'admin', '2019-04-01 23:56:14', '', '99020862912466944', 6.00, 0, '婚假', '婚假');
INSERT INTO `t_dict_data` VALUES ('99021437171404800', 'admin', '2019-01-19 20:08:11', 0, 'admin', '2019-04-01 23:56:18', '', '99020862912466944', 7.00, 0, '例假', '例假');
INSERT INTO `t_dict_data` VALUES ('99021497724571648', 'admin', '2019-01-19 20:08:25', 0, 'admin', '2019-04-01 23:56:23', '', '99020862912466944', 8.00, 0, '丧假', '丧假');
INSERT INTO `t_dict_data` VALUES ('99021556704874496', 'admin', '2019-01-19 20:08:39', 0, 'admin', '2019-04-01 23:56:27', '', '99020862912466944', 9.00, 0, '哺乳假', '哺乳假');

-- ----------------------------
-- Table structure for t_file
-- ----------------------------
DROP TABLE IF EXISTS `t_file`;
CREATE TABLE `t_file`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `f_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_github
-- ----------------------------
DROP TABLE IF EXISTS `t_github`;
CREATE TABLE `t_github`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_related` bit(1) DEFAULT NULL,
  `open_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `relate_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_leave
-- ----------------------------
DROP TABLE IF EXISTS `t_leave`;
CREATE TABLE `t_leave`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `end_date` datetime(0) DEFAULT NULL,
  `start_date` datetime(0) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_leave
-- ----------------------------
INSERT INTO `t_leave` VALUES ('264600714792144896', '682265633886208', '2020-04-20 18:01:08', 0, '682265633886208', '2020-04-20 18:01:08', '我想回家看看', '2020-04-28 00:00:00', '2020-04-20 00:00:00', '请假三天', 192, '事假');
INSERT INTO `t_leave` VALUES ('264608670069821441', '682265633886208', '2020-04-20 18:32:48', 0, '682265633886208', '2020-04-20 18:32:48', '1', '2020-04-21 00:00:00', '2020-04-20 00:00:00', '请假', 24, '年假');

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `cost_time` int(11) DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ip_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `request_param` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `request_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `request_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `log_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `create_send` bit(1) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_message
-- ----------------------------
INSERT INTO `t_message` VALUES ('124717033060306944', 'admin', '2019-03-31 17:53:19', 0, 'admin', '2019-03-31 17:53:19', NULL, '您收到了一条新的工作流待办消息，赶快去处理查看吧', '工作流', '<p>您收到了一条新的工作流待办消息，赶快去”工作流程-我的待办“处理查看吧</p>');
INSERT INTO `t_message` VALUES ('124743474544119808', 'admin', '2019-03-31 19:38:23', 0, 'admin', '2019-03-31 19:38:23', NULL, '您有一个工作流申请已审批通过，赶快去处理查看吧', '工作流', '<p>您有一个工作流申请已审批通过，赶快去”工作流程-我的申请“处理查看吧</p>');
INSERT INTO `t_message` VALUES ('124744392996032512', 'admin', '2019-03-31 19:42:02', 0, 'admin', '2019-03-31 19:42:02', NULL, '您有一个工作流申请已被驳回，赶快去处理查看吧', '工作流', '<p>您有一个工作流申请已已被驳回，赶快去”工作流程-我的申请“处理查看吧</p>');
INSERT INTO `t_message` VALUES ('124744706050494464', 'admin', '2019-03-31 19:43:17', 0, 'admin', '2019-03-31 19:43:17', NULL, '您收到了一个新的被委托待办工作流任务，赶快去处理查看吧', '工作流', '<p>您收到了一个新的被委托待办工作流任务，赶快去”工作流程-我的待办“处理查看吧</p>');

-- ----------------------------
-- Table structure for t_message_send
-- ----------------------------
DROP TABLE IF EXISTS `t_message_send`;
CREATE TABLE `t_message_send`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `message_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_message_send
-- ----------------------------
INSERT INTO `t_message_send` VALUES ('43615268663988224', NULL, '2018-08-19 22:43:51', 0, NULL, '2018-08-19 22:43:51', '43615268366192640', 0, '682265633886209');
INSERT INTO `t_message_send` VALUES ('43615268663988225', NULL, '2018-08-19 22:43:51', 0, NULL, '2018-08-19 22:43:51', '43615268366192640', 0, '16739222421508096');
INSERT INTO `t_message_send` VALUES ('43615268663988226', '', '2018-08-19 22:43:51', 0, '', '2018-08-24 12:41:24', '43615268366192640', 2, '4363087427670016');

-- ----------------------------
-- Table structure for t_pay_info
-- ----------------------------
DROP TABLE IF EXISTS `t_pay_info`;
CREATE TABLE `t_pay_info`  (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户ID',
  `order_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '业务订单ID',
  `pay_platform` int(20) DEFAULT NULL COMMENT '支付平台1-支付宝  2-微信',
  `platform_number` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '支付流水号',
  `platform_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '支付状态',
  `platform_amount` decimal(20, 2) NOT NULL COMMENT '支付金额',
  `pay_order_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付订单ID',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `platform_number`(`platform_number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 289459540905168897 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_pay_info
-- ----------------------------
INSERT INTO `t_pay_info` VALUES (257234025691746308, '682265633886208', '12345', 2, NULL, 'NOTPAY', 0.01, 'a35ff2648e1c4bfd8741f5742e71607f', '682265633886208', '2020-03-31 10:08:31', 1, '682265633886208', '2020-03-31 10:10:49');
INSERT INTO `t_pay_info` VALUES (257234601666154496, '682265633886208', '12345', 2, NULL, 'NOTPAY', 0.01, '94ba191e14d84afd9a276cecbc36add6', '682265633886208', '2020-03-31 10:10:49', 1, '682265633886208', '2020-03-31 11:40:32');
INSERT INTO `t_pay_info` VALUES (257257180099514368, '682265633886208', '12345', 2, NULL, 'NOTPAY', 0.01, 'a285a6de9101421f906ae9b0010fa559', '682265633886208', '2020-03-31 11:40:32', 1, '682265633886208', '2020-03-31 11:40:37');
INSERT INTO `t_pay_info` VALUES (257257202450960384, '682265633886208', '12345', 2, '4200000479202003314976947902', 'SUCCESS', 0.01, 'ceea7f7038d8441cbb71d65d71c2e95e', '682265633886208', '2020-03-31 11:40:37', 0, NULL, '2020-03-31 11:41:54');
INSERT INTO `t_pay_info` VALUES (257308727974039552, '682265633886208', 'p6e2d9rozk', 2, NULL, 'NOTPAY', 0.01, '16626db7d30e4529940af30b5d274627', '682265633886208', '2020-03-31 15:05:22', 0, NULL, NULL);
INSERT INTO `t_pay_info` VALUES (257309098092007430, '682265633886208', 'tfjpnv0kyk', 2, NULL, 'NOTPAY', 0.01, 'd41659bb37fb4f5b99bdff783c547ee5', '682265633886208', '2020-03-31 15:06:50', 0, NULL, NULL);
INSERT INTO `t_pay_info` VALUES (258055661659623424, '682265633886208', 'at3hs1blkx', 2, NULL, 'NOTPAY', 0.01, 'ab3e15e245d24937be6bebbbb6e8cd57', '682265633886208', '2020-04-02 16:33:25', 0, NULL, NULL);
INSERT INTO `t_pay_info` VALUES (258056105421180928, '682265633886208', '0b11na0n29', 2, NULL, 'NOTPAY', 0.01, 'c3ccba30f92146ea8fa4a6a185ec2dd0', '682265633886208', '2020-04-02 16:35:10', 0, NULL, NULL);
INSERT INTO `t_pay_info` VALUES (258314813594144768, '682265633886208', 'eowrmeblwp', 2, NULL, 'NOTPAY', 0.01, '147fa80a31ca432a884bd47b62d4a8f2', '682265633886208', '2020-04-03 09:43:11', 0, NULL, NULL);
INSERT INTO `t_pay_info` VALUES (262669871567867904, '682265633886208', 'vcqyrv7v9a', 2, NULL, 'NOTPAY', 0.01, '7a9c20293a224aa6938ec2afd5e1dc06', '682265633886208', '2020-04-15 10:08:38', 0, NULL, NULL);
INSERT INTO `t_pay_info` VALUES (264581481639186432, '682265633886208', 'qdpwegpj4u', 2, NULL, 'NOTPAY', 0.01, '0a5eec650f5c448abb5b14428cac12c0', '682265633886208', '2020-04-20 16:44:41', 0, NULL, NULL);
INSERT INTO `t_pay_info` VALUES (289221121910247424, '682265633886208', 'sh11thmtee', 2, NULL, 'NOTPAY', 0.01, '09b36aa0f1f14091bffd890e26e6132c', '682265633886208', '2020-06-27 16:33:49', 0, NULL, NULL);
INSERT INTO `t_pay_info` VALUES (289459540905168896, '682265633886208', 'ncs7fpx5n1', 2, NULL, 'NOTPAY', 0.01, 'c4984bfcab35484698c75ce2b6afd877', '682265633886208', '2020-06-28 08:21:13', 0, NULL, NULL);

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '说明备注',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单/权限名称',
  `parent_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父id',
  `type` int(11) DEFAULT NULL COMMENT '类型 -1顶部菜单 0页面 1具体操作',
  `sort_order` decimal(10, 2) DEFAULT NULL COMMENT '排序值',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '前端组件',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '页面路径/资源链接url',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单标题',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图标',
  `level` int(11) DEFAULT NULL COMMENT '层级',
  `button_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '按钮权限类型',
  `status` int(11) DEFAULT NULL COMMENT '是否启用 0启用 -1禁用',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '网页链接',
  `show_always` bit(1) DEFAULT NULL COMMENT '始终显示 默认是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES ('102235632889237504', 'admin', '2019-01-28 17:00:15', 0, 'admin', '2019-11-22 11:47:14', '', 'vue-generator', '125909152017944576', 0, 3.00, 'Main', '/vue-generator', 'Vue代码生成', 'md-send', 1, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('102237605176807424', 'admin', '2019-01-28 17:08:06', 0, 'admin', '2020-03-17 16:47:16', '', 'table-generator', '102235632889237504', 0, 0.00, 'yboot-vue-generator/tableGenerator', 'table', '增删改表格生成', 'md-grid', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('102240052523831296', 'admin', '2019-01-28 17:17:49', 0, 'admin', '2020-03-17 16:49:49', '', 'tree-generator', '102235632889237504', 0, 1.00, 'yboot-vue-generator/treeGenerator', 'tree', '树形结构生成', 'md-git-branch', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('103658022701633536', 'admin', '2019-02-01 15:12:20', 0, 'admin', '2020-03-17 16:50:01', '', 'test', '102235632889237504', 0, 3.00, 'yboot-vue-generator/test', 'test', '代码生成测试页', 'ios-bug', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('113601631450304512', 'admin', '2019-03-01 01:44:41', 0, 'admin', '2019-03-01 01:44:41', NULL, '', '81716172680073216', 1, 2.00, '', '/base/actTask/backAll/**', '审批驳回至发起人', '', 3, 'disable', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('113602149589454848', 'admin', '2019-03-01 01:46:44', 0, 'admin', '2020-03-17 14:56:31', '', 'components', '125909152017944576', 0, 5.00, 'Main', '/components', 'YBoot业务组件', 'md-cube', 1, '', 0, '', b'0');
INSERT INTO `t_permission` VALUES ('113602342657462272', 'admin', '2019-03-01 01:47:30', 0, 'admin', '2020-03-17 17:20:44', '', 'components', '113602149589454848', 0, 0.00, 'yboot-components/yboot-components', 'components', 'YBoot业务组件', 'md-cube', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('113603512293658624', 'admin', '2019-03-01 01:52:09', 0, 'admin', '2019-06-26 20:38:47', '', 'library', '125909152017944576', 0, 6.00, 'Main', '/library', '第三方依赖工具/组件', 'ios-link', 1, '', 0, '', b'0');
INSERT INTO `t_permission` VALUES ('113603617897844736', 'admin', '2019-03-01 01:52:34', 0, 'admin', '2020-03-17 17:20:57', '', 'library', '113603512293658624', 0, 0.00, 'yboot-library/yboot-library', 'library', '第三方依赖工具/组件', 'ios-link', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('117806106536841216', 'admin', '2019-03-12 16:11:46', 0, 'admin', '2019-03-12 16:11:46', NULL, 'process-finish-manage', '76606430504816640', 0, 0.80, 'activiti/process-finish-manage/processFinishManage', 'process-finish-manage', '结束的流程', 'md-power', 2, '', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('121426317022334976', 'admin', '2019-03-22 15:57:11', 0, 'admin', '2019-03-22 15:57:11', NULL, 'redis', '39915540965232640', 0, 2.21, 'sys/redis/redis', 'redis', 'Redis缓存管理', 'md-barcode', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('125909152017944576', 'admin', '2019-04-04 00:50:22', 0, 'admin', '2020-03-17 14:56:19', '', 'yboot', '', -1, 0.00, '', '', 'YBoot管理系统', 'md-home', 0, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('129033675403694080', 'admin', '2019-04-12 15:46:07', 0, 'admin', '2020-03-17 16:47:28', '', 'single-window', '41373430515240960', 0, 1.00, 'yboot-vue-template/single-window/singleWindow', 'single-window', '动态组件单页操作', 'md-easel', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('149452775095275520', 'admin', '2019-06-08 00:04:19', 0, 'admin', '2019-06-08 00:04:19', NULL, 'admin', '39915540965232640', 0, 2.29, 'sys/monitor/monitor', '/admin', 'Admin监控', 'md-speedometer', 2, '', 0, 'http://127.0.0.1:8888/base/admin', b'1');
INSERT INTO `t_permission` VALUES ('156365156580855808', 'admin', '2019-06-27 01:51:39', 0, 'admin', '2019-06-27 01:51:39', NULL, '', '5129710648430593', 1, 1.18, '', '/base/user/resetPass', '重置密码', '', 3, 'other', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('15701400130424832', '', '2018-06-03 22:04:06', 0, '', '2018-09-19 22:16:44', '', '', '5129710648430593', 1, 1.11, '', '/base/user/admin/add*', '添加用户', '', 3, 'add', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('15701915807518720', '', '2018-06-03 22:06:09', 0, '4363087427670016', '2020-03-25 16:02:05', '', '', '5129710648430593', 1, 1.13, '', '/base/user/admin/disable/**', '禁用用户', '', 3, 'disable', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('15708892205944832', '', '2018-06-03 22:33:52', 0, '', '2018-06-28 16:44:48', '', '', '5129710648430593', 1, 1.14, '', '/base/user/admin/enable/**', '启用用户', '', 3, 'enable', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('16392452747300864', '', '2018-06-05 19:50:06', 0, 'admin', '2019-06-26 20:38:41', '', 'access', '125909152017944576', 0, 7.00, 'Main', '/access', '权限按钮测试页', 'md-lock', 1, '', 0, '', b'0');
INSERT INTO `t_permission` VALUES ('16392767785668608', '', '2018-06-05 19:51:21', 0, 'admin', '2018-10-23 12:34:38', '', 'access_index', '16392452747300864', 0, 5.10, 'access/access', 'index', '权限按钮测试页', 'md-lock', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('16438800255291392', '', '2018-06-05 22:54:18', 0, 'admin', '2018-10-23 12:34:51', '', '', '16392767785668608', 1, 5.11, '', 'test-add', '添加按钮测试', '', 3, 'add', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('16438962738434048', '', '2018-06-05 22:54:55', 0, 'admin', '2018-10-23 12:35:05', '', '', '16392767785668608', 1, 5.12, '', 'test-edit', '编辑按钮测试', '', 3, 'edit', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('16439068543946752', '', '2018-06-05 22:55:20', 0, 'admin', '2018-10-23 12:34:54', '', '', '16392767785668608', 1, 5.13, '', 'test-delete', '删除按钮测试', '', 3, 'delete', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('16678126574637056', '', '2018-06-06 14:45:16', 0, '', '2018-09-19 22:16:48', '', '', '5129710648430593', 1, 1.12, '', '/base/user/admin/edit*', '编辑用户', '', 3, 'edit', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('16678447719911424', '', '2018-06-06 14:46:32', 0, '', '2018-08-10 21:41:16', '', '', '5129710648430593', 1, 1.15, '', '/base/user/delByIds/**', '删除用户', '', 3, 'delete', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('16687383932047360', '', '2018-06-06 15:22:03', 0, '', '2018-09-19 22:07:34', '', '', '5129710648430594', 1, 1.21, '', '/base/role/save*', '添加角色', '', 3, 'add', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('16689632049631232', '', '2018-06-06 15:30:59', 0, '', '2018-09-19 22:07:37', '', '', '5129710648430594', 1, 1.22, '', '/base/role/edit*', '编辑角色', '', 3, 'edit', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('16689745006432256', '', '2018-06-06 15:31:26', 0, '', '2018-08-10 21:41:23', '', '', '5129710648430594', 1, 1.23, '', '/base/role/delAllByIds/**', '删除角色', '', 3, 'delete', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('16689883993083904', NULL, '2018-06-06 15:31:59', 0, NULL, '2018-06-06 15:31:59', NULL, NULL, '5129710648430594', 1, 1.24, NULL, '/base/role/editRolePerm**', '分配权限', NULL, 3, 'editPerm', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('16690313745666048', '', '2018-06-06 15:33:41', 0, '', '2018-09-19 22:07:46', '', '', '5129710648430594', 1, 1.25, '', '/base/role/setDefault*', '设为默认角色', '', 3, 'setDefault', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('16694861252005888', '', '2018-06-06 15:51:46', 0, '', '2018-09-19 22:07:52', '', '', '5129710648430595', 1, 1.31, '', '/base/permission/add*', '添加菜单', '', 3, 'add', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('16695107491205120', '', '2018-06-06 15:52:44', 0, '', '2018-09-19 22:07:57', '', '', '5129710648430595', 1, 1.32, '', '/base/permission/edit*', '编辑菜单', '', 3, 'edit', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('16695243126607872', '', '2018-06-06 15:53:17', 0, '', '2018-08-10 21:41:33', '', '', '5129710648430595', 1, 1.33, '', '/base/permission/delByIds/**', '删除菜单', '', 3, 'delete', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('210154306362413056', 'admin', '2019-11-22 12:10:32', 0, 'admin', '2019-11-22 12:10:32', NULL, 'charts', '125909152017944576', 0, 3.10, 'Main', '/charts', '图表数据展示', 'md-analytics', 1, '', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('210155258859491329', 'admin', '2019-11-22 12:14:19', 0, 'admin', '2020-03-17 16:50:21', '', 'dashboard1', '210154306362413056', 0, 0.00, 'yboot-charts/dashboard1/dashboard1', 'dashboard1', 'Dashboard1', 'md-speedometer', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('210156371755143168', 'admin', '2019-11-22 12:18:45', 0, 'admin', '2020-03-17 16:50:29', '', 'dashboard2', '210154306362413056', 0, 1.00, 'yboot-charts/dashboard2/dashboard2', 'dashboard2', 'Dashboard2', 'ios-speedometer', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('211251162815401984', 'admin', '2019-11-25 12:49:03', 0, 'admin', '2019-11-25 12:49:12', '', 'open', '125909152017944576', 0, 1.20, 'Main', '/open', '开放平台', 'ios-apps', 1, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('211251678651879424', 'admin', '2019-11-25 12:51:06', 0, 'admin', '2019-11-25 12:51:06', NULL, 'client', '211251162815401984', 0, 0.00, 'open/client/client', 'client', '接入网站管理', 'md-browsers', 2, '', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('25014528525733888', '', '2018-06-29 14:51:09', 0, '', '2018-10-08 11:13:27', '', '', '5129710648430593', 1, 1.16, '', '无', '上传图片', '', 3, 'upload', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('256539217813835777', '4363087427670016', '2020-03-29 12:07:37', 0, '4363087427670016', '2020-03-29 12:08:25', '', 'pay', '125909152017944576', 0, 2.00, 'Main', '/pay', '支付系统', 'ios-card', 1, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('256539894803861505', '4363087427670016', '2020-03-29 12:10:18', 0, '4363087427670016', '2020-03-29 12:10:18', NULL, 'pay-test', '256539217813835777', 0, 2.10, 'pay/pay-test/payTest', 'pay-test', '支付测试', 'ios-card', 2, '', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('39915540965232640', NULL, '2018-08-09 17:42:28', 0, NULL, '2018-08-09 17:42:28', NULL, 'monitor', '125909152017944576', 0, 2.00, 'Main', '/monitor', '系统监控', 'ios-analytics', 1, NULL, 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('39916171171991552', '', '2018-08-09 17:44:57', 0, 'admin', '2019-01-20 00:37:29', '', 'druid', '39915540965232640', 0, 2.40, 'sys/monitor/monitor', 'druid', 'SQL监控', 'md-analytics', 2, '', 0, 'http://127.0.0.1:8888/druid/login.html', b'1');
INSERT INTO `t_permission` VALUES ('39918482854252544', '', '2018-08-09 17:54:08', 0, 'admin', '2019-01-20 00:37:41', '', 'swagger', '39915540965232640', 0, 2.50, 'sys/monitor/monitor', 'swagger', '接口文档', 'md-document', 2, '', 0, 'http://127.0.0.1:8888/swagger-ui.html', b'1');
INSERT INTO `t_permission` VALUES ('40238597734928384', NULL, '2018-08-10 15:06:10', 0, NULL, '2018-08-10 15:06:10', NULL, 'department-manage', '5129710648430592', 0, 1.20, 'sys/department-manage/departmentManage', 'department-manage', '部门管理', 'md-git-branch', 2, '', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('41363147411427328', '', '2018-08-13 17:34:43', 0, '', '2018-08-20 20:05:21', '', 'log-manage', '39915540965232640', 0, 2.20, 'sys/log-manage/logManage', 'log-manage', '操作日志管理', 'md-list-box', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('41363537456533504', '', '2018-08-13 17:36:16', 0, '', '2018-08-13 17:56:11', '', '', '41363147411427328', 1, 2.11, '', '/base/log/delByIds/**', '删除日志', '', 3, 'delete', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('41364927394353152', '', '2018-08-13 17:41:48', 0, '', '2018-09-19 22:08:57', '', '', '41363147411427328', 1, 2.12, '', '/base/log/delAll*', '清空日志', '', 3, 'undefined', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('41370251991977984', NULL, '2018-08-13 18:02:57', 0, NULL, '2018-08-13 18:02:57', NULL, 'quartz-job', '39915540965232640', 0, 2.10, 'sys/quartz-manage/quartzManage', 'quartz-job', '定时任务', 'md-time', 2, '', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('41371711400054784', '', '2018-08-13 18:08:45', 0, '', '2019-07-07 21:24:26', '', 'actuator', '39915540965232640', 0, 2.30, 'sys/actuator/actuator', 'actuator', 'Actuator监控', 'logo-angular', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('41373430515240960', '', '2018-08-13 18:15:35', 0, 'admin', '2019-11-22 11:47:07', '', 'vue-template', '125909152017944576', 0, 3.10, 'Main', '/vue-template', '后台Vue模版', 'ios-albums', 1, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('41375330996326400', '', '2018-08-13 18:23:08', 0, 'admin', '2020-03-17 16:47:37', '', 'simple-table', '41373430515240960', 0, 3.10, 'yboot-vue-template/simple-table/simpleTable', 'simple-table', '简单表格', 'ios-grid-outline', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('41376192166629376', '', '2018-08-13 18:26:33', 0, 'admin', '2020-03-17 16:48:28', '', 'search-table', '41373430515240960', 0, 3.40, 'yboot-vue-template/search-table/searchTable', 'search-table', '搜索表格', 'md-grid', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('41377034236071936', '', '2018-08-13 18:29:54', 0, 'admin', '2020-03-17 16:48:41', '', 'complex-table', '41373430515240960', 0, 3.50, 'yboot-vue-template/complex-table/complexTable', 'complex-table', '复杂表格', 'ios-grid', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('41378916912336896', '', '2018-08-13 18:37:23', 0, 'admin', '2020-03-17 16:48:02', '', 'tree', '41373430515240960', 0, 3.22, 'yboot-vue-template/tree/tree', 'tree', '树形结构', 'ios-git-network', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('41469219249852416', NULL, '2018-08-14 00:36:13', 0, NULL, '2018-08-14 00:36:13', NULL, '', '41371711400054784', 1, 2.31, '', '无', '查看数据', '', 3, 'view', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('42082442672082944', '', '2018-08-15 17:12:57', 0, 'admin', '2020-03-17 16:47:50', '', 'new-window', '41373430515240960', 0, 3.21, 'yboot-vue-template/new-window/newWindow', 'new-window', '新窗口操作', 'ios-browsers', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('43117268627886080', '', '2018-08-18 13:44:58', 0, '682265633886208', '2020-04-02 19:51:05', '', 'message-manage', '5129710648430592', 0, 1.30, 'sys/message-manage/messageManage', 'message-manage', '消息管理', 'md-mail', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('44986029924421632', '', '2018-08-23 17:30:46', 0, '', '2018-09-23 23:26:53', '', 'social-manage', '5129710648430592', 0, 1.50, 'sys/social-manage/socialManage', 'social-manage', '社交账号绑定', 'md-share', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('45069342940860416', '', '2018-08-23 23:01:49', 0, '', '2018-08-24 10:01:09', '', '', '44986029924421632', 1, 1.42, '', '无', '查看社交账号数据', '', 3, 'view', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('45235228800716800', '', '2018-08-24 10:01:00', 0, '', '2018-09-19 22:07:23', '', '', '44986029924421632', 1, 1.41, '', '/base/relate/delByIds*', '删除解绑', '', 3, 'delete', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('45235621697949696', '', '2018-08-24 10:02:33', 0, '', '2018-09-19 22:06:57', '', '', '40238597734928384', 1, 1.21, '', '/base/department/add*', '添加部门', '', 3, 'add', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('45235787867885568', '', '2018-08-24 10:03:13', 0, '', '2018-09-19 22:07:02', '', '', '40238597734928384', 1, 1.22, '', '/base/department/edit*', '编辑部门', '', 3, 'edit', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('45235939278065664', NULL, '2018-08-24 10:03:49', 0, NULL, '2018-08-24 10:03:49', NULL, '', '40238597734928384', 1, 1.23, '', '/base/department/delByIds/*', '删除部门', '', 3, 'delete', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('45236734832676864', '', '2018-08-24 10:06:59', 0, '', '2018-09-19 22:07:07', '', '', '43117268627886080', 1, 1.31, '', '/base/message/add*', '添加消息', '', 3, 'add', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('45237010692050944', '', '2018-08-24 10:08:04', 0, '', '2018-09-19 22:07:12', '', '', '43117268627886080', 1, 1.32, '', '/base/message/edit*', '编辑消息', '', 3, 'edit', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('45237170029465600', NULL, '2018-08-24 10:08:42', 0, NULL, '2018-08-24 10:08:42', NULL, '', '43117268627886080', 1, 1.33, '', '/base/message/delByIds/*', '删除消息', '', 3, 'delete', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('45264987354042368', '', '2018-08-24 11:59:14', 0, '', '2018-09-19 22:08:11', '', '', '41370251991977984', 1, 2.11, '', '/base/quartzJob/add*', '添加定时任务', '', 3, 'add', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('45265487029866496', '', '2018-08-24 12:01:14', 0, '', '2018-09-19 22:08:17', '', '', '41370251991977984', 1, 2.12, '', '/base/quartzJob/edit*', '编辑定时任务', '', 3, 'edit', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('45265762415284224', '', '2018-08-24 12:02:19', 0, '', '2018-09-19 22:08:24', '', '', '41370251991977984', 1, 2.13, '', '/base/quartzJob/pause*', '暂停定时任务', '', 3, 'disable', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('45265886315024384', '', '2018-08-24 12:02:49', 0, '', '2018-09-19 22:09:13', '', '', '41370251991977984', 1, 2.14, '', '/base/quartzJob/resume*', '恢复定时任务', '', 3, 'enable', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('45266070000373760', NULL, '2018-08-24 12:03:33', 0, NULL, '2018-08-24 12:03:33', NULL, '', '41370251991977984', 1, 2.15, '', '/base/quartzJob/delByIds/*', '删除定时任务', '', 3, 'delete', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('5129710648430592', '', '2018-06-04 19:02:29', 0, '', '2018-09-29 23:11:56', '', 'sys', '125909152017944576', 0, 1.00, 'Main', '/sys', '系统管理', 'ios-settings', 1, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('5129710648430593', '', '2018-06-04 19:02:32', 0, '', '2018-08-13 15:15:33', '', 'user-manage', '5129710648430592', 0, 1.10, 'sys/user-manage/userManage', 'user-manage', '用户管理', 'md-person', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('5129710648430594', '', '2018-06-04 19:02:35', 0, '', '2018-10-13 13:51:36', '', 'role-manage', '5129710648430592', 0, 1.60, 'sys/role-manage/roleManage', 'role-manage', '角色权限管理', 'md-contacts', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('5129710648430595', '', '2018-06-04 19:02:37', 0, '', '2018-09-23 23:32:02', '', 'menu-manage', '5129710648430592', 0, 1.70, 'sys/menu-manage/menuManage', 'menu-manage', '菜单权限管理', 'md-menu', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('56309618086776832', '', '2018-09-23 23:26:40', 0, '682265633886208', '2020-04-02 19:51:19', '', 'oss-manage', '5129710648430592', 0, 1.40, 'sys/oss-manage/ossManage', 'oss-manage', '文件对象存储', 'ios-folder', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('56898976661639168', '', '2018-09-25 14:28:34', 0, '', '2018-09-25 15:12:46', '', '', '5129710648430593', 1, 1.17, '', '/base/user/importData*', '导入用户', '', 3, 'input', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('56911328312299520', '', '2018-09-25 15:17:39', 0, 'admin', '2020-03-17 16:48:57', '', 'excel', '41373430515240960', 0, 3.60, 'yboot-vue-template/excel/excel', 'excel', 'Excel导入导出', 'md-exit', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('57009544286441472', NULL, '2018-09-25 21:47:55', 0, NULL, '2018-09-25 21:47:55', NULL, '', '43117268627886080', 1, 1.40, '', '/base/messageSend/save*', '添加已发送消息', '', 3, 'add', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('57009744761589760', NULL, '2018-09-25 21:48:43', 0, NULL, '2018-09-25 21:48:43', NULL, '', '43117268627886080', 1, 1.50, '', '/base/messageSend/update*', '编辑已发送消息', '', 3, 'edit', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('57009981228060672', NULL, '2018-09-25 21:49:39', 0, NULL, '2018-09-25 21:49:39', NULL, '', '43117268627886080', 1, 1.60, '', '/base/messageSend/delByIds/*', '删除已发送消息', '', 3, 'delete', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('57212882168844288', '', '2018-09-26 11:15:55', 0, '', '2018-10-08 11:10:05', '', '', '56309618086776832', 1, 1.41, '', '无', '上传文件', '', 3, 'upload', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('58480609315524608', '', '2018-09-29 23:13:24', 0, 'admin', '2018-11-14 13:24:26', '', 'setting', '5129710648430592', 0, 1.90, 'sys/setting-manage/settingManage', 'setting', '系统配置', 'ios-settings-outline', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('61394706252173312', NULL, '2018-10-08 00:12:59', 0, NULL, '2018-10-08 00:12:59', NULL, '', '58480609315524608', 1, 1.81, '', '/base/setting/seeSecret/**', '查看私密配置', '', 3, 'view', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('61417744146370560', '', '2018-10-08 01:44:32', 0, '', '2018-10-08 01:50:03', '', '', '58480609315524608', 1, 1.82, '', '/base/setting/*/set*', '编辑配置', '', 3, 'edit', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('61560041605435392', NULL, '2018-10-08 11:09:58', 0, NULL, '2018-10-08 11:09:58', NULL, '', '56309618086776832', 1, 1.42, '', '/base/file/rename*', '重命名文件', '', 3, 'edit', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('61560275261722624', NULL, '2018-10-08 11:10:54', 0, NULL, '2018-10-08 11:10:54', NULL, '', '56309618086776832', 1, 1.43, '', '/base/file/copy*', '复制文件', '', 3, 'edit', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('61560480518377472', NULL, '2018-10-08 11:11:43', 0, NULL, '2018-10-08 11:11:43', NULL, '', '56309618086776832', 1, 1.44, '', '/base/file/delete/*', '删除文件', '', 3, 'delete', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('63482475359244288', '', '2018-10-13 18:29:02', 0, 'admin', '2020-03-17 16:49:09', '', 'custom-tree', '41373430515240960', 0, 3.80, 'yboot-vue-template/custom-tree/customTree', 'custom-tree', '自定义树', 'md-git-network', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('63741744973352960', '', '2018-10-14 11:39:17', 0, 'admin', '2020-03-17 16:48:14', '', 'render', '41373430515240960', 0, 3.30, 'yboot-vue-template/render/render', 'render', 'Render函数示例', 'md-aperture', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('64290663792906240', '', '2018-10-16 00:00:29', 0, 'admin', '2020-03-17 16:49:23', '', 'tree&table', '41373430515240960', 0, 3.90, 'yboot-vue-template/tree&table/tree&table', 'tree&table', '树+表格', 'md-list', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('66790433014943744', 'admin', '2018-10-22 21:33:42', 0, 'admin', '2020-03-17 16:49:35', '', 'card-list', '41373430515240960', 0, 3.91, 'yboot-vue-template/card-list/cardList', 'card-list', '卡片列表', 'md-card', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('75002207560273920', 'admin', '2018-11-14 13:24:21', 0, 'admin', '2018-11-20 20:06:22', '', 'dict', '5129710648430592', 0, 1.80, 'sys/dict-manage/dictManage', 'dict', '数据字典管理', 'md-bookmarks', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('76215889006956544', 'admin', '2018-11-17 21:47:05', 0, 'admin', '2018-11-17 21:47:53', '', '', '75002207560273920', 1, 1.81, '', '/base/dict/add*', '添加字典', '', 3, 'add', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('76216071333351424', 'admin', '2018-11-17 21:47:48', 0, 'admin', '2018-11-17 21:47:48', NULL, '', '75002207560273920', 1, 1.82, '', '/base/dict/edit*', '编辑字典', '', 3, 'edit', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('76216264070008832', 'admin', '2018-11-17 21:48:34', 0, 'admin', '2018-11-17 21:48:34', NULL, '', '75002207560273920', 1, 1.83, '', '/base/dict/delByIds/**', '删除字典', '', 3, 'delete', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('76216459709124608', 'admin', '2018-11-17 21:49:21', 0, 'admin', '2018-11-17 21:49:21', NULL, '', '75002207560273920', 1, 1.84, '', '/base/dictData/add*', '添加字典数据', '', 3, 'add', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('76216594207870976', 'admin', '2018-11-17 21:49:53', 0, 'admin', '2018-11-17 21:49:53', NULL, '', '75002207560273920', 1, 1.85, '', '/base/dictData/edit*', '编辑字典数据', '', 3, 'edit', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('76216702639017984', 'admin', '2018-11-17 21:50:18', 0, 'admin', '2018-11-17 21:50:18', NULL, '', '75002207560273920', 1, 1.86, '', '/base/dictData/delByIds/**', '删除字典数据', '', 3, 'delete', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('76606430504816640', 'admin', '2018-11-18 23:38:57', 0, 'admin', '2018-11-18 23:39:12', '', 'activiti', '125909152017944576', 0, 1.10, 'Main', '/activiti', '工作流程', 'md-git-compare', 1, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('76607201262702592', 'admin', '2018-11-18 23:42:01', 0, 'admin', '2018-11-20 19:41:58', '', 'model-manage', '76606430504816640', 0, 1.00, 'activiti/model-manage/modelManage', 'model-manage', '模型管理', 'md-cube', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('76914082455752704', 'admin', '2018-11-19 20:01:28', 0, 'admin', '2018-11-20 19:41:50', '', 'process-manage', '76606430504816640', 0, 0.90, 'activiti/process-manage/processManage', 'process-manage', '流程管理', 'md-calendar', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('80539147005071360', 'admin', '2018-11-29 20:06:10', 0, 'admin', '2018-12-04 14:14:41', '', 'category-manage', '76606430504816640', 0, 2.00, 'activiti/category-manage/categoryManage', 'category-manage', '流程分类管理', 'md-bookmark', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('81319435670917120', 'admin', '2018-12-01 23:46:45', 0, 'admin', '2018-12-02 15:37:03', '', 'process-ins-manage', '76606430504816640', 0, 0.70, 'activiti/process-ins-manage/processInsManage', 'process-ins-manage', '运行中的流程', 'md-fastforward', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('81558529864896512', 'admin', '2018-12-02 15:36:50', 0, 'admin', '2018-12-08 14:50:38', '', 'apply-manage', '76606430504816640', 0, 0.00, 'activiti/apply-manage/applyManage', 'apply-manage', '我的申请', 'md-clipboard', 2, '', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('81716172680073216', 'admin', '2018-12-03 02:03:15', 0, 'admin', '2018-12-03 02:03:15', NULL, 'todo-manage', '76606430504816640', 0, 0.10, 'activiti/todo-manage/todoManage', 'todo-manage', '我的待办', 'ios-pricetag', 2, '', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('82269650301227008', 'admin', '2018-12-04 14:42:34', 0, 'admin', '2018-12-04 14:42:34', NULL, 'done-manage', '76606430504816640', 0, 0.20, 'activiti/done-manage/doneManage', 'done-manage', '我的已办', 'ios-pricetag-outline', 2, '', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('84082369492946944', 'admin', '2018-12-09 14:45:40', 0, 'admin', '2018-12-09 14:46:59', '', '', '81558529864896512', 1, 0.00, '', '/base/leave/add*', '添加请假申请', '', 3, 'add', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('84082920431554560', 'admin', '2018-12-09 14:47:51', 0, 'admin', '2018-12-09 14:47:51', NULL, '', '81558529864896512', 1, 1.00, '', '/base/actBusiness/delByIds/**', '删除草稿申请', '', 3, 'delete', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('84083562503999488', 'admin', '2018-12-09 14:50:25', 0, 'admin', '2018-12-09 14:50:25', NULL, '', '81716172680073216', 1, 0.00, '', '/base/actTask/pass**', '审批通过', '', 3, 'enable', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('84083641302388736', 'admin', '2018-12-09 14:50:43', 0, 'admin', '2018-12-09 14:50:43', NULL, '', '81716172680073216', 1, 1.00, '', '/base/actTask/back**', '审批驳回', '', 3, 'disable', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('84084404707659776', 'admin', '2018-12-09 14:53:45', 0, 'admin', '2018-12-09 14:53:45', NULL, '', '81716172680073216', 1, 3.00, '', '/base/actTask/delegate**', '委托代办', '', 3, 'other', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('84084724590448640', 'admin', '2018-12-09 14:55:02', 0, 'admin', '2018-12-09 14:55:02', NULL, '', '82269650301227008', 1, 0.00, '', '/base/actTask/deleteHistoric/**', '删除已办任务', '', 3, 'delete', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('84084965817454592', 'admin', '2018-12-09 14:55:59', 0, 'admin', '2018-12-09 14:55:59', NULL, '', '81319435670917120', 1, 0.00, '', '/base/actProcess/delInsByIds/**', '删除运行流程', '', 3, 'delete', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('84085542324539392', 'admin', '2018-12-09 14:58:17', 0, 'admin', '2018-12-09 14:58:17', NULL, '', '76914082455752704', 1, 0.00, '', '/base/actProcess/updateInfo/**', '编辑流程信息', '', 3, 'edit', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('84085810797744128', 'admin', '2018-12-09 14:59:21', 0, 'admin', '2018-12-09 14:59:21', NULL, '', '76914082455752704', 1, 1.00, '', '/base/actProcess/editNodeUser**', '流程节点设置', '', 3, 'edit', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('84085980943880192', 'admin', '2018-12-09 15:00:01', 0, 'admin', '2018-12-09 15:00:01', NULL, '', '76914082455752704', 1, 2.00, '', '/base/actProcess/convertToModel/**', '流程转模型', '', 3, 'other', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('84086163001839616', 'admin', '2018-12-09 15:00:45', 0, 'admin', '2018-12-09 15:01:37', '', '', '76914082455752704', 1, 3.00, '', '/base/actProcess/delByIds/**', '删除流程定义', '', 3, 'delete', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('84086362248056832', 'admin', '2018-12-09 15:01:32', 0, 'admin', '2018-12-09 15:01:32', NULL, '', '76914082455752704', 1, 4.00, '', '/base/actModel/deployByFile**', '文件部署流程', '', 3, 'other', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('84086882907983872', 'admin', '2018-12-09 15:03:36', 0, 'admin', '2018-12-09 15:03:36', NULL, '', '76607201262702592', 1, 0.00, '', '/base/actModel/add**', '添加模型', '', 3, 'add', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('84087009940869120', 'admin', '2018-12-09 15:04:06', 0, 'admin', '2018-12-09 15:04:06', NULL, '', '76607201262702592', 1, 1.00, '', '/base/actModel/delByIds/**', '删除模型', '', 3, 'delete', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('84087154040377344', 'admin', '2018-12-09 15:04:41', 0, 'admin', '2018-12-09 15:04:41', NULL, '', '76607201262702592', 1, 2.00, '', '/base/actModel/deploy/**', '部署模型', '', 3, 'other', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('84087344352727040', 'admin', '2018-12-09 15:05:26', 0, 'admin', '2018-12-09 15:05:33', '', '', '80539147005071360', 1, 0.00, '', '/base/actCategory/add**', '添加流程分类', '', 3, 'add', 0, '', b'1');
INSERT INTO `t_permission` VALUES ('84087480852156416', 'admin', '2018-12-09 15:05:59', 0, 'admin', '2018-12-09 15:05:59', NULL, '', '80539147005071360', 1, 1.00, '', '/base/actCategory/edit**', '编辑流程分类', '', 3, 'edit', 0, NULL, b'1');
INSERT INTO `t_permission` VALUES ('84087593041399808', 'admin', '2018-12-09 15:06:25', 0, 'admin', '2018-12-09 15:06:25', NULL, '', '80539147005071360', 1, 2.00, '', '/base/actCategory/delByIds/**', '删除流程分类', '', 3, 'delete', 0, NULL, b'1');

-- ----------------------------
-- Table structure for t_qq
-- ----------------------------
DROP TABLE IF EXISTS `t_qq`;
CREATE TABLE `t_qq`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_related` bit(1) DEFAULT NULL,
  `open_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `relate_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_quartz_job
-- ----------------------------
DROP TABLE IF EXISTS `t_quartz_job`;
CREATE TABLE `t_quartz_job`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `job_class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `parameter` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色名 以ROLE_开头',
  `del_flag` int(11) DEFAULT NULL,
  `default_role` bit(1) DEFAULT NULL COMMENT '是否为注册默认角色',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `data_type` int(11) DEFAULT NULL COMMENT '数据权限类型 0全部默认 1自定义 2本部门及以下 3本部门 4仅本人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('16457350655250432', '', '2018-06-06 00:08:00', 'admin', '2018-11-02 20:42:24', 'ROLE_TEST', 0, NULL, '测试权限按钮显示', 1);
INSERT INTO `t_role` VALUES ('496138616573952', '', '2018-04-22 23:03:49', 'admin', '2018-11-15 23:02:59', 'ROLE_ADMIN', 0, NULL, '超级管理员 拥有所有权限', 0);
INSERT INTO `t_role` VALUES ('496138616573953', '', '2018-05-02 21:40:03', 'admin', '2018-11-01 22:59:48', 'ROLE_USER', 0, b'1', '普通注册用户 路过看看', 0);

-- ----------------------------
-- Table structure for t_role_department
-- ----------------------------
DROP TABLE IF EXISTS `t_role_department`;
CREATE TABLE `t_role_department`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `department_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门id',
  `role_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_role_department
-- ----------------------------
INSERT INTO `t_role_department` VALUES ('70763874256687105', 'admin', '2018-11-02 20:42:43', 0, 'admin', '2018-11-02 20:42:43', '40322777781112832', '16457350655250432');
INSERT INTO `t_role_department` VALUES ('70763874265075712', 'admin', '2018-11-02 20:42:43', 0, 'admin', '2018-11-02 20:42:43', '40322811096469504', '16457350655250432');
INSERT INTO `t_role_department` VALUES ('70763874277658624', 'admin', '2018-11-02 20:42:43', 0, 'admin', '2018-11-02 20:42:43', '40322852833988608', '16457350655250432');

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `permission_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权限ID',
  `role_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
INSERT INTO `t_role_permission` VALUES ('252232314807914506', NULL, '2020-03-17 14:53:31', 0, NULL, '2020-03-17 14:53:31', '125909152017944576', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('252232314921160704', NULL, '2020-03-17 14:53:31', 0, NULL, '2020-03-17 14:53:31', '5129710648430592', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('252232315030212608', NULL, '2020-03-17 14:53:31', 0, NULL, '2020-03-17 14:53:31', '5129710648430593', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('252232315143458816', NULL, '2020-03-17 14:53:31', 0, NULL, '2020-03-17 14:53:31', '40238597734928384', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('252232315252510720', NULL, '2020-03-17 14:53:31', 0, NULL, '2020-03-17 14:53:31', '57009744761589760', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('252232315361562624', NULL, '2020-03-17 14:53:31', 0, NULL, '2020-03-17 14:53:31', '16392452747300864', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('252232315470614528', NULL, '2020-03-17 14:53:31', 0, NULL, '2020-03-17 14:53:31', '16392767785668608', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('252232315579666432', NULL, '2020-03-17 14:53:31', 0, NULL, '2020-03-17 14:53:31', '16439068543946752', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('290226411430481920', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '125909152017944576', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481921', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '5129710648430592', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481922', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '5129710648430593', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481923', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '15701400130424832', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481924', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '16678126574637056', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481925', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '15701915807518720', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481926', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '15708892205944832', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481927', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '16678447719911424', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481928', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '25014528525733888', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481929', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '56898976661639168', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481930', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '156365156580855808', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481931', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '40238597734928384', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481932', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '45235621697949696', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481933', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '45235787867885568', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481934', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '45235939278065664', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481935', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '43117268627886080', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481936', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '45236734832676864', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481937', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '45237010692050944', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481938', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '45237170029465600', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481939', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '57009544286441472', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481940', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '57009744761589760', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481941', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '57009981228060672', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481942', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '56309618086776832', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481943', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '57212882168844288', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481944', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '61560041605435392', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481945', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '61560275261722624', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481946', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '61560480518377472', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481947', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '44986029924421632', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481948', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '45235228800716800', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481949', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '45069342940860416', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481950', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '5129710648430594', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481951', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '16687383932047360', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481952', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '16689632049631232', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481953', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '16689745006432256', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481954', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '16689883993083904', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481955', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '16690313745666048', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481956', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '5129710648430595', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481957', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '16694861252005888', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481958', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '16695107491205120', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481959', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '16695243126607872', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481960', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '75002207560273920', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481961', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '76215889006956544', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481962', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '76216071333351424', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481963', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '76216264070008832', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481964', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '76216459709124608', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481965', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '76216594207870976', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481966', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '76216702639017984', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481967', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '58480609315524608', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481968', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '61394706252173312', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481969', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '61417744146370560', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481970', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '76606430504816640', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481971', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '81558529864896512', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481972', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '84082369492946944', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481973', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '84082920431554560', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481974', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '81716172680073216', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481975', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '84083562503999488', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481976', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '84083641302388736', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481977', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '113601631450304512', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481978', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '84084404707659776', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481979', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '82269650301227008', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481980', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '84084724590448640', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481981', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '81319435670917120', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481982', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '84084965817454592', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481983', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '117806106536841216', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481984', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '76914082455752704', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481985', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '84085542324539392', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481986', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '84085810797744128', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481987', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '84085980943880192', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481988', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '84086163001839616', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481989', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '84086362248056832', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481990', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '76607201262702592', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481991', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '84086882907983872', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481992', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '84087009940869120', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481993', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '84087154040377344', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481994', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '80539147005071360', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481995', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '84087344352727040', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481996', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '84087480852156416', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481997', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '84087593041399808', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481998', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '211251162815401984', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430481999', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '211251678651879424', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482000', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '39915540965232640', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482001', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '41370251991977984', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482002', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '45264987354042368', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482003', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '45265487029866496', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482004', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '45265762415284224', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482005', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '45265886315024384', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482006', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '45266070000373760', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482007', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '41363147411427328', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482008', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '41363537456533504', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482009', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '41364927394353152', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482010', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '121426317022334976', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482011', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '149452775095275520', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482012', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '41371711400054784', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482013', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '41469219249852416', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482014', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '39916171171991552', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482015', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '39918482854252544', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482016', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '256539217813835777', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482017', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '256539894803861505', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482018', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '102235632889237504', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482019', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '102237605176807424', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482020', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '102240052523831296', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482021', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '103658022701633536', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482022', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '41373430515240960', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482023', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '129033675403694080', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482024', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '41375330996326400', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482025', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '42082442672082944', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482026', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '41378916912336896', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482027', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '63741744973352960', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482028', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '41376192166629376', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482029', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '41377034236071936', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482030', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '56911328312299520', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482031', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '63482475359244288', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482032', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '64290663792906240', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482033', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '66790433014943744', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482034', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '210154306362413056', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482035', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '210155258859491329', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482036', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '210156371755143168', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482037', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '113602149589454848', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482038', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '113602342657462272', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482039', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '113603512293658624', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482040', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '113603617897844736', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482041', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '16392452747300864', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482042', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '16392767785668608', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482043', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '16438800255291392', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482044', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '16438962738434048', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290226411430482045', '682265633886208', '2020-06-30 11:08:29', 0, NULL, NULL, '16439068543946752', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('290227100609155072', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '125909152017944576', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155073', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '5129710648430592', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155074', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '5129710648430593', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155075', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '40238597734928384', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155076', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '43117268627886080', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155077', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '57009744761589760', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155078', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '56309618086776832', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155079', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '44986029924421632', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155080', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '5129710648430594', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155081', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '5129710648430595', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155082', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '75002207560273920', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155083', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '58480609315524608', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155084', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '76606430504816640', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155085', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '81558529864896512', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155086', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '81716172680073216', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155087', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '82269650301227008', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155088', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '81319435670917120', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155089', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '117806106536841216', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155090', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '76914082455752704', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155091', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '76607201262702592', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155092', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '80539147005071360', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155093', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '211251162815401984', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155094', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '211251678651879424', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155095', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '39915540965232640', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155096', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '41370251991977984', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155097', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '41363147411427328', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155098', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '121426317022334976', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155099', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '149452775095275520', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155100', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '41371711400054784', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155101', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '39916171171991552', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155102', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '39918482854252544', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155103', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '102235632889237504', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155104', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '102237605176807424', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155105', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '102240052523831296', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155106', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '103658022701633536', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155107', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '41373430515240960', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155108', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '129033675403694080', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155109', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '41375330996326400', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155110', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '42082442672082944', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155111', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '41378916912336896', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155112', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '63741744973352960', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155113', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '41376192166629376', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155114', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '41377034236071936', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155115', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '56911328312299520', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100609155116', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '63482475359244288', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100642709504', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '64290663792906240', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100642709505', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '66790433014943744', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100642709506', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '113602149589454848', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100642709507', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '113602342657462272', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100642709508', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '113603512293658624', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100642709509', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '113603617897844736', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100642709510', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '16392452747300864', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100642709511', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '16392767785668608', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100642709512', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '16438800255291392', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100642709513', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '16438962738434048', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('290227100642709514', '682265633886208', '2020-06-30 11:11:13', 0, NULL, NULL, '16439068543946752', '496138616573953');

-- ----------------------------
-- Table structure for t_setting
-- ----------------------------
DROP TABLE IF EXISTS `t_setting`;
CREATE TABLE `t_setting`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_setting
-- ----------------------------
INSERT INTO `t_setting` VALUES ('EMAIL_SETTING', '682265633886208', '2020-04-02 17:19:15', 0, '682265633886208', '2020-04-02 20:37:06', '{\"host\":\"smtp.163.com\",\"username\":\"canghaihongxin@163.com\",\"password\":\"EEGOZADAZVAGPTUR\",\"changed\":true}');
INSERT INTO `t_setting` VALUES ('OTHER_SETTING', '682265633886208', '2020-03-31 20:16:55', 0, '682265633886208', '2020-06-24 18:16:13', '{\"domain\":\"http://yboot.budongfeng.com:9200\",\"ssoDomain\":\"budongfeng.com\",\"blacklist\":\"\"}');
INSERT INTO `t_setting` VALUES ('VAPTCHA_SETTING', '682265633886208', '2020-04-02 19:50:24', 0, '682265633886208', '2020-04-02 19:50:24', '{\"vid\":\"5e85ce1255d0def9521469ac\",\"secretKey\":\"b1fc8b0c60b64379bba7a4f632c66bbd\",\"changed\":true}');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '省市县地址',
  `avatar` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户头像',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述/详情/备注',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮件',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机',
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '昵称',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '性别',
  `status` int(11) DEFAULT NULL COMMENT '状态 默认0正常 -1拉黑',
  `type` int(11) DEFAULT NULL COMMENT '用户类型 0普通用户 1管理员',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `del_flag` int(11) DEFAULT NULL,
  `department_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '所属部门id',
  `street` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '街道地址',
  `pass_strength` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码强度',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('16739222421508096', '', '2018-06-06 18:48:02', '4363087427670016', '2020-03-25 16:01:30', '', 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', '', 'canghaihongxin1@163.com', '17600000000', '', '$2a$10$PS04ecXfknNd3V8d.ymLTObQciapMU4xU8.GADBZZsuTZr7ymnagy', '男', 0, 0, 'test2', 0, '40652338142121984', '', '弱');
INSERT INTO `t_user` VALUES ('4363087427670016', '', '2018-05-03 15:09:42', '', '2020-03-18 08:56:22', '[\"510000\",\"510100\",\"510114\"]', 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', '', 'canghaihongxin2@163.com', '17600000001', '', '$2a$10$PS04ecXfknNd3V8d.ymLTObQciapMU4xU8.GADBZZsuTZr7ymnagy', '男', 0, 0, 'test', 0, '40652338142121984', '', '弱');
INSERT INTO `t_user` VALUES ('682265633886208', '', '2018-05-01 16:13:51', '682265633886208', '2020-06-30 11:12:46', '[\"510000\",\"510100\",\"510104\"]', 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', 'test', 'canghaihongxin@163.com', '17600000002', 'tpr', '$2a$10$8KA1CQm1v0zKwW4egTmZM.Z5qKI3N4u2RNrlRnMdGU.1VeKwbSOUW', '男', 0, 1, 'admin', 0, '40322777781112832', '天府1街', '弱');
INSERT INTO `t_user` VALUES ('682265633886209', '', '2018-04-30 23:28:42', 'admin', '2020-03-18 08:56:40', '', 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', '', '1012@qq.com', '17600000003', '', '$2a$10$PS04ecXfknNd3V8d.ymLTObQciapMU4xU8.GADBZZsuTZr7ymnagy', '男', -1, 0, 'tpr', 0, '40322777781112832', '', '弱');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `role_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色唯一id',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户唯一id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('252504761885003777', NULL, '2020-03-18 08:56:08', 0, NULL, '2020-03-18 08:56:08', '16457350655250432', '16739222421508096');
INSERT INTO `t_user_role` VALUES ('252504820710117377', NULL, '2020-03-18 08:56:22', 0, NULL, '2020-03-18 08:56:22', '496138616573953', '4363087427670016');
INSERT INTO `t_user_role` VALUES ('252505107520819201', NULL, '2020-03-18 08:57:30', 0, NULL, '2020-03-18 08:57:30', '496138616573952', '682265633886208');
INSERT INTO `t_user_role` VALUES ('252505174340276226', NULL, '2020-03-18 08:57:46', 0, NULL, '2020-03-18 08:57:46', '496138616573952', '682265633886209');
INSERT INTO `t_user_role` VALUES ('252505174482882560', NULL, '2020-03-18 08:57:46', 0, NULL, '2020-03-18 08:57:46', '496138616573953', '682265633886209');

-- ----------------------------
-- Table structure for t_wechat
-- ----------------------------
DROP TABLE IF EXISTS `t_wechat`;
CREATE TABLE `t_wechat`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_related` bit(1) DEFAULT NULL,
  `open_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `relate_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_weibo
-- ----------------------------
DROP TABLE IF EXISTS `t_weibo`;
CREATE TABLE `t_weibo`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_related` bit(1) DEFAULT NULL,
  `open_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `relate_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tx_order
-- ----------------------------
DROP TABLE IF EXISTS `tx_order`;
CREATE TABLE `tx_order`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tx_tpr_acc
-- ----------------------------
DROP TABLE IF EXISTS `tx_tpr_acc`;
CREATE TABLE `tx_tpr_acc`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `money` double DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'increment id',
  `branch_id` bigint(20) NOT NULL COMMENT 'branch transaction id',
  `xid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'global transaction id',
  `context` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'undo_log context,such as serialization',
  `rollback_info` longblob NOT NULL COMMENT 'rollback info',
  `log_status` int(11) NOT NULL COMMENT '0:normal status,1:defense status',
  `log_created` datetime(0) NOT NULL COMMENT 'create datetime',
  `log_modified` datetime(0) NOT NULL COMMENT 'modify datetime',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ux_undo_log`(`xid`, `branch_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'AT transaction mode undo table' ROW_FORMAT = Compact;

-- ----------------------------
-- Procedure structure for idata
-- ----------------------------
DROP PROCEDURE IF EXISTS `idata`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `idata`()
BEGIN
	declare i int;
	set i = 1;
	WHILE (1<100000) DO
	INSERT INTO t VALUES(i,i,i);
	set i=i+1;
END WHILE;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
