/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : park

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 19/07/2023 17:14:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `service_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'service层生成路径',
  `controller_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'controller代码生成路径',
  `mapper_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'mapper代码生成路径',
  `vue_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'vue代码生成路径',
  `api_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'api代码生成路径',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (17, 't_attachment', '附件', NULL, NULL, 'Attachment', 'crud', 'com.ruoyi.bigtian', 'bigtian', 'attachment', '附件', 'bigtian', '0', '/', NULL, 'admin', '2022-06-30 07:10:52', '', NULL, NULL, '/Users/daijunxiong/WebstormProjects/RuoYi-Vue/ruoyi-system', '/Users/daijunxiong/WebstormProjects/RuoYi-Vue/ruoyi-admin', NULL, '/Users/daijunxiong/code/RuoYi-Vue3', NULL);
INSERT INTO `gen_table` VALUES (18, 't_feedback', '反馈', NULL, NULL, 'Feedback', 'crud', 'com.ruoyi.bigtian', 'bigtian', 'feedback', '反馈', 'bigtian', '0', '/', NULL, 'admin', '2022-06-30 07:10:52', '', NULL, NULL, '/Users/daijunxiong/WebstormProjects/RuoYi-Vue/ruoyi-system', '/Users/daijunxiong/WebstormProjects/RuoYi-Vue/ruoyi-admin', NULL, '/Users/daijunxiong/code/RuoYi-Vue3', NULL);
INSERT INTO `gen_table` VALUES (19, 't_join_us', '合同共赢', NULL, NULL, 'JoinUs', 'crud', 'com.ruoyi.bigtian', 'bigtian', 'joinUs', '合同共赢', 'bigtian', '0', '/', NULL, 'admin', '2022-06-30 07:10:53', '', NULL, NULL, '/Users/daijunxiong/WebstormProjects/RuoYi-Vue/ruoyi-system', '/Users/daijunxiong/WebstormProjects/RuoYi-Vue/ruoyi-admin', NULL, '/Users/daijunxiong/code/RuoYi-Vue3', NULL);
INSERT INTO `gen_table` VALUES (20, 't_parks', '停车场', NULL, NULL, 'Parks', 'crud', 'com.ruoyi.bigtian', 'bigtian', 'parks', '停车场', 'bigtian', '0', '/', NULL, 'admin', '2022-06-30 07:10:54', '', NULL, NULL, '/Users/daijunxiong/WebstormProjects/RuoYi-Vue/ruoyi-system', '/Users/daijunxiong/WebstormProjects/RuoYi-Vue/ruoyi-admin', NULL, '/Users/daijunxiong/code/RuoYi-Vue3', NULL);
INSERT INTO `gen_table` VALUES (21, 't_wechat_user', '微信用户', NULL, NULL, 'WechatUser', 'crud', 'com.ruoyi.bigtian', 'bigtian', 'wechatUser', '微信用户', 'bigtian', '0', '/', NULL, 'admin', '2022-06-30 07:10:55', '', NULL, NULL, '/Users/daijunxiong/WebstormProjects/RuoYi-Vue/ruoyi-system', '/Users/daijunxiong/WebstormProjects/RuoYi-Vue/ruoyi-admin', NULL, '/Users/daijunxiong/code/RuoYi-Vue3', NULL);
INSERT INTO `gen_table` VALUES (22, 't_weixin_user', '微信用户', NULL, NULL, 'WeixinUser', 'crud', 'com.ruoyi.bigtian', 'bigtian', 'weixinUser', '微信用户', 'bigtian', '0', '/', NULL, 'admin', '2022-06-30 07:10:56', '', NULL, NULL, '/Users/daijunxiong/WebstormProjects/RuoYi-Vue/ruoyi-system', '/Users/daijunxiong/WebstormProjects/RuoYi-Vue/ruoyi-admin', NULL, '/Users/daijunxiong/code/RuoYi-Vue3', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 242 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (173, '17', 'id', '主键id', 'bigint', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-06-30 07:10:52', '', NULL);
INSERT INTO `gen_table_column` VALUES (174, '17', 'busi_id', '来源id', 'varchar(255)', 'String', 'busiId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-06-30 07:10:52', '', NULL);
INSERT INTO `gen_table_column` VALUES (175, '17', 'url', 'url地址', 'varchar(255)', 'String', 'url', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-06-30 07:10:52', '', NULL);
INSERT INTO `gen_table_column` VALUES (176, '17', 'type', '上传方式：local-本地上传，oss-阿里云oss', 'varchar(50)', 'String', 'type', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2022-06-30 07:10:52', '', NULL);
INSERT INTO `gen_table_column` VALUES (177, '17', 'source_name', '原始名称', 'varchar(255)', 'String', 'sourceName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2022-06-30 07:10:52', '', NULL);
INSERT INTO `gen_table_column` VALUES (178, '17', 'create_by', '创建人', 'varchar(50)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2022-06-30 07:10:52', '', NULL);
INSERT INTO `gen_table_column` VALUES (179, '17', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2022-06-30 07:10:52', '', NULL);
INSERT INTO `gen_table_column` VALUES (180, '17', 'update_by', '修改人', 'varchar(50)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2022-06-30 07:10:52', '', NULL);
INSERT INTO `gen_table_column` VALUES (181, '17', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2022-06-30 07:10:52', '', NULL);
INSERT INTO `gen_table_column` VALUES (182, '18', 'id', '主键', 'bigint', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-06-30 07:10:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (183, '18', 'title', '标题', 'varchar(255)', 'String', 'title', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-06-30 07:10:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (184, '18', 'content', '描述', 'varchar(255)', 'String', 'content', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'editor', '', 3, 'admin', '2022-06-30 07:10:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (185, '18', 'phone', '回访手机号', 'varchar(255)', 'String', 'phone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-06-30 07:10:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (186, '18', 'state', '状态', 'varchar(255)', 'String', 'state', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-06-30 07:10:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (187, '18', 'create_by', '创建人', 'varchar(50)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2022-06-30 07:10:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (188, '18', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2022-06-30 07:10:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (189, '18', 'update_by', '修改人', 'varchar(50)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2022-06-30 07:10:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (190, '18', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2022-06-30 07:10:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (191, '18', 'measure', '应对措施', 'varchar(255)', 'String', 'measure', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2022-06-30 07:10:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (192, '19', 'id', '主键', 'bigint', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-06-30 07:10:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (193, '19', 'title', '标题', 'varchar(255)', 'String', 'title', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-06-30 07:10:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (194, '19', 'linkman', '联系人', 'varchar(255)', 'String', 'linkman', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-06-30 07:10:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (195, '19', 'phone', '手机号', 'varchar(255)', 'String', 'phone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-06-30 07:10:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (196, '19', 'content', '详细内容', 'varchar(255)', 'String', 'content', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'editor', '', 5, 'admin', '2022-06-30 07:10:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (197, '19', 'state', '状态', 'varchar(255)', 'String', 'state', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-06-30 07:10:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (198, '19', 'remark', '审批意见', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2022-06-30 07:10:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (199, '19', 'create_by', '创建人', 'varchar(50)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2022-06-30 07:10:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (200, '19', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2022-06-30 07:10:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (201, '19', 'update_by', '修改人', 'varchar(50)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2022-06-30 07:10:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (202, '19', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2022-06-30 07:10:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (203, '20', 'id', '主键', 'bigint', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-06-30 07:10:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (204, '20', 'name', '停车场名称', 'varchar(255)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-06-30 07:10:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (205, '20', 'linkman', '联系人', 'varchar(255)', 'String', 'linkman', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-06-30 07:10:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (206, '20', 'phone', '手机号', 'varchar(255)', 'String', 'phone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-06-30 07:10:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (207, '20', 'vehicle_num', '车位', 'varchar(255)', 'String', 'vehicleNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-06-30 07:10:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (208, '20', 'residue_vehicle_num', '剩余车位', 'varchar(255)', 'String', 'residueVehicleNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-06-30 07:10:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (209, '20', 'longitude', '经度', 'varchar(255)', 'String', 'longitude', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2022-06-30 07:10:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (210, '20', 'latitude', '维度', 'varchar(255)', 'String', 'latitude', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2022-06-30 07:10:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (211, '20', 'tags', '标签', 'varchar(255)', 'String', 'tags', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2022-06-30 07:10:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (212, '20', 'rates', '收费标准', 'text', 'String', 'rates', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 10, 'admin', '2022-06-30 07:10:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (213, '20', 'state', '状态', 'varchar(255)', 'String', 'state', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2022-06-30 07:10:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (214, '20', 'point_name', '地图名称', 'varchar(255)', 'String', 'pointName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 12, 'admin', '2022-06-30 07:10:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (215, '20', 'point_detail', '详细地址', 'varchar(255)', 'String', 'pointDetail', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2022-06-30 07:10:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (216, '20', 'text_content', '文本收费标准', 'text', 'String', 'textContent', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'editor', '', 14, 'admin', '2022-06-30 07:10:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (217, '20', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 15, 'admin', '2022-06-30 07:10:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (218, '20', 'create_by', '创建人', 'varchar(50)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 16, 'admin', '2022-06-30 07:10:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (219, '20', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 17, 'admin', '2022-06-30 07:10:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (220, '20', 'update_by', '修改人', 'varchar(50)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 18, 'admin', '2022-06-30 07:10:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (221, '20', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 19, 'admin', '2022-06-30 07:10:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (222, '21', 'id', '主键', 'int', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-06-30 07:10:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (223, '21', 'open_id', '开放者id', 'varchar(255)', 'String', 'openId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-06-30 07:10:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (224, '21', 'nick_name', '昵称', 'varchar(255)', 'String', 'nickName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2022-06-30 07:10:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (225, '21', 'gender', '性别', 'varchar(255)', 'String', 'gender', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-06-30 07:10:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (226, '21', 'avatar_url', '头像', 'varchar(255)', 'String', 'avatarUrl', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-06-30 07:10:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (227, '21', 'type', '类型', 'varchar(255)', 'String', 'type', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 6, 'admin', '2022-06-30 07:10:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (228, '21', 'create_by', '创建人', 'varchar(50)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2022-06-30 07:10:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (229, '21', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2022-06-30 07:10:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (230, '21', 'update_by', '修改人', 'varchar(50)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2022-06-30 07:10:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (231, '21', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2022-06-30 07:10:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (232, '22', 'id', '主键', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-06-30 07:10:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (233, '22', 'nick_name', '昵称', 'varchar(20)', 'String', 'nickName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-06-30 07:10:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (234, '22', 'avatar_url', '图像', 'varchar(100)', 'String', 'avatarUrl', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-06-30 07:10:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (235, '22', 'gender', '性别', 'int', 'Long', 'gender', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-06-30 07:10:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (236, '22', 'open_id', '微信开放id', 'varchar(60)', 'String', 'openId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-06-30 07:10:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (237, '22', 'phone', '手机号', 'varchar(15)', 'String', 'phone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-06-30 07:10:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (238, '22', 'state', '状态', 'varchar(1)', 'String', 'state', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2022-06-30 07:10:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (239, '22', 'create_by', '创建人', 'varchar(32)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2022-06-30 07:10:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (240, '22', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2022-06-30 07:10:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (241, '22', 'update_by', '更新人', 'varchar(32)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2022-06-30 07:10:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (242, '22', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2022-06-30 07:10:56', '', NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017C13D1E80078707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017C13D1E80078707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017C13D1E80078707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'daijunxiongdeMacBook-Pro.local1637334689853', 1637375610850, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1637334690000, -1, 5, 'PAUSED', 'CRON', 1637334690000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1637334705000, -1, 5, 'PAUSED', 'CRON', 1637334691000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1637334700000, -1, 5, 'PAUSED', 'CRON', 1637334692000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-09-24 02:01:36', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-09-24 02:01:36', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-09-24 02:01:36', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaOnOff', 'true', 'Y', 'admin', '2021-09-24 02:01:36', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2021-09-24 02:01:36', '', NULL, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '停车场', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-09-24 02:01:36', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '南京总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-09-24 02:01:36', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '苏州分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-09-24 02:01:36', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-09-24 02:01:36', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-09-24 02:01:36', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-09-24 02:01:36', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-09-24 02:01:36', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-09-24 02:01:36', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-09-24 02:01:36', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-09-24 02:01:36', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2021-09-24 02:01:36', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 206 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '退出成功', '2021-09-24 02:02:02');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-09-24 02:02:08');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-10-25 04:20:56');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '退出成功', '2021-10-25 04:57:26');
INSERT INTO `sys_logininfor` VALUES (104, 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-10-25 04:57:30');
INSERT INTO `sys_logininfor` VALUES (105, 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '退出成功', '2021-10-25 04:57:37');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '1', '验证码错误', '2021-10-25 04:57:40');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-10-25 04:57:44');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '退出成功', '2021-10-25 04:58:09');
INSERT INTO `sys_logininfor` VALUES (109, 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-10-25 04:58:14');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '1', '验证码错误', '2021-10-25 10:12:41');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-10-25 10:12:45');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '退出成功', '2021-10-25 10:13:06');
INSERT INTO `sys_logininfor` VALUES (113, 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-10-25 10:13:24');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-10-25 12:17:55');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '退出成功', '2021-10-25 12:26:51');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-10-26 04:28:53');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '退出成功', '2021-10-26 04:41:55');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-10-26 04:43:02');
INSERT INTO `sys_logininfor` VALUES (119, 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-10-26 06:23:09');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '1', '验证码错误', '2021-10-26 07:14:15');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '1', '验证码错误', '2021-10-26 07:14:18');
INSERT INTO `sys_logininfor` VALUES (122, 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-10-26 07:14:26');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '1', '验证码错误', '2021-10-26 08:48:20');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-10-26 08:48:23');
INSERT INTO `sys_logininfor` VALUES (125, 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-10-26 10:25:44');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-10-26 12:01:07');
INSERT INTO `sys_logininfor` VALUES (127, 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-10-27 00:57:12');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-10-27 01:38:36');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-10-27 05:39:22');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-10-27 08:13:15');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '退出成功', '2021-10-27 08:14:18');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '1', '验证码错误', '2021-10-27 08:15:28');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-10-27 08:15:37');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '退出成功', '2021-10-27 08:32:21');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-10-27 08:32:26');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '退出成功', '2021-10-27 08:33:10');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-10-27 08:33:26');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '退出成功', '2021-10-27 08:46:56');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-10-27 08:48:33');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '退出成功', '2021-10-27 08:49:18');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-10-27 09:00:05');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '退出成功', '2021-10-27 09:04:28');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-10-27 09:04:38');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '退出成功', '2021-10-27 09:14:44');
INSERT INTO `sys_logininfor` VALUES (145, 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-10-27 09:14:51');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2021-10-27 09:17:51');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-10-27 13:40:41');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-11-19 14:21:09');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-11-20 02:24:06');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-06-30 06:29:34');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-06-30 06:48:20');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-06-30 06:51:41');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-06-30 06:51:46');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-06-30 06:52:43');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-06-30 06:52:50');
INSERT INTO `sys_logininfor` VALUES (156, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-05-16 14:18:48');
INSERT INTO `sys_logininfor` VALUES (157, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-05-18 18:19:31');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-18 18:31:33');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-18 19:07:51');
INSERT INTO `sys_logininfor` VALUES (160, 'ry', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-18 19:07:56');
INSERT INTO `sys_logininfor` VALUES (161, 'ry', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-18 19:08:26');
INSERT INTO `sys_logininfor` VALUES (162, '阿焦', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：阿焦 不存在', '2023-05-18 19:08:32');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-05-18 19:08:39');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-18 19:08:45');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-18 19:11:14');
INSERT INTO `sys_logininfor` VALUES (166, 'jiao', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-18 19:11:23');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-19 11:49:42');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-19 14:01:45');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-05-19 15:57:32');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-19 15:57:37');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-19 20:59:22');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-19 20:59:34');
INSERT INTO `sys_logininfor` VALUES (173, 'ry', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-19 20:59:39');
INSERT INTO `sys_logininfor` VALUES (174, 'ry', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-19 20:59:43');
INSERT INTO `sys_logininfor` VALUES (175, '阿焦', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：阿焦 不存在', '2023-05-19 20:59:50');
INSERT INTO `sys_logininfor` VALUES (176, 'jiao', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-19 21:00:01');
INSERT INTO `sys_logininfor` VALUES (177, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-05-20 10:22:10');
INSERT INTO `sys_logininfor` VALUES (178, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-05-20 10:22:18');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-20 10:24:41');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-20 10:34:54');
INSERT INTO `sys_logininfor` VALUES (181, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-05-20 10:54:07');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-05-20 11:33:47');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-20 11:33:50');
INSERT INTO `sys_logininfor` VALUES (184, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-05-20 11:53:56');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-20 12:05:26');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-22 08:33:22');
INSERT INTO `sys_logininfor` VALUES (187, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-05-22 08:33:59');
INSERT INTO `sys_logininfor` VALUES (188, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-05-22 08:49:14');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-22 10:28:38');
INSERT INTO `sys_logininfor` VALUES (190, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-05-23 20:00:54');
INSERT INTO `sys_logininfor` VALUES (191, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-05-23 22:20:06');
INSERT INTO `sys_logininfor` VALUES (192, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-05-23 23:20:03');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-23 23:32:34');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-24 09:25:32');
INSERT INTO `sys_logininfor` VALUES (195, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-05-24 10:06:46');
INSERT INTO `sys_logininfor` VALUES (196, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-05-24 11:15:03');
INSERT INTO `sys_logininfor` VALUES (197, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-05-24 11:17:44');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-24 11:33:48');
INSERT INTO `sys_logininfor` VALUES (199, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-05-24 13:05:19');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-24 13:50:22');
INSERT INTO `sys_logininfor` VALUES (201, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-05-24 14:29:29');
INSERT INTO `sys_logininfor` VALUES (202, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-05-24 14:32:10');
INSERT INTO `sys_logininfor` VALUES (203, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-05-24 15:07:55');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-24 15:40:52');
INSERT INTO `sys_logininfor` VALUES (205, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-07-19 16:50:24');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2042 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2021-09-24 02:01:36', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2021-09-24 02:01:36', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2021-09-24 02:01:36', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2021-09-24 02:01:36', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2021-09-24 02:01:36', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2021-09-24 02:01:36', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2021-09-24 02:01:36', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2021-09-24 02:01:36', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2021-09-24 02:01:36', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2021-09-24 02:01:36', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2021-09-24 02:01:36', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2021-09-24 02:01:36', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2021-09-24 02:01:36', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2021-09-24 02:01:36', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2021-09-24 02:01:36', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2021-09-24 02:01:36', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2021-09-24 02:01:36', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2021-09-24 02:01:36', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2021-09-24 02:01:36', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2021-09-24 02:01:36', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2021-09-24 02:01:36', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2021-09-24 02:01:36', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '附件', 3, 1, 'attachment', 'bigtian/attachment/index', NULL, 1, 0, 'C', '0', '0', 'bigtian:attachment:list', '#', 'admin', '2022-06-30 07:14:05', '', NULL, '附件菜单');
INSERT INTO `sys_menu` VALUES (2007, '附件查询', 2006, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'bigtian:attachment:query', '#', 'admin', '2022-06-30 07:14:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '附件新增', 2006, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'bigtian:attachment:add', '#', 'admin', '2022-06-30 07:14:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '附件修改', 2006, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'bigtian:attachment:edit', '#', 'admin', '2022-06-30 07:14:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '附件删除', 2006, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'bigtian:attachment:remove', '#', 'admin', '2022-06-30 07:14:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '附件导出', 2006, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'bigtian:attachment:export', '#', 'admin', '2022-06-30 07:14:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '反馈列表', 0, 1, 'feedback', 'bigtian/feedback/index', NULL, 1, 0, 'C', '0', '0', 'bigtian:feedback:list', 'feedback', 'admin', '2022-06-30 07:14:10', '1', '2022-06-30 07:29:05', '反馈菜单');
INSERT INTO `sys_menu` VALUES (2013, '反馈查询', 2012, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'bigtian:feedback:query', '#', 'admin', '2022-06-30 07:14:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '反馈新增', 2012, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'bigtian:feedback:add', '#', 'admin', '2022-06-30 07:14:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '反馈修改', 2012, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'bigtian:feedback:edit', '#', 'admin', '2022-06-30 07:14:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '反馈删除', 2012, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'bigtian:feedback:remove', '#', 'admin', '2022-06-30 07:14:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '反馈导出', 2012, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'bigtian:feedback:export', '#', 'admin', '2022-06-30 07:14:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '合同共赢', 0, 1, 'joinUs', 'bigtian/joinUs/index', NULL, 1, 0, 'C', '0', '0', 'bigtian:joinUs:list', 'cooperation', 'admin', '2022-06-30 07:14:15', '1', '2022-06-30 07:27:13', '合同共赢菜单');
INSERT INTO `sys_menu` VALUES (2019, '合同共赢查询', 2018, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'bigtian:joinUs:query', '#', 'admin', '2022-06-30 07:14:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '合同共赢新增', 2018, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'bigtian:joinUs:add', '#', 'admin', '2022-06-30 07:14:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '合同共赢修改', 2018, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'bigtian:joinUs:edit', '#', 'admin', '2022-06-30 07:14:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '合同共赢删除', 2018, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'bigtian:joinUs:remove', '#', 'admin', '2022-06-30 07:14:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '合同共赢导出', 2018, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'bigtian:joinUs:export', '#', 'admin', '2022-06-30 07:14:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '停车场列表', 0, 1, 'parks', 'bigtian/parks/index', NULL, 1, 0, 'C', '0', '0', 'bigtian:parks:list', 'park', 'admin', '2022-06-30 07:14:25', '1', '2022-06-30 07:24:35', '停车场菜单');
INSERT INTO `sys_menu` VALUES (2025, '停车场查询', 2024, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'bigtian:parks:query', '#', 'admin', '2022-06-30 07:14:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '停车场新增', 2024, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'bigtian:parks:add', '#', 'admin', '2022-06-30 07:14:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '停车场修改', 2024, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'bigtian:parks:edit', '#', 'admin', '2022-06-30 07:14:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '停车场删除', 2024, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'bigtian:parks:remove', '#', 'admin', '2022-06-30 07:14:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '停车场导出', 2024, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'bigtian:parks:export', '#', 'admin', '2022-06-30 07:14:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '微信用户', 3, 1, 'wechatUser', 'bigtian/wechatUser/index', NULL, 1, 0, 'C', '0', '0', 'bigtian:wechatUser:list', '#', 'admin', '2022-06-30 07:14:33', '', NULL, '微信用户菜单');
INSERT INTO `sys_menu` VALUES (2031, '微信用户查询', 2030, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'bigtian:wechatUser:query', '#', 'admin', '2022-06-30 07:14:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '微信用户新增', 2030, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'bigtian:wechatUser:add', '#', 'admin', '2022-06-30 07:14:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '微信用户修改', 2030, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'bigtian:wechatUser:edit', '#', 'admin', '2022-06-30 07:14:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '微信用户删除', 2030, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'bigtian:wechatUser:remove', '#', 'admin', '2022-06-30 07:14:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '微信用户导出', 2030, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'bigtian:wechatUser:export', '#', 'admin', '2022-06-30 07:14:33', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2021-09-24 02:01:37', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2021-09-24 02:01:37', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 334 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'tb_auto_reply', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-25 04:21:26');
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(22)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1635106886000,\"tableId\":1,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Keyword\",\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"keyword\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"关键字\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1635106886000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"keyword\"},{\"capJavaField\":\"Reply\",\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"reply\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"回复内容\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1635106886000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"reply\"}],\"businessName\":\"reply\",\"moduleName\":\"system\",\"className\":\"AutoReply\",\"tableName\":\"tb_auto_reply\",\"crud\":true,\"options\":\"{}\",\"genType\":\"0\",\"packageName\":\"com.ruoyi.system\",\"functionName\":\"自动回复\",\"tree\":false,\"tableComment\":\"自动回复\",\"params\":{},\"tplCategory\":\"crud\",\"tableId\":1,\"genPath\":\"/\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-25 04:21:57');
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"updateTime\":1635106917000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(22)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1635106886000,\"tableId\":1,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Keyword\",\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"keyword\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"关键字\",\"isQuery\":\"1\",\"updateTime\":1635106917000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1635106886000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"keyword\"},{\"capJavaField\":\"Reply\",\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"reply\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"回复内容\",\"isQuery\":\"1\",\"updateTime\":1635106917000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1635106886000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"reply\"}],\"businessName\":\"reply\",\"moduleName\":\"system\",\"className\":\"AutoReply\",\"tableName\":\"tb_auto_reply\",\"crud\":true,\"options\":\"{}\",\"genType\":\"0\",\"packageName\":\"com.ruoyi.system\",\"functionName\":\"自动回复\",\"tree\":false,\"tableComment\":\"自动回复\",\"params\":{},\"tplCategory\":\"crud\",\"tableId\":1,\"genPath\":\"/\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-25 04:22:10');
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2021-10-25 04:22:12');
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"updateTime\":1635106930000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(22)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1635106886000,\"tableId\":1,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Keyword\",\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"keyword\",\"htmlType\":\"textarea\",\"edit\":true,\"query\":true,\"columnComment\":\"关键字\",\"isQuery\":\"1\",\"updateTime\":1635106930000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1635106886000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"keyword\"},{\"capJavaField\":\"Reply\",\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"reply\",\"htmlType\":\"textarea\",\"edit\":true,\"query\":true,\"columnComment\":\"回复内容\",\"isQuery\":\"1\",\"updateTime\":1635106930000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1635106886000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"reply\"}],\"businessName\":\"reply\",\"moduleName\":\"system\",\"className\":\"AutoReply\",\"tableName\":\"tb_auto_reply\",\"crud\":true,\"options\":\"{}\",\"genType\":\"0\",\"packageName\":\"com.ruoyi.system\",\"functionName\":\"自动回复\",\"tree\":false,\"tableComment\":\"自动回复\",\"params\":{},\"tplCategory\":\"crud\",\"tableId\":1,\"genPath\":\"/\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-25 04:27:14');
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"updateTime\":1635107234000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(22)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1635106886000,\"tableId\":1,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Keyword\",\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"keyword\",\"htmlType\":\"textarea\",\"edit\":true,\"query\":true,\"columnComment\":\"关键字\",\"isQuery\":\"1\",\"updateTime\":1635107234000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1635106886000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"keyword\"},{\"capJavaField\":\"Reply\",\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"reply\",\"htmlType\":\"textarea\",\"edit\":true,\"query\":true,\"columnComment\":\"回复内容\",\"isQuery\":\"1\",\"updateTime\":1635107234000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1635106886000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"reply\"}],\"businessName\":\"reply\",\"moduleName\":\"system\",\"className\":\"AutoReply\",\"tableName\":\"tb_auto_reply\",\"crud\":true,\"options\":\"{}\",\"genType\":\"0\",\"packageName\":\"com.ruoyi.system\",\"functionName\":\"自动回复\",\"tree\":false,\"tableComment\":\"自动回复\",\"params\":{},\"tplCategory\":\"crud\",\"tableId\":1,\"genPath\":\"/\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-25 04:28:08');
INSERT INTO `sys_oper_log` VALUES (106, '自动回复', 1, 'com.ruoyi.web.controller.bigtian.AutoReplyController.add()', 'POST', 1, 'admin', NULL, '/system/reply', '127.0.0.1', '内网IP', '{\"keyword\":\"你好\",\"params\":{},\"reply\":\"我很好，欢迎你呀\"}', NULL, 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n### The error may exist in file [/Users/daijunxiong/code/RuoYi-mybatis-plus-3.7/ruoyi-system/target/classes/mapper/system/AutoReplyMapper.xml]\n### The error may involve com.ruoyi.system.mapper.AutoReplyMapper.insertAutoReply-Inline\n### The error occurred while setting parameters\n### SQL: insert into tb_auto_reply          ( keyword,             reply )           values ( ?,             ? )\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2021-10-25 04:28:54');
INSERT INTO `sys_oper_log` VALUES (107, '自动回复', 1, 'com.ruoyi.web.controller.bigtian.AutoReplyController.add()', 'POST', 1, 'admin', NULL, '/system/reply', '127.0.0.1', '内网IP', '{\"keyword\":\"你好\",\"params\":{},\"reply\":\"我很好，欢迎你呀\"}', NULL, 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n### The error may exist in file [/Users/daijunxiong/code/RuoYi-mybatis-plus-3.7/ruoyi-system/target/classes/mapper/system/AutoReplyMapper.xml]\n### The error may involve com.ruoyi.system.mapper.AutoReplyMapper.insertAutoReply-Inline\n### The error occurred while setting parameters\n### SQL: insert into tb_auto_reply          ( keyword,             reply )           values ( ?,             ? )\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2021-10-25 04:30:25');
INSERT INTO `sys_oper_log` VALUES (108, '自动回复', 1, 'com.ruoyi.web.controller.bigtian.AutoReplyController.add()', 'POST', 1, 'admin', NULL, '/system/reply', '127.0.0.1', '内网IP', '{\"keyword\":\"你好\",\"params\":{},\"reply\":\"我很好，欢迎你呀\"}', NULL, 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n### The error may exist in file [/Users/daijunxiong/code/RuoYi-mybatis-plus-3.7/ruoyi-system/target/classes/mapper/system/AutoReplyMapper.xml]\n### The error may involve com.ruoyi.system.mapper.AutoReplyMapper.insertAutoReply-Inline\n### The error occurred while setting parameters\n### SQL: insert into tb_auto_reply          ( keyword,             reply )           values ( ?,             ? )\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2021-10-25 04:30:56');
INSERT INTO `sys_oper_log` VALUES (109, '自动回复', 1, 'com.ruoyi.web.controller.bigtian.AutoReplyController.add()', 'POST', 1, 'admin', NULL, '/system/reply', '127.0.0.1', '内网IP', '{\"keyword\":\"你好\",\"params\":{},\"reply\":\"我很好，欢迎你呀\"}', NULL, 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n### The error may exist in file [/Users/daijunxiong/code/RuoYi-mybatis-plus-3.7/ruoyi-system/target/classes/mapper/system/AutoReplyMapper.xml]\n### The error may involve com.ruoyi.system.mapper.AutoReplyMapper.insertAutoReply-Inline\n### The error occurred while setting parameters\n### SQL: insert into tb_auto_reply          ( keyword,             reply )           values ( ?,             ? )\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2021-10-25 04:31:34');
INSERT INTO `sys_oper_log` VALUES (110, '自动回复', 1, 'com.ruoyi.web.controller.bigtian.AutoReplyController.add()', 'POST', 1, 'admin', NULL, '/system/reply', '127.0.0.1', '内网IP', '{\"keyword\":\"你好\",\"params\":{},\"reply\":\"我很好，欢迎你呀\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-25 04:32:52');
INSERT INTO `sys_oper_log` VALUES (111, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"updateTime\":1635107288000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(22)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1635106886000,\"tableId\":1,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Keyword\",\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"keyword\",\"htmlType\":\"textarea\",\"edit\":true,\"query\":true,\"columnComment\":\"关键字\",\"isQuery\":\"1\",\"updateTime\":1635107288000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1635106886000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"keyword\"},{\"capJavaField\":\"Reply\",\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"reply\",\"htmlType\":\"textarea\",\"edit\":true,\"query\":true,\"columnComment\":\"回复内容\",\"isQuery\":\"1\",\"updateTime\":1635107288000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1635106886000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"reply\"}],\"businessName\":\"reply\",\"moduleName\":\"system\",\"className\":\"AutoReply\",\"tableName\":\"tb_auto_reply\",\"crud\":true,\"options\":\"{}\",\"genType\":\"0\",\"packageName\":\"com.ruoyi.system\",\"functionName\":\"自动回复\",\"tree\":false,\"tableComment\":\"自动回复\",\"params\":{},\"tplCategory\":\"crud\",\"tableId\":1,\"genPath\":\"/\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-25 04:37:45');
INSERT INTO `sys_oper_log` VALUES (112, '自动回复', 2, 'com.ruoyi.web.controller.bigtian.AutoReplyController.edit()', 'PUT', 1, 'admin', NULL, '/system/reply', '127.0.0.1', '内网IP', '{\"id\":\"1\",\"keyword\":\"你好\",\"params\":{},\"reply\":\"我很好，欢迎你呀第三方发送到发送到范德萨发胜多负少三大法师的发生的\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-25 04:40:42');
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"自动回复\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"reply\",\"component\":\"system/reply/index\",\"children\":[],\"createTime\":1635106985000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"C\",\"perms\":\"system:reply:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-25 04:56:52');
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"system\",\"orderNum\":\"1\",\"menuName\":\"自动回复\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"reply\",\"component\":\"system/reply/index\",\"children\":[],\"createTime\":1635106985000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"C\",\"perms\":\"system:reply:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-25 04:57:15');
INSERT INTO `sys_oper_log` VALUES (115, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1632420096000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[2000,2001,2002,2003,2004,2005],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-25 04:58:05');
INSERT INTO `sys_oper_log` VALUES (116, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', NULL, 1, 'java.io.FileNotFoundException: /private/var/folders/7z/s45hnz7n1cb47n9pfv1l50s00000gn/T/tomcat.8080.8809000218856785830/work/Tomcat/localhost/ROOT/./uploads/avatar/2021/10/26/b4e61306-de5f-44d7-88d5-7d0fdf70eea0.jpeg (No such file or directory)', '2021-10-26 12:01:36');
INSERT INTO `sys_oper_log` VALUES (117, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', NULL, 1, 'java.io.FileNotFoundException: /private/var/folders/7z/s45hnz7n1cb47n9pfv1l50s00000gn/T/tomcat.8080.842726570363412373/work/Tomcat/localhost/ROOT/./uploads/avatar/2021/10/26/43f132cc-7b20-4dbc-b6ea-2b41d1ff42b6.jpeg (No such file or directory)', '2021-10-26 12:03:40');
INSERT INTO `sys_oper_log` VALUES (118, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', NULL, 1, 'java.io.FileNotFoundException: /private/var/folders/7z/s45hnz7n1cb47n9pfv1l50s00000gn/T/tomcat.8080.9150922963011326637/work/Tomcat/localhost/ROOT/././uploads/avatar/2021/10/26/fb145553-c880-421f-bf96-92b54f6fa1c3.jpeg (No such file or directory)', '2021-10-26 12:08:02');
INSERT INTO `sys_oper_log` VALUES (119, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/e196c942-5c77-44f5-994d-651f2ee280d5.jpeg\",\"code\":200}', 0, NULL, '2021-10-26 12:10:24');
INSERT INTO `sys_oper_log` VALUES (120, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/5d7dea8e-04bf-4ea8-9776-1b70d6a18d98.jpeg\",\"code\":200}', 0, NULL, '2021-10-26 12:13:06');
INSERT INTO `sys_oper_log` VALUES (121, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/14f17fb2-9e79-4be6-a718-8fc29285e924.png\",\"code\":200}', 0, NULL, '2021-10-26 12:31:12');
INSERT INTO `sys_oper_log` VALUES (122, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/164b037d-fc47-4c7c-9555-afa2b82bdea7.png\",\"code\":200}', 0, NULL, '2021-10-26 12:32:03');
INSERT INTO `sys_oper_log` VALUES (123, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/90557f5a-5d7f-4bad-b804-b852558d5ee6.png\",\"code\":200}', 0, NULL, '2021-10-26 12:37:31');
INSERT INTO `sys_oper_log` VALUES (124, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/07f80f3c-af98-4b7f-8256-77fc4b65022c.png\",\"code\":200}', 0, NULL, '2021-10-26 12:38:53');
INSERT INTO `sys_oper_log` VALUES (125, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/d35d15f5-2222-4bfc-b929-8d95c658d914.png\",\"code\":200}', 0, NULL, '2021-10-26 12:39:41');
INSERT INTO `sys_oper_log` VALUES (126, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/6f52bad1-0593-4018-9371-7e47937c16ba.png\",\"code\":200}', 0, NULL, '2021-10-26 12:40:48');
INSERT INTO `sys_oper_log` VALUES (127, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/d93c67ae-d67a-4f28-a081-2d2d4bd585e1.png\",\"code\":200}', 0, NULL, '2021-10-26 12:41:39');
INSERT INTO `sys_oper_log` VALUES (128, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/86ec5bd0-d59d-457b-a0c3-69330a956be0.png\",\"code\":200}', 0, NULL, '2021-10-26 12:44:09');
INSERT INTO `sys_oper_log` VALUES (129, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/a24a019c-4bda-4c40-a251-4ff273a25e7e.png\",\"code\":200}', 0, NULL, '2021-10-26 12:45:17');
INSERT INTO `sys_oper_log` VALUES (130, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/76eaee69-40eb-4fbd-9727-051d8e66cfd5.png\",\"code\":200}', 0, NULL, '2021-10-26 12:45:45');
INSERT INTO `sys_oper_log` VALUES (131, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/d343baff-173f-4ef9-af46-ffc2dca94cce.png\",\"code\":200}', 0, NULL, '2021-10-26 12:50:31');
INSERT INTO `sys_oper_log` VALUES (132, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/f32f9863-950d-4404-9489-d29b78b53000.png\",\"code\":200}', 0, NULL, '2021-10-26 12:51:11');
INSERT INTO `sys_oper_log` VALUES (133, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/aaf01b4a-4908-4d47-95f9-f7acec0108f3.png\",\"code\":200}', 0, NULL, '2021-10-26 12:51:38');
INSERT INTO `sys_oper_log` VALUES (134, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/2958d9aa-3a87-440a-a356-f350fe280923.png\",\"code\":200}', 0, NULL, '2021-10-26 12:51:45');
INSERT INTO `sys_oper_log` VALUES (135, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/fcd07b33-406f-4877-b207-d6c4d19a5f20.png\",\"code\":200}', 0, NULL, '2021-10-26 12:52:17');
INSERT INTO `sys_oper_log` VALUES (136, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/d0229b7e-90a0-4a00-b666-e498163ad20e.png\",\"code\":200}', 0, NULL, '2021-10-26 12:54:27');
INSERT INTO `sys_oper_log` VALUES (137, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/bd414d86-0ae0-45f0-b208-4b0df6d4190a.png\",\"code\":200}', 0, NULL, '2021-10-26 12:55:45');
INSERT INTO `sys_oper_log` VALUES (138, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/cccba292-534b-480b-a363-43163a2b3c7f.png\",\"code\":200}', 0, NULL, '2021-10-26 12:56:21');
INSERT INTO `sys_oper_log` VALUES (139, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/b889ba2e-aedf-4554-a9f7-c684c387f21f.png\",\"code\":200}', 0, NULL, '2021-10-26 12:58:09');
INSERT INTO `sys_oper_log` VALUES (140, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/5e6ff05d-cd8f-4a4d-abaa-06845fe32df3.png\",\"code\":200}', 0, NULL, '2021-10-26 13:01:24');
INSERT INTO `sys_oper_log` VALUES (141, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/1d2a0ff1-b897-4168-8517-c05bed1e7298.png\",\"code\":200}', 0, NULL, '2021-10-26 13:02:22');
INSERT INTO `sys_oper_log` VALUES (142, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/ec872273-5aa5-4924-9617-8e3e6abe7e51.png\",\"code\":200}', 0, NULL, '2021-10-26 13:03:11');
INSERT INTO `sys_oper_log` VALUES (143, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/99d273ef-a129-4fea-a0f3-766967a58479.png\",\"code\":200}', 0, NULL, '2021-10-26 13:05:27');
INSERT INTO `sys_oper_log` VALUES (144, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/c53beaef-e952-4684-bd88-6a8e19299fab.png\",\"code\":200}', 0, NULL, '2021-10-26 13:06:59');
INSERT INTO `sys_oper_log` VALUES (145, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/a99c5264-7cfb-4702-9b34-45df513e2e80.png\",\"code\":200}', 0, NULL, '2021-10-26 13:07:39');
INSERT INTO `sys_oper_log` VALUES (146, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/dcd7af3b-77fa-4510-96a0-d06644ec04e6.png\",\"code\":200}', 0, NULL, '2021-10-26 13:10:51');
INSERT INTO `sys_oper_log` VALUES (147, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/c3b522cb-1b69-4053-9200-2b382d19337f.png\",\"code\":200}', 0, NULL, '2021-10-26 13:11:40');
INSERT INTO `sys_oper_log` VALUES (148, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/189e5939-2c8a-4281-a628-94d93a07e3c8.png\",\"code\":200}', 0, NULL, '2021-10-26 13:12:23');
INSERT INTO `sys_oper_log` VALUES (149, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/5746105d-6ce4-42d0-b154-e7d9fb3fe4f2.png\",\"code\":200}', 0, NULL, '2021-10-26 13:14:20');
INSERT INTO `sys_oper_log` VALUES (150, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/7bc2f17a-4e8d-4e42-a9b3-bdaa07f2cf23.png\",\"code\":200}', 0, NULL, '2021-10-26 13:15:12');
INSERT INTO `sys_oper_log` VALUES (151, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/8ace3ae5-8f18-4e35-b525-b14fbbe6ae5c.png\",\"code\":200}', 0, NULL, '2021-10-26 13:15:40');
INSERT INTO `sys_oper_log` VALUES (152, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/c061392c-a92b-4135-9957-ce6c3094aa3c.png\",\"code\":200}', 0, NULL, '2021-10-26 13:17:13');
INSERT INTO `sys_oper_log` VALUES (153, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/f776cf55-a3a9-4183-9a50-e150b2070af3.png\",\"code\":200}', 0, NULL, '2021-10-26 13:17:49');
INSERT INTO `sys_oper_log` VALUES (154, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/3f92db60-c329-4ba7-9457-8112fe206cd7.png\",\"code\":200}', 0, NULL, '2021-10-26 13:18:35');
INSERT INTO `sys_oper_log` VALUES (155, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/1bba94b1-c635-40da-a5bc-bb98a87c6349.png\",\"code\":200}', 0, NULL, '2021-10-26 13:20:07');
INSERT INTO `sys_oper_log` VALUES (156, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/a8a32957-bf39-49cb-aae6-1967918fd670.png\",\"code\":200}', 0, NULL, '2021-10-26 13:21:02');
INSERT INTO `sys_oper_log` VALUES (157, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/b1994b1b-b546-45a7-8577-d80687daa17e.png\",\"code\":200}', 0, NULL, '2021-10-26 13:22:05');
INSERT INTO `sys_oper_log` VALUES (158, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/4dc800a7-30c0-4613-9849-2a0bb2ccd68f.png\",\"code\":200}', 0, NULL, '2021-10-26 13:23:29');
INSERT INTO `sys_oper_log` VALUES (159, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/4ed2fa69-54b1-40ed-a29b-22f2f4aada59.png\",\"code\":200}', 0, NULL, '2021-10-26 13:23:59');
INSERT INTO `sys_oper_log` VALUES (160, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/21d82cbf-4db3-4b38-92bd-94a4f8b20e9e.png\",\"code\":200}', 0, NULL, '2021-10-26 13:24:39');
INSERT INTO `sys_oper_log` VALUES (161, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/74e4cca6-6cc0-4c0e-9912-73fdb4443bd3.png\",\"code\":200}', 0, NULL, '2021-10-26 13:25:32');
INSERT INTO `sys_oper_log` VALUES (162, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/0f275334-6f1f-4e5e-8d65-8bd800e31a38.png\",\"code\":200}', 0, NULL, '2021-10-26 13:27:10');
INSERT INTO `sys_oper_log` VALUES (163, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/f9462610-1b40-48d7-9000-6c4c800965fc.png\",\"code\":200}', 0, NULL, '2021-10-26 13:27:55');
INSERT INTO `sys_oper_log` VALUES (164, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/793008e6-1f00-4267-949f-c5ebce2d1d51.png\",\"code\":200}', 0, NULL, '2021-10-26 13:28:42');
INSERT INTO `sys_oper_log` VALUES (165, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/caec3b47-d0b4-4fa8-91d5-92d7ad6348be.png\",\"code\":200}', 0, NULL, '2021-10-26 13:29:27');
INSERT INTO `sys_oper_log` VALUES (166, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/2cb79812-53a1-4598-b0f6-b691be229dba.png\",\"code\":200}', 0, NULL, '2021-10-26 13:31:45');
INSERT INTO `sys_oper_log` VALUES (167, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/c85453a9-3386-485f-a513-1bb19090a857.png\",\"code\":200}', 0, NULL, '2021-10-26 14:00:47');
INSERT INTO `sys_oper_log` VALUES (168, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/77b2a480-a6c9-47e8-b46e-015a8a20d094.png\",\"code\":200}', 0, NULL, '2021-10-26 14:08:06');
INSERT INTO `sys_oper_log` VALUES (169, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/71644a49-31ec-4a31-94fd-2bca12e90744.png\",\"code\":200}', 0, NULL, '2021-10-26 14:11:10');
INSERT INTO `sys_oper_log` VALUES (170, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/e87a625d-72c2-447e-87d8-5e18ceb1719e.png\",\"code\":200}', 0, NULL, '2021-10-26 14:14:12');
INSERT INTO `sys_oper_log` VALUES (171, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/ce3f907b-8ba7-4cac-80bb-c23cae2e47ee.png\",\"code\":200}', 0, NULL, '2021-10-26 14:19:50');
INSERT INTO `sys_oper_log` VALUES (172, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/50b77add-3d0a-4842-8cc8-184c306c0394.png\",\"code\":200}', 0, NULL, '2021-10-26 14:37:44');
INSERT INTO `sys_oper_log` VALUES (173, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/4e8b3572-831d-450a-88e5-4e016898e3a7.png\",\"code\":200}', 0, NULL, '2021-10-26 14:37:44');
INSERT INTO `sys_oper_log` VALUES (174, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/418543e2-c898-416f-b2cb-d306326f7c02.png\",\"code\":200}', 0, NULL, '2021-10-26 15:00:06');
INSERT INTO `sys_oper_log` VALUES (175, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/26/5d2451d6-a5c0-4d76-a9eb-52a062c2c418.png\",\"code\":200}', 0, NULL, '2021-10-26 15:00:07');
INSERT INTO `sys_oper_log` VALUES (176, '自动回复', 1, 'com.ruoyi.web.controller.bigtian.AutoReplyController.add()', 'POST', 1, 'admin', NULL, '/system/reply', '127.0.0.1', '内网IP', '{\"keyword\":\"love\",\"reply\":\"你喜欢我吗？\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-26 15:00:42');
INSERT INTO `sys_oper_log` VALUES (177, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'ry', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/1108af8e-276d-4d91-9db2-f6a20bc8df84.png\",\"code\":200}', 0, NULL, '2021-10-27 00:58:37');
INSERT INTO `sys_oper_log` VALUES (178, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'ry', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/00ad9f5f-4286-4a62-a752-f31b0e0fd320.png\",\"code\":200}', 0, NULL, '2021-10-27 00:58:37');
INSERT INTO `sys_oper_log` VALUES (179, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/4887d3a1-c19b-4758-98a4-5be6e78690b0.png\",\"code\":200}', 0, NULL, '2021-10-27 01:53:44');
INSERT INTO `sys_oper_log` VALUES (180, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/dc613dfc-9564-47d2-8418-6369d7182952.png\",\"code\":200}', 0, NULL, '2021-10-27 01:53:44');
INSERT INTO `sys_oper_log` VALUES (181, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/fff01591-239f-4bd8-8ef0-e9353eaef90c.png\",\"code\":200}', 0, NULL, '2021-10-27 01:53:49');
INSERT INTO `sys_oper_log` VALUES (182, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/0f27c845-9262-4862-b7df-cdb75cad726a.png\",\"code\":200}', 0, NULL, '2021-10-27 01:53:49');
INSERT INTO `sys_oper_log` VALUES (183, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/33dc887a-a988-4e34-8219-8908250433da.png\",\"code\":200}', 0, NULL, '2021-10-27 05:50:25');
INSERT INTO `sys_oper_log` VALUES (184, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/50cb2aa9-3057-4bd4-b938-0b2129aac8b8.png\",\"code\":200}', 0, NULL, '2021-10-27 05:50:25');
INSERT INTO `sys_oper_log` VALUES (185, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/1f4d804c-3fab-4a67-93ed-5a7dcdd50485.png\",\"code\":200}', 0, NULL, '2021-10-27 05:52:24');
INSERT INTO `sys_oper_log` VALUES (186, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/7e85f580-827f-49c8-bf23-171b7e3538a0.png\",\"code\":200}', 0, NULL, '2021-10-27 05:52:24');
INSERT INTO `sys_oper_log` VALUES (187, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/a4c21a09-96cc-4f91-9291-18b0cd2d8e60.png\",\"code\":200}', 0, NULL, '2021-10-27 05:54:29');
INSERT INTO `sys_oper_log` VALUES (188, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/9028f751-eecd-4f0d-a7a7-305c669f40a6.png\",\"code\":200}', 0, NULL, '2021-10-27 05:54:29');
INSERT INTO `sys_oper_log` VALUES (189, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/00e7423e-2853-4524-b204-d3cec215bbd8.png\",\"code\":200}', 0, NULL, '2021-10-27 05:55:25');
INSERT INTO `sys_oper_log` VALUES (190, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/2c858bfc-0c3f-4a1d-8712-ecf71dbff502.png\",\"code\":200}', 0, NULL, '2021-10-27 05:55:25');
INSERT INTO `sys_oper_log` VALUES (191, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/8031d22d-8593-4e2a-bc1f-8211295dbefb.png\",\"code\":200}', 0, NULL, '2021-10-27 05:59:48');
INSERT INTO `sys_oper_log` VALUES (192, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/f90f4a52-b348-4f79-bf2a-7274b47ce850.png\",\"code\":200}', 0, NULL, '2021-10-27 05:59:48');
INSERT INTO `sys_oper_log` VALUES (193, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/11da46bc-a7ce-4b11-bda6-8403c35ddc6f.png\",\"code\":200}', 0, NULL, '2021-10-27 05:59:52');
INSERT INTO `sys_oper_log` VALUES (194, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/bad7d389-dbcd-493b-8562-fc1e9db46ec0.png\",\"code\":200}', 0, NULL, '2021-10-27 05:59:52');
INSERT INTO `sys_oper_log` VALUES (195, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/46b6f9f2-5ecc-43da-a6c5-989431a1c28c.png\",\"code\":200}', 0, NULL, '2021-10-27 06:10:56');
INSERT INTO `sys_oper_log` VALUES (196, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/a3b068f3-9123-4747-8d25-e5f4ee0465f4.png\",\"code\":200}', 0, NULL, '2021-10-27 06:10:56');
INSERT INTO `sys_oper_log` VALUES (197, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/1fff3b7f-d0fa-4e9d-91be-932152cffbe6.png\",\"code\":200}', 0, NULL, '2021-10-27 06:11:01');
INSERT INTO `sys_oper_log` VALUES (198, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/04a8c6cf-000b-4379-98d9-e24c7d138759.png\",\"code\":200}', 0, NULL, '2021-10-27 06:11:01');
INSERT INTO `sys_oper_log` VALUES (199, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/ba0ab1bd-dc8d-434d-9667-7dcec8242742.png\",\"code\":200}', 0, NULL, '2021-10-27 06:12:06');
INSERT INTO `sys_oper_log` VALUES (200, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/6890d0db-e94f-46c8-853b-228c3782a9ab.png\",\"code\":200}', 0, NULL, '2021-10-27 06:12:06');
INSERT INTO `sys_oper_log` VALUES (201, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/4bb752e7-bd9e-4bae-8473-acb688854295.png\",\"code\":200}', 0, NULL, '2021-10-27 06:12:10');
INSERT INTO `sys_oper_log` VALUES (202, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/32f1afd2-04be-4f6e-8527-98661c1f1b48.png\",\"code\":200}', 0, NULL, '2021-10-27 06:12:10');
INSERT INTO `sys_oper_log` VALUES (203, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/4204d9f1-1a43-403d-99ec-82b1f6174d11.png\",\"code\":200}', 0, NULL, '2021-10-27 06:19:10');
INSERT INTO `sys_oper_log` VALUES (204, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/561ef76a-0039-4789-a81c-71b1717e676e.png\",\"code\":200}', 0, NULL, '2021-10-27 06:19:10');
INSERT INTO `sys_oper_log` VALUES (205, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/4ea4c501-0373-4a48-9e28-ad9165a14cb3.png\",\"code\":200}', 0, NULL, '2021-10-27 06:19:14');
INSERT INTO `sys_oper_log` VALUES (206, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/ec1f2397-2f16-4835-acf6-ab8dbd917b78.png\",\"code\":200}', 0, NULL, '2021-10-27 06:19:14');
INSERT INTO `sys_oper_log` VALUES (207, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/d91a7e16-2767-42d8-9734-89cb5035b2d7.png\",\"code\":200}', 0, NULL, '2021-10-27 06:19:19');
INSERT INTO `sys_oper_log` VALUES (208, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/8a01abc1-1e39-4751-a601-dde22790fa2f.png\",\"code\":200}', 0, NULL, '2021-10-27 06:19:19');
INSERT INTO `sys_oper_log` VALUES (209, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/c7df3f52-dee0-4e3d-84da-f5ea2e5b4661.png\",\"code\":200}', 0, NULL, '2021-10-27 06:21:36');
INSERT INTO `sys_oper_log` VALUES (210, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/a2784ead-763e-4a43-80d1-11b4007f6975.png\",\"code\":200}', 0, NULL, '2021-10-27 06:21:36');
INSERT INTO `sys_oper_log` VALUES (211, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/29cd60c1-2199-4465-976a-b795af344679.png\",\"code\":200}', 0, NULL, '2021-10-27 06:21:41');
INSERT INTO `sys_oper_log` VALUES (212, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/65a6cabf-30c9-42fa-a8c4-7b4117319215.png\",\"code\":200}', 0, NULL, '2021-10-27 06:24:47');
INSERT INTO `sys_oper_log` VALUES (213, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/d036fd6b-047f-49d4-9bd2-9d0537ac03e0.png\",\"code\":200}', 0, NULL, '2021-10-27 06:24:47');
INSERT INTO `sys_oper_log` VALUES (214, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/79d780a9-26b4-4613-a3fe-a063416bd12a.png\",\"code\":200}', 0, NULL, '2021-10-27 06:24:51');
INSERT INTO `sys_oper_log` VALUES (215, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/c8e1d6cd-451c-4966-93d4-1f1db0d9b12f.png\",\"code\":200}', 0, NULL, '2021-10-27 06:24:51');
INSERT INTO `sys_oper_log` VALUES (216, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/0f5b635b-a936-4224-9d2c-1b41b5551319.png\",\"code\":200}', 0, NULL, '2021-10-27 06:26:14');
INSERT INTO `sys_oper_log` VALUES (217, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/81f43d4a-f719-44f5-8386-b636f7f3f3a9.png\",\"code\":200}', 0, NULL, '2021-10-27 06:26:14');
INSERT INTO `sys_oper_log` VALUES (218, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/083109d4-d8b6-4444-ba8a-990d55ebb1fc.png\",\"code\":200}', 0, NULL, '2021-10-27 06:26:18');
INSERT INTO `sys_oper_log` VALUES (219, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/59e7a0db-b215-464c-9596-b358d782743d.png\",\"code\":200}', 0, NULL, '2021-10-27 06:26:18');
INSERT INTO `sys_oper_log` VALUES (220, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/874b4d80-7abb-43ea-8869-e5984aa4956c.png\",\"code\":200}', 0, NULL, '2021-10-27 06:26:23');
INSERT INTO `sys_oper_log` VALUES (221, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/5320df5e-7f7a-48de-aa4e-9dbb6af088ce.png\",\"code\":200}', 0, NULL, '2021-10-27 06:45:45');
INSERT INTO `sys_oper_log` VALUES (222, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/998ebabb-00b8-4278-8052-8280a17bafa6.png\",\"code\":200}', 0, NULL, '2021-10-27 06:45:45');
INSERT INTO `sys_oper_log` VALUES (223, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/06512635-8a4c-4e73-877e-7f8b71485485.png\",\"code\":200}', 0, NULL, '2021-10-27 08:36:09');
INSERT INTO `sys_oper_log` VALUES (224, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/585c1b9e-28b9-44f9-b40b-4cff866e8392.png\",\"code\":200}', 0, NULL, '2021-10-27 08:37:01');
INSERT INTO `sys_oper_log` VALUES (225, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/b1fb058e-805f-4faf-9a14-50a540167dfb.png\",\"code\":200}', 0, NULL, '2021-10-27 09:04:48');
INSERT INTO `sys_oper_log` VALUES (226, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/40440c34-c157-49b6-bb9c-a53d7eedb788.png\",\"code\":200}', 0, NULL, '2021-10-27 09:07:28');
INSERT INTO `sys_oper_log` VALUES (227, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/c924dfab-dbac-4448-b11d-9d11ca3fe30a.png\",\"code\":200}', 0, NULL, '2021-10-27 09:08:36');
INSERT INTO `sys_oper_log` VALUES (228, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/792e2ff4-41da-4b52-b682-523b3ba44ef6.png\",\"code\":200}', 0, NULL, '2021-10-27 09:10:10');
INSERT INTO `sys_oper_log` VALUES (229, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/fb1b1cba-a150-462d-b4cd-bf891b17752d.png\",\"code\":200}', 0, NULL, '2021-10-27 09:10:52');
INSERT INTO `sys_oper_log` VALUES (230, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'ry', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/9773c3c8-3c09-4b4c-b493-11797cfd9eca.png\",\"code\":200}', 0, NULL, '2021-10-27 10:06:38');
INSERT INTO `sys_oper_log` VALUES (231, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'ry', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/f330922a-63f3-4375-886f-a1e6e092c98e.png\",\"code\":200}', 0, NULL, '2021-10-27 10:07:06');
INSERT INTO `sys_oper_log` VALUES (232, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'ry', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/1fe5f9b7-25f0-4e1a-b0f9-9fa87272f4db.png\",\"code\":200}', 0, NULL, '2021-10-27 10:07:51');
INSERT INTO `sys_oper_log` VALUES (233, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'ry', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/127bf3a4-e849-4e9b-a110-e4b031bf4a16.png\",\"code\":200}', 0, NULL, '2021-10-27 10:09:19');
INSERT INTO `sys_oper_log` VALUES (234, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'ry', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/825fe4e7-32ef-4cb5-84cd-67ee4685917d.png\",\"code\":200}', 0, NULL, '2021-10-27 10:09:48');
INSERT INTO `sys_oper_log` VALUES (235, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'ry', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/c3b23af6-f49c-4242-8fc7-cd53f8ad24de.png\",\"code\":200}', 0, NULL, '2021-10-27 10:11:23');
INSERT INTO `sys_oper_log` VALUES (236, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'ry', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/59df5420-3968-4f1b-b54b-552654a6b4c7.png\",\"code\":200}', 0, NULL, '2021-10-27 10:13:35');
INSERT INTO `sys_oper_log` VALUES (237, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/36ab8b7e-b977-4cb2-b0a6-4d1346bb5045.png\",\"code\":200}', 0, NULL, '2021-10-27 14:13:14');
INSERT INTO `sys_oper_log` VALUES (238, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/27/ec732d79-4783-48c4-afaf-e8f81b7cc343.png\",\"code\":200}', 0, NULL, '2021-10-27 14:14:26');
INSERT INTO `sys_oper_log` VALUES (239, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2000', '127.0.0.1', '内网IP', '{menuId=2000}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', 0, NULL, '2021-11-19 14:21:53');
INSERT INTO `sys_oper_log` VALUES (240, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2001', '127.0.0.1', '内网IP', '{menuId=2001}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2021-11-19 14:22:01');
INSERT INTO `sys_oper_log` VALUES (241, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2005', '127.0.0.1', '内网IP', '{menuId=2005}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2021-11-19 14:22:06');
INSERT INTO `sys_oper_log` VALUES (242, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/1', '127.0.0.1', '内网IP', '{tableIds=1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 14:23:04');
INSERT INTO `sys_oper_log` VALUES (243, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 't_weixin_user', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 14:30:32');
INSERT INTO `sys_oper_log` VALUES (244, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2021-11-19 14:30:37');
INSERT INTO `sys_oper_log` VALUES (245, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/2', '127.0.0.1', '内网IP', '{tableIds=2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 14:34:14');
INSERT INTO `sys_oper_log` VALUES (246, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 't_weixin_user', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 14:34:19');
INSERT INTO `sys_oper_log` VALUES (247, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/3', '127.0.0.1', '内网IP', '{tableIds=3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 14:37:16');
INSERT INTO `sys_oper_log` VALUES (248, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 't_weixin_user', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 14:37:21');
INSERT INTO `sys_oper_log` VALUES (249, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/4', '127.0.0.1', '内网IP', '{tableIds=4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 14:41:08');
INSERT INTO `sys_oper_log` VALUES (250, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 't_weixin_user', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 14:41:13');
INSERT INTO `sys_oper_log` VALUES (251, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":100,\"admin\":false,\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"pc_admin\",\"roleName\":\"管理员\",\"deptIds\":[],\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,115,1055,1058,1056,1057,1059,1060,116],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 14:49:21');
INSERT INTO `sys_oper_log` VALUES (252, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/5', '127.0.0.1', '内网IP', '{tableIds=5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 14:59:26');
INSERT INTO `sys_oper_log` VALUES (253, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 't_weixin_user', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 14:59:32');
INSERT INTO `sys_oper_log` VALUES (254, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/6', '127.0.0.1', '内网IP', '{tableIds=6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 14:59:50');
INSERT INTO `sys_oper_log` VALUES (255, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 't_weixin_user', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 15:04:46');
INSERT INTO `sys_oper_log` VALUES (256, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 't_weixin_user', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 15:04:47');
INSERT INTO `sys_oper_log` VALUES (257, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 't_weixin_user', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 15:04:48');
INSERT INTO `sys_oper_log` VALUES (258, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/8', '127.0.0.1', '内网IP', '{tableIds=8}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 15:04:51');
INSERT INTO `sys_oper_log` VALUES (259, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/9', '127.0.0.1', '内网IP', '{tableIds=9}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 15:04:53');
INSERT INTO `sys_oper_log` VALUES (260, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/7', '127.0.0.1', '内网IP', '{tableIds=7}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 15:07:16');
INSERT INTO `sys_oper_log` VALUES (261, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 't_weixin_user', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 15:07:20');
INSERT INTO `sys_oper_log` VALUES (262, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/10', '127.0.0.1', '内网IP', '{tableIds=10}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 15:11:40');
INSERT INTO `sys_oper_log` VALUES (263, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 't_weixin_user', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 15:11:46');
INSERT INTO `sys_oper_log` VALUES (264, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-06-30 06:34:32');
INSERT INTO `sys_oper_log` VALUES (265, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', 1, 'admin', NULL, '/tool/gen/genCode/undefined', '127.0.0.1', '内网IP', '{tableName=undefined}', NULL, 1, 'Cannot invoke \"com.ruoyi.generator.domain.GenTable.getSubTableName()\" because \"table\" is null', '2022-06-30 06:34:35');
INSERT INTO `sys_oper_log` VALUES (266, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-06-30 06:48:37');
INSERT INTO `sys_oper_log` VALUES (267, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', NULL, 1, '\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\n### The error may exist in com/ruoyi/bigtian/mapper/AttachmentMapper.java (best guess)\n### The error may involve com.ruoyi.bigtian.mapper.AttachmentMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO t_attachment  ( id,  url, type, source_name, create_by, create_time, update_by, update_time )  VALUES  ( ?,  ?, ?, ?, ?, ?, ?, ? )\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'', '2022-06-30 06:54:25');
INSERT INTO `sys_oper_log` VALUES (268, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', NULL, 1, '\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\n### The error may exist in com/ruoyi/bigtian/mapper/AttachmentMapper.java (best guess)\n### The error may involve com.ruoyi.bigtian.mapper.AttachmentMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO t_attachment  ( id,  url, type, source_name, create_by, create_time, update_by, update_time )  VALUES  ( ?,  ?, ?, ?, ?, ?, ?, ? )\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'', '2022-06-30 06:54:37');
INSERT INTO `sys_oper_log` VALUES (269, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', NULL, 1, '\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\n### The error may exist in com/ruoyi/bigtian/mapper/AttachmentMapper.java (best guess)\n### The error may involve com.ruoyi.bigtian.mapper.AttachmentMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO t_attachment  ( id,  url, type, source_name, create_by, create_time, update_by, update_time )  VALUES  ( ?,  ?, ?, ?, ?, ?, ?, ? )\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'', '2022-06-30 06:55:46');
INSERT INTO `sys_oper_log` VALUES (270, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"https://bigdai.oss-cn-hangzhou.aliyuncs.com/2022/06/30/blob_20220630150520A004.jpeg\",\"code\":200}', 0, NULL, '2022-06-30 07:05:25');
INSERT INTO `sys_oper_log` VALUES (271, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 't_wechat_user,t_attachment,t_feedback,t_parks,t_join_us', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-06-30 07:09:52');
INSERT INTO `sys_oper_log` VALUES (272, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/11', '127.0.0.1', '内网IP', '{tableIds=11}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-06-30 07:09:57');
INSERT INTO `sys_oper_log` VALUES (273, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"parks\",\"className\":\"Parks\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":144,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2022-06-30 07:09:00\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"停车场名称\",\"columnId\":145,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2022-06-30 07:09:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Linkman\",\"columnComment\":\"联系人\",\"columnId\":146,\"columnName\":\"linkman\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2022-06-30 07:09:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"linkman\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Phone\",\"columnComment\":\"手机号\",\"columnId\":147,\"columnName\":\"phone\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2022-06-30 07:09:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"phone\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"query', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-06-30 07:10:26');
INSERT INTO `sys_oper_log` VALUES (274, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/16,15,13,14,12', '127.0.0.1', '内网IP', '{tableIds=16,15,13,14,12}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-06-30 07:10:43');
INSERT INTO `sys_oper_log` VALUES (275, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 't_wechat_user,t_attachment,t_parks,t_join_us,t_feedback,t_weixin_user', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-06-30 07:10:56');
INSERT INTO `sys_oper_log` VALUES (276, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', 1, 'admin', NULL, '/tool/gen/genCode/undefined', '127.0.0.1', '内网IP', '{tableName=undefined}', NULL, 1, 'Cannot invoke \"com.ruoyi.generator.domain.GenTable.getSubTableName()\" because \"table\" is null', '2022-06-30 07:10:59');
INSERT INTO `sys_oper_log` VALUES (277, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', 1, 'admin', NULL, '/tool/gen/genCode/undefined', '127.0.0.1', '内网IP', '{tableName=undefined}', NULL, 1, 'Cannot invoke \"com.ruoyi.generator.domain.GenTable.getSubTableName()\" because \"table\" is null', '2022-06-30 07:11:02');
INSERT INTO `sys_oper_log` VALUES (278, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', 1, 'admin', NULL, '/tool/gen/genCode/undefined', '127.0.0.1', '内网IP', '{tableName=undefined}', NULL, 1, 'Cannot invoke \"com.ruoyi.generator.domain.GenTable.getSubTableName()\" because \"table\" is null', '2022-06-30 07:11:32');
INSERT INTO `sys_oper_log` VALUES (279, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-06-30 07:12:33');
INSERT INTO `sys_oper_log` VALUES (280, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-06-30 07:13:18');
INSERT INTO `sys_oper_log` VALUES (281, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2036', '127.0.0.1', '内网IP', '{menuId=2036}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', 0, NULL, '2022-06-30 07:21:22');
INSERT INTO `sys_oper_log` VALUES (282, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2041', '127.0.0.1', '内网IP', '{menuId=2041}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-06-30 07:21:31');
INSERT INTO `sys_oper_log` VALUES (283, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2040', '127.0.0.1', '内网IP', '{menuId=2040}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-06-30 07:21:35');
INSERT INTO `sys_oper_log` VALUES (284, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2039', '127.0.0.1', '内网IP', '{menuId=2039}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-06-30 07:21:38');
INSERT INTO `sys_oper_log` VALUES (285, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2038', '127.0.0.1', '内网IP', '{menuId=2038}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-06-30 07:21:41');
INSERT INTO `sys_oper_log` VALUES (286, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2037', '127.0.0.1', '内网IP', '{menuId=2037}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-06-30 07:21:44');
INSERT INTO `sys_oper_log` VALUES (287, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2036', '127.0.0.1', '内网IP', '{menuId=2036}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-06-30 07:21:47');
INSERT INTO `sys_oper_log` VALUES (288, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"bigtian/feedback/index\",\"createTime\":\"2022-06-30 07:14:00\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"反馈列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"feedback\",\"perms\":\"bigtian:feedback:list\",\"status\":\"0\",\"updateBy\":\"1\",\"updateTime\":\"2022-06-30T15:23:56.187+08:00\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-06-30 07:23:56');
INSERT INTO `sys_oper_log` VALUES (289, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"bigtian/joinUs/index\",\"createTime\":\"2022-06-30 07:14:00\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2018,\"menuName\":\"合同共赢\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"joinUs\",\"perms\":\"bigtian:joinUs:list\",\"status\":\"0\",\"updateBy\":\"1\",\"updateTime\":\"2022-06-30T15:24:05.616+08:00\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-06-30 07:24:05');
INSERT INTO `sys_oper_log` VALUES (290, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"bigtian/parks/index\",\"createTime\":\"2022-06-30 07:14:00\",\"icon\":\"park\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2024,\"menuName\":\"停车场列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"parks\",\"perms\":\"bigtian:parks:list\",\"status\":\"0\",\"updateBy\":\"1\",\"updateTime\":\"2022-06-30T15:24:35.33+08:00\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-06-30 07:24:35');
INSERT INTO `sys_oper_log` VALUES (291, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"bigtian/joinUs/index\",\"createTime\":\"2022-06-30 07:14:00\",\"icon\":\"cooperation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2018,\"menuName\":\"合同共赢\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"joinUs\",\"perms\":\"bigtian:joinUs:list\",\"status\":\"0\",\"updateBy\":\"1\",\"updateTime\":\"2022-06-30T15:27:13.731+08:00\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-06-30 07:27:14');
INSERT INTO `sys_oper_log` VALUES (292, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"bigtian/feedback/index\",\"createTime\":\"2022-06-30 07:14:00\",\"icon\":\"feedback\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"反馈列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"feedback\",\"perms\":\"bigtian:feedback:list\",\"status\":\"0\",\"updateBy\":\"1\",\"updateTime\":\"2022-06-30T15:29:04.848+08:00\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-06-30 07:29:05');
INSERT INTO `sys_oper_log` VALUES (293, '停车场', 1, 'com.ruoyi.web.controller.bigtian.ParksController.add()', 'POST', 1, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', NULL, '/bigtian/parks', '127.0.0.1', '内网IP', '{\"atts\":\"1659142496380661760,1659142501187334144,1659142510876176384,1659142520036536320\",\"createBy\":\"100\",\"createTime\":\"2023-05-18T18:25:33.799+08:00\",\"id\":1659143178491932672,\"latitude\":\"32.120581\",\"linkman\":\"焦恒鑫\",\"longitude\":\"118.940478\",\"name\":\"park-1\",\"params\":{},\"phone\":\"18012275669\",\"pointDetail\":\"江苏省南京市栖霞区仙林大学城羊山北路1号\",\"pointName\":\"南京工业职业技术大学\",\"price\":5,\"rates\":\"<p>道路泊车位收费标准</p><p><br></p><p>一、小型车为30分钟内免费，每增加3个小时加收5元，停车不足3小时的按3小时计算，全天最高限额20元，包月价格为360元。</p><p><br></p><p>二、新能源车为2小时内（含）免费，3小时内（含）3元，每增加3小时加收5元，停车不足3小时的按3小时计算，全天最高限额15元，包月价格为360元。</p><p><br></p><p>三、大型车按照实际占车位数计费。</p><p><br></p><p>四、超过24小时重新按以上规定计收。</p><p><br></p><p style=\\\"text-align: left;\\\">五、收费时间为7:30-19:30。<img style=\\\"max-width:100%;height:auto;\\\" src=\\\"https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/18/tdEtn0rlwJnc4f8025926e88229bf33dabdefec9f479_20230518182458A010.png\\\" class=\\\"editor-img\\\" data-custom=\\\"id=wux-upload--1684405385460-1\\\"></p><p style=\\\"text-align: left;\\\"><br></p>\",\"residueVehicleNum\":602,\"state\":\"wait_apply\",\"textContent\":\"道路泊车位收费标准一、小型车为30分钟内免费，每增加3个小时加收5元，停车不足3小时的按3小时计算，全天最高限额20元，包月价格为360元。二、新能源车为2小时内（含）免费，3小时内（含）3元，每增加3小时加收5元，停车不足3小时的按3小时计算，全天最高限额15元，包月价格为360元。三、大型车按照实际占车位数计费。四、超过24小时重新按以上规定计收。五、收费时间为7:30-19:30。\",\"updateBy\":\"100\",\"updateTime\":\"2023-05-18T18:25:33.799+08:00\",\"vehicleNum\":602}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'price\' in \'field list\'\r\n### The error may exist in com/ruoyi/bigtian/mapper/ParksMapper.java (best guess)\r\n### The error may involve com.ruoyi.bigtian.mapper.ParksMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO t_parks  ( id, name, linkman, phone, vehicle_num, residue_vehicle_num, longitude, latitude,  rates, state, point_name, point_detail, text_content,  price, create_by, create_time, update_by, update_time )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?,  ?, ?, ?, ?, ?,  ?, ?, ?, ?, ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'price\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'price\' in \'field list\'', '2023-05-18 18:25:33');
INSERT INTO `sys_oper_log` VALUES (294, '停车场', 1, 'com.ruoyi.web.controller.bigtian.ParksController.add()', 'POST', 1, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', NULL, '/bigtian/parks', '127.0.0.1', '内网IP', '{\"atts\":\"1659142496380661760,1659142501187334144,1659142510876176384,1659142520036536320\",\"createBy\":\"100\",\"createTime\":\"2023-05-18T18:25:36.531+08:00\",\"id\":1659143189950771200,\"latitude\":\"32.120581\",\"linkman\":\"焦恒鑫\",\"longitude\":\"118.940478\",\"name\":\"park-1\",\"params\":{},\"phone\":\"18012275669\",\"pointDetail\":\"江苏省南京市栖霞区仙林大学城羊山北路1号\",\"pointName\":\"南京工业职业技术大学\",\"price\":5,\"rates\":\"<p>道路泊车位收费标准</p><p><br></p><p>一、小型车为30分钟内免费，每增加3个小时加收5元，停车不足3小时的按3小时计算，全天最高限额20元，包月价格为360元。</p><p><br></p><p>二、新能源车为2小时内（含）免费，3小时内（含）3元，每增加3小时加收5元，停车不足3小时的按3小时计算，全天最高限额15元，包月价格为360元。</p><p><br></p><p>三、大型车按照实际占车位数计费。</p><p><br></p><p>四、超过24小时重新按以上规定计收。</p><p><br></p><p style=\\\"text-align: left;\\\">五、收费时间为7:30-19:30。<img style=\\\"max-width:100%;height:auto;\\\" src=\\\"https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/18/tdEtn0rlwJnc4f8025926e88229bf33dabdefec9f479_20230518182458A010.png\\\" class=\\\"editor-img\\\" data-custom=\\\"id=wux-upload--1684405385460-1\\\"></p><p style=\\\"text-align: left;\\\"><br></p>\",\"residueVehicleNum\":602,\"state\":\"wait_apply\",\"textContent\":\"道路泊车位收费标准一、小型车为30分钟内免费，每增加3个小时加收5元，停车不足3小时的按3小时计算，全天最高限额20元，包月价格为360元。二、新能源车为2小时内（含）免费，3小时内（含）3元，每增加3小时加收5元，停车不足3小时的按3小时计算，全天最高限额15元，包月价格为360元。三、大型车按照实际占车位数计费。四、超过24小时重新按以上规定计收。五、收费时间为7:30-19:30。\",\"updateBy\":\"100\",\"updateTime\":\"2023-05-18T18:25:36.531+08:00\",\"vehicleNum\":602}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'price\' in \'field list\'\r\n### The error may exist in com/ruoyi/bigtian/mapper/ParksMapper.java (best guess)\r\n### The error may involve com.ruoyi.bigtian.mapper.ParksMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO t_parks  ( id, name, linkman, phone, vehicle_num, residue_vehicle_num, longitude, latitude,  rates, state, point_name, point_detail, text_content,  price, create_by, create_time, update_by, update_time )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?,  ?, ?, ?, ?, ?,  ?, ?, ?, ?, ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'price\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'price\' in \'field list\'', '2023-05-18 18:25:36');
INSERT INTO `sys_oper_log` VALUES (295, '停车场', 1, 'com.ruoyi.web.controller.bigtian.ParksController.add()', 'POST', 1, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', NULL, '/bigtian/parks', '127.0.0.1', '内网IP', '{\"atts\":\"1659142496380661760,1659142501187334144,1659142510876176384,1659142520036536320\",\"createBy\":\"100\",\"createTime\":\"2023-05-18T18:25:43.374+08:00\",\"id\":1659143218652393472,\"latitude\":\"32.120581\",\"linkman\":\"焦恒鑫\",\"longitude\":\"118.940478\",\"name\":\"park-1\",\"params\":{},\"phone\":\"18012275669\",\"pointDetail\":\"江苏省南京市栖霞区仙林大学城羊山北路1号\",\"pointName\":\"南京工业职业技术大学\",\"price\":5,\"rates\":\"<p>道路泊车位收费标准</p><p><br></p><p>一、小型车为30分钟内免费，每增加3个小时加收5元，停车不足3小时的按3小时计算，全天最高限额20元，包月价格为360元。</p><p><br></p><p>二、新能源车为2小时内（含）免费，3小时内（含）3元，每增加3小时加收5元，停车不足3小时的按3小时计算，全天最高限额15元，包月价格为360元。</p><p><br></p><p>三、大型车按照实际占车位数计费。</p><p><br></p><p>四、超过24小时重新按以上规定计收。</p><p><br></p><p style=\\\"text-align: left;\\\">五、收费时间为7:30-19:30。<img style=\\\"max-width:100%;height:auto;\\\" src=\\\"https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/18/tdEtn0rlwJnc4f8025926e88229bf33dabdefec9f479_20230518182458A010.png\\\" class=\\\"editor-img\\\" data-custom=\\\"id=wux-upload--1684405385460-1\\\"></p><p style=\\\"text-align: left;\\\"><br></p>\",\"residueVehicleNum\":602,\"state\":\"wait_apply\",\"textContent\":\"道路泊车位收费标准一、小型车为30分钟内免费，每增加3个小时加收5元，停车不足3小时的按3小时计算，全天最高限额20元，包月价格为360元。二、新能源车为2小时内（含）免费，3小时内（含）3元，每增加3小时加收5元，停车不足3小时的按3小时计算，全天最高限额15元，包月价格为360元。三、大型车按照实际占车位数计费。四、超过24小时重新按以上规定计收。五、收费时间为7:30-19:30。\",\"updateBy\":\"100\",\"updateTime\":\"2023-05-18T18:25:43.374+08:00\",\"vehicleNum\":602}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'price\' in \'field list\'\r\n### The error may exist in com/ruoyi/bigtian/mapper/ParksMapper.java (best guess)\r\n### The error may involve com.ruoyi.bigtian.mapper.ParksMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO t_parks  ( id, name, linkman, phone, vehicle_num, residue_vehicle_num, longitude, latitude,  rates, state, point_name, point_detail, text_content,  price, create_by, create_time, update_by, update_time )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?,  ?, ?, ?, ?, ?,  ?, ?, ?, ?, ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'price\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'price\' in \'field list\'', '2023-05-18 18:25:43');
INSERT INTO `sys_oper_log` VALUES (296, '停车场', 1, 'com.ruoyi.web.controller.bigtian.ParksController.add()', 'POST', 1, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', NULL, '/bigtian/parks', '127.0.0.1', '内网IP', '{\"atts\":\"1659142496380661760,1659142501187334144,1659142510876176384,1659142520036536320\",\"createBy\":\"100\",\"createTime\":\"2023-05-18T18:26:31.145+08:00\",\"id\":1659143419018489856,\"latitude\":\"32.120581\",\"linkman\":\"焦恒鑫\",\"longitude\":\"118.940478\",\"name\":\"park-1\",\"params\":{},\"phone\":\"18012275669\",\"pointDetail\":\"江苏省南京市栖霞区仙林大学城羊山北路1号\",\"pointName\":\"南京工业职业技术大学\",\"price\":2,\"rates\":\"<p>道路泊车位收费标准</p><p><br></p><p>一、小型车为30分钟内免费，每增加3个小时加收5元，停车不足3小时的按3小时计算，全天最高限额20元，包月价格为360元。</p><p><br></p><p>二、新能源车为2小时内（含）免费，3小时内（含）3元，每增加3小时加收5元，停车不足3小时的按3小时计算，全天最高限额15元，包月价格为360元。</p><p><br></p><p>三、大型车按照实际占车位数计费。</p><p><br></p><p>四、超过24小时重新按以上规定计收。</p><p><br></p><p style=\\\"text-align: left;\\\">五、收费时间为7:30-19:30。<img style=\\\"max-width:100%;height:auto;\\\" src=\\\"https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/18/tdEtn0rlwJnc4f8025926e88229bf33dabdefec9f479_20230518182458A010.png\\\" class=\\\"editor-img\\\" data-custom=\\\"id=wux-upload--1684405385460-1\\\"></p><p style=\\\"text-align: left;\\\"><br></p>\",\"residueVehicleNum\":602,\"state\":\"wait_apply\",\"textContent\":\"道路泊车位收费标准一、小型车为30分钟内免费，每增加3个小时加收5元，停车不足3小时的按3小时计算，全天最高限额20元，包月价格为360元。二、新能源车为2小时内（含）免费，3小时内（含）3元，每增加3小时加收5元，停车不足3小时的按3小时计算，全天最高限额15元，包月价格为360元。三、大型车按照实际占车位数计费。四、超过24小时重新按以上规定计收。五、收费时间为7:30-19:30。\",\"updateBy\":\"100\",\"updateTime\":\"2023-05-18T18:26:31.145+08:00\",\"vehicleNum\":602}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'price\' in \'field list\'\r\n### The error may exist in com/ruoyi/bigtian/mapper/ParksMapper.java (best guess)\r\n### The error may involve com.ruoyi.bigtian.mapper.ParksMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO t_parks  ( id, name, linkman, phone, vehicle_num, residue_vehicle_num, longitude, latitude,  rates, state, point_name, point_detail, text_content,  price, create_by, create_time, update_by, update_time )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?,  ?, ?, ?, ?, ?,  ?, ?, ?, ?, ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'price\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'price\' in \'field list\'', '2023-05-18 18:26:31');
INSERT INTO `sys_oper_log` VALUES (297, '停车场', 1, 'com.ruoyi.web.controller.bigtian.ParksController.add()', 'POST', 1, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', NULL, '/bigtian/parks', '127.0.0.1', '内网IP', '{\"atts\":\"1659142496380661760,1659142501187334144,1659142510876176384,1659142520036536320\",\"createBy\":\"100\",\"createTime\":\"2023-05-18T18:27:59.733+08:00\",\"id\":1659143790583492608,\"latitude\":\"32.120581\",\"linkman\":\"焦恒鑫\",\"longitude\":\"118.940478\",\"name\":\"park-1\",\"params\":{},\"phone\":\"18012275669\",\"pointDetail\":\"江苏省南京市栖霞区仙林大学城羊山北路1号\",\"pointName\":\"南京工业职业技术大学\",\"price\":2,\"rates\":\"<p>道路泊车位收费标准</p><p><br></p><p>一、小型车为30分钟内免费，每增加3个小时加收5元，停车不足3小时的按3小时计算，全天最高限额20元，包月价格为360元。</p><p><br></p><p>二、新能源车为2小时内（含）免费，3小时内（含）3元，每增加3小时加收5元，停车不足3小时的按3小时计算，全天最高限额15元，包月价格为360元。</p><p><br></p><p>三、大型车按照实际占车位数计费。</p><p><br></p><p>四、超过24小时重新按以上规定计收。</p><p><br></p><p style=\\\"text-align: left;\\\">五、收费时间为7:30-19:30。<img style=\\\"max-width:100%;height:auto;\\\" src=\\\"https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/18/tdEtn0rlwJnc4f8025926e88229bf33dabdefec9f479_20230518182458A010.png\\\" class=\\\"editor-img\\\" data-custom=\\\"id=wux-upload--1684405385460-1\\\"></p><p style=\\\"text-align: left;\\\"><br></p>\",\"residueVehicleNum\":602,\"state\":\"wait_apply\",\"textContent\":\"道路泊车位收费标准一、小型车为30分钟内免费，每增加3个小时加收5元，停车不足3小时的按3小时计算，全天最高限额20元，包月价格为360元。二、新能源车为2小时内（含）免费，3小时内（含）3元，每增加3小时加收5元，停车不足3小时的按3小时计算，全天最高限额15元，包月价格为360元。三、大型车按照实际占车位数计费。四、超过24小时重新按以上规定计收。五、收费时间为7:30-19:30。\",\"updateBy\":\"100\",\"updateTime\":\"2023-05-18T18:27:59.733+08:00\",\"vehicleNum\":602}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-18 18:27:59');
INSERT INTO `sys_oper_log` VALUES (298, '停车场', 1, 'com.ruoyi.web.controller.bigtian.ParksController.add()', 'POST', 1, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', NULL, '/bigtian/parks', '127.0.0.1', '内网IP', '{\"atts\":\"1659142496380661760,1659142501187334144,1659142510876176384,1659142520036536320\",\"createBy\":\"100\",\"createTime\":\"2023-05-18T18:28:03.151+08:00\",\"id\":1659143804919623680,\"latitude\":\"32.120581\",\"linkman\":\"焦恒鑫\",\"longitude\":\"118.940478\",\"name\":\"park-1\",\"params\":{},\"phone\":\"18012275669\",\"pointDetail\":\"江苏省南京市栖霞区仙林大学城羊山北路1号\",\"pointName\":\"南京工业职业技术大学\",\"price\":2,\"rates\":\"<p>道路泊车位收费标准</p><p><br></p><p>一、小型车为30分钟内免费，每增加3个小时加收5元，停车不足3小时的按3小时计算，全天最高限额20元，包月价格为360元。</p><p><br></p><p>二、新能源车为2小时内（含）免费，3小时内（含）3元，每增加3小时加收5元，停车不足3小时的按3小时计算，全天最高限额15元，包月价格为360元。</p><p><br></p><p>三、大型车按照实际占车位数计费。</p><p><br></p><p>四、超过24小时重新按以上规定计收。</p><p><br></p><p style=\\\"text-align: left;\\\">五、收费时间为7:30-19:30。<img style=\\\"max-width:100%;height:auto;\\\" src=\\\"https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/18/tdEtn0rlwJnc4f8025926e88229bf33dabdefec9f479_20230518182458A010.png\\\" class=\\\"editor-img\\\" data-custom=\\\"id=wux-upload--1684405385460-1\\\"></p><p style=\\\"text-align: left;\\\"><br></p>\",\"residueVehicleNum\":602,\"state\":\"wait_apply\",\"textContent\":\"道路泊车位收费标准一、小型车为30分钟内免费，每增加3个小时加收5元，停车不足3小时的按3小时计算，全天最高限额20元，包月价格为360元。二、新能源车为2小时内（含）免费，3小时内（含）3元，每增加3小时加收5元，停车不足3小时的按3小时计算，全天最高限额15元，包月价格为360元。三、大型车按照实际占车位数计费。四、超过24小时重新按以上规定计收。五、收费时间为7:30-19:30。\",\"updateBy\":\"100\",\"updateTime\":\"2023-05-18T18:28:03.151+08:00\",\"vehicleNum\":602}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-18 18:28:03');
INSERT INTO `sys_oper_log` VALUES (299, '支付订单', 1, 'com.ruoyi.bigtian.controller.PayOrderController.add()', 'POST', 1, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', NULL, '/bigtian/payOrder', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-05-18T18:34:47.258+08:00\",\"id\":1659145499884007424,\"parkId\":1659143804919623680,\"status\":1,\"userId\":100}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Table \'park.t_pay_order\' doesn\'t exist\r\n### The error may exist in com/ruoyi/bigtian/mapper/PayOrderMapper.java (best guess)\r\n### The error may involve com.ruoyi.bigtian.mapper.PayOrderMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO t_pay_order  ( id, user_id, park_id, status, create_time )  VALUES  ( ?, ?, ?, ?, ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Table \'park.t_pay_order\' doesn\'t exist\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Table \'park.t_pay_order\' doesn\'t exist', '2023-05-18 18:34:47');
INSERT INTO `sys_oper_log` VALUES (300, '支付订单', 1, 'com.ruoyi.bigtian.controller.PayOrderController.add()', 'POST', 1, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', NULL, '/bigtian/payOrder', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-05-18T18:34:51.884+08:00\",\"id\":1659145519270080512,\"parkId\":1659143804919623680,\"status\":1,\"userId\":100}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Table \'park.t_pay_order\' doesn\'t exist\r\n### The error may exist in com/ruoyi/bigtian/mapper/PayOrderMapper.java (best guess)\r\n### The error may involve com.ruoyi.bigtian.mapper.PayOrderMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO t_pay_order  ( id, user_id, park_id, status, create_time )  VALUES  ( ?, ?, ?, ?, ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Table \'park.t_pay_order\' doesn\'t exist\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Table \'park.t_pay_order\' doesn\'t exist', '2023-05-18 18:34:51');
INSERT INTO `sys_oper_log` VALUES (301, '支付订单', 1, 'com.ruoyi.bigtian.controller.PayOrderController.add()', 'POST', 1, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', NULL, '/bigtian/payOrder', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-05-18T18:35:02.049+08:00\",\"id\":1659145561909374976,\"parkId\":1659143804919623680,\"status\":1,\"userId\":100}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Table \'park.t_pay_order\' doesn\'t exist\r\n### The error may exist in com/ruoyi/bigtian/mapper/PayOrderMapper.java (best guess)\r\n### The error may involve com.ruoyi.bigtian.mapper.PayOrderMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO t_pay_order  ( id, user_id, park_id, status, create_time )  VALUES  ( ?, ?, ?, ?, ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Table \'park.t_pay_order\' doesn\'t exist\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Table \'park.t_pay_order\' doesn\'t exist', '2023-05-18 18:35:02');
INSERT INTO `sys_oper_log` VALUES (302, '支付订单', 1, 'com.ruoyi.bigtian.controller.PayOrderController.add()', 'POST', 1, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', NULL, '/bigtian/payOrder', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-05-18T18:39:08.258+08:00\",\"id\":1659146594588962816,\"parkId\":1659143804919623680,\"status\":1,\"userId\":100}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'park_id\' at row 1\r\n### The error may exist in com/ruoyi/bigtian/mapper/PayOrderMapper.java (best guess)\r\n### The error may involve com.ruoyi.bigtian.mapper.PayOrderMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO t_pay_order  ( id, user_id, park_id, status, create_time )  VALUES  ( ?, ?, ?, ?, ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'park_id\' at row 1\n; Data truncation: Out of range value for column \'park_id\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'park_id\' at row 1', '2023-05-18 18:39:08');
INSERT INTO `sys_oper_log` VALUES (303, '支付订单', 1, 'com.ruoyi.bigtian.controller.PayOrderController.add()', 'POST', 1, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', NULL, '/bigtian/payOrder', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-05-18T18:39:12.384+08:00\",\"id\":1659146611886272512,\"parkId\":1659143804919623680,\"status\":1,\"userId\":100}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'park_id\' at row 1\r\n### The error may exist in com/ruoyi/bigtian/mapper/PayOrderMapper.java (best guess)\r\n### The error may involve com.ruoyi.bigtian.mapper.PayOrderMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO t_pay_order  ( id, user_id, park_id, status, create_time )  VALUES  ( ?, ?, ?, ?, ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'park_id\' at row 1\n; Data truncation: Out of range value for column \'park_id\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'park_id\' at row 1', '2023-05-18 18:39:12');
INSERT INTO `sys_oper_log` VALUES (304, '支付订单', 1, 'com.ruoyi.bigtian.controller.PayOrderController.add()', 'POST', 1, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', NULL, '/bigtian/payOrder', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-05-18T18:39:20.201+08:00\",\"id\":1659146644673146880,\"parkId\":1659143804919623680,\"status\":1,\"userId\":100}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'park_id\' at row 1\r\n### The error may exist in com/ruoyi/bigtian/mapper/PayOrderMapper.java (best guess)\r\n### The error may involve com.ruoyi.bigtian.mapper.PayOrderMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO t_pay_order  ( id, user_id, park_id, status, create_time )  VALUES  ( ?, ?, ?, ?, ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'park_id\' at row 1\n; Data truncation: Out of range value for column \'park_id\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'park_id\' at row 1', '2023-05-18 18:39:20');
INSERT INTO `sys_oper_log` VALUES (305, '支付订单', 1, 'com.ruoyi.bigtian.controller.PayOrderController.add()', 'POST', 1, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', NULL, '/bigtian/payOrder', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-05-18T18:39:38.999+08:00\",\"id\":1659146723517673472,\"parkId\":1659143804919623680,\"status\":1,\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-18 18:39:39');
INSERT INTO `sys_oper_log` VALUES (306, '附件', 3, 'com.ruoyi.web.controller.bigtian.AttachmentController.removeByUrl()', 'DELETE', 1, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', NULL, '/bigtian/attachment/del', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-18 18:47:12');
INSERT INTO `sys_oper_log` VALUES (307, '附件', 3, 'com.ruoyi.web.controller.bigtian.AttachmentController.removeByUrl()', 'DELETE', 1, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', NULL, '/bigtian/attachment/del', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-18 18:53:17');
INSERT INTO `sys_oper_log` VALUES (308, '合同共赢', 1, 'com.ruoyi.web.controller.bigtian.JoinUsController.add()', 'POST', 1, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', NULL, '/bigtian/joinUs', '127.0.0.1', '内网IP', '{\"atts\":\"1659150207243661312\",\"content\":\"首先，我们将与您共同制定一个合作协议，明确双方的权责和合作方式。在此基础上，我们将提供专业的停车场管理团队，负责日常的运营和管理工作。这包括但不限于停车场的布局设计、设备维护、车位管理、收费系统的建立与维护等。\\n\\n我们将充分利用我们的资源和技术优势，通过推广和市场营销策略，为您的停车场吸引更多的用户和客流量。我们将建立一个高效的预订系统，方便用户提前预定停车位，减少用户等待时间\",\"createBy\":\"100\",\"createTime\":\"2023-05-18T18:53:32.621+08:00\",\"id\":1659150219981762560,\"linkman\":\"焦恒鑫\",\"params\":{},\"phone\":\"18012275669\",\"state\":\"wait_apply\",\"title\":\"大面积停车场入住合作\",\"updateBy\":\"100\",\"updateTime\":\"2023-05-18T18:53:32.621+08:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-18 18:53:32');
INSERT INTO `sys_oper_log` VALUES (309, '合同共赢', 2, 'com.ruoyi.web.controller.bigtian.JoinUsController.edit()', 'PUT', 1, 'admin', NULL, '/bigtian/joinUs', '127.0.0.1', '内网IP', '{\"attCount\":1,\"atts\":\"https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/18/tlBx0gEz2YfK4f8025926e88229bf33dabdefec9f479_20230518185328A013.png\",\"content\":\"首先，我们将与您共同制定一个合作协议，明确双方的权责和合作方式。在此基础上，我们将提供专业的停车场管理团队，负责日常的运营和管理工作。这包括但不限于停车场的布局设计、设备维护、车位管理、收费系统的建立与维护等。\\n\\n我们将充分利用我们的资源和技术优势，通过推广和市场营销策略，为您的停车场吸引更多的用户和客流量。我们将建立一个高效的预订系统，方便用户提前预定停车位，减少用户等待时间\",\"createBy\":\"100\",\"createTime\":\"2023-05-18 18:53:00\",\"id\":1659150219981762560,\"linkman\":\"焦恒鑫\",\"params\":{},\"phone\":\"18012275669\",\"remark\":\"同意\",\"state\":\"apply_success\",\"title\":\"大面积停车场入住合作\",\"updateBy\":\"1\",\"updateTime\":\"2023-05-18T19:00:24.034+08:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-18 19:00:24');
INSERT INTO `sys_oper_log` VALUES (310, '反馈', 1, 'com.ruoyi.web.controller.bigtian.FeedbackController.add()', 'POST', 1, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', NULL, '/bigtian/feedback', '127.0.0.1', '内网IP', '{\"content\":\"603车位有污损\",\"createBy\":\"100\",\"createTime\":\"2023-05-18T19:05:28.009+08:00\",\"id\":1659153220536512512,\"params\":{},\"phone\":\"18012275669\",\"state\":\"wait_apply\",\"title\":\"603车位有污损\",\"updateBy\":\"100\",\"updateTime\":\"2023-05-18T19:05:28.009+08:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-18 19:05:28');
INSERT INTO `sys_oper_log` VALUES (311, '反馈', 2, 'com.ruoyi.web.controller.bigtian.FeedbackController.edit()', 'PUT', 1, 'admin', NULL, '/bigtian/feedback', '127.0.0.1', '内网IP', '{\"content\":\"603车位有污损\",\"createBy\":\"100\",\"createTime\":\"2023-05-18 19:05:00\",\"id\":1659153220536512512,\"measure\":\"已处理完毕\\n\",\"params\":{},\"phone\":\"18012275669\",\"state\":\"apply_success\",\"title\":\"603车位有污损\",\"updateBy\":\"1\",\"updateTime\":\"2023-05-18T19:06:23.899+08:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-18 19:06:23');
INSERT INTO `sys_oper_log` VALUES (312, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":true,\"avatar\":\"https://bigdai.oss-cn-hangzhou.aliyuncs.com/2022/06/30/blob_20220630150520A004.jpeg\",\"createBy\":\"admin\",\"createTime\":\"2021-09-24 02:01:00\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"ry@163.com\",\"loginDate\":\"2022-06-30 14:52:50\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"焦\",\"params\":{},\"phonenumber\":\"15888888888\",\"remark\":\"管理员\",\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":\"1\",\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateTime\":\"2023-05-18T19:07:27.676+08:00\",\"userId\":1,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-18 19:07:27');
INSERT INTO `sys_oper_log` VALUES (313, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/18/blob_20230518190737A014.jpeg\",\"code\":200}', 0, NULL, '2023-05-18 19:07:37');
INSERT INTO `sys_oper_log` VALUES (314, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'ry', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"/static/img/profile.473f5971.jpg\",\"createBy\":\"admin\",\"createTime\":\"2021-09-24 02:01:00\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2021-10-27 17:14:51\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"普通焦\",\"params\":{},\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":\"2\",\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateTime\":\"2023-05-18T19:08:09.702+08:00\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-18 19:08:09');
INSERT INTO `sys_oper_log` VALUES (315, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"createTime\":\"2023-05-18T19:11:07.06+08:00\",\"deptId\":103,\"nickName\":\"jiao\",\"params\":{},\"postIds\":[1],\"roleIds\":[100,2],\"sex\":\"2\",\"status\":\"0\",\"updateTime\":\"2023-05-18T19:11:07.06+08:00\",\"userId\":101,\"userName\":\"jiao\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-18 19:11:07');
INSERT INTO `sys_oper_log` VALUES (316, '合同共赢', 5, 'com.ruoyi.web.controller.bigtian.JoinUsController.export()', 'POST', 1, 'admin', NULL, '/bigtian/joinUs/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2023-05-19 14:02:07');
INSERT INTO `sys_oper_log` VALUES (317, '合同共赢', 5, 'com.ruoyi.web.controller.bigtian.JoinUsController.export()', 'POST', 1, 'admin', NULL, '/bigtian/joinUs/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2023-05-19 14:02:13');
INSERT INTO `sys_oper_log` VALUES (318, '合同共赢', 5, 'com.ruoyi.web.controller.bigtian.JoinUsController.export()', 'POST', 1, 'admin', NULL, '/bigtian/joinUs/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2023-05-19 14:02:22');
INSERT INTO `sys_oper_log` VALUES (319, '停车场', 1, 'com.ruoyi.web.controller.bigtian.ParksController.add()', 'POST', 1, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', NULL, '/bigtian/parks', '127.0.0.1', '内网IP', '{\"atts\":\"1659746505126719488,1659746508767375360,1659746509757231104,1659746510818390016\",\"createBy\":\"100\",\"createTime\":\"2023-05-20T10:23:37.572+08:00\",\"id\":1659746670776561664,\"latitude\":\"32.09636\",\"linkman\":\"焦恒鑫\",\"longitude\":\"118.90907\",\"name\":\"停车场1\",\"params\":{},\"phone\":\"18012275669\",\"pointDetail\":\"江苏省南京市栖霞区文枢东路1号\",\"pointName\":\"仙林南京市栖霞区人民政府(敬文街南)\",\"price\":5,\"rates\":\"<p>1、住宅小区物业管理区域最高地面停车服务收费标准每车每月70元。临时社会车辆首小时内不收费，超过1小时按2元/小时收费(不足1小时按1小时收费)，每天(24小时内)最高收取10元。</p><p><br></p><p>2.普通住宅小区业主拥有产权或者使用权的车库或者车库内的车位，按照普通住宅物业服务收费标准收取物业服务费。</p><p><br></p><p style=\\\"text-align: left;\\\">3.住宅和非住宅小区，住宅业主按小区住宅物业服务费标准收取，非住宅业主按市场调节价收取。</p>\",\"residueVehicleNum\":401,\"state\":\"wait_apply\",\"textContent\":\"1、住宅小区物业管理区域最高地面停车服务收费标准每车每月70元。临时社会车辆首小时内不收费，超过1小时按2元/小时收费(不足1小时按1小时收费)，每天(24小时内)最高收取10元。2.普通住宅小区业主拥有产权或者使用权的车库或者车库内的车位，按照普通住宅物业服务收费标准收取物业服务费。3.住宅和非住宅小区，住宅业主按小区住宅物业服务费标准收取，非住宅业主按市场调节价收取。\",\"updateBy\":\"100\",\"updateTime\":\"2023-05-20T10:23:37.572+08:00\",\"vehicleNum\":401}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-20 10:23:37');
INSERT INTO `sys_oper_log` VALUES (320, '支付订单', 1, 'com.ruoyi.bigtian.controller.PayOrderController.add()', 'POST', 1, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', NULL, '/bigtian/payOrder', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-05-20T11:07:57.485+08:00\",\"id\":1659757827277074432,\"parkId\":1659143804919623680,\"status\":1,\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-20 11:07:57');
INSERT INTO `sys_oper_log` VALUES (321, '停车场', 1, 'com.ruoyi.web.controller.bigtian.ParksController.add()', 'POST', 1, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', NULL, '/bigtian/parks', '127.0.0.1', '内网IP', '{\"atts\":\"1659762897641156608,1659762899314683904,1659762900325511168,1659762901537665024\",\"createBy\":\"100\",\"createTime\":\"2023-05-20T11:29:48.715+08:00\",\"id\":1659763326957531136,\"latitude\":\"32.086866\",\"linkman\":\"焦恒鑫\",\"longitude\":\"118.797697\",\"name\":\"南京站\",\"params\":{},\"phone\":\"18012275669\",\"pointDetail\":\"江苏省南京市玄武区龙蟠路264号\",\"pointName\":\"南京站\",\"price\":10,\"rates\":\"<p style=\\\"text-align: left;\\\">南京站车位</p>\",\"residueVehicleNum\":101,\"state\":\"wait_apply\",\"textContent\":\"南京站车位\",\"updateBy\":\"100\",\"updateTime\":\"2023-05-20T11:29:48.715+08:00\",\"vehicleNum\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-20 11:29:48');
INSERT INTO `sys_oper_log` VALUES (322, '停车场', 1, 'com.ruoyi.web.controller.bigtian.ParksController.add()', 'POST', 1, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', NULL, '/bigtian/parks', '127.0.0.1', '内网IP', '{\"atts\":\"1659762897641156608,1659762899314683904,1659762900325511168,1659762901537665024\",\"createBy\":\"100\",\"createTime\":\"2023-05-20T11:29:52.415+08:00\",\"id\":1659763342476455936,\"latitude\":\"32.086866\",\"linkman\":\"焦恒鑫\",\"longitude\":\"118.797697\",\"name\":\"南京站\",\"params\":{},\"phone\":\"18012275669\",\"pointDetail\":\"江苏省南京市玄武区龙蟠路264号\",\"pointName\":\"南京站\",\"price\":10,\"rates\":\"<p style=\\\"text-align: left;\\\">南京站车位</p>\",\"residueVehicleNum\":101,\"state\":\"wait_apply\",\"textContent\":\"南京站车位\",\"updateBy\":\"100\",\"updateTime\":\"2023-05-20T11:29:52.415+08:00\",\"vehicleNum\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-20 11:29:52');
INSERT INTO `sys_oper_log` VALUES (323, '停车场', 1, 'com.ruoyi.web.controller.bigtian.ParksController.add()', 'POST', 1, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', NULL, '/bigtian/parks', '127.0.0.1', '内网IP', '{\"atts\":\"1659776504038830080,1659776507255861248,1659776508468015104,1659776509541756928\",\"createBy\":\"100\",\"createTime\":\"2023-05-20T12:22:16.718+08:00\",\"id\":1659776530639106048,\"latitude\":\"32.09636\",\"linkman\":\"焦恒鑫\",\"longitude\":\"118.90907\",\"name\":\"park\",\"params\":{},\"phone\":\"18012275669\",\"pointDetail\":\"江苏省南京市栖霞区文枢东路1号\",\"pointName\":\"仙林南京市栖霞区人民政府(敬文街南)\",\"price\":5,\"rates\":\"<p style=\\\"text-align: left;\\\"><span style=\\\"font-size: 14px;\\\">收费标准</span></p>\",\"residueVehicleNum\":123,\"state\":\"wait_apply\",\"textContent\":\"收费标准\",\"updateBy\":\"100\",\"updateTime\":\"2023-05-20T12:22:16.718+08:00\",\"vehicleNum\":123}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-20 12:22:16');
INSERT INTO `sys_oper_log` VALUES (324, '合同共赢', 1, 'com.ruoyi.web.controller.bigtian.JoinUsController.add()', 'POST', 1, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', NULL, '/bigtian/joinUs', '127.0.0.1', '内网IP', '{\"atts\":\"1659777049659060224\",\"content\":\"首先，我们将与您共同制定一个合作协议，明确双方的权责和合作方式。在此基础上，我们将提供专业的停车场管理团队，负责日常的运营和管理工作。这包括但不限于停车场的布局设计、设备维护、车位管理、收费系统的建立与维护等。 我们将充分利用我们的资源和技术优势，通过推广和市场营销策略，为您的停车场吸引更多的用户和客流量。我们将建立一个高效的预订系统，方便用户提前预定停车位，减少用户等待时间\",\"createBy\":\"100\",\"createTime\":\"2023-05-20T12:25:00.533+08:00\",\"id\":1659777217729015808,\"linkman\":\"焦恒鑫\",\"params\":{},\"phone\":\"18012275669\",\"state\":\"wait_apply\",\"title\":\"大面积停车场入住合作\",\"updateBy\":\"100\",\"updateTime\":\"2023-05-20T12:25:00.533+08:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-20 12:25:00');
INSERT INTO `sys_oper_log` VALUES (325, '反馈', 1, 'com.ruoyi.web.controller.bigtian.FeedbackController.add()', 'POST', 1, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', NULL, '/bigtian/feedback', '127.0.0.1', '内网IP', '{\"content\":\"603车位有污损\",\"createBy\":\"100\",\"createTime\":\"2023-05-20T12:26:46.022+08:00\",\"id\":1659777660181950464,\"params\":{},\"phone\":\"18012275669\",\"state\":\"wait_apply\",\"title\":\"603车位有污损\",\"updateBy\":\"100\",\"updateTime\":\"2023-05-20T12:26:46.022+08:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-20 12:26:46');
INSERT INTO `sys_oper_log` VALUES (326, '反馈', 2, 'com.ruoyi.web.controller.bigtian.FeedbackController.edit()', 'PUT', 1, 'admin', NULL, '/bigtian/feedback', '127.0.0.1', '内网IP', '{\"content\":\"603车位有污损\",\"createBy\":\"100\",\"createTime\":\"2023-05-20 12:26:00\",\"id\":1659777660181950464,\"measure\":\"已处理\",\"params\":{},\"phone\":\"18012275669\",\"state\":\"apply_success\",\"title\":\"603车位有污损\",\"updateBy\":\"1\",\"updateTime\":\"2023-05-20T12:27:38.443+08:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-20 12:27:38');
INSERT INTO `sys_oper_log` VALUES (327, '反馈', 1, 'com.ruoyi.web.controller.bigtian.FeedbackController.add()', 'POST', 1, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', NULL, '/bigtian/feedback', '127.0.0.1', '内网IP', '{\"content\":\"603有污损\",\"createBy\":\"100\",\"createTime\":\"2023-05-22T08:34:31.43+08:00\",\"id\":1660443989998186496,\"params\":{},\"phone\":\"18012275669\",\"state\":\"wait_apply\",\"title\":\"603有污损\",\"updateBy\":\"100\",\"updateTime\":\"2023-05-22T08:34:31.43+08:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-22 08:34:31');
INSERT INTO `sys_oper_log` VALUES (328, '支付订单', 1, 'com.ruoyi.bigtian.controller.PayOrderController.add()', 'POST', 1, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', NULL, '/bigtian/payOrder', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-05-23T22:25:32.012+08:00\",\"id\":1661015508323282944,\"parkId\":1659746670776561664,\"status\":1,\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-23 22:25:32');
INSERT INTO `sys_oper_log` VALUES (329, '支付订单', 1, 'com.ruoyi.bigtian.controller.PayOrderController.add()', 'POST', 1, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', NULL, '/bigtian/payOrder', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-05-23T23:22:22.939+08:00\",\"id\":1661029814779654144,\"parkId\":1659143804919623680,\"status\":1,\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-23 23:22:22');
INSERT INTO `sys_oper_log` VALUES (330, '合同共赢', 2, 'com.ruoyi.web.controller.bigtian.JoinUsController.edit()', 'PUT', 1, 'admin', NULL, '/bigtian/joinUs', '127.0.0.1', '内网IP', '{\"attCount\":1,\"atts\":\"https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/20/3gLirEis2pml4f8025926e88229bf33dabdefec9f479_20230520122419A017.png\",\"content\":\"首先，我们将与您共同制定一个合作协议，明确双方的权责和合作方式。在此基础上，我们将提供专业的停车场管理团队，负责日常的运营和管理工作。这包括但不限于停车场的布局设计、设备维护、车位管理、收费系统的建立与维护等。 我们将充分利用我们的资源和技术优势，通过推广和市场营销策略，为您的停车场吸引更多的用户和客流量。我们将建立一个高效的预订系统，方便用户提前预定停车位，减少用户等待时间\",\"createBy\":\"100\",\"createTime\":\"2023-05-20 12:25:00\",\"id\":1659777217729015808,\"linkman\":\"焦恒鑫\",\"params\":{},\"phone\":\"18012275669\",\"remark\":\"同意\",\"state\":\"apply_success\",\"title\":\"大面积停车场入住合作\",\"updateBy\":\"1\",\"updateTime\":\"2023-05-23T23:37:26.032+08:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-23 23:37:26');
INSERT INTO `sys_oper_log` VALUES (331, '反馈', 2, 'com.ruoyi.web.controller.bigtian.FeedbackController.edit()', 'PUT', 1, 'admin', NULL, '/bigtian/feedback', '127.0.0.1', '内网IP', '{\"content\":\"603有污损\",\"createBy\":\"100\",\"createTime\":\"2023-05-22 08:34:00\",\"id\":1660443989998186496,\"measure\":\"一打扫\",\"params\":{},\"phone\":\"18012275669\",\"state\":\"apply_success\",\"title\":\"603有污损\",\"updateBy\":\"1\",\"updateTime\":\"2023-05-23T23:38:30.991+08:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-23 23:38:31');
INSERT INTO `sys_oper_log` VALUES (332, '支付订单', 1, 'com.ruoyi.bigtian.controller.PayOrderController.add()', 'POST', 1, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', NULL, '/bigtian/payOrder', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-05-24T10:08:13.691+08:00\",\"id\":1661192347243130880,\"parkId\":1659746670776561664,\"status\":1,\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-24 10:08:13');
INSERT INTO `sys_oper_log` VALUES (333, '支付订单', 1, 'com.ruoyi.bigtian.controller.PayOrderController.add()', 'POST', 1, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', NULL, '/bigtian/payOrder', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-05-24T10:09:34.052+08:00\",\"id\":1661192684259651584,\"parkId\":1659746670776561664,\"status\":1,\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-24 10:09:34');
INSERT INTO `sys_oper_log` VALUES (334, '合同共赢', 5, 'com.ruoyi.web.controller.bigtian.JoinUsController.export()', 'POST', 1, 'admin', NULL, '/bigtian/joinUs/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2023-05-24 10:53:46');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2021-09-24 02:01:36', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2021-09-24 02:01:36', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2021-09-24 02:01:36', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2021-09-24 02:01:36', 'admin', '2021-10-25 04:58:05', '普通角色');
INSERT INTO `sys_role` VALUES (100, '管理员', 'pc_admin', 3, '1', 1, 1, '0', '0', 'admin', '2021-11-19 14:49:20', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2001);
INSERT INTO `sys_role_menu` VALUES (2, 2002);
INSERT INTO `sys_role_menu` VALUES (2, 2003);
INSERT INTO `sys_role_menu` VALUES (2, 2004);
INSERT INTO `sys_role_menu` VALUES (2, 2005);
INSERT INTO `sys_role_menu` VALUES (100, 1);
INSERT INTO `sys_role_menu` VALUES (100, 2);
INSERT INTO `sys_role_menu` VALUES (100, 3);
INSERT INTO `sys_role_menu` VALUES (100, 100);
INSERT INTO `sys_role_menu` VALUES (100, 101);
INSERT INTO `sys_role_menu` VALUES (100, 102);
INSERT INTO `sys_role_menu` VALUES (100, 103);
INSERT INTO `sys_role_menu` VALUES (100, 104);
INSERT INTO `sys_role_menu` VALUES (100, 105);
INSERT INTO `sys_role_menu` VALUES (100, 106);
INSERT INTO `sys_role_menu` VALUES (100, 107);
INSERT INTO `sys_role_menu` VALUES (100, 108);
INSERT INTO `sys_role_menu` VALUES (100, 109);
INSERT INTO `sys_role_menu` VALUES (100, 110);
INSERT INTO `sys_role_menu` VALUES (100, 111);
INSERT INTO `sys_role_menu` VALUES (100, 112);
INSERT INTO `sys_role_menu` VALUES (100, 113);
INSERT INTO `sys_role_menu` VALUES (100, 114);
INSERT INTO `sys_role_menu` VALUES (100, 115);
INSERT INTO `sys_role_menu` VALUES (100, 116);
INSERT INTO `sys_role_menu` VALUES (100, 500);
INSERT INTO `sys_role_menu` VALUES (100, 501);
INSERT INTO `sys_role_menu` VALUES (100, 1001);
INSERT INTO `sys_role_menu` VALUES (100, 1002);
INSERT INTO `sys_role_menu` VALUES (100, 1003);
INSERT INTO `sys_role_menu` VALUES (100, 1004);
INSERT INTO `sys_role_menu` VALUES (100, 1005);
INSERT INTO `sys_role_menu` VALUES (100, 1006);
INSERT INTO `sys_role_menu` VALUES (100, 1007);
INSERT INTO `sys_role_menu` VALUES (100, 1008);
INSERT INTO `sys_role_menu` VALUES (100, 1009);
INSERT INTO `sys_role_menu` VALUES (100, 1010);
INSERT INTO `sys_role_menu` VALUES (100, 1011);
INSERT INTO `sys_role_menu` VALUES (100, 1012);
INSERT INTO `sys_role_menu` VALUES (100, 1013);
INSERT INTO `sys_role_menu` VALUES (100, 1014);
INSERT INTO `sys_role_menu` VALUES (100, 1015);
INSERT INTO `sys_role_menu` VALUES (100, 1016);
INSERT INTO `sys_role_menu` VALUES (100, 1017);
INSERT INTO `sys_role_menu` VALUES (100, 1018);
INSERT INTO `sys_role_menu` VALUES (100, 1019);
INSERT INTO `sys_role_menu` VALUES (100, 1020);
INSERT INTO `sys_role_menu` VALUES (100, 1021);
INSERT INTO `sys_role_menu` VALUES (100, 1022);
INSERT INTO `sys_role_menu` VALUES (100, 1023);
INSERT INTO `sys_role_menu` VALUES (100, 1024);
INSERT INTO `sys_role_menu` VALUES (100, 1025);
INSERT INTO `sys_role_menu` VALUES (100, 1026);
INSERT INTO `sys_role_menu` VALUES (100, 1027);
INSERT INTO `sys_role_menu` VALUES (100, 1028);
INSERT INTO `sys_role_menu` VALUES (100, 1029);
INSERT INTO `sys_role_menu` VALUES (100, 1030);
INSERT INTO `sys_role_menu` VALUES (100, 1031);
INSERT INTO `sys_role_menu` VALUES (100, 1032);
INSERT INTO `sys_role_menu` VALUES (100, 1033);
INSERT INTO `sys_role_menu` VALUES (100, 1034);
INSERT INTO `sys_role_menu` VALUES (100, 1035);
INSERT INTO `sys_role_menu` VALUES (100, 1036);
INSERT INTO `sys_role_menu` VALUES (100, 1037);
INSERT INTO `sys_role_menu` VALUES (100, 1038);
INSERT INTO `sys_role_menu` VALUES (100, 1039);
INSERT INTO `sys_role_menu` VALUES (100, 1040);
INSERT INTO `sys_role_menu` VALUES (100, 1041);
INSERT INTO `sys_role_menu` VALUES (100, 1042);
INSERT INTO `sys_role_menu` VALUES (100, 1043);
INSERT INTO `sys_role_menu` VALUES (100, 1044);
INSERT INTO `sys_role_menu` VALUES (100, 1045);
INSERT INTO `sys_role_menu` VALUES (100, 1046);
INSERT INTO `sys_role_menu` VALUES (100, 1047);
INSERT INTO `sys_role_menu` VALUES (100, 1048);
INSERT INTO `sys_role_menu` VALUES (100, 1049);
INSERT INTO `sys_role_menu` VALUES (100, 1050);
INSERT INTO `sys_role_menu` VALUES (100, 1051);
INSERT INTO `sys_role_menu` VALUES (100, 1052);
INSERT INTO `sys_role_menu` VALUES (100, 1053);
INSERT INTO `sys_role_menu` VALUES (100, 1054);
INSERT INTO `sys_role_menu` VALUES (100, 1055);
INSERT INTO `sys_role_menu` VALUES (100, 1056);
INSERT INTO `sys_role_menu` VALUES (100, 1057);
INSERT INTO `sys_role_menu` VALUES (100, 1058);
INSERT INTO `sys_role_menu` VALUES (100, 1059);
INSERT INTO `sys_role_menu` VALUES (100, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '焦', '00', 'ry@163.com', '15888888888', '1', 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/18/blob_20230518190737A014.jpeg', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-05-24 15:40:52', 'admin', '2021-09-24 02:01:36', '', '2023-05-24 15:40:52', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '普通焦', '00', 'ry@qq.com', '15666666666', '1', '/static/img/profile.473f5971.jpg', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-05-19 20:59:39', 'admin', '2021-09-24 02:01:36', '', '2023-05-19 20:59:39', '测试员');
INSERT INTO `sys_user` VALUES (100, NULL, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', '温柔的小怪兽', '00', '', '', '0', 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/16/Wb3TJizg6KFp27f04c5949fe7e5bf472ef4ddca7893a_20230516141713A002.jpeg', '$2a$10$Cxet10kYdz/UUQkUrBrDH.ioBwHj6vhHqK5lPURlC2kh2SdFYG8He', '0', '0', '127.0.0.1', '2023-07-19 16:50:24', '', '2023-05-16 14:18:48', '', '2023-07-19 16:50:24', NULL);
INSERT INTO `sys_user` VALUES (101, 103, 'jiao', 'jiao', '00', '', '', '2', '', '$2a$10$BI2qEkzN3dOu8ozcvZPWMOwdrqN0Ck/sxnhTbVOQL6tlR5tFL1LmO', '0', '0', '127.0.0.1', '2023-05-19 21:00:02', 'admin', '2023-05-18 19:11:07', '', '2023-05-19 21:00:01', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (101, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (101, 2);
INSERT INTO `sys_user_role` VALUES (101, 100);

-- ----------------------------
-- Table structure for t_attachment
-- ----------------------------
DROP TABLE IF EXISTS `t_attachment`;
CREATE TABLE `t_attachment`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `busi_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '来源id',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'url地址',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '上传方式：local-本地上传，oss-阿里云oss',
  `source_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '原始名称',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '附件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_attachment
-- ----------------------------
INSERT INTO `t_attachment` VALUES (1542403915646382080, NULL, 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2022/06/30/blob_20220630150520A004.jpeg', 'oss', '2022/06/30/blob_20220630150520A004.jpeg', '1', '2022-06-30 15:05:25', '1', '2022-06-30 15:05:25');
INSERT INTO `t_attachment` VALUES (1658355293656330240, NULL, 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/16/fi23tl02pQAje215381bf7e4ed53f48a6394d52cb02b_20230516141446A001.jpeg', 'oss', '2023/05/16/fi23tl02pQAje215381bf7e4ed53f48a6394d52cb02b_20230516141446A001.jpeg', 'WechatUser', '2023-05-16 14:14:47', NULL, '2023-05-16 14:14:47');
INSERT INTO `t_attachment` VALUES (1658355909795393536, NULL, 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/16/Wb3TJizg6KFp27f04c5949fe7e5bf472ef4ddca7893a_20230516141713A002.jpeg', 'oss', '2023/05/16/Wb3TJizg6KFp27f04c5949fe7e5bf472ef4ddca7893a_20230516141713A002.jpeg', 'WechatUser', '2023-05-16 14:17:14', NULL, '2023-05-16 14:17:14');
INSERT INTO `t_attachment` VALUES (1659141596807311360, NULL, 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/18/INl2NN3MszD6c867ec6d44fa0a6772f785e622c6d213_20230518181916A001.jpeg', 'oss', '2023/05/18/INl2NN3MszD6c867ec6d44fa0a6772f785e622c6d213_20230518181916A001.jpeg', 'WechatUser', '2023-05-18 18:19:17', NULL, '2023-05-18 18:19:17');
INSERT INTO `t_attachment` VALUES (1659142301232279552, NULL, 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/18/GzstlwG6NIOz6ef66abd16bf993c453e1f03c51bac7a_20230518182204A002.png', 'oss', '2023/05/18/GzstlwG6NIOz6ef66abd16bf993c453e1f03c51bac7a_20230518182204A002.png', '100', '2023-05-18 18:22:05', '100', '2023-05-18 18:22:05');
INSERT INTO `t_attachment` VALUES (1659142309973209088, NULL, 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/18/ALM12QSgPsrK1b71cd6a2e48622dd6ea8fb9f7126f63_20230518182206A003.png', 'oss', '2023/05/18/ALM12QSgPsrK1b71cd6a2e48622dd6ea8fb9f7126f63_20230518182206A003.png', '100', '2023-05-18 18:22:07', '100', '2023-05-18 18:22:07');
INSERT INTO `t_attachment` VALUES (1659142318705750016, NULL, 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/18/ZShfx3oPMlrsb381a407203945d2b7132b49eb941fe9_20230518182208A004.png', 'oss', '2023/05/18/ZShfx3oPMlrsb381a407203945d2b7132b49eb941fe9_20230518182208A004.png', '100', '2023-05-18 18:22:09', '100', '2023-05-18 18:22:09');
INSERT INTO `t_attachment` VALUES (1659142328449118208, NULL, 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/18/8r5UdcojpmZx4426028a9861dea71794bbf111dbdba4_20230518182210A005.png', 'oss', '2023/05/18/8r5UdcojpmZx4426028a9861dea71794bbf111dbdba4_20230518182210A005.png', '100', '2023-05-18 18:22:11', '100', '2023-05-18 18:22:11');
INSERT INTO `t_attachment` VALUES (1659142496380661760, '1659143804919623680', 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/18/cb9GIr7ls2t26ef66abd16bf993c453e1f03c51bac7a_20230518182249A006.png', 'oss', '2023/05/18/cb9GIr7ls2t26ef66abd16bf993c453e1f03c51bac7a_20230518182249A006.png', '100', '2023-05-18 18:22:51', '100', '2023-05-18 18:22:51');
INSERT INTO `t_attachment` VALUES (1659142501187334144, '1659143804919623680', 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/18/SuITuhxVthyd1b71cd6a2e48622dd6ea8fb9f7126f63_20230518182251A007.png', 'oss', '2023/05/18/SuITuhxVthyd1b71cd6a2e48622dd6ea8fb9f7126f63_20230518182251A007.png', '100', '2023-05-18 18:22:52', '100', '2023-05-18 18:22:52');
INSERT INTO `t_attachment` VALUES (1659142510876176384, '1659143804919623680', 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/18/0eibYI4RmI1eb381a407203945d2b7132b49eb941fe9_20230518182254A008.png', 'oss', '2023/05/18/0eibYI4RmI1eb381a407203945d2b7132b49eb941fe9_20230518182254A008.png', '100', '2023-05-18 18:22:55', '100', '2023-05-18 18:22:55');
INSERT INTO `t_attachment` VALUES (1659142520036536320, '1659143804919623680', 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/18/DxApTpyKlREF4426028a9861dea71794bbf111dbdba4_20230518182256A009.png', 'oss', '2023/05/18/DxApTpyKlREF4426028a9861dea71794bbf111dbdba4_20230518182256A009.png', '100', '2023-05-18 18:22:57', '100', '2023-05-18 18:22:57');
INSERT INTO `t_attachment` VALUES (1659143033931051008, NULL, 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/18/tdEtn0rlwJnc4f8025926e88229bf33dabdefec9f479_20230518182458A010.png', 'oss', '2023/05/18/tdEtn0rlwJnc4f8025926e88229bf33dabdefec9f479_20230518182458A010.png', '100', '2023-05-18 18:24:59', '100', '2023-05-18 18:24:59');
INSERT INTO `t_attachment` VALUES (1659150207243661312, '1659150219981762560', 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/18/tlBx0gEz2YfK4f8025926e88229bf33dabdefec9f479_20230518185328A013.png', 'oss', '2023/05/18/tlBx0gEz2YfK4f8025926e88229bf33dabdefec9f479_20230518185328A013.png', '100', '2023-05-18 18:53:30', '100', '2023-05-18 18:53:30');
INSERT INTO `t_attachment` VALUES (1659153764932005888, NULL, 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/18/blob_20230518190737A014.jpeg', 'oss', '2023/05/18/blob_20230518190737A014.jpeg', '1', '2023-05-18 19:07:38', '1', '2023-05-18 19:07:38');
INSERT INTO `t_attachment` VALUES (1659744783046160384, NULL, 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/20/v2Zq6gdT2u0p1c7d981c9ddb0e4095db0d0e5529cc9a_20230520101607A001.jpeg', 'oss', '2023/05/20/v2Zq6gdT2u0p1c7d981c9ddb0e4095db0d0e5529cc9a_20230520101607A001.jpeg', 'WechatUser', '2023-05-20 10:16:08', NULL, '2023-05-20 10:16:08');
INSERT INTO `t_attachment` VALUES (1659746505126719488, '1659746670776561664', 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/20/Gy8S0WUvpSzc6ef66abd16bf993c453e1f03c51bac7a_20230520102257A002.png', 'oss', '2023/05/20/Gy8S0WUvpSzc6ef66abd16bf993c453e1f03c51bac7a_20230520102257A002.png', '100', '2023-05-20 10:22:58', '100', '2023-05-20 10:22:58');
INSERT INTO `t_attachment` VALUES (1659746508767375360, '1659746670776561664', 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/20/CewDxZw1xxGg1b71cd6a2e48622dd6ea8fb9f7126f63_20230520102258A003.png', 'oss', '2023/05/20/CewDxZw1xxGg1b71cd6a2e48622dd6ea8fb9f7126f63_20230520102258A003.png', '100', '2023-05-20 10:22:59', '100', '2023-05-20 10:22:59');
INSERT INTO `t_attachment` VALUES (1659746509757231104, '1659746670776561664', 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/20/DU8gFJpDrIY0b381a407203945d2b7132b49eb941fe9_20230520102258A004.png', 'oss', '2023/05/20/DU8gFJpDrIY0b381a407203945d2b7132b49eb941fe9_20230520102258A004.png', '100', '2023-05-20 10:22:59', '100', '2023-05-20 10:22:59');
INSERT INTO `t_attachment` VALUES (1659746510818390016, '1659746670776561664', 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/20/cbV6QJ8zoRrF4426028a9861dea71794bbf111dbdba4_20230520102259A005.png', 'oss', '2023/05/20/cbV6QJ8zoRrF4426028a9861dea71794bbf111dbdba4_20230520102259A005.png', '100', '2023-05-20 10:22:59', '100', '2023-05-20 10:22:59');
INSERT INTO `t_attachment` VALUES (1659754337406431232, NULL, 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/20/k586mwclten03a6322b635e2dcfd2b9cb7a03f2075ef_20230520105405A006.jpeg', 'oss', '2023/05/20/k586mwclten03a6322b635e2dcfd2b9cb7a03f2075ef_20230520105405A006.jpeg', 'WechatUser', '2023-05-20 10:54:05', NULL, '2023-05-20 10:54:05');
INSERT INTO `t_attachment` VALUES (1659762897641156608, '1659763342476455936', 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/20/dtjZkpSO3n2i6ef66abd16bf993c453e1f03c51bac7a_20230520112806A007.png', 'oss', '2023/05/20/dtjZkpSO3n2i6ef66abd16bf993c453e1f03c51bac7a_20230520112806A007.png', '100', '2023-05-20 11:28:06', '100', '2023-05-20 11:28:06');
INSERT INTO `t_attachment` VALUES (1659762899314683904, '1659763342476455936', 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/20/jGGakySImwsJ1b71cd6a2e48622dd6ea8fb9f7126f63_20230520112806A008.png', 'oss', '2023/05/20/jGGakySImwsJ1b71cd6a2e48622dd6ea8fb9f7126f63_20230520112806A008.png', '100', '2023-05-20 11:28:07', '100', '2023-05-20 11:28:07');
INSERT INTO `t_attachment` VALUES (1659762900325511168, '1659763342476455936', 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/20/sIMoiWioWh9Bb381a407203945d2b7132b49eb941fe9_20230520112806A009.png', 'oss', '2023/05/20/sIMoiWioWh9Bb381a407203945d2b7132b49eb941fe9_20230520112806A009.png', '100', '2023-05-20 11:28:07', '100', '2023-05-20 11:28:07');
INSERT INTO `t_attachment` VALUES (1659762901537665024, '1659763342476455936', 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/20/wqOEULIrgHde4426028a9861dea71794bbf111dbdba4_20230520112807A010.png', 'oss', '2023/05/20/wqOEULIrgHde4426028a9861dea71794bbf111dbdba4_20230520112807A010.png', '100', '2023-05-20 11:28:07', '100', '2023-05-20 11:28:07');
INSERT INTO `t_attachment` VALUES (1659762921729044480, NULL, 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/20/Bh6N7qImvDmM4f8025926e88229bf33dabdefec9f479_20230520112811A011.png', 'oss', '2023/05/20/Bh6N7qImvDmM4f8025926e88229bf33dabdefec9f479_20230520112811A011.png', '100', '2023-05-20 11:28:12', '100', '2023-05-20 11:28:12');
INSERT INTO `t_attachment` VALUES (1659769394710327296, NULL, 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/20/4NT5OsAzFTMgebb7c4099f0bd409c2a21f4b1fb0cd6d_20230520115355A012.jpeg', 'oss', '2023/05/20/4NT5OsAzFTMgebb7c4099f0bd409c2a21f4b1fb0cd6d_20230520115355A012.jpeg', 'WechatUser', '2023-05-20 11:53:55', NULL, '2023-05-20 11:53:55');
INSERT INTO `t_attachment` VALUES (1659776504038830080, '1659776530639106048', 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/20/yoXUfjqiVgk86ef66abd16bf993c453e1f03c51bac7a_20230520122210A013.png', 'oss', '2023/05/20/yoXUfjqiVgk86ef66abd16bf993c453e1f03c51bac7a_20230520122210A013.png', '100', '2023-05-20 12:22:10', '100', '2023-05-20 12:22:10');
INSERT INTO `t_attachment` VALUES (1659776507255861248, '1659776530639106048', 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/20/3Br6BPdfzA3J1b71cd6a2e48622dd6ea8fb9f7126f63_20230520122210A014.png', 'oss', '2023/05/20/3Br6BPdfzA3J1b71cd6a2e48622dd6ea8fb9f7126f63_20230520122210A014.png', '100', '2023-05-20 12:22:11', '100', '2023-05-20 12:22:11');
INSERT INTO `t_attachment` VALUES (1659776508468015104, '1659776530639106048', 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/20/c3fJTWQkLWDGb381a407203945d2b7132b49eb941fe9_20230520122211A015.png', 'oss', '2023/05/20/c3fJTWQkLWDGb381a407203945d2b7132b49eb941fe9_20230520122211A015.png', '100', '2023-05-20 12:22:11', '100', '2023-05-20 12:22:11');
INSERT INTO `t_attachment` VALUES (1659776509541756928, '1659776530639106048', 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/20/rppBZYzJ3rTF4426028a9861dea71794bbf111dbdba4_20230520122211A016.png', 'oss', '2023/05/20/rppBZYzJ3rTF4426028a9861dea71794bbf111dbdba4_20230520122211A016.png', '100', '2023-05-20 12:22:12', '100', '2023-05-20 12:22:12');
INSERT INTO `t_attachment` VALUES (1659777049659060224, '1659777217729015808', 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/20/3gLirEis2pml4f8025926e88229bf33dabdefec9f479_20230520122419A017.png', 'oss', '2023/05/20/3gLirEis2pml4f8025926e88229bf33dabdefec9f479_20230520122419A017.png', '100', '2023-05-20 12:24:20', '100', '2023-05-20 12:24:20');
INSERT INTO `t_attachment` VALUES (1660443849296064512, NULL, 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/22/4A41q8svHl6N13602d481a5ec3e4dcb420078491cf4b_20230522083357A001.jpeg', 'oss', '2023/05/22/4A41q8svHl6N13602d481a5ec3e4dcb420078491cf4b_20230522083357A001.jpeg', 'WechatUser', '2023-05-22 08:33:58', NULL, '2023-05-22 08:33:58');
INSERT INTO `t_attachment` VALUES (1660447685846904832, NULL, 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/22/KewIllh5bSd2b8f7898eef03893afe50f219bf89447c_20230522084912A002.jpeg', 'oss', '2023/05/22/KewIllh5bSd2b8f7898eef03893afe50f219bf89447c_20230522084912A002.jpeg', 'WechatUser', '2023-05-22 08:49:13', NULL, '2023-05-22 08:49:13');
INSERT INTO `t_attachment` VALUES (1660979105476521984, NULL, 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/23/yUuxUr9oG5MEec7daf2342637724c866a2b77665af48_20230523200052A001.jpeg', 'oss', '2023/05/23/yUuxUr9oG5MEec7daf2342637724c866a2b77665af48_20230523200052A001.jpeg', 'WechatUser', '2023-05-23 20:00:53', NULL, '2023-05-23 20:00:53');
INSERT INTO `t_attachment` VALUES (1661014134290264064, NULL, 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/23/qQ4PbP3bcpgY7e6c2849f1422132ab5193ef75405287_20230523222004A001.jpeg', 'oss', '2023/05/23/qQ4PbP3bcpgY7e6c2849f1422132ab5193ef75405287_20230523222004A001.jpeg', 'WechatUser', '2023-05-23 22:20:04', NULL, '2023-05-23 22:20:04');
INSERT INTO `t_attachment` VALUES (1661029221193363456, NULL, 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/23/9VTK4hUBRxtje325c7c4d59c73cabe4e3fdd4f97bd0d_20230523232001A001.jpeg', 'oss', '2023/05/23/9VTK4hUBRxtje325c7c4d59c73cabe4e3fdd4f97bd0d_20230523232001A001.jpeg', 'WechatUser', '2023-05-23 23:20:01', NULL, '2023-05-23 23:20:01');
INSERT INTO `t_attachment` VALUES (1661191977439735808, NULL, 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/24/NZrofMt6ZCmlb4df2d6ea9f3e888b08ecc9a750d2732_20230524100645A001.jpeg', 'oss', '2023/05/24/NZrofMt6ZCmlb4df2d6ea9f3e888b08ecc9a750d2732_20230524100645A001.jpeg', 'WechatUser', '2023-05-24 10:06:46', NULL, '2023-05-24 10:06:46');
INSERT INTO `t_attachment` VALUES (1661209160681140224, NULL, 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/24/Wo3SLB0Vs1OIf82e0929f61d12e12ce098ea43427040_20230524111502A002.jpeg', 'oss', '2023/05/24/Wo3SLB0Vs1OIf82e0929f61d12e12ce098ea43427040_20230524111502A002.jpeg', 'WechatUser', '2023-05-24 11:15:02', NULL, '2023-05-24 11:15:02');
INSERT INTO `t_attachment` VALUES (1661209835737591808, NULL, 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/24/sDCryg6ujPwidf095bb7dff7f7a802021361f2ec8381_20230524111743A003.jpeg', 'oss', '2023/05/24/sDCryg6ujPwidf095bb7dff7f7a802021361f2ec8381_20230524111743A003.jpeg', 'WechatUser', '2023-05-24 11:17:43', NULL, '2023-05-24 11:17:43');
INSERT INTO `t_attachment` VALUES (1661236911786045440, NULL, 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/24/bDy5EfBHeg33ec2c2ae4e31ffdd92af24a3ebaf32c52_20230524130518A001.jpeg', 'oss', '2023/05/24/bDy5EfBHeg33ec2c2ae4e31ffdd92af24a3ebaf32c52_20230524130518A001.jpeg', 'WechatUser', '2023-05-24 13:05:19', NULL, '2023-05-24 13:05:19');
INSERT INTO `t_attachment` VALUES (1661258091830063104, NULL, 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/24/6OgQM1NdYxWSd4879c520605c172946ac5cd3e1f7eb3_20230524142928A001.jpeg', 'oss', '2023/05/24/6OgQM1NdYxWSd4879c520605c172946ac5cd3e1f7eb3_20230524142928A001.jpeg', 'WechatUser', '2023-05-24 14:29:28', NULL, '2023-05-24 14:29:28');
INSERT INTO `t_attachment` VALUES (1661258765787607040, NULL, 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/24/5G6Lo86siigH4f1137b98627e29144678dc166e715e6_20230524143208A002.jpeg', 'oss', '2023/05/24/5G6Lo86siigH4f1137b98627e29144678dc166e715e6_20230524143208A002.jpeg', 'WechatUser', '2023-05-24 14:32:09', NULL, '2023-05-24 14:32:09');
INSERT INTO `t_attachment` VALUES (1661267765132406784, NULL, 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/24/31oRLTHddHkF9788170b0d5bdd7afa48fac3785c355f_20230524150754A003.jpeg', 'oss', '2023/05/24/31oRLTHddHkF9788170b0d5bdd7afa48fac3785c355f_20230524150754A003.jpeg', 'WechatUser', '2023-05-24 15:07:55', NULL, '2023-05-24 15:07:55');
INSERT INTO `t_attachment` VALUES (1681587270358282240, NULL, 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/07/19/odCnLgRq1EThbf35aa3c5431ee9bc17f74404554eb02_20230719165021A001.jpeg', 'oss', '2023/07/19/odCnLgRq1EThbf35aa3c5431ee9bc17f74404554eb02_20230719165021A001.jpeg', 'WechatUser', '2023-07-19 16:50:22', NULL, '2023-07-19 16:50:22');

-- ----------------------------
-- Table structure for t_feedback
-- ----------------------------
DROP TABLE IF EXISTS `t_feedback`;
CREATE TABLE `t_feedback`  (
  `id` bigint NOT NULL COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '回访手机号',
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '状态',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `measure` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '应对措施',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '反馈' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_feedback
-- ----------------------------
INSERT INTO `t_feedback` VALUES (1659153220536512512, '603车位有污损', '603车位有污损', '18012275669', 'apply_success', '100', '2023-05-18 19:05:00', '1', '2023-05-18 19:06:24', '已处理完毕\n');
INSERT INTO `t_feedback` VALUES (1659777660181950464, '603车位有污损', '603车位有污损', '18012275669', 'apply_success', '100', '2023-05-20 12:26:00', '1', '2023-05-20 12:27:38', '已处理');
INSERT INTO `t_feedback` VALUES (1660443989998186496, '603有污损', '603有污损', '18012275669', 'apply_success', '100', '2023-05-22 08:34:00', '1', '2023-05-23 23:38:31', '一打扫');

-- ----------------------------
-- Table structure for t_join_us
-- ----------------------------
DROP TABLE IF EXISTS `t_join_us`;
CREATE TABLE `t_join_us`  (
  `id` bigint NOT NULL COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `linkman` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系人',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '详细内容',
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审批意见',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '合同共赢' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_join_us
-- ----------------------------
INSERT INTO `t_join_us` VALUES (1659150219981762560, '大面积停车场入住合作', '焦恒鑫', '18012275669', '首先，我们将与您共同制定一个合作协议，明确双方的权责和合作方式。在此基础上，我们将提供专业的停车场管理团队，负责日常的运营和管理工作。这包括但不限于停车场的布局设计、设备维护、车位管理、收费系统的建立与维护等。\n\n我们将充分利用我们的资源和技术优势，通过推广和市场营销策略，为您的停车场吸引更多的用户和客流量。我们将建立一个高效的预订系统，方便用户提前预定停车位，减少用户等待时间', 'apply_success', '同意', '100', '2023-05-18 18:53:00', '1', '2023-05-18 19:00:24');
INSERT INTO `t_join_us` VALUES (1659777217729015808, '大面积停车场入住合作', '焦恒鑫', '18012275669', '首先，我们将与您共同制定一个合作协议，明确双方的权责和合作方式。在此基础上，我们将提供专业的停车场管理团队，负责日常的运营和管理工作。这包括但不限于停车场的布局设计、设备维护、车位管理、收费系统的建立与维护等。 我们将充分利用我们的资源和技术优势，通过推广和市场营销策略，为您的停车场吸引更多的用户和客流量。我们将建立一个高效的预订系统，方便用户提前预定停车位，减少用户等待时间', 'apply_success', '同意', '100', '2023-05-20 12:25:00', '1', '2023-05-23 23:37:26');

-- ----------------------------
-- Table structure for t_parks
-- ----------------------------
DROP TABLE IF EXISTS `t_parks`;
CREATE TABLE `t_parks`  (
  `id` bigint NOT NULL COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '停车场名称',
  `linkman` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系人',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `vehicle_num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '车位',
  `residue_vehicle_num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '剩余车位',
  `longitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '经度',
  `latitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '维度',
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签',
  `rates` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '收费标准',
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '状态',
  `point_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地图名称',
  `point_detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '详细地址',
  `text_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '文本收费标准',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `price` bigint NULL DEFAULT NULL COMMENT '价格 元/h',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '停车场' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_parks
-- ----------------------------
INSERT INTO `t_parks` VALUES (1659143790583492604, 'park-1', '焦恒鑫', '18012275669', '602', '602', '118.940478', '32.120581', NULL, '<p>道路泊车位收费标准</p><p><br></p><p>一、小型车为30分钟内免费，每增加3个小时加收5元，停车不足3小时的按3小时计算，全天最高限额20元，包月价格为360元。</p><p><br></p><p>二、新能源车为2小时内（含）免费，3小时内（含）3元，每增加3小时加收5元，停车不足3小时的按3小时计算，全天最高限额15元，包月价格为360元。</p><p><br></p><p>三、大型车按照实际占车位数计费。</p><p><br></p><p>四、超过24小时重新按以上规定计收。</p><p><br></p><p style=\"text-align: left;\">五、收费时间为7:30-19:30。<img style=\"max-width:100%;height:auto;\" src=\"https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/18/tdEtn0rlwJnc4f8025926e88229bf33dabdefec9f479_20230518182458A010.png\" class=\"editor-img\" data-custom=\"id=wux-upload--1684405385460-1\"></p><p style=\"text-align: left;\"><br></p>', 'fail_apply', '南京工业职业技术大学', '江苏省南京市栖霞区仙林大学城羊山北路1号', '道路泊车位收费标准一、小型车为30分钟内免费，每增加3个小时加收5元，停车不足3小时的按3小时计算，全天最高限额20元，包月价格为360元。二、新能源车为2小时内（含）免费，3小时内（含）3元，每增加3小时加收5元，停车不足3小时的按3小时计算，全天最高限额15元，包月价格为360元。三、大型车按照实际占车位数计费。四、超过24小时重新按以上规定计收。五、收费时间为7:30-19:30。', '拒绝', '100', '2023-05-18 18:28:00', '1', '2023-05-18 18:33:19', 2);
INSERT INTO `t_parks` VALUES (1659143790583492606, 'park-1', '焦恒鑫', '18012275669', '602', '602', '118.940478', '32.120581', NULL, '<p>道路泊车位收费标准</p><p><br></p><p>一、小型车为30分钟内免费，每增加3个小时加收5元，停车不足3小时的按3小时计算，全天最高限额20元，包月价格为360元。</p><p><br></p><p>二、新能源车为2小时内（含）免费，3小时内（含）3元，每增加3小时加收5元，停车不足3小时的按3小时计算，全天最高限额15元，包月价格为360元。</p><p><br></p><p>三、大型车按照实际占车位数计费。</p><p><br></p><p>四、超过24小时重新按以上规定计收。</p><p><br></p><p style=\"text-align: left;\">五、收费时间为7:30-19:30。<img style=\"max-width:100%;height:auto;\" src=\"https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/18/tdEtn0rlwJnc4f8025926e88229bf33dabdefec9f479_20230518182458A010.png\" class=\"editor-img\" data-custom=\"id=wux-upload--1684405385460-1\"></p><p style=\"text-align: left;\"><br></p>', 'fail_apply', '南京工业职业技术大学', '江苏省南京市栖霞区仙林大学城羊山北路1号', '道路泊车位收费标准一、小型车为30分钟内免费，每增加3个小时加收5元，停车不足3小时的按3小时计算，全天最高限额20元，包月价格为360元。二、新能源车为2小时内（含）免费，3小时内（含）3元，每增加3小时加收5元，停车不足3小时的按3小时计算，全天最高限额15元，包月价格为360元。三、大型车按照实际占车位数计费。四、超过24小时重新按以上规定计收。五、收费时间为7:30-19:30。', '拒绝', '100', '2023-05-18 18:28:00', '1', '2023-05-18 18:33:19', 2);
INSERT INTO `t_parks` VALUES (1659143790583492607, 'park-1', '焦恒鑫', '18012275669', '602', '602', '118.940478', '32.120581', NULL, '<p>道路泊车位收费标准</p><p><br></p><p>一、小型车为30分钟内免费，每增加3个小时加收5元，停车不足3小时的按3小时计算，全天最高限额20元，包月价格为360元。</p><p><br></p><p>二、新能源车为2小时内（含）免费，3小时内（含）3元，每增加3小时加收5元，停车不足3小时的按3小时计算，全天最高限额15元，包月价格为360元。</p><p><br></p><p>三、大型车按照实际占车位数计费。</p><p><br></p><p>四、超过24小时重新按以上规定计收。</p><p><br></p><p style=\"text-align: left;\">五、收费时间为7:30-19:30。<img style=\"max-width:100%;height:auto;\" src=\"https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/18/tdEtn0rlwJnc4f8025926e88229bf33dabdefec9f479_20230518182458A010.png\" class=\"editor-img\" data-custom=\"id=wux-upload--1684405385460-1\"></p><p style=\"text-align: left;\"><br></p>', 'fail_apply', '南京工业职业技术大学', '江苏省南京市栖霞区仙林大学城羊山北路1号', '道路泊车位收费标准一、小型车为30分钟内免费，每增加3个小时加收5元，停车不足3小时的按3小时计算，全天最高限额20元，包月价格为360元。二、新能源车为2小时内（含）免费，3小时内（含）3元，每增加3小时加收5元，停车不足3小时的按3小时计算，全天最高限额15元，包月价格为360元。三、大型车按照实际占车位数计费。四、超过24小时重新按以上规定计收。五、收费时间为7:30-19:30。', '拒绝', '100', '2023-05-18 18:28:00', '1', '2023-05-18 18:33:19', 2);
INSERT INTO `t_parks` VALUES (1659143790583492608, 'park-1', '焦恒鑫', '18012275669', '602', '602', '118.940478', '32.120581', NULL, '<p>道路泊车位收费标准</p><p><br></p><p>一、小型车为30分钟内免费，每增加3个小时加收5元，停车不足3小时的按3小时计算，全天最高限额20元，包月价格为360元。</p><p><br></p><p>二、新能源车为2小时内（含）免费，3小时内（含）3元，每增加3小时加收5元，停车不足3小时的按3小时计算，全天最高限额15元，包月价格为360元。</p><p><br></p><p>三、大型车按照实际占车位数计费。</p><p><br></p><p>四、超过24小时重新按以上规定计收。</p><p><br></p><p style=\"text-align: left;\">五、收费时间为7:30-19:30。<img style=\"max-width:100%;height:auto;\" src=\"https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/18/tdEtn0rlwJnc4f8025926e88229bf33dabdefec9f479_20230518182458A010.png\" class=\"editor-img\" data-custom=\"id=wux-upload--1684405385460-1\"></p><p style=\"text-align: left;\"><br></p>', 'fail_apply', '南京工业职业技术大学', '江苏省南京市栖霞区仙林大学城羊山北路1号', '道路泊车位收费标准一、小型车为30分钟内免费，每增加3个小时加收5元，停车不足3小时的按3小时计算，全天最高限额20元，包月价格为360元。二、新能源车为2小时内（含）免费，3小时内（含）3元，每增加3小时加收5元，停车不足3小时的按3小时计算，全天最高限额15元，包月价格为360元。三、大型车按照实际占车位数计费。四、超过24小时重新按以上规定计收。五、收费时间为7:30-19:30。', '拒绝', '100', '2023-05-18 18:28:00', '1', '2023-05-18 18:33:19', 2);
INSERT INTO `t_parks` VALUES (1659143804919623680, 'park-1', '焦恒鑫', '18012275669', '602', '602', '118.940478', '32.120581', NULL, '<p>道路泊车位收费标准</p><p><br></p><p>一、小型车为30分钟内免费，每增加3个小时加收5元，停车不足3小时的按3小时计算，全天最高限额20元，包月价格为360元。</p><p><br></p><p>二、新能源车为2小时内（含）免费，3小时内（含）3元，每增加3小时加收5元，停车不足3小时的按3小时计算，全天最高限额15元，包月价格为360元。</p><p><br></p><p>三、大型车按照实际占车位数计费。</p><p><br></p><p>四、超过24小时重新按以上规定计收。</p><p><br></p><p style=\"text-align: left;\">五、收费时间为7:30-19:30。<img style=\"max-width:100%;height:auto;\" src=\"https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/18/tdEtn0rlwJnc4f8025926e88229bf33dabdefec9f479_20230518182458A010.png\" class=\"editor-img\" data-custom=\"id=wux-upload--1684405385460-1\"></p><p style=\"text-align: left;\"><br></p>', 'apply_success', '南京工业职业技术大学', '江苏省南京市栖霞区仙林大学城羊山北路1号', '道路泊车位收费标准一、小型车为30分钟内免费，每增加3个小时加收5元，停车不足3小时的按3小时计算，全天最高限额20元，包月价格为360元。二、新能源车为2小时内（含）免费，3小时内（含）3元，每增加3小时加收5元，停车不足3小时的按3小时计算，全天最高限额15元，包月价格为360元。三、大型车按照实际占车位数计费。四、超过24小时重新按以上规定计收。五、收费时间为7:30-19:30。', NULL, '100', '2023-05-18 18:28:03', '1', '2023-05-19 14:02:36', 2);
INSERT INTO `t_parks` VALUES (1659746670776561664, '停车场1', '焦恒鑫', '18012275669', '401', '401', '118.90907', '32.09636', NULL, '<p>1、住宅小区物业管理区域最高地面停车服务收费标准每车每月70元。临时社会车辆首小时内不收费，超过1小时按2元/小时收费(不足1小时按1小时收费)，每天(24小时内)最高收取10元。</p><p><br></p><p>2.普通住宅小区业主拥有产权或者使用权的车库或者车库内的车位，按照普通住宅物业服务收费标准收取物业服务费。</p><p><br></p><p style=\"text-align: left;\">3.住宅和非住宅小区，住宅业主按小区住宅物业服务费标准收取，非住宅业主按市场调节价收取。</p>', 'apply_success', '仙林南京市栖霞区人民政府(敬文街南)', '江苏省南京市栖霞区文枢东路1号', '1、住宅小区物业管理区域最高地面停车服务收费标准每车每月70元。临时社会车辆首小时内不收费，超过1小时按2元/小时收费(不足1小时按1小时收费)，每天(24小时内)最高收取10元。2.普通住宅小区业主拥有产权或者使用权的车库或者车库内的车位，按照普通住宅物业服务收费标准收取物业服务费。3.住宅和非住宅小区，住宅业主按小区住宅物业服务费标准收取，非住宅业主按市场调节价收取。', NULL, '100', '2023-05-20 10:23:38', '1', '2023-05-24 14:15:02', 5);
INSERT INTO `t_parks` VALUES (1659763326957531136, '南京站', '焦恒鑫', '18012275669', '101', '101', '118.797697', '32.086866', NULL, '<p style=\"text-align: left;\">南京站车位</p>', 'fail_apply', '南京站', '江苏省南京市玄武区龙蟠路264号', '南京站车位', '拒绝', '100', '2023-05-20 11:29:49', '1', '2023-05-23 23:35:36', 10);
INSERT INTO `t_parks` VALUES (1659763342476455936, '南京站', '焦恒鑫', '18012275669', '101', '101', '118.797697', '32.086866', NULL, '<p style=\"text-align: left;\">南京站车位</p>', 'wait_apply', '南京站', '江苏省南京市玄武区龙蟠路264号', '南京站车位', NULL, '100', '2023-05-20 11:29:52', '100', '2023-05-20 11:29:52', 10);
INSERT INTO `t_parks` VALUES (1659776530639106040, 'park', '焦恒鑫', '18012275669', '123', '123', '118.90907', '32.09636', NULL, '<p style=\"text-align: left;\"><span style=\"font-size: 14px;\">收费标准</span></p>', 'forbidden', '仙林南京市栖霞区人民政府(敬文街南)', '江苏省南京市栖霞区文枢东路1号', '收费标准', NULL, '100', '2023-05-20 12:22:17', '1', '2023-05-24 14:15:04', 5);
INSERT INTO `t_parks` VALUES (1659776530639106042, 'park', '焦恒鑫', '18012275669', '123', '123', '118.90907', '32.09636', NULL, '<p style=\"text-align: left;\"><span style=\"font-size: 14px;\">收费标准</span></p>', 'forbidden', '仙林南京市栖霞区人民政府(敬文街南)', '江苏省南京市栖霞区文枢东路1号', '收费标准', NULL, '100', '2023-05-20 12:22:17', '1', '2023-05-24 14:15:04', 5);
INSERT INTO `t_parks` VALUES (1659776530639106043, 'park', '焦恒鑫', '18012275669', '123', '123', '118.90907', '32.09636', NULL, '<p style=\"text-align: left;\"><span style=\"font-size: 14px;\">收费标准</span></p>', 'forbidden', '仙林南京市栖霞区人民政府(敬文街南)', '江苏省南京市栖霞区文枢东路1号', '收费标准', NULL, '100', '2023-05-20 12:22:17', '1', '2023-05-24 14:15:04', 5);
INSERT INTO `t_parks` VALUES (1659776530639106048, 'park', '焦恒鑫', '18012275669', '123', '123', '118.90907', '32.09636', NULL, '<p style=\"text-align: left;\"><span style=\"font-size: 14px;\">收费标准</span></p>', 'forbidden', '仙林南京市栖霞区人民政府(敬文街南)', '江苏省南京市栖霞区文枢东路1号', '收费标准', NULL, '100', '2023-05-20 12:22:17', '1', '2023-05-24 14:15:04', 5);

-- ----------------------------
-- Table structure for t_pay_order
-- ----------------------------
DROP TABLE IF EXISTS `t_pay_order`;
CREATE TABLE `t_pay_order`  (
  `id` bigint NOT NULL,
  `user_id` bigint NULL DEFAULT NULL COMMENT '支付用户',
  `create_time` datetime NULL DEFAULT NULL COMMENT '支付时间',
  `park_id` bigint NULL DEFAULT NULL COMMENT '停车场id',
  `status` int NULL DEFAULT NULL COMMENT '状态（0：未支付；1：已支付）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支付订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_pay_order
-- ----------------------------
INSERT INTO `t_pay_order` VALUES (1659757827277074432, 100, '2023-05-20 11:07:57', 1659143804919623680, 1);
INSERT INTO `t_pay_order` VALUES (1661015508323282944, 100, '2023-05-23 22:25:32', 1659746670776561664, 1);
INSERT INTO `t_pay_order` VALUES (1661029814779654144, 100, '2023-05-23 23:22:23', 1659143804919623680, 1);
INSERT INTO `t_pay_order` VALUES (1661192347243130880, 100, '2023-05-24 10:08:14', 1659746670776561664, 1);
INSERT INTO `t_pay_order` VALUES (1661192684259651584, 100, '2023-05-24 10:09:34', 1659746670776561664, 1);

-- ----------------------------
-- Table structure for t_wechat_user
-- ----------------------------
DROP TABLE IF EXISTS `t_wechat_user`;
CREATE TABLE `t_wechat_user`  (
  `id` bigint NOT NULL COMMENT '主键',
  `open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '开放者id',
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '昵称',
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '类型',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '微信用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_wechat_user
-- ----------------------------
INSERT INTO `t_wechat_user` VALUES (1658356304852692992, 'ox2zt4u0NCIiT4MkzPQr5VAB1ooU', '温柔的小怪兽', '0', 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/2023/05/16/Wb3TJizg6KFp27f04c5949fe7e5bf472ef4ddca7893a_20230516141713A002.jpeg', 'teac', NULL, '2023-05-16 14:18:49', NULL, '2023-05-16 14:18:49');

-- ----------------------------
-- Table structure for t_weixin_user
-- ----------------------------
DROP TABLE IF EXISTS `t_weixin_user`;
CREATE TABLE `t_weixin_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `nick_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `avatar_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图像',
  `gender` int NULL DEFAULT NULL COMMENT '性别',
  `open_id` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '微信开放id',
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `state` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '状态',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 999 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '微信用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_weixin_user
-- ----------------------------
INSERT INTO `t_weixin_user` VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_weixin_user` VALUES (2, 'jlkl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_weixin_user` VALUES (3, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_weixin_user` VALUES (4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_weixin_user` VALUES (999, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
