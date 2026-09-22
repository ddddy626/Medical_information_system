/*
 Navicat Premium Data Transfer

 Source Server         : 222
 Source Server Type    : MySQL
 Source Server Version : 80409 (8.4.9)
 Source Host           : localhost:3309
 Source Schema         : hospital_db

 Target Server Type    : MySQL
 Target Server Version : 80409 (8.4.9)
 File Encoding         : 65001

 Date: 20/07/2026 13:22:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for announcement_info
-- ----------------------------
DROP TABLE IF EXISTS `announcement_info`;
CREATE TABLE `announcement_info`  (
  `announcement_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `author_id` int NULL DEFAULT NULL,
  `author_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT 1,
  PRIMARY KEY (`announcement_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of announcement_info
-- ----------------------------
INSERT INTO `announcement_info` VALUES (1, '', NULL, NULL, NULL, NULL, 1);
INSERT INTO `announcement_info` VALUES (2, '公告', '请照看好身边老人与小孩，保管好个人随身财物，谨防物品丢失。', 12, '邓宇航', '2026-05-20 10:00:00', 1);
INSERT INTO `announcement_info` VALUES (3, '公告', '本系统于2026年5月20日完成', 12, '邓宇航', '2026-5-20 12:44:14', 1);
INSERT INTO `announcement_info` VALUES (4, '公告', '各位患者及家属请注意，请自觉遵守医院秩序，文明就医，请勿大声喧哗，共同营造安静舒适的就诊环境。', 12, '邓宇航', '2026-5-20 13:00:10', 1);
INSERT INTO `announcement_info` VALUES (5, '公告', '请前来就诊的人员依次排队挂号缴费，有序候诊，听从医护人员引导，请勿拥挤插队。', 12, '邓宇航', '2026-5-20 13:00:20', 1);
INSERT INTO `announcement_info` VALUES (6, '公告', '请勿吸烟', 12, '邓宇航', '2026-5-25 21:06:14', 1);

-- ----------------------------
-- Table structure for check_info
-- ----------------------------
DROP TABLE IF EXISTS `check_info`;
CREATE TABLE `check_info`  (
  `check_id` int NOT NULL AUTO_INCREMENT,
  `check_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `check_time` datetime NULL DEFAULT NULL,
  `result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `check_status` int NULL DEFAULT 0,
  `check_fee` decimal(10, 2) NULL DEFAULT NULL,
  `record_id` int NOT NULL,
  PRIMARY KEY (`check_id`) USING BTREE,
  INDEX `record_id`(`record_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of check_info
-- ----------------------------
INSERT INTO `check_info` VALUES (1, '血常规', '2026-04-16 20:14:13', '正常', 1, 30.00, 1);
INSERT INTO `check_info` VALUES (2, '胸片', '2026-04-16 20:14:13', '正常', 1, 80.00, 2);
INSERT INTO `check_info` VALUES (3, 'CT', '2026-04-16 20:14:13', '正常', 1, 200.00, 3);
INSERT INTO `check_info` VALUES (4, 'B超', '2026-04-16 20:14:13', '正常', 1, 60.00, 4);
INSERT INTO `check_info` VALUES (5, '心电图', '2026-04-16 20:14:13', '正常', 1, 50.00, 5);
INSERT INTO `check_info` VALUES (6, '肝功能', '2026-04-16 20:14:13', '正常', 1, 70.00, 6);
INSERT INTO `check_info` VALUES (7, '肾功能', '2026-04-16 20:14:13', '正常', 1, 70.00, 7);
INSERT INTO `check_info` VALUES (8, '血糖', '2026-04-16 20:14:13', '正常', 1, 20.00, 8);
INSERT INTO `check_info` VALUES (9, '血脂', '2026-04-16 20:14:13', '正常', 1, 40.00, 9);
INSERT INTO `check_info` VALUES (10, '尿常规', '2026-04-16 20:14:13', '正常', 1, 25.00, 10);
INSERT INTO `check_info` VALUES (11, '凝血功能', '2026-04-16 20:00:00', '正常', 1, 120.00, 11);
INSERT INTO `check_info` VALUES (12, '电解质', '2026-04-16 20:00:00', '正常', 1, 45.00, 12);
INSERT INTO `check_info` VALUES (13, '心肌酶谱', '2026-04-16 20:00:00', '正常', 1, 150.00, 13);
INSERT INTO `check_info` VALUES (14, '淀粉酶', '2026-04-16 20:00:00', '正常', 1, 35.00, 14);
INSERT INTO `check_info` VALUES (15, '脂肪酶', '2026-04-16 20:00:00', '正常', 1, 40.00, 15);
INSERT INTO `check_info` VALUES (43, '电解质', '2026-05-20 12:51:59', NULL, 0, 35.00, 16);
INSERT INTO `check_info` VALUES (47, 'B超', '2026-05-25 20:50:17', NULL, 0, 60.00, 17);
INSERT INTO `check_info` VALUES (18, '血型鉴定', '2026-04-16 20:00:00', 'A型Rh阳性', 1, 25.00, 18);
INSERT INTO `check_info` VALUES (19, '传染病四项(乙肝/丙肝/梅毒/艾滋)', '2026-04-16 20:00:00', '阴性', 1, 180.00, 19);
INSERT INTO `check_info` VALUES (20, '幽门螺杆菌检测(C13)', '2026-04-16 20:00:00', '阴性', 1, 150.00, 20);
INSERT INTO `check_info` VALUES (21, '粪便常规+潜血', '2026-04-16 20:00:00', '正常', 1, 30.00, 21);
INSERT INTO `check_info` VALUES (22, '痰培养+药敏', '2026-04-16 20:00:00', '无致病菌生长', 1, 200.00, 22);
INSERT INTO `check_info` VALUES (23, '血培养+药敏', '2026-04-16 20:00:00', '无致病菌生长', 1, 260.00, 23);
INSERT INTO `check_info` VALUES (24, '肺功能检查', '2026-04-16 20:00:00', '正常', 1, 180.00, 24);
INSERT INTO `check_info` VALUES (25, '动态心电图(Holter)', '2026-04-16 20:00:00', '正常', 1, 260.00, 25);
INSERT INTO `check_info` VALUES (26, '心脏彩超', '2026-04-16 20:00:00', '结构及功能未见异常', 1, 260.00, 26);
INSERT INTO `check_info` VALUES (27, '腹部彩超', '2026-04-16 20:00:00', '肝、胆、胰、脾、肾未见异常', 1, 120.00, 27);
INSERT INTO `check_info` VALUES (28, '泌尿系彩超', '2026-04-16 20:00:00', '未见异常', 1, 100.00, 28);
INSERT INTO `check_info` VALUES (29, '甲状腺彩超', '2026-04-16 20:00:00', '未见异常', 1, 120.00, 29);
INSERT INTO `check_info` VALUES (30, '头颅CT', '2026-04-16 20:00:00', '未见明显异常', 1, 260.00, 30);
INSERT INTO `check_info` VALUES (31, '胸部CT', '2026-04-16 20:00:00', '未见明显异常', 1, 300.00, 31);
INSERT INTO `check_info` VALUES (32, '腰椎CT', '2026-04-16 20:00:00', '未见明显异常', 1, 260.00, 32);
INSERT INTO `check_info` VALUES (33, '胃镜', '2026-04-16 20:00:00', '浅表性胃炎', 1, 300.00, 33);
INSERT INTO `check_info` VALUES (34, '肠镜', '2026-04-16 20:00:00', '未见异常', 1, 350.00, 34);
INSERT INTO `check_info` VALUES (35, '骨密度检测', '2026-04-16 20:00:00', '骨量正常', 1, 120.00, 35);
INSERT INTO `check_info` VALUES (36, '糖化血红蛋白', '2026-04-16 20:00:00', '正常', 1, 80.00, 36);
INSERT INTO `check_info` VALUES (37, '甲状腺功能三项', '2026-04-16 20:00:00', '正常', 1, 150.00, 37);
INSERT INTO `check_info` VALUES (38, '肿瘤标志物五项(CEA/AFP/CA199/CA125/PSA)', '2026-04-16 20:00:00', '正常', 1, 380.00, 38);
INSERT INTO `check_info` VALUES (39, '乙肝五项', '2026-04-16 20:00:00', '表面抗体阳性', 1, 80.00, 39);
INSERT INTO `check_info` VALUES (40, '丙肝抗体', '2026-04-16 20:00:00', '阴性', 1, 60.00, 40);
INSERT INTO `check_info` VALUES (44, 'C反应蛋白(CRP)', '2026-05-20 12:51:59', NULL, 0, 30.00, 16);
INSERT INTO `check_info` VALUES (45, '便常规', '2026-05-20 12:51:59', NULL, 0, 15.01, 16);
INSERT INTO `check_info` VALUES (48, '降钙素原(PCT)', '2026-05-25 20:50:17', NULL, 0, 120.00, 17);
INSERT INTO `check_info` VALUES (49, '血常规', '2026-05-29 08:01:18', NULL, 0, 30.00, 20);
INSERT INTO `check_info` VALUES (50, '肿瘤标志物', '2026-05-29 08:11:46', NULL, 0, 120.00, 21);

-- ----------------------------
-- Table structure for consult_info
-- ----------------------------
DROP TABLE IF EXISTS `consult_info`;
CREATE TABLE `consult_info`  (
  `consult_id` int NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `reply` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `consult_time` datetime NOT NULL,
  `reply_time` datetime NULL DEFAULT NULL,
  `consult_status` int NULL DEFAULT 0,
  `patient_id` int NOT NULL,
  `doctor_id` int NULL DEFAULT NULL,
  `consult_type` int NULL DEFAULT 0 COMMENT '咨询类型：0-AI咨询，1-人工咨询',
  `sender_role` int NULL DEFAULT 0 COMMENT '发送者角色：0=患者，1=医生',
  PRIMARY KEY (`consult_id`) USING BTREE,
  INDEX `patient_id`(`patient_id`) USING BTREE,
  INDEX `doctor_id`(`doctor_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of consult_info
-- ----------------------------
INSERT INTO `consult_info` VALUES (1, '感冒多久好', '一周', '2026-04-16 20:14:13', '2026-04-16 20:14:13', 1, 1, 1, 0, 0);
INSERT INTO `consult_info` VALUES (2, '咳嗽怎么办', '吃药', '2026-04-16 20:14:13', '2026-04-16 20:14:13', 1, 2, 2, 0, 0);
INSERT INTO `consult_info` VALUES (3, '发烧注意什么', '多喝水', '2026-04-16 20:14:13', '2026-04-16 20:14:13', 1, 3, 3, 0, 0);
INSERT INTO `consult_info` VALUES (4, '头痛原因', '休息', '2026-04-16 20:14:13', '2026-04-16 20:14:13', 1, 4, 4, 0, 0);
INSERT INTO `consult_info` VALUES (5, '腹痛饮食', '清淡', '2026-04-16 20:14:13', '2026-04-16 20:14:13', 1, 5, 5, 0, 0);
INSERT INTO `consult_info` VALUES (6, '咽痛护理', '少说话', '2026-04-16 20:14:13', '2026-04-16 20:14:13', 1, 6, 6, 0, 0);
INSERT INTO `consult_info` VALUES (7, '皮疹用药', '遵医嘱', '2026-04-16 20:14:13', '2026-04-16 20:14:13', 1, 7, 7, 0, 0);
INSERT INTO `consult_info` VALUES (8, '关节痛护理', '保暖', '2026-04-16 20:14:13', '2026-04-16 20:14:13', 1, 8, 8, 0, 0);
INSERT INTO `consult_info` VALUES (9, '失眠调理', '早睡', '2026-04-16 20:14:13', '2026-04-16 20:14:13', 1, 9, 9, 0, 0);
INSERT INTO `consult_info` VALUES (10, '乏力调理', '补营养', '2026-04-16 20:14:13', '2026-04-16 20:14:13', 1, 10, 10, 0, 0);
INSERT INTO `consult_info` VALUES (11, '患者请求人工咨询', 'sjb', '2026-05-12 10:02:36', '2026-05-12 10:19:27', 1, 14, 1, 1, 0);
INSERT INTO `consult_info` VALUES (12, '被蚊虫叮咬了怎么办', '被蚊虫叮咬后，可参考以下步骤处理，若症状加重或出现全身反应请及时就医。\n\n**1. 立即清洁**\n用肥皂和清水清洗叮咬处，冲淡蚊虫唾液，降低过敏和感染风险。\n\n**2. 冷敷止痒**\n用包裹毛巾的冰袋或冷毛巾敷在患处，每次10-15分钟，可收缩血管、减轻红肿瘙痒。\n\n**3. 合理用药（按需选用）**\n- **外用**：未抓破时可涂炉甘石洗剂止痒；若红肿明显且无破损，可短期使用弱效激素药膏（如氢化可的松乳膏）。\n- **口服**：瘙痒剧烈影响睡眠，可咨询药师后服用抗组胺药（如氯雷他定），儿童需按体重/年龄选择剂型。\n\n**4. 避免抓挠**\n抓破易导致细菌感染，留下色素沉淀或疤痕。可剪短指甲，转移注意力。\n\n**5. 出现这些情况需就医**\n- 叮咬处大面积肿胀、起水疱、流脓。\n- 发烧、头痛、恶心、关节痛等全身症状。\n- 呼吸费力、嘴唇肿胀、头晕等严重过敏迹象。\n\n**特别提醒**：近期若从蚊媒传染病流行区返回，务必告知医生旅行史。\n\n**以上建议不能替代专业诊断，若自行处理后无改善或症状加重，请尽快到皮肤科或急诊就诊。**', '2026-05-12 10:35:40', NULL, 1, 14, NULL, 0, 0);
INSERT INTO `consult_info` VALUES (13, '【AI咨询对话记录】\n患者：被蚊虫叮咬了怎么办\nAI助手：被蚊虫叮咬后，可参考以下步骤处理，若症状加重或出现全身反应请及时就医。\n\n**1. 立即清洁**\n用肥皂和清水清洗叮咬处，冲淡蚊虫唾液，降低过敏和感染风险。\n\n**2. 冷敷止痒**\n用包裹毛巾的冰袋或冷毛巾敷在患处，每次10-15分钟，可收缩血管、减轻红肿瘙痒。\n\n**3. 合理用药（按需选用）**\n- **外用**：未抓破时可涂炉甘石洗剂止痒；若红肿明显且无破损，可短期使用弱效激素药膏（如氢化可的松乳膏）。\n- **口服**：瘙痒剧烈影响睡眠，可咨询药师后服用抗组胺药（如氯雷他定），儿童需按体重/年龄选择剂型。\n\n**4. 避免抓挠**\n抓破易导致细菌感染，留下色素沉淀或疤痕。可剪短指甲，转移注意力。\n\n**5. 出现这些情况需就医**\n- 叮咬处大面积肿胀、起水疱、流脓。\n- 发烧、头痛、恶心、关节痛等全身症状。\n- 呼吸费力、嘴唇肿胀、头晕等严重过敏迹象。\n\n**特别提醒**：近期若从蚊媒传染病流行区返回，务必告知医生旅行史。\n\n**以上建议不能替代专业诊断，若自行处理后无改善或症状加重，请尽快到皮肤科或急诊就诊。**\n【以上为AI咨询内容，请医生参考并回复患者】', '', '2026-05-12 10:35:57', NULL, 0, 14, 1, 1, 0);
INSERT INTO `consult_info` VALUES (14, '蚊虫叮咬建议转接皮肤科', '', '2026-05-12 10:37:28', NULL, 0, 14, 1, 1, 1);
INSERT INTO `consult_info` VALUES (15, '??', '？', '2026-05-12 10:47:14', '2026-05-14 08:50:01', 1, 1, 1, 1, 0);
INSERT INTO `consult_info` VALUES (16, '抑郁症如何缓解', '抑郁症缓解：保持规律作息，适当户外运动，培养爱好，每日快走半小时，多食蔬果深海鱼，补充维生素D，避免饮酒。记录心情，与亲友倾诉，练习腹式深呼吸。若持续两周兴趣丧失、疲惫绝望，务必就医。本建议不替代专业诊断。', '2026-05-20 09:31:16', NULL, 1, 184, NULL, 0, 0);
INSERT INTO `consult_info` VALUES (17, '【AI咨询对话记录】\n患者：抑郁症如何缓解\nAI助手：抑郁症缓解：保持规律作息，适当户外运动，培养爱好，每日快走半小时，多食蔬果深海鱼，补充维生素D，避免饮酒。记录心情，与亲友倾诉，练习腹式深呼吸。若持续两周兴趣丧失、疲惫绝望，务必就医。本建议不替代专业诊断。\n【以上为AI咨询内容，请医生参考并回复患者】', '', '2026-05-20 09:33:38', NULL, 0, 184, 1, 1, 0);
INSERT INTO `consult_info` VALUES (18, '好累', '', '2026-05-20 09:33:48', NULL, 0, 184, 1, 1, 0);
INSERT INTO `consult_info` VALUES (19, '请你说一下完整病情', '', '2026-05-20 09:34:24', NULL, 0, 184, 1, 1, 1);
INSERT INTO `consult_info` VALUES (20, '蚊虫叮咬', '被蚊虫叮咬后，立即用肥皂水和清水清洗局部，冷敷减轻肿胀瘙痒。可涂抹炉甘石洗剂止痒，避免抓挠以防感染。若出现大面积红肿、水疱、发热或呼吸困难，需及时就医。以上建议不能替代医生诊断，如有不适请咨询专业医师。', '2026-05-25 20:51:13', NULL, 1, 14, NULL, 0, 0);
INSERT INTO `consult_info` VALUES (21, '【AI咨询对话记录】\n患者：蚊虫叮咬\nAI助手：被蚊虫叮咬后，立即用肥皂水和清水清洗局部，冷敷减轻肿胀瘙痒。可涂抹炉甘石洗剂止痒，避免抓挠以防感染。若出现大面积红肿、水疱、发热或呼吸困难，需及时就医。以上建议不能替代医生诊断，如有不适请咨询专业医师。\n【以上为AI咨询内容，请医生参考并回复患者】', '', '2026-05-25 20:51:28', NULL, 0, 14, 1, 1, 0);
INSERT INTO `consult_info` VALUES (22, '涂什么药', '', '2026-05-25 20:52:01', NULL, 0, 14, 1, 1, 0);
INSERT INTO `consult_info` VALUES (23, '患者请求人工咨询', '', '2026-05-27 10:12:48', NULL, 0, 14, 1, 1, 0);
INSERT INTO `consult_info` VALUES (24, '什么问题', '', '2026-05-27 10:13:20', NULL, 0, 14, 1, 1, 1);
INSERT INTO `consult_info` VALUES (25, '蚊虫叮咬', '', '2026-05-27 10:13:42', NULL, 0, 14, 1, 1, 0);
INSERT INTO `consult_info` VALUES (26, '患者请求人工咨询', '', '2026-05-27 10:13:51', NULL, 0, 14, 1, 1, 0);
INSERT INTO `consult_info` VALUES (27, '头疼', '头疼时可先休息，避免强光和噪音，适当补充水分。若伴随发热、呕吐、视力模糊或肢体麻木等症状，或头痛持续加重，请尽快就医。以上建议不能替代医生诊断，如有不适请及时咨询专业医生。', '2026-05-27 10:19:41', NULL, 1, 14, NULL, 0, 0);
INSERT INTO `consult_info` VALUES (28, '【AI咨询对话记录】\n患者：头疼\nAI助手：头疼时可先休息，避免强光和噪音，适当补充水分。若伴随发热、呕吐、视力模糊或肢体麻木等症状，或头痛持续加重，请尽快就医。以上建议不能替代医生诊断，如有不适请及时咨询专业医生。\n【以上为AI咨询内容，请医生参考并回复患者】', '', '2026-05-27 10:19:48', NULL, 0, 14, 1, 1, 0);
INSERT INTO `consult_info` VALUES (29, '头疼', '如果您出现头痛，建议先安静休息，避免强光和噪音。可尝试冷敷前额或热敷后颈，适量饮水，避免咖啡因和酒精。若疼痛持续或伴有呕吐、视力模糊、肢体麻木等症状，请及时就医。以上建议仅供参考，不能替代医生诊断。', '2026-05-29 07:59:21', '2026-05-29 07:59:21', 1, 14, NULL, 0, 0);
INSERT INTO `consult_info` VALUES (30, '【AI咨询对话记录】\n患者：头疼\nAI助手：如果您出现头痛，建议先安静休息，避免强光和噪音。可尝试冷敷前额或热敷后颈，适量饮水，避免咖啡因和酒精。若疼痛持续或伴有呕吐、视力模糊、肢体麻木等症状，请及时就医。以上建议仅供参考，不能替代医生诊断。\n【以上为AI咨询内容，请医生参考并回复患者】', '', '2026-05-29 07:59:33', NULL, 0, 14, 1, 1, 0);
INSERT INTO `consult_info` VALUES (31, '吃什么药', '', '2026-05-29 07:59:49', NULL, 0, 14, 1, 1, 0);
INSERT INTO `consult_info` VALUES (32, '布洛芬', '', '2026-05-29 08:00:08', NULL, 0, 14, 1, 1, 1);
INSERT INTO `consult_info` VALUES (33, '1', '', '2026-05-29 08:00:13', NULL, 0, 1, 1, 1, 1);
INSERT INTO `consult_info` VALUES (34, '头疼', '头疼时建议先休息避免强光噪音可冷敷额头或太阳穴轻轻按摩颈部如持续不缓解或伴有呕吐视力模糊等需及时就医以上建议不能替代医生诊断请咨询专业医师', '2026-05-29 08:10:27', '2026-05-29 08:10:27', 1, 14, NULL, 0, 0);
INSERT INTO `consult_info` VALUES (35, '【AI咨询对话记录】\n患者：头疼\nAI助手：头疼时建议先休息避免强光噪音可冷敷额头或太阳穴轻轻按摩颈部如持续不缓解或伴有呕吐视力模糊等需及时就医以上建议不能替代医生诊断请咨询专业医师\n【以上为AI咨询内容，请医生参考并回复患者】', '', '2026-05-29 08:10:32', NULL, 0, 14, 1, 1, 0);
INSERT INTO `consult_info` VALUES (36, '头疼吃什么药', '', '2026-05-29 08:10:45', NULL, 0, 14, 1, 1, 0);
INSERT INTO `consult_info` VALUES (37, '布洛芬', '', '2026-05-29 08:10:56', NULL, 0, 14, 1, 1, 1);
INSERT INTO `consult_info` VALUES (38, '头疼', '头疼可能由多种原因引起，建议先休息、补充水分、避免强光。可尝试冷敷或热敷额头。若持续或加重、伴呕吐、视力模糊，请及时就医。此建议不能替代医生诊断。', '2026-06-03 09:53:47', '2026-06-03 09:53:47', 1, 14, NULL, 0, 0);
INSERT INTO `consult_info` VALUES (39, '患者请求人工咨询', '', '2026-06-03 09:57:27', NULL, 0, 14, 1, 1, 0);

-- ----------------------------
-- Table structure for dept_info
-- ----------------------------
DROP TABLE IF EXISTS `dept_info`;
CREATE TABLE `dept_info`  (
  `dept_id` int NOT NULL AUTO_INCREMENT COMMENT '科室ID',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '科室名称',
  `dept_desc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室描述',
  `location` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室楼层位置',
  `dept_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室联系电话',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '医院完整科室信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of dept_info
-- ----------------------------
INSERT INTO `dept_info` VALUES (1, '内科', '普通内科', '门诊一楼', '010-1001');
INSERT INTO `dept_info` VALUES (2, '外科', '普通外科', '门诊二楼', '010-1002');
INSERT INTO `dept_info` VALUES (3, '儿科', '儿童专科', '门诊一楼', '010-1003');
INSERT INTO `dept_info` VALUES (4, '妇产科', '妇科产科', '门诊四楼', '010-1004');
INSERT INTO `dept_info` VALUES (5, '眼科', '眼部疾病', '门诊五楼', '010-1005');
INSERT INTO `dept_info` VALUES (6, '耳鼻喉科', '耳鼻喉专科', '门诊六楼', '010-1006');
INSERT INTO `dept_info` VALUES (7, '口腔科', '口腔疾病', '门诊七楼', '010-1007');
INSERT INTO `dept_info` VALUES (8, '皮肤科', '皮肤专科', '门诊八楼', '010-1008');
INSERT INTO `dept_info` VALUES (9, '神经内科', '神经专科', '门诊九楼', '010-1009');
INSERT INTO `dept_info` VALUES (10, '骨科', '骨骼关节', '门诊十楼', '010-1010');
INSERT INTO `dept_info` VALUES (11, '心血管内科', '心脑血管疾病诊疗', '门诊一楼', '010-1011');
INSERT INTO `dept_info` VALUES (12, '呼吸内科', '呼吸道、肺部疾病', '门诊一楼', '010-1012');
INSERT INTO `dept_info` VALUES (13, '消化内科', '胃肠、肝胆消化系统', '门诊一楼', '010-1013');
INSERT INTO `dept_info` VALUES (14, '肾内科', '肾脏相关疾病', '门诊一楼', '010-1014');
INSERT INTO `dept_info` VALUES (15, '内分泌科', '糖尿病、甲状腺代谢疾病', '门诊一楼', '010-1015');
INSERT INTO `dept_info` VALUES (16, '风湿免疫科', '风湿、类风湿免疫疾病', '门诊一楼', '010-1016');
INSERT INTO `dept_info` VALUES (17, '血液内科', '血液系统疾病', '门诊一楼', '010-1017');
INSERT INTO `dept_info` VALUES (18, '感染科', '传染性、感染性疾病', '感染楼', '010-1018');
INSERT INTO `dept_info` VALUES (19, '全科医学科', '全科综合门诊', '门诊一楼', '010-1019');
INSERT INTO `dept_info` VALUES (20, '神经外科', '颅脑、脊柱外科', '门诊二楼', '010-1020');
INSERT INTO `dept_info` VALUES (21, '心胸外科', '心脏、胸腔外科', '门诊二楼', '010-1021');
INSERT INTO `dept_info` VALUES (22, '泌尿外科', '泌尿、男性生殖系统', '门诊二楼', '010-1022');
INSERT INTO `dept_info` VALUES (23, '肝胆外科', '肝胆胰腺外科手术', '门诊二楼', '010-1023');
INSERT INTO `dept_info` VALUES (24, '胃肠外科', '胃肠道肿瘤与手术', '门诊二楼', '010-1024');
INSERT INTO `dept_info` VALUES (25, '乳腺外科', '乳腺疾病诊疗', '门诊二楼', '010-1025');
INSERT INTO `dept_info` VALUES (26, '血管外科', '外周血管疾病', '门诊二楼', '010-1026');
INSERT INTO `dept_info` VALUES (27, '烧伤整形外科', '烧伤、创面修复整形', '门诊二楼', '010-1027');
INSERT INTO `dept_info` VALUES (28, '肛肠科', '肛门肠道疾病', '门诊二楼', '010-1028');
INSERT INTO `dept_info` VALUES (29, '妇科', '妇科疾病、妇科肿瘤', '门诊四楼', '010-1029');
INSERT INTO `dept_info` VALUES (30, '产科', '产检、分娩、产后康复', '门诊四楼', '010-1030');
INSERT INTO `dept_info` VALUES (31, '新生儿科', '新生儿重症护理', '住院三楼', '010-1031');
INSERT INTO `dept_info` VALUES (32, '儿童保健科', '儿童生长发育体检', '门诊三楼', '010-1032');
INSERT INTO `dept_info` VALUES (33, '急诊科', '24小时急诊急救', '门诊一楼大厅', '010-1033');
INSERT INTO `dept_info` VALUES (34, '重症医学科ICU', '危重症监护救治', '住院负一楼', '010-1034');
INSERT INTO `dept_info` VALUES (35, '麻醉科', '手术麻醉、术后镇痛', '手术楼', '010-1035');
INSERT INTO `dept_info` VALUES (36, '手术室', '全院手术开展', '手术楼', '010-1036');
INSERT INTO `dept_info` VALUES (37, '检验科', '临床标本检验检测', '医技一楼', '010-1037');
INSERT INTO `dept_info` VALUES (38, '放射科', 'CT、X光影像检查', '医技二楼', '010-1038');
INSERT INTO `dept_info` VALUES (39, '超声科', 'B超、彩超影像诊断', '医技二楼', '010-1039');
INSERT INTO `dept_info` VALUES (40, '心电图室', '心电功能检查', '医技二楼', '010-1040');
INSERT INTO `dept_info` VALUES (41, '病理科', '细胞、病理切片诊断', '医技三楼', '010-1041');
INSERT INTO `dept_info` VALUES (42, '药剂科', '门诊、住院药房发药', '门诊一楼', '010-1042');
INSERT INTO `dept_info` VALUES (43, '消毒供应中心', '医疗器械消毒灭菌', '供应楼', '010-1043');
INSERT INTO `dept_info` VALUES (44, '中医科', '中医中药辨证诊疗', '门诊十一楼', '010-1044');
INSERT INTO `dept_info` VALUES (45, '针灸推拿科', '针灸、理疗、推拿正骨', '门诊十一楼', '010-1045');
INSERT INTO `dept_info` VALUES (46, '康复医学科', '术后、慢病康复训练', '门诊十二楼', '010-1046');
INSERT INTO `dept_info` VALUES (47, '男科', '男性生殖健康专科', '门诊十楼', '010-1047');
INSERT INTO `dept_info` VALUES (48, '肿瘤科', '良恶性肿瘤诊疗放化疗', '住院十五楼', '010-1048');
INSERT INTO `dept_info` VALUES (49, '营养科', '临床膳食营养指导', '门诊一楼', '010-1049');
INSERT INTO `dept_info` VALUES (50, '老年病科', '老年慢性综合疾病', '住院十二楼', '010-1050');
INSERT INTO `dept_info` VALUES (51, '过敏反应科', '过敏性疾病专项诊疗', '门诊八楼', '010-1051');
INSERT INTO `dept_info` VALUES (52, '体检中心', '健康入职、年度体检', '体检中心一楼', '010-1052');

-- ----------------------------
-- Table structure for doctor_info
-- ----------------------------
DROP TABLE IF EXISTS `doctor_info`;
CREATE TABLE `doctor_info`  (
  `doctor_id` int NOT NULL AUTO_INCREMENT COMMENT '医生ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '职称',
  `specialty` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '专业特长',
  `work_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作时间',
  `doc_status` tinyint NULL DEFAULT 1 COMMENT '医生状态：1=可预约，0=休息中',
  `user_id` int NOT NULL COMMENT '用户ID',
  `dept_id` int NULL DEFAULT NULL COMMENT '科室ID',
  `doctor_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医生姓名',
  `gender` tinyint NULL DEFAULT NULL COMMENT '性别：1=男，0=女',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `education` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学历',
  `intro` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '个人简介',
  `dept` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室名称',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态',
  PRIMARY KEY (`doctor_id`) USING BTREE,
  INDEX `fk_doctor_user`(`user_id` ASC) USING BTREE,
  INDEX `fk_doctor_dept`(`dept_id` ASC) USING BTREE,
  CONSTRAINT `fk_doctor_dept` FOREIGN KEY (`dept_id`) REFERENCES `dept_info` (`dept_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_doctor_user` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 181 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '医生信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of doctor_info
-- ----------------------------
INSERT INTO `doctor_info` VALUES (1, '主任医师', '心血管疾病诊治', '周一至周五', 1, 15, 1, '张建国', 1, 55, '13800100001', '博士', '张医生从事内科临床工作30年，擅长心血管疾病诊治。', '内科', 1);
INSERT INTO `doctor_info` VALUES (2, '副主任医师', '呼吸系统疾病', '周一至周五', 1, 16, 1, '李秀华', 0, 48, '13800100002', '硕士', '李医生在呼吸系统疾病领域有丰富经验。', '内科', 1);
INSERT INTO `doctor_info` VALUES (3, '主治医师', '消化系统疾病', '周一至周五', 1, 17, 1, '王志强', 1, 40, '13800100003', '本科', '王医生擅长消化系统疾病的诊断与治疗。', '内科', 1);
INSERT INTO `doctor_info` VALUES (4, '主任医师', '肝胆外科', '周一至周五', 1, 18, 2, '赵伟', 1, 52, '13800100004', '博士', '赵医生是肝胆外科领域的权威专家。', '外科', 1);
INSERT INTO `doctor_info` VALUES (5, '副主任医师', '胃肠外科', '周一至周五', 1, 19, 2, '孙丽', 0, 46, '13800100005', '硕士', '孙医生擅长胃肠外科手术。', '外科', 1);
INSERT INTO `doctor_info` VALUES (6, '主治医师', '乳腺外科', '周一至周五', 1, 20, 2, '周强', 1, 42, '13800100006', '硕士', '周医生专注于乳腺疾病的诊治。', '外科', 1);
INSERT INTO `doctor_info` VALUES (7, '主任医师', '儿童呼吸系统', '周一至周五', 1, 21, 3, '冯燕', 0, 50, '13800100007', '博士', '冯医生擅长儿童呼吸系统疾病诊治。', '儿科', 1);
INSERT INTO `doctor_info` VALUES (8, '副主任医师', '儿童消化系统', '周一至周五', 1, 22, 3, '何亮', 1, 45, '13800100008', '硕士', '何医生专注于儿童消化系统疾病。', '儿科', 1);
INSERT INTO `doctor_info` VALUES (9, '主治医师', '儿童心血管', '周一至周五', 1, 23, 3, '梁敏', 0, 38, '13800100009', '硕士', '梁医生在儿童心血管领域有研究。', '儿科', 1);
INSERT INTO `doctor_info` VALUES (10, '主任医师', '妇科肿瘤', '周一至周五', 1, 24, 4, '韩梅', 0, 53, '13800100010', '博士', '韩医生是妇科肿瘤领域专家。', '妇产科', 1);
INSERT INTO `doctor_info` VALUES (11, '副主任医师', '产科', '周一至周五', 1, 25, 4, '唐杰', 1, 47, '13800100011', '硕士', '唐医生在产科方面经验丰富。', '妇产科', 1);
INSERT INTO `doctor_info` VALUES (12, '主治医师', '妇科炎症', '周一至周五', 1, 26, 4, '许静', 0, 41, '13800100012', '硕士', '许医生擅长妇科炎症诊治。', '妇产科', 1);
INSERT INTO `doctor_info` VALUES (13, '主任医师', '白内障', '周一至周五', 1, 27, 5, '彭伟', 1, 54, '13800100013', '博士', '彭医生是白内障手术专家。', '眼科', 1);
INSERT INTO `doctor_info` VALUES (14, '副主任医师', '青光眼', '周一至周五', 1, 28, 5, '曾芳', 0, 48, '13800100014', '硕士', '曾医生擅长青光眼诊治。', '眼科', 1);
INSERT INTO `doctor_info` VALUES (15, '主治医师', '眼底病', '周一至周五', 1, 29, 5, '吕强', 1, 42, '13800100015', '硕士', '吕医生专注于眼底病治疗。', '眼科', 1);
INSERT INTO `doctor_info` VALUES (16, '主任医师', '耳鼻喉肿瘤', '周一至周五', 1, 30, 6, '叶伟', 1, 51, '13800100016', '博士', '叶医生是耳鼻喉肿瘤专家。', '耳鼻喉科', 1);
INSERT INTO `doctor_info` VALUES (17, '副主任医师', '鼻科疾病', '周一至周五', 1, 31, 6, '戴芳', 0, 46, '13800100017', '硕士', '戴医生擅长鼻科疾病诊治。', '耳鼻喉科', 1);
INSERT INTO `doctor_info` VALUES (18, '主治医师', '咽喉疾病', '周一至周五', 1, 32, 6, '钟强', 1, 40, '13800100018', '硕士', '钟医生专注于咽喉疾病治疗。', '耳鼻喉科', 1);
INSERT INTO `doctor_info` VALUES (19, '主任医师', '口腔颌面外科', '周一至周五', 1, 33, 7, '黄涛', 1, 52, '13800100019', '博士', '黄医生是口腔颌面外科专家。', '口腔科', 1);
INSERT INTO `doctor_info` VALUES (20, '副主任医师', '口腔内科', '周一至周五', 1, 34, 7, '冯静', 0, 47, '13800100020', '硕士', '冯医生擅长口腔内科疾病诊治。', '口腔科', 1);
INSERT INTO `doctor_info` VALUES (21, '主治医师', '口腔修复', '周一至周五', 1, 35, 7, '陈强', 1, 41, '13800100021', '硕士', '陈医生专注于口腔修复治疗。', '口腔科', 1);
INSERT INTO `doctor_info` VALUES (22, '主任医师', '皮肤肿瘤', '周一至周五', 1, 36, 8, '林涛', 1, 53, '13800100022', '博士', '林医生是皮肤肿瘤专家。', '皮肤科', 1);
INSERT INTO `doctor_info` VALUES (23, '副主任医师', '过敏性皮肤病', '周一至周五', 1, 37, 8, '何芳', 0, 48, '13800100023', '硕士', '何医生擅长过敏性皮肤病诊治。', '皮肤科', 1);
INSERT INTO `doctor_info` VALUES (24, '主治医师', '感染性皮肤病', '周一至周五', 1, 38, 8, '梁伟', 1, 42, '13800100024', '硕士', '梁医生专注于感染性皮肤病治疗。', '皮肤科', 1);
INSERT INTO `doctor_info` VALUES (25, '主任医师', '脑血管疾病', '周一至周五', 1, 39, 9, '韩杰', 1, 55, '13800100025', '博士', '韩医生是脑血管疾病专家。', '神经内科', 1);
INSERT INTO `doctor_info` VALUES (26, '副主任医师', '帕金森病', '周一至周五', 1, 40, 9, '唐静', 0, 49, '13800100026', '硕士', '唐医生擅长帕金森病诊治。', '神经内科', 1);
INSERT INTO `doctor_info` VALUES (27, '主治医师', '癫痫', '周一至周五', 1, 41, 9, '许强', 1, 43, '13800100027', '硕士', '许医生专注于癫痫治疗。', '神经内科', 1);
INSERT INTO `doctor_info` VALUES (28, '主任医师', '脊柱外科', '周一至周五', 1, 42, 10, '彭伟', 1, 54, '13800100028', '博士', '彭医生是脊柱外科专家。', '骨科', 1);
INSERT INTO `doctor_info` VALUES (29, '副主任医师', '关节外科', '周一至周五', 1, 43, 10, '曾强', 1, 48, '13800100029', '硕士', '曾医生擅长关节置换手术。', '骨科', 1);
INSERT INTO `doctor_info` VALUES (30, '主治医师', '创伤骨科', '周一至周五', 1, 44, 10, '吕芳', 0, 42, '13800100030', '硕士', '吕医生专注于创伤骨科治疗。', '骨科', 1);
INSERT INTO `doctor_info` VALUES (31, '主任医师', '冠心病', '周一至周五', 1, 45, 11, '叶华', 1, 56, '13800100031', '博士', '叶医生是冠心病治疗专家。', '心血管内科', 1);
INSERT INTO `doctor_info` VALUES (32, '副主任医师', '心律失常', '周一至周五', 1, 46, 11, '戴静', 0, 50, '13800100032', '硕士', '戴医生擅长心律失常诊治。', '心血管内科', 1);
INSERT INTO `doctor_info` VALUES (33, '主治医师', '高血压', '周一至周五', 1, 47, 11, '钟芳', 0, 44, '13800100033', '硕士', '钟医生专注于高血压治疗。', '心血管内科', 1);
INSERT INTO `doctor_info` VALUES (34, '主任医师', '慢阻肺', '周一至周五', 1, 48, 12, '黄静', 0, 54, '13800100034', '博士', '黄医生是慢阻肺治疗专家。', '呼吸内科', 1);
INSERT INTO `doctor_info` VALUES (35, '副主任医师', '哮喘', '周一至周五', 1, 49, 12, '冯强', 1, 48, '13800100035', '硕士', '冯医生擅长哮喘诊治。', '呼吸内科', 1);
INSERT INTO `doctor_info` VALUES (36, '主治医师', '肺炎', '周一至周五', 1, 50, 12, '陈丽', 0, 42, '13800100036', '硕士', '陈医生专注于肺炎治疗。', '呼吸内科', 1);
INSERT INTO `doctor_info` VALUES (37, '主任医师', '消化内镜', '周一至周五', 1, 51, 13, '林强', 1, 53, '13800100037', '博士', '林医生是消化内镜专家。', '消化内科', 1);
INSERT INTO `doctor_info` VALUES (38, '副主任医师', '慢性胃炎', '周一至周五', 1, 52, 13, '何芳', 0, 47, '13800100038', '硕士', '何医生擅长慢性胃炎诊治。', '消化内科', 1);
INSERT INTO `doctor_info` VALUES (39, '主治医师', '消化性溃疡', '周一至周五', 1, 53, 13, '梁静', 0, 41, '13800100039', '硕士', '梁医生专注于消化性溃疡治疗。', '消化内科', 1);
INSERT INTO `doctor_info` VALUES (40, '主任医师', '慢性肾病', '周一至周五', 1, 54, 14, '韩伟', 1, 55, '13800100040', '博士', '韩医生是慢性肾病治疗专家。', '肾内科', 1);
INSERT INTO `doctor_info` VALUES (41, '副主任医师', '透析治疗', '周一至周五', 1, 55, 14, '唐芳', 0, 49, '13800100041', '硕士', '唐医生擅长透析治疗管理。', '肾内科', 1);
INSERT INTO `doctor_info` VALUES (42, '主治医师', '肾小球疾病', '周一至周五', 1, 56, 14, '许静', 0, 43, '13800100042', '硕士', '许医生专注于肾小球疾病治疗。', '肾内科', 1);
INSERT INTO `doctor_info` VALUES (43, '主任医师', '糖尿病', '周一至周五', 1, 57, 15, '彭芳', 0, 52, '13800100043', '博士', '彭医生是糖尿病治疗专家。', '内分泌科', 1);
INSERT INTO `doctor_info` VALUES (44, '副主任医师', '甲状腺疾病', '周一至周五', 1, 58, 15, '曾丽', 0, 46, '13800100044', '硕士', '曾医生擅长甲状腺疾病诊治。', '内分泌科', 1);
INSERT INTO `doctor_info` VALUES (45, '主治医师', '肥胖症', '周一至周五', 1, 59, 15, '吕强', 1, 40, '13800100045', '硕士', '吕医生专注于肥胖症治疗。', '内分泌科', 1);
INSERT INTO `doctor_info` VALUES (46, '主任医师', '类风湿关节炎', '周一至周五', 1, 60, 16, '叶强', 1, 54, '13800100046', '博士', '叶医生是类风湿关节炎治疗专家。', '风湿免疫科', 1);
INSERT INTO `doctor_info` VALUES (47, '副主任医师', '系统性红斑狼疮', '周一至周五', 1, 61, 16, '戴芳', 0, 48, '13800100047', '硕士', '戴医生擅长系统性红斑狼疮诊治。', '风湿免疫科', 1);
INSERT INTO `doctor_info` VALUES (48, '主治医师', '强直性脊柱炎', '周一至周五', 1, 62, 16, '钟伟', 1, 42, '13800100048', '硕士', '钟医生专注于强直性脊柱炎治疗。', '风湿免疫科', 1);
INSERT INTO `doctor_info` VALUES (49, '主任医师', '白血病', '周一至周五', 1, 63, 17, '黄涛', 1, 53, '13800100049', '博士', '黄医生是白血病治疗专家。', '血液内科', 1);
INSERT INTO `doctor_info` VALUES (50, '副主任医师', '淋巴瘤', '周一至周五', 1, 64, 17, '冯丽', 0, 47, '13800100050', '硕士', '冯医生擅长淋巴瘤诊治。', '血液内科', 1);
INSERT INTO `doctor_info` VALUES (51, '主治医师', '贫血', '周一至周五', 1, 65, 17, '陈强', 1, 41, '13800100051', '硕士', '陈医生专注于贫血治疗。', '血液内科', 1);
INSERT INTO `doctor_info` VALUES (52, '主任医师', '病毒性肝炎', '周一至周五', 1, 66, 18, '林芳', 0, 55, '13800100052', '博士', '林医生是病毒性肝炎治疗专家。', '感染科', 1);
INSERT INTO `doctor_info` VALUES (53, '副主任医师', '艾滋病', '周一至周五', 1, 67, 18, '何强', 1, 49, '13800100053', '硕士', '何医生擅长艾滋病诊治。', '感染科', 1);
INSERT INTO `doctor_info` VALUES (54, '主治医师', '结核病', '周一至周五', 1, 68, 18, '梁静', 0, 43, '13800100054', '硕士', '梁医生专注于结核病治疗。', '感染科', 1);
INSERT INTO `doctor_info` VALUES (55, '主任医师', '全科综合', '周一至周五', 1, 69, 19, '韩静', 0, 52, '13800100055', '博士', '韩医生是全科医学专家。', '全科医学科', 1);
INSERT INTO `doctor_info` VALUES (56, '副主任医师', '慢性病管理', '周一至周五', 1, 70, 19, '唐强', 1, 46, '13800100056', '硕士', '唐医生擅长慢性病管理。', '全科医学科', 1);
INSERT INTO `doctor_info` VALUES (57, '主治医师', '健康咨询', '周一至周五', 1, 71, 19, '许芳', 0, 40, '13800100057', '硕士', '许医生专注于健康咨询。', '全科医学科', 1);
INSERT INTO `doctor_info` VALUES (58, '主任医师', '脑肿瘤', '周一至周五', 1, 72, 20, '彭伟', 1, 54, '13800100058', '博士', '彭医生是脑肿瘤治疗专家。', '神经外科', 1);
INSERT INTO `doctor_info` VALUES (59, '副主任医师', '脑血管手术', '周一至周五', 1, 73, 20, '曾芳', 0, 48, '13800100059', '硕士', '曾医生擅长脑血管手术。', '神经外科', 1);
INSERT INTO `doctor_info` VALUES (60, '主治医师', '脊髓疾病', '周一至周五', 1, 74, 20, '吕强', 1, 42, '13800100060', '硕士', '吕医生专注于脊髓疾病治疗。', '神经外科', 1);
INSERT INTO `doctor_info` VALUES (61, '主任医师', '心脏外科', '周一至周五', 1, 75, 21, '苏静', 0, 53, '13800100061', '博士', '苏医生是心脏外科专家。', '心胸外科', 1);
INSERT INTO `doctor_info` VALUES (62, '副主任医师', '胸外科', '周一至周五', 1, 76, 21, '魏涛', 1, 47, '13800100062', '硕士', '魏医生擅长胸外科手术。', '心胸外科', 1);
INSERT INTO `doctor_info` VALUES (63, '主治医师', '胸腔镜手术', '周一至周五', 1, 77, 21, '叶华', 1, 41, '13800100063', '硕士', '叶医生专注于胸腔镜手术。', '心胸外科', 1);
INSERT INTO `doctor_info` VALUES (64, '主任医师', '泌尿系统肿瘤', '周一至周五', 1, 78, 22, '戴静', 0, 52, '13800100064', '博士', '戴医生是泌尿系统肿瘤专家。', '泌尿外科', 1);
INSERT INTO `doctor_info` VALUES (65, '副主任医师', '前列腺疾病', '周一至周五', 1, 79, 22, '钟芳', 0, 46, '13800100065', '硕士', '钟医生擅长前列腺疾病诊治。', '泌尿外科', 1);
INSERT INTO `doctor_info` VALUES (66, '主治医师', '泌尿系结石', '周一至周五', 1, 80, 22, '黄静', 0, 40, '13800100066', '硕士', '黄医生专注于泌尿系结石治疗。', '泌尿外科', 1);
INSERT INTO `doctor_info` VALUES (67, '主任医师', '肝脏外科', '周一至周五', 1, 81, 23, '冯强', 1, 54, '13800100067', '博士', '冯医生是肝脏外科专家。', '肝胆外科', 1);
INSERT INTO `doctor_info` VALUES (68, '副主任医师', '胆道外科', '周一至周五', 1, 82, 23, '陈丽', 0, 48, '13800100068', '硕士', '陈医生擅长胆道外科手术。', '肝胆外科', 1);
INSERT INTO `doctor_info` VALUES (69, '主治医师', '胰腺外科', '周一至周五', 1, 83, 23, '林强', 1, 42, '13800100069', '硕士', '林医生专注于胰腺外科治疗。', '肝胆外科', 1);
INSERT INTO `doctor_info` VALUES (70, '主任医师', '胃癌治疗', '周一至周五', 1, 84, 24, '何芳', 0, 53, '13800100070', '博士', '何医生是胃癌治疗专家。', '胃肠外科', 1);
INSERT INTO `doctor_info` VALUES (71, '副主任医师', '肠癌治疗', '周一至周五', 1, 85, 24, '梁静', 0, 47, '13800100071', '硕士', '梁医生擅长肠癌治疗。', '胃肠外科', 1);
INSERT INTO `doctor_info` VALUES (72, '主治医师', '腹腔镜手术', '周一至周五', 1, 86, 24, '韩伟', 1, 41, '13800100072', '硕士', '韩医生专注于腹腔镜手术。', '胃肠外科', 1);
INSERT INTO `doctor_info` VALUES (73, '主任医师', '乳腺癌治疗', '周一至周五', 1, 87, 25, '唐芳', 0, 52, '13800100073', '博士', '唐医生是乳腺癌治疗专家。', '乳腺外科', 1);
INSERT INTO `doctor_info` VALUES (74, '副主任医师', '乳腺增生', '周一至周五', 1, 88, 25, '许静', 0, 46, '13800100074', '硕士', '许医生擅长乳腺增生诊治。', '乳腺外科', 1);
INSERT INTO `doctor_info` VALUES (75, '主治医师', '乳腺肿瘤', '周一至周五', 1, 89, 25, '彭芳', 0, 40, '13800100075', '硕士', '彭医生专注于乳腺肿瘤治疗。', '乳腺外科', 1);
INSERT INTO `doctor_info` VALUES (100, '主任医师', '静脉曲张', '周一至周五', 1, 100, 26, '郑丽', 0, 50, '13800100100', '博士', '郑医生是血管外科专家。', '血管外科', 1);
INSERT INTO `doctor_info` VALUES (101, '副主任医师', '动脉硬化', '周一至周五', 1, 101, 26, '黄涛', 1, 44, '13800100101', '硕士', '黄医生擅长动脉硬化诊治。', '血管外科', 1);
INSERT INTO `doctor_info` VALUES (102, '主治医师', '血管介入', '周一至周五', 1, 102, 26, '冯静', 0, 38, '13800100102', '本科', '冯医生专注于血管介入治疗。', '血管外科', 1);
INSERT INTO `doctor_info` VALUES (103, '主任医师', '烧伤治疗', '周一至周五', 1, 103, 27, '陈强', 1, 52, '13800100103', '博士', '陈医生是烧伤整形外科专家。', '烧伤整形外科', 1);
INSERT INTO `doctor_info` VALUES (104, '副主任医师', '疤痕修复', '周一至周五', 1, 104, 27, '周芳', 0, 46, '13800100104', '硕士', '周医生擅长疤痕修复。', '烧伤整形外科', 1);
INSERT INTO `doctor_info` VALUES (105, '主治医师', '整形美容', '周一至周五', 1, 105, 27, '吴丽', 0, 40, '13800100105', '本科', '吴医生专注于整形美容。', '烧伤整形外科', 1);
INSERT INTO `doctor_info` VALUES (106, '主任医师', '痔疮治疗', '周一至周五', 1, 106, 28, '林涛', 1, 53, '13800100106', '博士', '林医生是肛肠科专家。', '肛肠科', 1);
INSERT INTO `doctor_info` VALUES (107, '副主任医师', '肛裂', '周一至周五', 1, 107, 28, '何芳', 0, 47, '13800100107', '硕士', '何医生擅长肛裂诊治。', '肛肠科', 1);
INSERT INTO `doctor_info` VALUES (108, '主治医师', '肛瘘', '周一至周五', 1, 108, 28, '梁伟', 1, 41, '13800100108', '本科', '梁医生专注于肛瘘治疗。', '肛肠科', 1);
INSERT INTO `doctor_info` VALUES (109, '主任医师', '妇科肿瘤', '周一至周五', 1, 109, 29, '罗静', 0, 54, '13800100109', '博士', '罗医生是妇科肿瘤专家。', '妇科', 1);
INSERT INTO `doctor_info` VALUES (110, '副主任医师', '妇科炎症', '周一至周五', 1, 110, 29, '谢涛', 1, 48, '13800100110', '硕士', '谢医生擅长妇科炎症诊治。', '妇科', 1);
INSERT INTO `doctor_info` VALUES (111, '主治医师', '月经不调', '周一至周五', 1, 111, 29, '韩杰', 1, 42, '13800100111', '本科', '韩医生专注于月经不调治疗。', '妇科', 1);
INSERT INTO `doctor_info` VALUES (112, '主任医师', '高危妊娠', '周一至周五', 1, 112, 30, '唐静', 0, 55, '13800100112', '博士', '唐医生是产科专家，擅长高危妊娠管理。', '产科', 1);
INSERT INTO `doctor_info` VALUES (113, '副主任医师', '顺产指导', '周一至周五', 1, 113, 30, '许强', 1, 49, '13800100113', '硕士', '许医生擅长顺产指导。', '产科', 1);
INSERT INTO `doctor_info` VALUES (114, '主治医师', '剖宫产', '周一至周五', 1, 114, 30, '邓丽', 0, 43, '13800100114', '本科', '邓医生专注于剖宫产手术。', '产科', 1);
INSERT INTO `doctor_info` VALUES (115, '主任医师', '新生儿重症', '周一至周五', 1, 115, 31, '曹涛', 1, 52, '13800100115', '博士', '曹医生是新生儿科专家。', '新生儿科', 1);
INSERT INTO `doctor_info` VALUES (116, '副主任医师', '早产儿护理', '周一至周五', 1, 116, 31, '彭伟', 1, 46, '13800100116', '硕士', '彭医生擅长早产儿护理。', '新生儿科', 1);
INSERT INTO `doctor_info` VALUES (117, '主治医师', '新生儿感染', '周一至周五', 1, 117, 31, '曾强', 1, 40, '13800100117', '本科', '曾医生专注于新生儿感染治疗。', '新生儿科', 1);
INSERT INTO `doctor_info` VALUES (118, '主任医师', '儿童发育', '周一至周五', 1, 118, 32, '吕芳', 0, 50, '13800100118', '博士', '吕医生是儿童保健专家。', '儿童保健科', 1);
INSERT INTO `doctor_info` VALUES (119, '副主任医师', '儿童营养', '周一至周五', 1, 119, 32, '苏强', 1, 44, '13800100119', '硕士', '苏医生擅长儿童营养指导。', '儿童保健科', 1);
INSERT INTO `doctor_info` VALUES (120, '主治医师', '儿童心理', '周一至周五', 1, 120, 32, '魏丽', 0, 38, '13800100120', '本科', '魏医生专注于儿童心理辅导。', '儿童保健科', 1);
INSERT INTO `doctor_info` VALUES (121, '主任医师', '急诊急救', '周一至周五', 1, 121, 33, '叶华', 1, 56, '13800100121', '博士', '叶医生是急诊科专家。', '急诊科', 1);
INSERT INTO `doctor_info` VALUES (122, '副主任医师', '创伤急救', '周一至周五', 1, 122, 33, '戴静', 0, 50, '13800100122', '硕士', '戴医生擅长创伤急救。', '急诊科', 1);
INSERT INTO `doctor_info` VALUES (123, '主治医师', '内科急诊', '周一至周五', 1, 123, 33, '钟芳', 0, 44, '13800100123', '本科', '钟医生专注于内科急诊。', '急诊科', 1);
INSERT INTO `doctor_info` VALUES (124, '主任医师', '重症监护', '周一至周五', 1, 124, 34, '宋强', 1, 54, '13800100124', '博士', '宋医生是重症医学专家。', '重症医学科ICU', 1);
INSERT INTO `doctor_info` VALUES (125, '副主任医师', '呼吸机管理', '周一至周五', 1, 125, 34, '郑涛', 1, 48, '13800100125', '硕士', '郑医生擅长呼吸机管理。', '重症医学科ICU', 1);
INSERT INTO `doctor_info` VALUES (126, '主治医师', '危重症救治', '周一至周五', 1, 126, 34, '黄静', 0, 42, '13800100126', '本科', '黄医生专注于危重症救治。', '重症医学科ICU', 1);
INSERT INTO `doctor_info` VALUES (127, '主任医师', '临床麻醉', '周一至周五', 1, 127, 35, '冯强', 1, 53, '13800100127', '博士', '冯医生是麻醉科专家。', '麻醉科', 1);
INSERT INTO `doctor_info` VALUES (128, '副主任医师', '疼痛管理', '周一至周五', 1, 128, 35, '陈丽', 0, 47, '13800100128', '硕士', '陈医生擅长疼痛管理。', '麻醉科', 1);
INSERT INTO `doctor_info` VALUES (129, '主治医师', '麻醉监测', '周一至周五', 1, 129, 35, '周伟', 1, 41, '13800100129', '本科', '周医生专注于麻醉监测。', '麻醉科', 1);
INSERT INTO `doctor_info` VALUES (130, '主任医师', '手术管理', '周一至周五', 1, 130, 36, '吴涛', 1, 55, '13800100130', '博士', '吴医生是手术室专家。', '手术室', 1);
INSERT INTO `doctor_info` VALUES (131, '副主任医师', '无菌操作', '周一至周五', 1, 131, 36, '林强', 1, 49, '13800100131', '硕士', '林医生擅长无菌操作管理。', '手术室', 1);
INSERT INTO `doctor_info` VALUES (132, '主治医师', '器械管理', '周一至周五', 1, 132, 36, '何芳', 0, 43, '13800100132', '本科', '何医生专注于手术器械管理。', '手术室', 1);
INSERT INTO `doctor_info` VALUES (133, '主任医师', '临床检验', '周一至周五', 1, 133, 37, '梁静', 0, 52, '13800100133', '博士', '梁医生是检验科专家。', '检验科', 1);
INSERT INTO `doctor_info` VALUES (134, '副主任医师', '生化检验', '周一至周五', 1, 134, 37, '罗涛', 1, 46, '13800100134', '硕士', '罗医生擅长生化检验。', '检验科', 1);
INSERT INTO `doctor_info` VALUES (135, '主治医师', '微生物检验', '周一至周五', 1, 135, 37, '谢丽', 0, 40, '13800100135', '本科', '谢医生专注于微生物检验。', '检验科', 1);
INSERT INTO `doctor_info` VALUES (136, '主任医师', 'CT诊断', '周一至周五', 1, 136, 38, '韩伟', 1, 54, '13800100136', '博士', '韩医生是放射科专家。', '放射科', 1);
INSERT INTO `doctor_info` VALUES (137, '副主任医师', 'X光诊断', '周一至周五', 1, 137, 38, '唐芳', 0, 48, '13800100137', '硕士', '唐医生擅长X光诊断。', '放射科', 1);
INSERT INTO `doctor_info` VALUES (138, '主治医师', 'MRI诊断', '周一至周五', 1, 138, 38, '许静', 0, 42, '13800100138', '本科', '许医生专注于MRI诊断。', '放射科', 1);
INSERT INTO `doctor_info` VALUES (139, '主任医师', '腹部超声', '周一至周五', 1, 139, 39, '邓强', 1, 53, '13800100139', '博士', '邓医生是超声科专家。', '超声科', 1);
INSERT INTO `doctor_info` VALUES (140, '副主任医师', '心脏超声', '周一至周五', 1, 140, 39, '曹涛', 1, 47, '13800100140', '硕士', '曹医生擅长心脏超声。', '超声科', 1);
INSERT INTO `doctor_info` VALUES (141, '主治医师', '妇产科超声', '周一至周五', 1, 141, 39, '彭芳', 0, 41, '13800100141', '本科', '彭医生专注于妇产科超声。', '超声科', 1);
INSERT INTO `doctor_info` VALUES (142, '主任医师', '心电图诊断', '周一至周五', 1, 142, 40, '曾丽', 0, 51, '13800100142', '博士', '曾医生是心电图诊断专家。', '心电图室', 1);
INSERT INTO `doctor_info` VALUES (143, '副主任医师', '动态心电图', '周一至周五', 1, 143, 40, '吕强', 1, 45, '13800100143', '硕士', '吕医生擅长动态心电图分析。', '心电图室', 1);
INSERT INTO `doctor_info` VALUES (144, '主治医师', '心律失常', '周一至周五', 1, 144, 40, '苏静', 0, 39, '13800100144', '本科', '苏医生专注于心律失常诊断。', '心电图室', 1);
INSERT INTO `doctor_info` VALUES (145, '主任医师', '病理诊断', '周一至周五', 1, 145, 41, '魏丽', 0, 54, '13800100145', '博士', '魏医生是病理科专家。', '病理科', 1);
INSERT INTO `doctor_info` VALUES (146, '副主任医师', '组织病理', '周一至周五', 1, 146, 41, '叶强', 1, 48, '13800100146', '硕士', '叶医生擅长组织病理诊断。', '病理科', 1);
INSERT INTO `doctor_info` VALUES (147, '主治医师', '细胞病理', '周一至周五', 1, 147, 41, '戴芳', 0, 42, '13800100147', '本科', '戴医生专注于细胞病理诊断。', '病理科', 1);
INSERT INTO `doctor_info` VALUES (148, '主任医师', '临床药学', '周一至周五', 1, 148, 42, '钟伟', 1, 52, '13800100148', '博士', '钟医生是药剂科专家。', '药剂科', 1);
INSERT INTO `doctor_info` VALUES (149, '副主任医师', '药物分析', '周一至周五', 1, 149, 42, '宋静', 0, 46, '13800100149', '硕士', '宋医生擅长药物分析。', '药剂科', 1);
INSERT INTO `doctor_info` VALUES (150, '主治医师', '药房管理', '周一至周五', 1, 150, 42, '郑涛', 1, 40, '13800100150', '本科', '郑医生专注于药房管理。', '药剂科', 1);
INSERT INTO `doctor_info` VALUES (151, '主任医师', '消毒管理', '周一至周五', 1, 151, 43, '黄涛', 1, 55, '13800100151', '博士', '黄医生是消毒供应中心专家。', '消毒供应中心', 1);
INSERT INTO `doctor_info` VALUES (152, '副主任医师', '灭菌技术', '周一至周五', 1, 152, 43, '冯丽', 0, 49, '13800100152', '硕士', '冯医生擅长灭菌技术。', '消毒供应中心', 1);
INSERT INTO `doctor_info` VALUES (153, '主治医师', '无菌物品', '周一至周五', 1, 153, 43, '陈强', 1, 43, '13800100153', '本科', '陈医生专注于无菌物品管理。', '消毒供应中心', 1);
INSERT INTO `doctor_info` VALUES (154, '主任医师', '中医内科', '周一至周五', 1, 154, 44, '周芳', 0, 53, '13800100154', '博士', '周医生是中医科专家。', '中医科', 1);
INSERT INTO `doctor_info` VALUES (155, '副主任医师', '中医妇科', '周一至周五', 1, 155, 44, '吴丽', 0, 47, '13800100155', '硕士', '吴医生擅长中医妇科。', '中医科', 1);
INSERT INTO `doctor_info` VALUES (156, '主治医师', '中医儿科', '周一至周五', 1, 156, 44, '林芳', 0, 41, '13800100156', '本科', '林医生专注于中医儿科。', '中医科', 1);
INSERT INTO `doctor_info` VALUES (157, '主任医师', '针灸治疗', '周一至周五', 1, 157, 45, '何强', 1, 54, '13800100157', '博士', '何医生是针灸推拿科专家。', '针灸推拿科', 1);
INSERT INTO `doctor_info` VALUES (158, '副主任医师', '推拿按摩', '周一至周五', 1, 158, 45, '梁静', 0, 48, '13800100158', '硕士', '梁医生擅长推拿按摩。', '针灸推拿科', 1);
INSERT INTO `doctor_info` VALUES (159, '主治医师', '经络调理', '周一至周五', 1, 159, 45, '罗涛', 1, 42, '13800100159', '本科', '罗医生专注于经络调理。', '针灸推拿科', 1);
INSERT INTO `doctor_info` VALUES (160, '主任医师', '康复治疗', '周一至周五', 1, 160, 46, '谢丽', 0, 52, '13800100160', '博士', '谢医生是康复医学科专家。', '康复医学科', 1);
INSERT INTO `doctor_info` VALUES (161, '副主任医师', '物理治疗', '周一至周五', 1, 161, 46, '韩静', 0, 46, '13800100161', '硕士', '韩医生擅长物理治疗。', '康复医学科', 1);
INSERT INTO `doctor_info` VALUES (162, '主治医师', '康复训练', '周一至周五', 1, 162, 46, '唐强', 1, 40, '13800100162', '本科', '唐医生专注于康复训练指导。', '康复医学科', 1);
INSERT INTO `doctor_info` VALUES (163, '主任医师', '男性不育', '周一至周五', 1, 163, 47, '许芳', 0, 51, '13800100163', '博士', '许医生是男科专家。', '男科', 1);
INSERT INTO `doctor_info` VALUES (164, '副主任医师', '性功能障碍', '周一至周五', 1, 164, 47, '邓丽', 0, 45, '13800100164', '硕士', '邓医生擅长性功能障碍诊治。', '男科', 1);
INSERT INTO `doctor_info` VALUES (165, '主治医师', '前列腺疾病', '周一至周五', 1, 165, 47, '曹涛', 1, 39, '13800100165', '本科', '曹医生专注于前列腺疾病治疗。', '男科', 1);
INSERT INTO `doctor_info` VALUES (166, '主任医师', '肿瘤化疗', '周一至周五', 1, 166, 48, '彭伟', 1, 56, '13800100166', '博士', '彭医生是肿瘤科专家。', '肿瘤科', 1);
INSERT INTO `doctor_info` VALUES (167, '副主任医师', '肿瘤放疗', '周一至周五', 1, 167, 48, '曾芳', 0, 50, '13800100167', '硕士', '曾医生擅长肿瘤放疗。', '肿瘤科', 1);
INSERT INTO `doctor_info` VALUES (168, '主治医师', '肿瘤靶向治疗', '周一至周五', 1, 168, 48, '吕强', 1, 44, '13800100168', '本科', '吕医生专注于肿瘤靶向治疗。', '肿瘤科', 1);
INSERT INTO `doctor_info` VALUES (169, '主任医师', '临床营养', '周一至周五', 1, 172, 49, '李明华', 1, 55, '13800138001', '博士', '李医生专注于临床营养指导', '营养科', 1);
INSERT INTO `doctor_info` VALUES (170, '副主任医师', '膳食调理', '周一至周五', 1, 173, 49, '王芳', 0, 48, '13800138002', '硕士', '王医生擅长膳食营养搭配', '营养科', 1);
INSERT INTO `doctor_info` VALUES (171, '主治医师', '营养评估', '周一至周五', 1, 174, 49, '张伟', 1, 40, '13800138003', '本科', '张医生负责营养评估工作', '营养科', 1);
INSERT INTO `doctor_info` VALUES (172, '主任医师', '老年慢病', '周一至周五', 1, 175, 50, '陈建国', 1, 60, '13800138004', '博士', '陈医生擅长老年慢性病管理', '老年病科', 1);
INSERT INTO `doctor_info` VALUES (173, '副主任医师', '康复护理', '周一至周五', 1, 176, 50, '刘冬梅', 0, 52, '13800138005', '硕士', '刘医生专注于老年康复护理', '老年病科', 1);
INSERT INTO `doctor_info` VALUES (174, '主治医师', '综合评估', '周一至周五', 1, 177, 50, '赵强', 1, 45, '13800138006', '本科', '赵医生负责老年综合评估', '老年病科', 1);
INSERT INTO `doctor_info` VALUES (175, '主任医师', '过敏诊治', '周一至周五', 1, 178, 51, '孙丽华', 0, 58, '13800138007', '博士', '孙医生是过敏疾病专家', '过敏反应科', 1);
INSERT INTO `doctor_info` VALUES (176, '副主任医师', '免疫检测', '周一至周五', 1, 179, 51, '周伟', 1, 50, '13800138008', '硕士', '周医生擅长免疫功能检测', '过敏反应科', 1);
INSERT INTO `doctor_info` VALUES (177, '主治医师', '脱敏治疗', '周一至周五', 1, 180, 51, '吴敏', 0, 42, '13800138009', '本科', '吴医生负责脱敏治疗工作', '过敏反应科', 1);
INSERT INTO `doctor_info` VALUES (178, '主任医师', '体检诊断', '周一至周日', 1, 181, 52, '郑磊', 1, 56, '13800138010', '博士', '郑医生负责体检报告解读', '体检中心', 1);
INSERT INTO `doctor_info` VALUES (179, '副主任医师', '健康评估', '周一至周日', 1, 182, 52, '黄燕', 0, 49, '13800138011', '硕士', '黄医生擅长健康风险评估', '体检中心', 1);
INSERT INTO `doctor_info` VALUES (180, '主治医师', '报告分析', '周一至周日', 1, 183, 52, '许峰', 1, 43, '13800138012', '本科', '许医生负责体检报告分析', '体检中心', 1);

-- ----------------------------
-- Table structure for fee_info
-- ----------------------------
DROP TABLE IF EXISTS `fee_info`;
CREATE TABLE `fee_info`  (
  `fee_id` int NOT NULL AUTO_INCREMENT,
  `fee_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `amount` decimal(10, 2) NOT NULL,
  `pay_time` datetime NULL DEFAULT NULL,
  `pay_status` int NULL DEFAULT 0,
  `pay_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `record_id` int NOT NULL,
  `patient_id` int NOT NULL,
  `doctor_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`fee_id`) USING BTREE,
  INDEX `record_id`(`record_id`) USING BTREE,
  INDEX `patient_id`(`patient_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fee_info
-- ----------------------------
INSERT INTO `fee_info` VALUES (1, '挂号费', 50.00, '2026-04-16 20:14:13', 1, '微信', 1, 1, NULL);
INSERT INTO `fee_info` VALUES (2, '药品费', 30.00, '2026-04-16 20:14:13', 1, '支付宝', 2, 2, NULL);
INSERT INTO `fee_info` VALUES (3, '检查费', 80.00, '2026-04-16 20:14:13', 1, '现金', 3, 3, NULL);
INSERT INTO `fee_info` VALUES (4, '治疗费', 40.00, '2026-04-16 20:14:13', 1, '微信', 4, 4, NULL);
INSERT INTO `fee_info` VALUES (5, '手术费', 500.00, '2026-04-16 20:14:13', 1, '支付宝', 5, 5, NULL);
INSERT INTO `fee_info` VALUES (6, '住院费', 200.00, '2026-04-16 20:14:13', 1, '现金', 6, 6, NULL);
INSERT INTO `fee_info` VALUES (7, '西药费', 60.00, '2026-04-16 20:14:13', 1, '微信', 7, 7, NULL);
INSERT INTO `fee_info` VALUES (8, '中成药费', 45.00, '2026-04-16 20:14:13', 1, '支付宝', 8, 8, NULL);
INSERT INTO `fee_info` VALUES (9, '材料费', 20.00, '2026-04-16 20:14:13', 1, '现金', 9, 9, NULL);
INSERT INTO `fee_info` VALUES (10, '其他费', 35.00, '2026-04-16 20:14:13', 1, '微信', 10, 10, NULL);
INSERT INTO `fee_info` VALUES (11, '药品费', 35.50, '2026-05-20 00:22:34', 1, '线上支付', 12, 14, 1);
INSERT INTO `fee_info` VALUES (12, '药品费', 8.50, '2026-05-20 01:03:14', 1, '线下缴费', 13, 14, 1);
INSERT INTO `fee_info` VALUES (13, '药品费', 17.00, '2026-05-20 01:49:28', 1, '线下缴费', 14, 186, 1);
INSERT INTO `fee_info` VALUES (14, '药品费', 15.80, '2026-05-27 08:50:35', 1, '微信线上缴费', 15, 14, 1);
INSERT INTO `fee_info` VALUES (15, '药品+检查费', 89.81, '2026-05-27 07:55:38', 1, '微信线上缴费', 16, 14, 1);
INSERT INTO `fee_info` VALUES (16, '药品+检查费', 229.50, '2026-05-25 20:56:47', 1, '微信线上缴费', 17, 14, 1);
INSERT INTO `fee_info` VALUES (17, '药品费', 28.50, '2026-05-27 10:00:00', 1, '微信线上缴费', 18, 14, 1);
INSERT INTO `fee_info` VALUES (18, '药品费', 114.00, '2026-05-27 10:06:13', 1, '微信线上缴费', 19, 14, 1);
INSERT INTO `fee_info` VALUES (19, '药品+检查费', 224.80, '2026-06-03 10:07:26', 1, '微信线上支付', 20, 14, 1);
INSERT INTO `fee_info` VALUES (20, '药品+检查费', 193.80, '2026-05-29 08:12:10', 1, '微信线上支付', 21, 14, 1);

-- ----------------------------
-- Table structure for medicine_info
-- ----------------------------
DROP TABLE IF EXISTS `medicine_info`;
CREATE TABLE `medicine_info`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增主键ID',
  `med_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '药品名称',
  `med_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '药品类型',
  `price` decimal(10, 2) NOT NULL COMMENT '药品单价',
  `stock` int NOT NULL DEFAULT 0 COMMENT '库存数量',
  `spec` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药品规格',
  `producer` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生产厂家',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态 1=上架 0=下架',
  `med_insurance_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保类型（甲/乙/丙）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1896 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '药品信息管理表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of medicine_info
-- ----------------------------
INSERT INTO `medicine_info` VALUES (1, '布洛芬缓释胶囊', '解热镇痛抗炎药', 28.50, 200, '0.4g*24粒', '中美史克', 1, '甲');
INSERT INTO `medicine_info` VALUES (2, '布洛芬片', '解热镇痛抗炎药', 12.80, 300, '0.2g*100片', '新华制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (3, '对乙酰氨基酚片', '解热镇痛抗炎药', 11.50, 320, '0.5g*100片', '云南白药', 1, '甲');
INSERT INTO `medicine_info` VALUES (4, '对乙酰氨基酚缓释片', '解热镇痛抗炎药', 19.80, 260, '0.65g*18片', '强生', 1, '乙');
INSERT INTO `medicine_info` VALUES (5, '阿司匹林肠溶片', '解热镇痛抗炎药', 9.90, 280, '100mg*60片', '拜耳', 1, '甲');
INSERT INTO `medicine_info` VALUES (6, '阿司匹林泡腾片', '解热镇痛抗炎药', 22.00, 220, '0.5g*10片', '拜耳', 1, '乙');
INSERT INTO `medicine_info` VALUES (7, '洛索洛芬钠片', '解热镇痛抗炎药', 22.50, 240, '60mg*20片', '乐松', 1, '乙');
INSERT INTO `medicine_info` VALUES (8, '洛索洛芬钠凝胶贴膏', '解热镇痛抗炎药', 49.80, 130, '100mg*6贴', '久光制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (9, '双氯芬酸钠缓释片', '解热镇痛抗炎药', 16.80, 250, '75mg*20片', '扶他林', 1, '乙');
INSERT INTO `medicine_info` VALUES (10, '双氯芬酸钠肠溶片', '解热镇痛抗炎药', 12.50, 300, '25mg*100片', '白云山', 1, '甲');
INSERT INTO `medicine_info` VALUES (11, '双氯芬酸二乙胺乳胶剂', '解热镇痛抗炎药', 23.80, 240, '20g', '扶他林', 1, '乙');
INSERT INTO `medicine_info` VALUES (12, '塞来昔布胶囊', '解热镇痛抗炎药', 45.00, 160, '0.2g*6粒', '辉瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (13, '依托考昔片', '解热镇痛抗炎药', 58.00, 120, '60mg*5片', '默沙东', 1, '乙');
INSERT INTO `medicine_info` VALUES (14, '尼美舒利颗粒', '解热镇痛抗炎药', 18.50, 230, '50mg*12袋', '康芝药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (15, '尼美舒利片', '解热镇痛抗炎药', 22.80, 210, '0.1g*10片', '健民药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (16, '吲哚美辛肠溶片', '解热镇痛抗炎药', 8.50, 350, '25mg*100片', '恒健药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (17, '吲哚美辛栓', '解热镇痛抗炎药', 15.80, 260, '0.1g*10枚', '马应龙', 1, '乙');
INSERT INTO `medicine_info` VALUES (18, '美洛昔康片', '解热镇痛抗炎药', 26.80, 210, '7.5mg*10片', '勃林格殷格翰', 1, '乙');
INSERT INTO `medicine_info` VALUES (19, '氯诺昔康片', '解热镇痛抗炎药', 28.50, 200, '8mg*10片', '赫森药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (20, '氟比洛芬酯注射液', '解热镇痛抗炎药', 52.00, 110, '50mg/支', '凯纷', 1, '乙');
INSERT INTO `medicine_info` VALUES (21, '氟比洛芬凝胶贴膏', '解热镇痛抗炎药', 48.00, 130, '40mg*6贴', '泽普思', 1, '乙');
INSERT INTO `medicine_info` VALUES (22, '酮洛芬凝胶', '解热镇痛抗炎药', 19.50, 250, '20g', '法斯通', 1, '乙');
INSERT INTO `medicine_info` VALUES (23, '酮洛芬贴片', '解热镇痛抗炎药', 32.50, 180, '30mg*5贴', '日本帝国', 1, '乙');
INSERT INTO `medicine_info` VALUES (24, '吡罗昔康片', '解热镇痛抗炎药', 9.90, 320, '20mg*100片', '恒健药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (25, '吡罗昔康凝胶', '解热镇痛抗炎药', 16.80, 260, '20g', '太极集团', 1, '乙');
INSERT INTO `medicine_info` VALUES (26, '安乃近片', '解热镇痛抗炎药', 8.50, 350, '0.5g*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (27, '去痛片', '解热镇痛抗炎药', 5.50, 400, '100片/瓶', '东北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (28, '复方对乙酰氨基酚片', '解热镇痛抗炎药', 15.80, 280, '10片/盒', '拜耳', 1, '甲');
INSERT INTO `medicine_info` VALUES (29, '氨酚咖那敏片', '解热镇痛抗炎药', 16.50, 260, '10片/盒', '修正药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (30, '酚咖片', '解热镇痛抗炎药', 19.80, 240, '10片/盒', '施贵宝', 1, '乙');
INSERT INTO `medicine_info` VALUES (31, '精氨酸阿司匹林注射液', '解热镇痛抗炎药', 12.50, 180, '1g/支', '亚宝药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (32, '赖氨匹林散', '解热镇痛抗炎药', 16.80, 240, '0.45g*10袋', '丽珠集团', 1, '乙');
INSERT INTO `medicine_info` VALUES (33, '赖氨匹林注射液', '解热镇痛抗炎药', 18.50, 220, '0.9g/支', '悦康药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (34, '丙帕他莫注射液', '解热镇痛抗炎药', 38.00, 140, '1g/支', '泰诺', 1, '乙');
INSERT INTO `medicine_info` VALUES (35, '帕瑞昔布钠注射液', '解热镇痛抗炎药', 65.00, 100, '40mg/支', '辉瑞', 1, '谈判');
INSERT INTO `medicine_info` VALUES (36, '布洛芬混悬液', '解热镇痛抗炎药', 25.00, 250, '100ml', '美林', 1, '甲');
INSERT INTO `medicine_info` VALUES (37, '布洛芬混悬滴剂', '解热镇痛抗炎药', 22.50, 230, '15ml', '美林', 1, '甲');
INSERT INTO `medicine_info` VALUES (38, '对乙酰氨基酚混悬滴剂', '解热镇痛抗炎药', 18.50, 280, '15ml', '泰诺林', 1, '甲');
INSERT INTO `medicine_info` VALUES (39, '对乙酰氨基酚口服溶液', '解热镇痛抗炎药', 16.80, 260, '60ml', '百服宁', 1, '甲');
INSERT INTO `medicine_info` VALUES (40, '小儿退热栓', '解热镇痛抗炎药', 12.50, 280, '0.15g*10枚', '葵花药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (41, '小儿氨酚黄那敏颗粒', '解热镇痛抗炎药', 12.80, 300, '6g*12袋', '护彤', 1, '甲');
INSERT INTO `medicine_info` VALUES (42, '小儿氨酚烷胺颗粒', '解热镇痛抗炎药', 15.80, 260, '6g*12袋', '优卡丹', 1, '乙');
INSERT INTO `medicine_info` VALUES (43, '小儿豉翘清热颗粒', '解热镇痛抗炎药', 28.00, 200, '2g*12袋', '同贝', 1, '乙');
INSERT INTO `medicine_info` VALUES (44, '小儿柴桂退热颗粒', '解热镇痛抗炎药', 22.50, 230, '5g*12袋', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (45, '连花清瘟颗粒', '解热镇痛抗炎药', 24.90, 210, '6g*10袋', '以岭药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (46, '连花清瘟胶囊', '解热镇痛抗炎药', 23.80, 220, '0.35g*24粒', '以岭药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (47, '金花清感颗粒', '解热镇痛抗炎药', 26.80, 200, '5g*12袋', '聚协昌', 1, '乙');
INSERT INTO `medicine_info` VALUES (48, '疏风解毒胶囊', '解热镇痛抗炎药', 29.80, 190, '0.52g*24粒', '济人药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (49, '清热解毒口服液', '解热镇痛抗炎药', 18.50, 250, '10ml*10支', '白云山', 1, '甲');
INSERT INTO `medicine_info` VALUES (50, '抗病毒口服液', '解热镇痛抗炎药', 19.80, 240, '10ml*10支', '香雪制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (51, '板蓝根颗粒', '解热镇痛抗炎药', 9.90, 350, '10g*20袋', '白云山', 1, '甲');
INSERT INTO `medicine_info` VALUES (52, '双黄连口服液', '解热镇痛抗炎药', 16.50, 280, '10ml*10支', '哈药集团', 1, '甲');
INSERT INTO `medicine_info` VALUES (53, '清开灵颗粒', '解热镇痛抗炎药', 22.00, 240, '3g*12袋', '白云山', 1, '乙');
INSERT INTO `medicine_info` VALUES (54, '清开灵口服液', '解热镇痛抗炎药', 23.80, 220, '10ml*10支', '白云山', 1, '乙');
INSERT INTO `medicine_info` VALUES (55, '安痛定注射液', '解热镇痛抗炎药', 8.50, 300, '2ml/支', '亚宝药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (56, '柴胡注射液', '解热镇痛抗炎药', 6.80, 350, '2ml/支', '神威药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (57, '羚羊角口服液', '解热镇痛抗炎药', 32.00, 180, '5ml*6支', '同仁堂', 1, '乙');
INSERT INTO `medicine_info` VALUES (58, '紫雪散', '解热镇痛抗炎药', 45.00, 150, '1.5g*10瓶', '同仁堂', 1, '乙');
INSERT INTO `medicine_info` VALUES (59, '复方锌布颗粒', '解热镇痛抗炎药', 16.80, 260, '12袋/盒', '臣功再欣', 1, '乙');
INSERT INTO `medicine_info` VALUES (60, '牛磺酸颗粒', '解热镇痛抗炎药', 12.50, 300, '0.4g*12袋', '白云山', 1, '甲');
INSERT INTO `medicine_info` VALUES (61, '布洛芬乳膏', '解热镇痛抗炎药', 15.50, 280, '20g', '中美史克', 1, '乙');
INSERT INTO `medicine_info` VALUES (62, '布洛芬口腔崩解片', '解热镇痛抗炎药', 28.50, 200, '0.2g*12片', '亚宝药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (63, '对乙酰氨基酚栓', '解热镇痛抗炎药', 9.90, 320, '0.3g*10枚', '敬修堂', 1, '甲');
INSERT INTO `medicine_info` VALUES (64, '阿司匹林维生素C泡腾片', '解热镇痛抗炎药', 32.50, 180, '10片/盒', '拜耳', 1, '乙');
INSERT INTO `medicine_info` VALUES (65, '复方阿司匹林片', '解热镇痛抗炎药', 7.50, 380, '100片/瓶', '新华制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (66, '贝诺酯片', '解热镇痛抗炎药', 12.50, 300, '0.5g*100片', '康恩贝', 1, '甲');
INSERT INTO `medicine_info` VALUES (67, '阿咖酚散', '解热镇痛抗炎药', 8.50, 350, '100包/盒', '白云山', 1, '甲');
INSERT INTO `medicine_info` VALUES (68, '酚氨咖敏片', '解热镇痛抗炎药', 9.90, 320, '100片/瓶', '三九药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (69, '氨酚双氢可待因片', '解热镇痛抗炎药', 38.00, 140, '12片/盒', '路盖克', 1, '乙');
INSERT INTO `medicine_info` VALUES (70, '洛芬待因缓释片', '解热镇痛抗炎药', 42.00, 130, '12片/盒', '恩华药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (71, '曲马多片', '解热镇痛抗炎药', 28.50, 200, '50mg*10片', '奇曼丁', 1, '乙');
INSERT INTO `medicine_info` VALUES (72, '曲马多缓释片', '解热镇痛抗炎药', 38.00, 140, '100mg*10片', '萌迪', 1, '乙');
INSERT INTO `medicine_info` VALUES (73, '曲马多注射液', '解热镇痛抗炎药', 18.50, 220, '100mg/支', '石药欧意', 1, '乙');
INSERT INTO `medicine_info` VALUES (74, '氨酚曲马多片', '解热镇痛抗炎药', 32.50, 180, '10片/盒', '奇曼丁', 1, '乙');
INSERT INTO `medicine_info` VALUES (75, '羟考酮缓释片', '解热镇痛抗炎药', 85.00, 100, '10mg*10片', '萌蒂', 1, '谈判');
INSERT INTO `medicine_info` VALUES (76, '吗啡缓释片', '解热镇痛抗炎药', 65.00, 100, '30mg*10片', '东北制药', 1, '谈判');
INSERT INTO `medicine_info` VALUES (77, '吗啡注射液', '解热镇痛抗炎药', 12.50, 300, '10mg/支', '东北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (78, '哌替啶注射液', '解热镇痛抗炎药', 9.90, 320, '50mg/支', '青海制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (79, '芬太尼透皮贴剂', '解热镇痛抗炎药', 128.00, 80, '4.2mg*5贴', '强生', 1, '谈判');
INSERT INTO `medicine_info` VALUES (80, '芬太尼注射液', '解热镇痛抗炎药', 18.50, 220, '0.1mg/支', '宜昌人福', 1, '乙');
INSERT INTO `medicine_info` VALUES (81, '舒芬太尼注射液', '解热镇痛抗炎药', 38.00, 140, '50μg/支', '宜昌人福', 1, '乙');
INSERT INTO `medicine_info` VALUES (82, '瑞芬太尼注射液', '解热镇痛抗炎药', 45.00, 140, '1mg/支', '宜昌人福', 1, '乙');
INSERT INTO `medicine_info` VALUES (83, '丁丙诺啡舌下片', '解热镇痛抗炎药', 28.50, 200, '0.5mg*10片', '青海制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (84, '丁丙诺啡注射液', '解热镇痛抗炎药', 18.50, 220, '0.15mg/支', '天津药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (85, '氯唑沙宗片', '解热镇痛抗炎药', 12.50, 300, '0.25g*24片', '华润药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (86, '复方氯唑沙宗片', '解热镇痛抗炎药', 16.80, 260, '24片/盒', '鲁南贝特', 1, '乙');
INSERT INTO `medicine_info` VALUES (87, '乙哌立松片', '解热镇痛抗炎药', 28.50, 200, '50mg*20片', '卫材药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (88, '替扎尼定片', '解热镇痛抗炎药', 22.80, 220, '2mg*12片', '凯莱通', 1, '乙');
INSERT INTO `medicine_info` VALUES (89, '天麻素片', '解热镇痛抗炎药', 15.80, 260, '25mg*24片', '昆药集团', 1, '乙');
INSERT INTO `medicine_info` VALUES (90, '天麻素注射液', '解热镇痛抗炎药', 28.50, 200, '0.2g/支', '昆药集团', 1, '乙');
INSERT INTO `medicine_info` VALUES (91, '汉防己甲素片', '解热镇痛抗炎药', 38.00, 140, '20mg*12片', '金华药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (92, '草乌甲素片', '解热镇痛抗炎药', 28.50, 200, '0.4mg*12片', '滇药药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (93, '高乌甲素片', '解热镇痛抗炎药', 22.80, 220, '5mg*12片', '天药药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (94, '高乌甲素注射液', '解热镇痛抗炎药', 18.50, 220, '4mg/支', '天药药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (95, '氟芬那酸丁酯软膏', '解热镇痛抗炎药', 28.50, 200, '10g', '同联药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (96, '丁苯羟酸乳膏', '解热镇痛抗炎药', 16.80, 260, '10g', '舒夫林', 1, '乙');
INSERT INTO `medicine_info` VALUES (97, '布洛芬口腔凝胶', '解热镇痛抗炎药', 19.80, 240, '10g', '拜耳', 1, '乙');
INSERT INTO `medicine_info` VALUES (98, '复方辣椒碱乳膏', '解热镇痛抗炎药', 22.80, 220, '10g', '五环药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (99, '辣椒碱乳膏', '解热镇痛抗炎药', 28.50, 200, '10g', '舒笑药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (100, '水杨酸甲酯乳膏', '解热镇痛抗炎药', 12.50, 300, '10g', '恒健药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (101, '薄荷脑软膏', '解热镇痛抗炎药', 9.90, 320, '10g', '曼秀雷敦', 1, '甲');
INSERT INTO `medicine_info` VALUES (102, '樟脑软膏', '解热镇痛抗炎药', 8.50, 350, '10g', '恒健药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (103, '松节油搽剂', '解热镇痛抗炎药', 12.50, 300, '20ml', '恒健药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (104, '布洛芬咀嚼片', '解热镇痛抗炎药', 28.50, 200, '0.2g*12片', '强生', 1, '乙');
INSERT INTO `medicine_info` VALUES (105, '对乙酰氨基酚咀嚼片', '解热镇痛抗炎药', 19.80, 240, '160mg*15片', '百服宁', 1, '乙');
INSERT INTO `medicine_info` VALUES (106, '小儿布洛芬栓', '解热镇痛抗炎药', 15.80, 260, '50mg*10枚', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (107, '小儿对乙酰氨基酚栓', '解热镇痛抗炎药', 12.50, 300, '0.15g*10枚', '敬修堂', 1, '甲');
INSERT INTO `medicine_info` VALUES (108, '小儿退热口服液', '解热镇痛抗炎药', 18.50, 250, '10ml*6支', '同仁堂', 1, '乙');
INSERT INTO `medicine_info` VALUES (109, '小儿清热宁颗粒', '解热镇痛抗炎药', 22.50, 230, '4g*12袋', '同仁堂', 1, '乙');
INSERT INTO `medicine_info` VALUES (110, '小儿感冒颗粒', '解热镇痛抗炎药', 16.80, 260, '12g*10袋', '同仁堂', 1, '甲');
INSERT INTO `medicine_info` VALUES (111, '小儿解表颗粒', '解热镇痛抗炎药', 19.80, 240, '8g*10袋', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (112, '小儿清咽颗粒', '解热镇痛抗炎药', 16.80, 260, '6g*10袋', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (113, '小儿咽扁颗粒', '解热镇痛抗炎药', 18.50, 250, '8g*10袋', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (114, '小儿热速清颗粒', '解热镇痛抗炎药', 22.50, 230, '2g*12袋', '圣泰药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (115, '小儿双金清热口服液', '解热镇痛抗炎药', 28.00, 200, '10ml*6支', '润华药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (116, '小儿柴桂退热口服液', '解热镇痛抗炎药', 28.00, 200, '10ml*10支', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (117, '小儿豉翘清热口服液', '解热镇痛抗炎药', 29.80, 190, '10ml*6支', '同贝', 1, '乙');
INSERT INTO `medicine_info` VALUES (118, '小儿氨酚黄那敏片', '解热镇痛抗炎药', 12.80, 300, '12片/盒', '葵花药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (119, '小儿氨酚烷胺片', '解热镇痛抗炎药', 15.80, 260, '12片/盒', '优卡丹', 1, '乙');
INSERT INTO `medicine_info` VALUES (120, '小儿氨咖黄敏颗粒', '解热镇痛抗炎药', 12.80, 300, '5g*12袋', '葵花药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (121, '小儿氨咖黄敏口服液', '解热镇痛抗炎药', 18.50, 250, '10ml*6支', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (122, '复方小儿退热栓', '解热镇痛抗炎药', 15.80, 260, '10枚/盒', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (123, '布洛芬颗粒', '解热镇痛抗炎药', 16.80, 260, '0.2g*12袋', '葵花药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (124, '对乙酰氨基酚颗粒', '解热镇痛抗炎药', 12.80, 300, '0.1g*12袋', '葵花药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (125, '阿司匹林颗粒', '解热镇痛抗炎药', 18.50, 250, '0.1g*12袋', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (126, '洛索洛芬钠颗粒', '解热镇痛抗炎药', 22.50, 230, '60mg*12袋', '乐松', 1, '乙');
INSERT INTO `medicine_info` VALUES (127, '双氯芬酸钠颗粒', '解热镇痛抗炎药', 16.80, 260, '50mg*12袋', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (128, '塞来昔布胶囊', '解热镇痛抗炎药', 45.00, 160, '0.2g*12粒', '辉瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (129, '依托考昔片', '解热镇痛抗炎药', 58.00, 120, '120mg*5片', '默沙东', 1, '乙');
INSERT INTO `medicine_info` VALUES (130, '尼美舒利胶囊', '解热镇痛抗炎药', 22.80, 210, '0.1g*10粒', '健民药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (131, '吲哚美辛胶囊', '解热镇痛抗炎药', 8.50, 350, '25mg*100粒', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (132, '美洛昔康胶囊', '解热镇痛抗炎药', 26.80, 210, '7.5mg*10粒', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (133, '氯诺昔康胶囊', '解热镇痛抗炎药', 28.50, 200, '8mg*10粒', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (134, '氟比洛芬胶囊', '解热镇痛抗炎药', 32.50, 180, '50mg*10粒', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (135, '酮洛芬胶囊', '解热镇痛抗炎药', 19.50, 250, '50mg*20粒', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (136, '吡罗昔康胶囊', '解热镇痛抗炎药', 9.90, 320, '20mg*100粒', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (137, '安乃近胶囊', '解热镇痛抗炎药', 8.50, 350, '0.5g*100粒', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (138, '复方对乙酰氨基酚胶囊', '解热镇痛抗炎药', 15.80, 280, '12粒/盒', '葵花药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (139, '氨酚咖那敏胶囊', '解热镇痛抗炎药', 16.50, 260, '12粒/盒', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (140, '酚咖胶囊', '解热镇痛抗炎药', 19.80, 240, '12粒/盒', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (141, '布洛芬缓释胶囊', '解热镇痛抗炎药', 28.50, 200, '0.3g*20粒', '葵花药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (142, '对乙酰氨基酚缓释胶囊', '解热镇痛抗炎药', 19.80, 240, '0.65g*18粒', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (143, '阿司匹林缓释胶囊', '解热镇痛抗炎药', 22.00, 220, '100mg*60粒', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (144, '洛索洛芬钠缓释胶囊', '解热镇痛抗炎药', 22.50, 240, '60mg*20粒', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (145, '双氯芬酸钠缓释胶囊', '解热镇痛抗炎药', 16.80, 250, '75mg*20粒', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (146, '塞来昔布缓释胶囊', '解热镇痛抗炎药', 45.00, 160, '0.2g*6粒', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (147, '依托考昔缓释胶囊', '解热镇痛抗炎药', 58.00, 120, '60mg*5粒', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (148, '尼美舒利缓释胶囊', '解热镇痛抗炎药', 18.50, 230, '0.1g*10粒', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (149, '吲哚美辛缓释胶囊', '解热镇痛抗炎药', 8.50, 350, '25mg*100粒', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (150, '美洛昔康缓释胶囊', '解热镇痛抗炎药', 26.80, 210, '7.5mg*10粒', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (151, '氯诺昔康缓释胶囊', '解热镇痛抗炎药', 28.50, 200, '8mg*10粒', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (152, '氟比洛芬缓释胶囊', '解热镇痛抗炎药', 32.50, 180, '50mg*10粒', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (153, '酮洛芬缓释胶囊', '解热镇痛抗炎药', 19.50, 250, '50mg*20粒', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (154, '吡罗昔康缓释胶囊', '解热镇痛抗炎药', 9.90, 320, '20mg*100粒', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (155, '安乃近缓释胶囊', '解热镇痛抗炎药', 8.50, 350, '0.5g*100粒', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (156, '布洛芬分散片', '解热镇痛抗炎药', 28.50, 200, '0.2g*12片', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (157, '对乙酰氨基酚分散片', '解热镇痛抗炎药', 19.80, 240, '0.5g*12片', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (158, '阿司匹林分散片', '解热镇痛抗炎药', 22.00, 220, '0.5g*12片', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (159, '洛索洛芬钠分散片', '解热镇痛抗炎药', 22.50, 230, '60mg*12片', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (160, '双氯芬酸钠分散片', '解热镇痛抗炎药', 16.80, 260, '50mg*12片', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (161, '塞来昔布分散片', '解热镇痛抗炎药', 45.00, 160, '0.2g*6片', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (162, '依托考昔分散片', '解热镇痛抗炎药', 58.00, 120, '60mg*5片', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (163, '尼美舒利分散片', '解热镇痛抗炎药', 18.50, 230, '0.1g*10片', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (164, '吲哚美辛分散片', '解热镇痛抗炎药', 8.50, 350, '25mg*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (165, '美洛昔康分散片', '解热镇痛抗炎药', 26.80, 210, '7.5mg*10片', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (166, '氯诺昔康分散片', '解热镇痛抗炎药', 28.50, 200, '8mg*10片', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (167, '氟比洛芬分散片', '解热镇痛抗炎药', 32.50, 180, '50mg*10片', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (168, '酮洛芬分散片', '解热镇痛抗炎药', 19.50, 250, '50mg*20片', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (169, '吡罗昔康分散片', '解热镇痛抗炎药', 9.90, 320, '20mg*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (170, '安乃近分散片', '解热镇痛抗炎药', 8.50, 350, '0.5g*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (171, '布洛芬口崩片', '解热镇痛抗炎药', 28.50, 200, '0.2g*12片', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (172, '对乙酰氨基酚口崩片', '解热镇痛抗炎药', 19.80, 240, '0.5g*12片', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (173, '阿司匹林口崩片', '解热镇痛抗炎药', 22.00, 220, '0.5g*12片', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (174, '洛索洛芬钠口崩片', '解热镇痛抗炎药', 22.50, 230, '60mg*12片', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (175, '双氯芬酸钠口崩片', '解热镇痛抗炎药', 16.80, 260, '50mg*12片', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (176, '布洛芬干混悬剂', '解热镇痛抗炎药', 25.00, 250, '30g/瓶', '葵花药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (177, '对乙酰氨基酚干混悬剂', '解热镇痛抗炎药', 18.50, 280, '30g/瓶', '葵花药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (178, '阿司匹林干混悬剂', '解热镇痛抗炎药', 22.00, 220, '30g/瓶', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (179, '洛索洛芬钠干混悬剂', '解热镇痛抗炎药', 22.50, 230, '30g/瓶', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (180, '双氯芬酸钠干混悬剂', '解热镇痛抗炎药', 16.80, 260, '30g/瓶', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (181, '布洛芬糖浆', '解热镇痛抗炎药', 22.50, 230, '60ml', '葵花药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (182, '对乙酰氨基酚糖浆', '解热镇痛抗炎药', 16.80, 260, '60ml', '葵花药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (183, '阿司匹林糖浆', '解热镇痛抗炎药', 22.00, 220, '60ml', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (184, '洛索洛芬钠糖浆', '解热镇痛抗炎药', 22.50, 230, '60ml', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (185, '双氯芬酸钠糖浆', '解热镇痛抗炎药', 16.80, 260, '60ml', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (186, '布洛芬搽剂', '解热镇痛抗炎药', 15.50, 280, '20ml', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (187, '对乙酰氨基酚搽剂', '解热镇痛抗炎药', 12.50, 300, '20ml', '葵花药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (188, '阿司匹林搽剂', '解热镇痛抗炎药', 18.50, 250, '20ml', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (189, '洛索洛芬钠搽剂', '解热镇痛抗炎药', 22.50, 230, '20ml', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (190, '双氯芬酸钠搽剂', '解热镇痛抗炎药', 16.80, 260, '20ml', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (191, '布洛芬喷雾剂', '解热镇痛抗炎药', 28.50, 200, '50ml', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (192, '对乙酰氨基酚喷雾剂', '解热镇痛抗炎药', 19.80, 240, '50ml', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (193, '阿司匹林喷雾剂', '解热镇痛抗炎药', 22.00, 220, '50ml', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (194, '洛索洛芬钠喷雾剂', '解热镇痛抗炎药', 22.50, 230, '50ml', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (195, '双氯芬酸钠喷雾剂', '解热镇痛抗炎药', 16.80, 260, '50ml', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (196, '布洛芬凝胶', '解热镇痛抗炎药', 15.50, 280, '20g', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (197, '对乙酰氨基酚凝胶', '解热镇痛抗炎药', 12.50, 300, '20g', '葵花药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (198, '阿司匹林凝胶', '解热镇痛抗炎药', 18.50, 250, '20g', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (199, '洛索洛芬钠凝胶', '解热镇痛抗炎药', 22.50, 230, '20g', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (200, '双氯芬酸钠凝胶', '解热镇痛抗炎药', 16.80, 260, '20g', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (201, '布洛芬贴剂', '解热镇痛抗炎药', 28.50, 200, '6贴/盒', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (202, '对乙酰氨基酚贴剂', '解热镇痛抗炎药', 19.80, 240, '6贴/盒', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (203, '阿司匹林贴剂', '解热镇痛抗炎药', 22.00, 220, '6贴/盒', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (204, '洛索洛芬钠贴剂', '解热镇痛抗炎药', 22.50, 230, '6贴/盒', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (205, '双氯芬酸钠贴剂', '解热镇痛抗炎药', 16.80, 260, '6贴/盒', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (206, '布洛芬栓', '解热镇痛抗炎药', 15.80, 260, '10枚/盒', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (207, '对乙酰氨基酚栓', '解热镇痛抗炎药', 12.50, 300, '10枚/盒', '葵花药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (208, '阿司匹林栓', '解热镇痛抗炎药', 18.50, 250, '10枚/盒', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (209, '洛索洛芬钠栓', '解热镇痛抗炎药', 22.50, 230, '10枚/盒', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (210, '双氯芬酸钠栓', '解热镇痛抗炎药', 16.80, 260, '10枚/盒', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (211, '布洛芬注射液', '解热镇痛抗炎药', 38.00, 140, '0.4g/支', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (212, '对乙酰氨基酚注射液', '解热镇痛抗炎药', 28.50, 200, '0.5g/支', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (213, '阿司匹林注射液', '解热镇痛抗炎药', 22.00, 220, '0.5g/支', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (214, '洛索洛芬钠注射液', '解热镇痛抗炎药', 28.50, 200, '60mg/支', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (215, '双氯芬酸钠注射液', '解热镇痛抗炎药', 18.50, 250, '50mg/支', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (216, '塞来昔布注射液', '解热镇痛抗炎药', 45.00, 160, '0.2g/支', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (217, '依托考昔注射液', '解热镇痛抗炎药', 58.00, 120, '60mg/支', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (218, '尼美舒利注射液', '解热镇痛抗炎药', 28.50, 200, '0.1g/支', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (219, '吲哚美辛注射液', '解热镇痛抗炎药', 12.50, 300, '25mg/支', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (220, '美洛昔康注射液', '解热镇痛抗炎药', 28.50, 200, '7.5mg/支', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (221, '氯诺昔康注射液', '解热镇痛抗炎药', 28.50, 200, '8mg/支', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (222, '氟比洛芬注射液', '解热镇痛抗炎药', 32.50, 180, '50mg/支', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (223, '酮洛芬注射液', '解热镇痛抗炎药', 19.50, 250, '50mg/支', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (224, '吡罗昔康注射液', '解热镇痛抗炎药', 12.50, 300, '20mg/支', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (225, '安乃近注射液', '解热镇痛抗炎药', 8.50, 350, '0.5g/支', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (226, '复方氨林巴比妥注射液', '解热镇痛抗炎药', 8.50, 350, '2ml/支', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (227, '柴胡注射液', '解热镇痛抗炎药', 6.80, 350, '2ml/支', '神威药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (228, '羚羊角注射液', '解热镇痛抗炎药', 32.00, 180, '2ml/支', '同仁堂', 1, '乙');
INSERT INTO `medicine_info` VALUES (229, '清开灵注射液', '解热镇痛抗炎药', 28.50, 200, '10ml/支', '白云山', 1, '乙');
INSERT INTO `medicine_info` VALUES (230, '双黄连注射液', '解热镇痛抗炎药', 18.50, 250, '20ml/支', '哈药集团', 1, '甲');
INSERT INTO `medicine_info` VALUES (231, '清热解毒注射液', '解热镇痛抗炎药', 18.50, 250, '2ml/支', '白云山', 1, '甲');
INSERT INTO `medicine_info` VALUES (232, '抗病毒注射液', '解热镇痛抗炎药', 19.80, 240, '2ml/支', '香雪制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (233, '板蓝根注射液', '解热镇痛抗炎药', 9.90, 350, '2ml/支', '白云山', 1, '甲');
INSERT INTO `medicine_info` VALUES (234, '阿莫西林胶囊', '抗生素/抗菌药', 18.80, 240, '0.25g*20粒', '哈药集团', 1, '甲');
INSERT INTO `medicine_info` VALUES (235, '阿莫西林颗粒', '抗生素/抗菌药', 16.80, 260, '0.125g*12袋', '葵花药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (236, '阿莫西林分散片', '抗生素/抗菌药', 22.50, 230, '0.5g*12片', '石药集团', 1, '乙');
INSERT INTO `medicine_info` VALUES (237, '阿莫西林克拉维酸钾片', '抗生素/抗菌药', 32.50, 180, '0.457g*12片', '联邦制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (238, '阿莫西林钠氟氯西林钠注射液', '抗生素/抗菌药', 38.00, 140, '1g/支', '华北制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (239, '青霉素钠注射液', '抗生素/抗菌药', 5.50, 400, '80万U/支', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (240, '青霉素V钾片', '抗生素/抗菌药', 12.50, 300, '0.25g*30片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (241, '苄星青霉素注射液', '抗生素/抗菌药', 18.50, 250, '120万U/支', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (242, '哌拉西林钠他唑巴坦钠注射液', '抗生素/抗菌药', 52.00, 110, '4.5g/支', '惠氏', 1, '乙');
INSERT INTO `medicine_info` VALUES (243, '替卡西林克拉维酸钾注射液', '抗生素/抗菌药', 48.00, 130, '3.2g/支', '葛兰素', 1, '乙');
INSERT INTO `medicine_info` VALUES (244, '头孢氨苄胶囊', '抗生素/抗菌药', 15.80, 260, '0.25g*24粒', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (245, '头孢拉定胶囊', '抗生素/抗菌药', 16.50, 250, '0.25g*24粒', '施贵宝', 1, '甲');
INSERT INTO `medicine_info` VALUES (246, '头孢羟氨苄胶囊', '抗生素/抗菌药', 22.80, 220, '0.25g*12粒', '石药集团', 1, '乙');
INSERT INTO `medicine_info` VALUES (247, '头孢克洛胶囊', '抗生素/抗菌药', 28.50, 200, '0.25g*12粒', '礼来', 1, '乙');
INSERT INTO `medicine_info` VALUES (248, '头孢克洛干混悬剂', '抗生素/抗菌药', 26.80, 210, '0.125g*6袋', '礼来', 1, '乙');
INSERT INTO `medicine_info` VALUES (249, '头孢呋辛酯片', '抗生素/抗菌药', 29.90, 200, '0.25g*12片', '联邦制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (250, '头孢丙烯片', '抗生素/抗菌药', 38.50, 160, '0.25g*6片', '施贵宝', 1, '乙');
INSERT INTO `medicine_info` VALUES (251, '头孢克肟分散片', '抗生素/抗菌药', 35.00, 180, '50mg*12片', '石药集团', 1, '乙');
INSERT INTO `medicine_info` VALUES (252, '头孢克肟颗粒', '抗生素/抗菌药', 28.50, 200, '50mg*6袋', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (253, '头孢泊肟酯片', '抗生素/抗菌药', 42.00, 150, '0.1g*6片', '三共制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (254, '头孢地尼胶囊', '抗生素/抗菌药', 45.00, 140, '0.1g*10粒', '安斯泰来', 1, '乙');
INSERT INTO `medicine_info` VALUES (255, '头孢他啶注射液', '抗生素/抗菌药', 36.80, 170, '1g/支', '复星医药', 1, '乙');
INSERT INTO `medicine_info` VALUES (256, '头孢哌酮舒巴坦注射液', '抗生素/抗菌药', 48.00, 130, '1.5g/支', '辉瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (257, '头孢曲松注射液', '抗生素/抗菌药', 28.50, 200, '1g/支', '罗氏', 1, '甲');
INSERT INTO `medicine_info` VALUES (258, '头孢噻肟注射液', '抗生素/抗菌药', 26.80, 210, '1g/支', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (259, '头孢吡肟注射液', '抗生素/抗菌药', 58.00, 120, '1g/支', '施贵宝', 1, '乙');
INSERT INTO `medicine_info` VALUES (260, '亚胺培南西司他丁注射液', '抗生素/抗菌药', 128.00, 80, '0.5g/支', '默沙东', 1, '谈判');
INSERT INTO `medicine_info` VALUES (261, '美罗培南注射液', '抗生素/抗菌药', 98.00, 90, '0.5g/支', '住友制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (262, '厄他培南注射液', '抗生素/抗菌药', 85.00, 100, '1g/支', '默沙东', 1, '谈判');
INSERT INTO `medicine_info` VALUES (263, '氨曲南注射液', '抗生素/抗菌药', 45.00, 140, '0.5g/支', '施贵宝', 1, '乙');
INSERT INTO `medicine_info` VALUES (264, '红霉素肠溶片', '抗生素/抗菌药', 15.80, 260, '0.25g*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (265, '罗红霉素胶囊', '抗生素/抗菌药', 22.30, 220, '150mg*12粒', '扬子江药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (266, '阿奇霉素分散片', '抗生素/抗菌药', 38.00, 160, '0.25g*6片', '辉瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (267, '阿奇霉素注射液', '抗生素/抗菌药', 28.50, 200, '0.25g/支', '辉瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (268, '阿奇霉素干混悬剂', '抗生素/抗菌药', 26.80, 210, '0.1g*6袋', '辉瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (269, '克拉霉素片', '抗生素/抗菌药', 26.80, 210, '0.25g*6片', '雅培', 1, '乙');
INSERT INTO `medicine_info` VALUES (270, '地红霉素肠溶片', '抗生素/抗菌药', 32.50, 180, '0.25g*12片', '鲁南制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (271, '琥乙红霉素片', '抗生素/抗菌药', 18.50, 250, '0.25g*24片', '华北制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (272, '乙酰螺旋霉素片', '抗生素/抗菌药', 12.50, 300, '0.1g*24片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (273, '交沙霉素片', '抗生素/抗菌药', 22.80, 220, '0.2g*12片', '施贵宝', 1, '乙');
INSERT INTO `medicine_info` VALUES (274, '左氧氟沙星片', '抗生素/抗菌药', 26.50, 210, '0.5g*10片', '可乐必妥', 1, '乙');
INSERT INTO `medicine_info` VALUES (275, '左氧氟沙星注射液', '抗生素/抗菌药', 32.50, 180, '0.5g/瓶', '扬子江药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (276, '左氧氟沙星滴眼液', '抗生素/抗菌药', 15.80, 260, '5ml', '参天制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (277, '诺氟沙星胶囊', '抗生素/抗菌药', 8.50, 350, '0.1g*24粒', '哈药集团', 1, '甲');
INSERT INTO `medicine_info` VALUES (278, '环丙沙星片', '抗生素/抗菌药', 12.80, 300, '0.25g*12片', '拜耳', 1, '甲');
INSERT INTO `medicine_info` VALUES (279, '环丙沙星注射液', '抗生素/抗菌药', 18.50, 250, '0.2g/瓶', '拜耳', 1, '乙');
INSERT INTO `medicine_info` VALUES (280, '氧氟沙星片', '抗生素/抗菌药', 16.50, 250, '0.1g*12片', '扬子江药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (281, '氧氟沙星注射液', '抗生素/抗菌药', 22.80, 220, '0.2g/瓶', '扬子江药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (282, '莫西沙星片', '抗生素/抗菌药', 45.00, 140, '0.4g*3片', '拜耳', 1, '乙');
INSERT INTO `medicine_info` VALUES (283, '莫西沙星注射液', '抗生素/抗菌药', 58.00, 120, '0.4g/瓶', '拜耳', 1, '乙');
INSERT INTO `medicine_info` VALUES (284, '加替沙星片', '抗生素/抗菌药', 28.50, 200, '0.2g*6片', '施贵宝', 1, '乙');
INSERT INTO `medicine_info` VALUES (285, '吉米沙星片', '抗生素/抗菌药', 38.00, 140, '0.32g*6片', 'LG', 1, '乙');
INSERT INTO `medicine_info` VALUES (286, '庆大霉素注射液', '抗生素/抗菌药', 6.50, 380, '8万U/支', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (287, '庆大霉素片', '抗生素/抗菌药', 8.50, 350, '40mg*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (288, '阿米卡星注射液', '抗生素/抗菌药', 9.90, 320, '0.2g/支', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (289, '妥布霉素注射液', '抗生素/抗菌药', 12.50, 300, '80mg/支', '礼来', 1, '乙');
INSERT INTO `medicine_info` VALUES (290, '依替米星注射液', '抗生素/抗菌药', 32.50, 180, '0.1g/支', '爱大药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (291, '异帕米星注射液', '抗生素/抗菌药', 38.00, 140, '0.2g/支', '旭化成', 1, '乙');
INSERT INTO `medicine_info` VALUES (292, '多西环素片', '抗生素/抗菌药', 18.50, 250, '0.1g*12片', '辉瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (293, '米诺环素胶囊', '抗生素/抗菌药', 28.50, 200, '50mg*12粒', '惠氏', 1, '乙');
INSERT INTO `medicine_info` VALUES (294, '氯霉素片', '抗生素/抗菌药', 9.90, 320, '0.25g*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (295, '氯霉素注射液', '抗生素/抗菌药', 12.50, 300, '0.25g/支', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (296, '克林霉素胶囊', '抗生素/抗菌药', 19.90, 230, '0.15g*20粒', '华北制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (297, '克林霉素注射液', '抗生素/抗菌药', 22.80, 220, '0.6g/支', '华北制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (298, '林可霉素注射液', '抗生素/抗菌药', 12.50, 300, '0.6g/支', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (299, '甲硝唑片', '抗生素/抗菌药', 6.80, 400, '0.2g*100片', '华源药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (300, '甲硝唑注射液', '抗生素/抗菌药', 8.50, 350, '0.5g/瓶', '华源药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (301, '甲硝唑凝胶', '抗生素/抗菌药', 12.50, 300, '20g', '辰欣药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (302, '替硝唑片', '抗生素/抗菌药', 9.90, 350, '0.5g*8片', '丽珠集团', 1, '乙');
INSERT INTO `medicine_info` VALUES (303, '替硝唑注射液', '抗生素/抗菌药', 12.50, 300, '0.4g/瓶', '丽珠集团', 1, '乙');
INSERT INTO `medicine_info` VALUES (304, '奥硝唑片', '抗生素/抗菌药', 22.80, 220, '0.5g*12片', '扬子江药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (305, '奥硝唑注射液', '抗生素/抗菌药', 28.50, 200, '0.5g/瓶', '扬子江药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (306, '万古霉素注射液', '抗生素/抗菌药', 128.00, 80, '0.5g/支', '礼来', 1, '谈判');
INSERT INTO `medicine_info` VALUES (307, '去甲万古霉素注射液', '抗生素/抗菌药', 98.00, 90, '0.4g/支', '华北制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (308, '替考拉宁注射液', '抗生素/抗菌药', 158.00, 70, '0.2g/支', '赛诺菲', 1, '谈判');
INSERT INTO `medicine_info` VALUES (309, '利奈唑胺片', '抗生素/抗菌药', 128.00, 80, '0.6g*10片', '辉瑞', 1, '谈判');
INSERT INTO `medicine_info` VALUES (310, '利奈唑胺注射液', '抗生素/抗菌药', 158.00, 70, '0.6g/瓶', '辉瑞', 1, '谈判');
INSERT INTO `medicine_info` VALUES (311, '达托霉素注射液', '抗生素/抗菌药', 228.00, 60, '0.5g/支', '礼来', 1, '谈判');
INSERT INTO `medicine_info` VALUES (312, '氟康唑胶囊', '抗生素/抗菌药', 28.50, 200, '50mg*12粒', '辉瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (313, '氟康唑注射液', '抗生素/抗菌药', 32.50, 180, '0.2g/瓶', '辉瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (314, '伊曲康唑胶囊', '抗生素/抗菌药', 45.00, 140, '0.1g*14粒', '杨森', 1, '乙');
INSERT INTO `medicine_info` VALUES (315, '伏立康唑片', '抗生素/抗菌药', 128.00, 80, '0.2g*10片', '辉瑞', 1, '谈判');
INSERT INTO `medicine_info` VALUES (316, '伏立康唑注射液', '抗生素/抗菌药', 158.00, 70, '0.2g/瓶', '辉瑞', 1, '谈判');
INSERT INTO `medicine_info` VALUES (317, '卡泊芬净注射液', '抗生素/抗菌药', 228.00, 60, '50mg/支', '默沙东', 1, '谈判');
INSERT INTO `medicine_info` VALUES (318, '米卡芬净注射液', '抗生素/抗菌药', 198.00, 70, '50mg/支', '安斯泰来', 1, '谈判');
INSERT INTO `medicine_info` VALUES (319, '两性霉素B注射液', '抗生素/抗菌药', 65.00, 100, '5mg/支', '华北制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (320, '制霉菌素片', '抗生素/抗菌药', 12.50, 300, '50万U*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (321, '克霉唑乳膏', '抗生素/抗菌药', 12.90, 320, '10g/支', '达克宁', 1, '甲');
INSERT INTO `medicine_info` VALUES (322, '特比萘芬乳膏', '抗生素/抗菌药', 18.50, 280, '10g/支', '兰美抒', 1, '乙');
INSERT INTO `medicine_info` VALUES (323, '特比萘芬片', '抗生素/抗菌药', 32.50, 180, '0.125g*6片', '诺华', 1, '乙');
INSERT INTO `medicine_info` VALUES (324, '酮康唑乳膏', '抗生素/抗菌药', 12.90, 320, '10g/支', '达克宁', 1, '甲');
INSERT INTO `medicine_info` VALUES (325, '联苯苄唑乳膏', '抗生素/抗菌药', 18.50, 250, '10g/支', '美克', 1, '乙');
INSERT INTO `medicine_info` VALUES (326, '奥司他韦胶囊', '抗生素/抗菌药', 58.00, 120, '75mg*10粒', '罗氏', 1, '谈判');
INSERT INTO `medicine_info` VALUES (327, '利巴韦林片', '抗生素/抗菌药', 8.50, 350, '0.1g*24片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (328, '利巴韦林注射液', '抗生素/抗菌药', 12.50, 300, '0.1g/支', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (329, '阿昔洛韦片', '抗生素/抗菌药', 15.80, 260, '0.2g*24片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (330, '阿昔洛韦乳膏', '抗生素/抗菌药', 9.90, 320, '10g/支', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (331, '更昔洛韦注射液', '抗生素/抗菌药', 45.00, 140, '0.25g/支', '罗氏', 1, '乙');
INSERT INTO `medicine_info` VALUES (332, '伐昔洛韦片', '抗生素/抗菌药', 28.50, 200, '0.3g*6片', '葛兰素', 1, '乙');
INSERT INTO `medicine_info` VALUES (333, '恩替卡韦片', '抗生素/抗菌药', 65.00, 100, '0.5mg*7片', '施贵宝', 1, '谈判');
INSERT INTO `medicine_info` VALUES (334, '替诺福韦酯片', '抗生素/抗菌药', 85.00, 100, '300mg*30片', '葛兰素', 1, '谈判');
INSERT INTO `medicine_info` VALUES (335, '拉米夫定片', '抗生素/抗菌药', 45.00, 140, '0.1g*14片', '葛兰素', 1, '乙');
INSERT INTO `medicine_info` VALUES (336, '利福平胶囊', '抗生素/抗菌药', 18.50, 250, '0.15g*100粒', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (337, '异烟肼片', '抗生素/抗菌药', 6.50, 380, '0.1g*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (338, '吡嗪酰胺片', '抗生素/抗菌药', 12.50, 300, '0.25g*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (339, '乙胺丁醇片', '抗生素/抗菌药', 15.80, 260, '0.25g*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (340, '复方磺胺甲恶唑片', '抗生素/抗菌药', 8.50, 350, '100片/瓶', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (341, '柳氮磺吡啶片', '抗生素/抗菌药', 22.80, 220, '0.25g*60片', '上海制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (342, '呋喃妥因片', '抗生素/抗菌药', 7.50, 380, '50mg*100片', '上海制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (343, '呋喃唑酮片', '抗生素/抗菌药', 6.50, 380, '0.1g*100片', '上海制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (344, '磷霉素氨丁三醇散', '抗生素/抗菌药', 38.00, 140, '3g/袋', '默沙东', 1, '乙');
INSERT INTO `medicine_info` VALUES (345, '奥美拉唑肠溶胶囊', '消化系统用药', 26.80, 220, '20mg*14粒', '修正药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (346, '奥美拉唑肠溶片', '消化系统用药', 22.50, 230, '20mg*28片', '康普药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (347, '奥美拉唑注射液', '消化系统用药', 32.50, 180, '40mg/支', '扬子江药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (348, '雷贝拉唑钠肠溶片', '消化系统用药', 38.50, 160, '10mg*7片', '卫材药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (349, '雷贝拉唑钠注射液', '消化系统用药', 45.00, 140, '20mg/支', '卫材药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (350, '泮托拉唑钠肠溶片', '消化系统用药', 32.50, 180, '40mg*7片', '扬子江药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (351, '泮托拉唑钠注射液', '消化系统用药', 38.00, 140, '40mg/支', '扬子江药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (352, '兰索拉唑肠溶片', '消化系统用药', 29.80, 190, '15mg*14片', '康普药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (353, '兰索拉唑肠溶胶囊', '消化系统用药', 32.50, 180, '30mg*10粒', '武田制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (354, '埃索美拉唑镁肠溶片', '消化系统用药', 58.00, 120, '20mg*7片', '阿斯利康', 1, '乙');
INSERT INTO `medicine_info` VALUES (355, '埃索美拉唑镁肠溶胶囊', '消化系统用药', 65.00, 100, '40mg*10粒', '阿斯利康', 1, '乙');
INSERT INTO `medicine_info` VALUES (356, '埃索美拉唑注射液', '消化系统用药', 68.00, 100, '40mg/支', '阿斯利康', 1, '乙');
INSERT INTO `medicine_info` VALUES (357, '雷尼替丁胶囊', '消化系统用药', 8.50, 350, '0.15g*20粒', '恒健药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (358, '雷尼替丁注射液', '消化系统用药', 12.50, 300, '50mg/支', '恒健药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (359, '法莫替丁片', '消化系统用药', 12.50, 300, '20mg*24片', '安斯泰来', 1, '甲');
INSERT INTO `medicine_info` VALUES (360, '法莫替丁胶囊', '消化系统用药', 15.80, 260, '20mg*12粒', '安斯泰来', 1, '甲');
INSERT INTO `medicine_info` VALUES (361, '法莫替丁注射液', '消化系统用药', 18.50, 250, '20mg/支', '安斯泰来', 1, '乙');
INSERT INTO `medicine_info` VALUES (362, '尼扎替丁片', '消化系统用药', 22.80, 220, '0.15g*6片', '礼来', 1, '乙');
INSERT INTO `medicine_info` VALUES (363, '罗沙替丁醋酸酯胶囊', '消化系统用药', 28.50, 200, '75mg*12粒', '安斯泰来', 1, '乙');
INSERT INTO `medicine_info` VALUES (364, '铝碳酸镁咀嚼片', '消化系统用药', 18.90, 280, '0.5g*30片', '达喜', 1, '甲');
INSERT INTO `medicine_info` VALUES (365, '硫糖铝混悬凝胶', '消化系统用药', 28.50, 200, '5ml*12袋', '云南白药', 1, '乙');
INSERT INTO `medicine_info` VALUES (366, '硫糖铝口服混悬液', '消化系统用药', 16.80, 260, '120ml', '恒健药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (367, '枸橼酸铋钾颗粒', '消化系统用药', 16.80, 260, '1.0g*56袋', '丽珠药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (368, '枸橼酸铋钾胶囊', '消化系统用药', 19.80, 240, '0.3g*20粒', '丽珠药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (369, '胶体果胶铋胶囊', '消化系统用药', 22.50, 230, '50mg*24粒', '安特药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (370, '胶体酒石酸铋胶囊', '消化系统用药', 28.50, 200, '55mg*12粒', '安特药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (371, '磷酸铝凝胶', '消化系统用药', 32.50, 180, '20g*6袋', '博福-益普生', 1, '乙');
INSERT INTO `medicine_info` VALUES (372, '瑞巴派特片', '消化系统用药', 26.80, 210, '0.1g*12片', '浙江大冢', 1, '乙');
INSERT INTO `medicine_info` VALUES (373, '替普瑞酮胶囊', '消化系统用药', 32.50, 180, '50mg*20粒', '卫材药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (374, '伊索拉定片', '消化系统用药', 28.50, 200, '2mg*12片', '日本新药', 1, '乙');
INSERT INTO `medicine_info` VALUES (375, '吉法酯片', '消化系统用药', 38.00, 140, '50mg*30片', '生晃荣养', 1, '乙');
INSERT INTO `medicine_info` VALUES (376, '麦滋林-S颗粒', '消化系统用药', 22.80, 220, '0.67g*15袋', '寿制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (377, '多潘立酮片', '消化系统用药', 15.50, 280, '10mg*30片', '西安杨森', 1, '甲');
INSERT INTO `medicine_info` VALUES (378, '多潘立酮混悬液', '消化系统用药', 19.80, 240, '100ml', '西安杨森', 1, '乙');
INSERT INTO `medicine_info` VALUES (379, '莫沙必利片', '消化系统用药', 26.80, 210, '5mg*12片', '鲁南制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (380, '莫沙必利分散片', '消化系统用药', 29.80, 190, '5mg*12片', '鲁南制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (381, '伊托必利片', '消化系统用药', 22.80, 220, '50mg*12片', '安斯泰来', 1, '乙');
INSERT INTO `medicine_info` VALUES (382, '伊托必利分散片', '消化系统用药', 26.80, 210, '50mg*12片', '安斯泰来', 1, '乙');
INSERT INTO `medicine_info` VALUES (383, '甲氧氯普胺片', '消化系统用药', 6.50, 380, '5mg*100片', '恒健药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (384, '甲氧氯普胺注射液', '消化系统用药', 8.50, 350, '10mg/支', '恒健药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (385, '西沙必利片', '消化系统用药', 28.50, 200, '5mg*12片', '西安杨森', 1, '乙');
INSERT INTO `medicine_info` VALUES (386, '普芦卡必利片', '消化系统用药', 45.00, 140, '2mg*7片', '强生', 1, '乙');
INSERT INTO `medicine_info` VALUES (387, '蒙脱石散', '消化系统用药', 18.50, 250, '3g*15袋', '思密达', 1, '甲');
INSERT INTO `medicine_info` VALUES (388, '蒙脱石混悬液', '消化系统用药', 22.50, 230, '90ml', '思密达', 1, '乙');
INSERT INTO `medicine_info` VALUES (389, '盐酸洛哌丁胺胶囊', '消化系统用药', 19.80, 240, '2mg*6粒', '西安杨森', 1, '乙');
INSERT INTO `medicine_info` VALUES (390, '复方地芬诺酯片', '消化系统用药', 8.50, 350, '100片/瓶', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (391, '鞣酸蛋白片', '消化系统用药', 12.50, 300, '0.3g*24片', '恒健药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (392, '碱式水杨酸铋片', '消化系统用药', 22.80, 220, '262mg*12片', '杨森', 1, '乙');
INSERT INTO `medicine_info` VALUES (393, '消旋卡多曲颗粒', '消化系统用药', 28.50, 200, '10mg*12袋', '强生', 1, '乙');
INSERT INTO `medicine_info` VALUES (394, '次水杨酸铋分散片', '消化系统用药', 26.80, 210, '262mg*12片', '杨森', 1, '乙');
INSERT INTO `medicine_info` VALUES (395, '乳果糖口服溶液', '消化系统用药', 35.00, 170, '10ml*10袋', '杜密克', 1, '乙');
INSERT INTO `medicine_info` VALUES (396, '乳果糖口服液', '消化系统用药', 38.00, 160, '100ml', '杜密克', 1, '乙');
INSERT INTO `medicine_info` VALUES (397, '聚乙二醇4000散', '消化系统用药', 28.50, 200, '10g*10袋', '福松', 1, '乙');
INSERT INTO `medicine_info` VALUES (398, '聚乙二醇电解质散', '消化系统用药', 32.50, 180, '137.15g/袋', '和黄药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (399, '开塞露', '消化系统用药', 3.50, 450, '20ml*2支', '恒健药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (400, '甘油灌肠剂', '消化系统用药', 8.50, 350, '110ml', '恒健药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (401, '酚酞片', '消化系统用药', 5.50, 400, '100片/瓶', '亨迪药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (402, '比沙可啶肠溶片', '消化系统用药', 18.50, 250, '5mg*12片', '德国勃林格', 1, '乙');
INSERT INTO `medicine_info` VALUES (403, '拉克替醇散', '消化系统用药', 38.00, 140, '5g*12袋', '华东医药', 1, '乙');
INSERT INTO `medicine_info` VALUES (404, '普伐他汀钠片', '消化系统用药', 28.50, 200, '10mg*12片', '三共制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (405, '双歧杆菌三联活菌胶囊', '消化系统用药', 32.50, 180, '0.21g*24粒', '东海药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (406, '双歧杆菌三联活菌片', '消化系统用药', 29.80, 190, '0.5g*24片', '东海药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (407, '双歧杆菌四联活菌片', '消化系统用药', 38.00, 160, '0.5g*24片', '天龙药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (408, '地衣芽孢杆菌活菌胶囊', '消化系统用药', 26.80, 210, '0.25g*24粒', '东北制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (409, '地衣芽孢杆菌活菌片', '消化系统用药', 22.80, 220, '0.5g*12片', '东北制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (410, '酪酸梭菌活菌片', '消化系统用药', 29.80, 190, '350mg*18片', '米雅', 1, '乙');
INSERT INTO `medicine_info` VALUES (411, '酪酸梭菌二联活菌散', '消化系统用药', 32.50, 180, '500mg*12袋', '科兴制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (412, '枯草杆菌二联活菌颗粒', '消化系统用药', 22.00, 240, '1g*30袋', '妈咪爱', 1, '乙');
INSERT INTO `medicine_info` VALUES (413, '枯草杆菌二联活菌肠溶胶囊', '消化系统用药', 28.50, 200, '250mg*30粒', '北京韩美', 1, '乙');
INSERT INTO `medicine_info` VALUES (414, '复方嗜酸乳杆菌片', '消化系统用药', 22.50, 230, '0.5g*20片', '江中药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (415, '布拉氏酵母菌散', '消化系统用药', 38.00, 140, '0.25g*6袋', '百科飞', 1, '乙');
INSERT INTO `medicine_info` VALUES (416, '乳酶生片', '消化系统用药', 4.50, 450, '0.3g*100片', '桂林南药', 1, '甲');
INSERT INTO `medicine_info` VALUES (417, '熊去氧胆酸胶囊', '消化系统用药', 185.00, 80, '250mg*25粒', '福摩斯特', 1, '乙');
INSERT INTO `medicine_info` VALUES (418, '熊去氧胆酸片', '消化系统用药', 85.00, 100, '50mg*30片', '上海上药', 1, '乙');
INSERT INTO `medicine_info` VALUES (419, '消炎利胆片', '消化系统用药', 12.50, 300, '100片/瓶', '罗浮山', 1, '甲');
INSERT INTO `medicine_info` VALUES (420, '消炎利胆胶囊', '消化系统用药', 16.80, 260, '0.45g*24粒', '罗浮山', 1, '甲');
INSERT INTO `medicine_info` VALUES (421, '胆宁片', '消化系统用药', 28.50, 200, '0.36g*60片', '和黄药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (422, '胆舒胶囊', '消化系统用药', 22.80, 220, '0.45g*30粒', '济生制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (423, '茴三硫片', '消化系统用药', 22.80, 220, '25mg*12片', '成都药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (424, '腺苷蛋氨酸肠溶片', '消化系统用药', 128.00, 80, '500mg*10片', '雅培', 1, '谈判');
INSERT INTO `medicine_info` VALUES (425, '腺苷蛋氨酸注射液', '消化系统用药', 158.00, 70, '500mg/支', '雅培', 1, '谈判');
INSERT INTO `medicine_info` VALUES (426, '甘草酸二铵肠溶胶囊', '消化系统用药', 26.80, 210, '50mg*24粒', '正大天晴', 1, '乙');
INSERT INTO `medicine_info` VALUES (427, '甘草酸二铵注射液', '消化系统用药', 18.50, 250, '50mg/支', '正大天晴', 1, '乙');
INSERT INTO `medicine_info` VALUES (428, '异甘草酸镁注射液', '消化系统用药', 45.00, 140, '50mg/支', '正大天晴', 1, '乙');
INSERT INTO `medicine_info` VALUES (429, '多烯磷脂酰胆碱胶囊', '消化系统用药', 45.00, 140, '228mg*36粒', '赛诺菲', 1, '乙');
INSERT INTO `medicine_info` VALUES (430, '多烯磷脂酰胆碱注射液', '消化系统用药', 38.00, 140, '5ml/支', '赛诺菲', 1, '乙');
INSERT INTO `medicine_info` VALUES (431, '还原型谷胱甘肽片', '消化系统用药', 38.00, 160, '0.1g*36片', '药友制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (432, '还原型谷胱甘肽注射液', '消化系统用药', 28.50, 200, '0.6g/支', '药友制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (433, '硫普罗宁肠溶片', '消化系统用药', 28.50, 200, '0.1g*12片', '凯西制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (434, '硫普罗宁注射液', '消化系统用药', 22.80, 220, '0.1g/支', '凯西制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (435, '门冬氨酸鸟氨酸颗粒', '消化系统用药', 58.00, 120, '3g*10袋', '瑞甘', 1, '乙');
INSERT INTO `medicine_info` VALUES (436, '门冬氨酸鸟氨酸注射液', '消化系统用药', 45.00, 140, '5g/支', '瑞甘', 1, '乙');
INSERT INTO `medicine_info` VALUES (437, '双环醇片', '消化系统用药', 38.00, 140, '25mg*18片', '协和药厂', 1, '乙');
INSERT INTO `medicine_info` VALUES (438, '联苯双酯滴丸', '消化系统用药', 8.50, 350, '1.5mg*250丸', '北京协和', 1, '甲');
INSERT INTO `medicine_info` VALUES (439, '水飞蓟宾胶囊', '消化系统用药', 28.50, 200, '35mg*30粒', '天士力', 1, '乙');
INSERT INTO `medicine_info` VALUES (440, '水飞蓟宾葡甲胺片', '消化系统用药', 22.80, 220, '50mg*60片', '江苏中兴', 1, '乙');
INSERT INTO `medicine_info` VALUES (441, '复方消化酶胶囊', '消化系统用药', 26.80, 210, '12粒/盒', '达吉', 1, '乙');
INSERT INTO `medicine_info` VALUES (442, '复方消化酶片', '消化系统用药', 22.80, 220, '12片/盒', '达吉', 1, '乙');
INSERT INTO `medicine_info` VALUES (443, '胰酶肠溶胶囊', '消化系统用药', 22.50, 230, '0.15g*24粒', '得每通', 1, '乙');
INSERT INTO `medicine_info` VALUES (444, '乳糜泻专用酶胶囊', '消化系统用药', 65.00, 100, '12粒/盒', '得每通', 1, '乙');
INSERT INTO `medicine_info` VALUES (445, '奥曲肽注射液', '消化系统用药', 128.00, 80, '0.1mg/支', '诺华', 1, '谈判');
INSERT INTO `medicine_info` VALUES (446, '生长抑素注射液', '消化系统用药', 98.00, 90, '3mg/支', '雪兰诺', 1, '乙');
INSERT INTO `medicine_info` VALUES (447, '加贝酯注射液', '消化系统用药', 45.00, 140, '0.1g/支', '常州四药', 1, '乙');
INSERT INTO `medicine_info` VALUES (448, '乌司他丁注射液', '消化系统用药', 58.00, 120, '10万U/支', '广东天普', 1, '乙');
INSERT INTO `medicine_info` VALUES (449, '盐酸氨溴索口服溶液', '呼吸系统用药', 29.80, 170, '100ml/瓶', '勃林格殷格翰', 1, '乙');
INSERT INTO `medicine_info` VALUES (450, '盐酸氨溴索片', '呼吸系统用药', 18.50, 240, '30mg*20片', '勃林格殷格翰', 1, '乙');
INSERT INTO `medicine_info` VALUES (451, '盐酸氨溴索分散片', '呼吸系统用药', 22.50, 230, '30mg*12片', '石药集团', 1, '乙');
INSERT INTO `medicine_info` VALUES (452, '盐酸氨溴索注射液', '呼吸系统用药', 28.50, 200, '15mg/支', '勃林格殷格翰', 1, '乙');
INSERT INTO `medicine_info` VALUES (453, '乙酰半胱氨酸颗粒', '呼吸系统用药', 22.50, 200, '0.2g*15袋', '赞邦制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (454, '乙酰半胱氨酸泡腾片', '呼吸系统用药', 28.50, 200, '600mg*6片', '赞邦制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (455, '乙酰半胱氨酸雾化液', '呼吸系统用药', 32.50, 180, '3ml/支', '赞邦制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (456, '羧甲司坦口服溶液', '呼吸系统用药', 16.80, 250, '10ml*10支', '白云山', 1, '甲');
INSERT INTO `medicine_info` VALUES (457, '羧甲司坦片', '呼吸系统用药', 12.50, 300, '0.25g*24片', '白云山', 1, '甲');
INSERT INTO `medicine_info` VALUES (458, '厄多司坦胶囊', '呼吸系统用药', 26.80, 210, '0.3g*12粒', '海南先声', 1, '乙');
INSERT INTO `medicine_info` VALUES (459, '福多司坦片', '呼吸系统用药', 28.50, 200, '0.2g*12片', '江苏正大', 1, '乙');
INSERT INTO `medicine_info` VALUES (460, '桉柠蒎肠溶软胶囊', '呼吸系统用药', 38.00, 160, '0.3g*12粒', '北京九和', 1, '乙');
INSERT INTO `medicine_info` VALUES (461, '桃金娘油肠溶胶囊', '呼吸系统用药', 42.00, 150, '0.3g*10粒', '德国保时佳', 1, '乙');
INSERT INTO `medicine_info` VALUES (462, '愈创甘油醚片', '呼吸系统用药', 8.50, 350, '0.2g*24片', '恒健药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (463, '愈创甘油醚糖浆', '呼吸系统用药', 16.80, 260, '100ml', '史达功', 1, '乙');
INSERT INTO `medicine_info` VALUES (464, '复方甘草片', '呼吸系统用药', 8.50, 320, '100片/瓶', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (465, '复方甘草口服溶液', '呼吸系统用药', 12.50, 300, '100ml', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (466, '右美沙芬口服溶液', '呼吸系统用药', 19.90, 250, '100ml/瓶', '史克', 1, '乙');
INSERT INTO `medicine_info` VALUES (467, '右美沙芬片', '呼吸系统用药', 15.80, 260, '15mg*24片', '史克', 1, '乙');
INSERT INTO `medicine_info` VALUES (468, '右美沙芬缓释混悬液', '呼吸系统用药', 22.80, 220, '100ml', '史克', 1, '乙');
INSERT INTO `medicine_info` VALUES (469, '喷托维林片', '呼吸系统用药', 6.50, 380, '25mg*100片', '恒健药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (470, '喷托维林糖浆', '呼吸系统用药', 9.90, 320, '100ml', '恒健药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (471, '左羟丙哌嗪胶囊', '呼吸系统用药', 28.50, 200, '60mg*12粒', '湖南迪诺', 1, '乙');
INSERT INTO `medicine_info` VALUES (472, '左羟丙哌嗪口服溶液', '呼吸系统用药', 32.50, 180, '100ml', '湖南迪诺', 1, '乙');
INSERT INTO `medicine_info` VALUES (473, '那可丁片', '呼吸系统用药', 12.50, 300, '10mg*24片', '西安杨森', 1, '乙');
INSERT INTO `medicine_info` VALUES (474, '苯丙哌林片', '呼吸系统用药', 15.80, 260, '20mg*24片', '太极集团', 1, '乙');
INSERT INTO `medicine_info` VALUES (475, '二氧丙嗪片', '呼吸系统用药', 8.50, 350, '5mg*24片', '丹东医创', 1, '甲');
INSERT INTO `medicine_info` VALUES (476, '福尔可定口服溶液', '呼吸系统用药', 28.50, 200, '100ml', '香港澳美', 1, '乙');
INSERT INTO `medicine_info` VALUES (477, '可待因桔梗片', '呼吸系统用药', 38.00, 140, '12片/盒', '青海制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (478, '复方磷酸可待因溶液', '呼吸系统用药', 42.00, 150, '100ml', '联邦制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (479, '沙丁胺醇气雾剂', '呼吸系统用药', 38.00, 140, '100μg*200揿', '葛兰素史克', 1, '甲');
INSERT INTO `medicine_info` VALUES (480, '沙丁胺醇雾化液', '呼吸系统用药', 28.50, 200, '2.5ml/支', '葛兰素史克', 1, '乙');
INSERT INTO `medicine_info` VALUES (481, '沙丁胺醇片', '呼吸系统用药', 12.50, 300, '2.4mg*24片', '上海医药', 1, '甲');
INSERT INTO `medicine_info` VALUES (482, '硫酸特布他林雾化液', '呼吸系统用药', 45.00, 130, '2ml/支', '阿斯利康', 1, '乙');
INSERT INTO `medicine_info` VALUES (483, '特布他林气雾剂', '呼吸系统用药', 32.50, 180, '100μg*200揿', '阿斯利康', 1, '乙');
INSERT INTO `medicine_info` VALUES (484, '特布他林片', '呼吸系统用药', 19.80, 240, '2.5mg*12片', '阿斯利康', 1, '乙');
INSERT INTO `medicine_info` VALUES (485, '异丙托溴铵气雾剂', '呼吸系统用药', 42.00, 150, '20μg*200揿', '勃林格殷格翰', 1, '乙');
INSERT INTO `medicine_info` VALUES (486, '异丙托溴铵雾化液', '呼吸系统用药', 38.00, 160, '2ml/支', '勃林格殷格翰', 1, '乙');
INSERT INTO `medicine_info` VALUES (487, '复方异丙托溴铵雾化液', '呼吸系统用药', 45.00, 140, '2.5ml/支', '勃林格殷格翰', 1, '乙');
INSERT INTO `medicine_info` VALUES (488, '噻托溴铵粉吸入剂', '呼吸系统用药', 85.00, 100, '18μg*30粒', '勃林格殷格翰', 1, '谈判');
INSERT INTO `medicine_info` VALUES (489, '噻托溴铵喷雾剂', '呼吸系统用药', 98.00, 90, '60揿/瓶', '勃林格殷格翰', 1, '谈判');
INSERT INTO `medicine_info` VALUES (490, '福莫特罗粉吸入剂', '呼吸系统用药', 58.00, 120, '4.5μg*60吸', '阿斯利康', 1, '乙');
INSERT INTO `medicine_info` VALUES (491, '福莫特罗片', '呼吸系统用药', 26.80, 210, '40μg*12片', '阿斯利康', 1, '乙');
INSERT INTO `medicine_info` VALUES (492, '沙美特罗替卡松粉吸入剂', '呼吸系统用药', 228.00, 70, '50μg/250μg*60吸', '葛兰素史克', 1, '谈判');
INSERT INTO `medicine_info` VALUES (493, '布地奈德福莫特罗粉吸入剂', '呼吸系统用药', 198.00, 80, '160μg/4.5μg*60吸', '阿斯利康', 1, '谈判');
INSERT INTO `medicine_info` VALUES (494, '氨茶碱片', '呼吸系统用药', 12.50, 280, '0.1g*100片', '太原制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (495, '氨茶碱注射液', '呼吸系统用药', 8.50, 350, '0.25g/支', '太原制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (496, '茶碱缓释片', '呼吸系统用药', 18.80, 250, '0.1g*24片', '舒弗美', 1, '乙');
INSERT INTO `medicine_info` VALUES (497, '多索茶碱片', '呼吸系统用药', 28.50, 200, '0.2g*12片', '昂利康制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (498, '多索茶碱注射液', '呼吸系统用药', 32.50, 180, '0.2g/支', '昂利康制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (499, '孟鲁司特钠片', '呼吸系统用药', 45.00, 130, '10mg*5片', '默沙东', 1, '乙');
INSERT INTO `medicine_info` VALUES (500, '孟鲁司特钠咀嚼片', '呼吸系统用药', 38.00, 160, '4mg*5片', '默沙东', 1, '乙');
INSERT INTO `medicine_info` VALUES (501, '孟鲁司特钠颗粒', '呼吸系统用药', 32.50, 180, '0.5g*5袋', '默沙东', 1, '乙');
INSERT INTO `medicine_info` VALUES (502, '扎鲁司特片', '呼吸系统用药', 28.50, 200, '20mg*12片', '阿斯利康', 1, '乙');
INSERT INTO `medicine_info` VALUES (503, '色甘酸钠气雾剂', '呼吸系统用药', 18.50, 250, '35μg*200揿', '上海信谊', 1, '甲');
INSERT INTO `medicine_info` VALUES (504, '酮替芬片', '呼吸系统用药', 6.50, 380, '1mg*60片', '山东鲁西', 1, '甲');
INSERT INTO `medicine_info` VALUES (505, '布地奈德混悬液', '呼吸系统用药', 58.00, 120, '2ml/支', '阿斯利康', 1, '乙');
INSERT INTO `medicine_info` VALUES (506, '布地奈德气雾剂', '呼吸系统用药', 45.00, 140, '50μg*200揿', '阿斯利康', 1, '乙');
INSERT INTO `medicine_info` VALUES (507, '布地奈德粉吸入剂', '呼吸系统用药', 65.00, 100, '100μg*200吸', '阿斯利康', 1, '乙');
INSERT INTO `medicine_info` VALUES (508, '丙酸氟替卡松气雾剂', '呼吸系统用药', 58.00, 120, '50μg*120揿', '葛兰素史克', 1, '乙');
INSERT INTO `medicine_info` VALUES (509, '丙酸氟替卡松雾化液', '呼吸系统用药', 68.00, 100, '2ml/支', '葛兰素史克', 1, '乙');
INSERT INTO `medicine_info` VALUES (510, '丙酸倍氯米松气雾剂', '呼吸系统用药', 38.00, 160, '50μg*200揿', '山东京卫', 1, '乙');
INSERT INTO `medicine_info` VALUES (511, '地塞米松注射液', '呼吸系统用药', 5.50, 400, '5mg/支', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (512, '甲泼尼龙片', '呼吸系统用药', 45.00, 140, '4mg*30片', '辉瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (513, '甲泼尼龙注射液', '呼吸系统用药', 38.00, 160, '40mg/支', '辉瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (514, '泼尼松片', '呼吸系统用药', 6.50, 380, '5mg*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (515, '氨酚黄那敏颗粒', '呼吸系统用药', 12.80, 300, '6g*12袋', '护彤', 1, '甲');
INSERT INTO `medicine_info` VALUES (516, '小儿氨酚黄那敏颗粒', '呼吸系统用药', 12.80, 300, '6g*12袋', '葵花药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (517, '氨酚烷胺胶囊', '呼吸系统用药', 15.80, 260, '12粒/盒', '快克', 1, '乙');
INSERT INTO `medicine_info` VALUES (518, '复方氨酚烷胺片', '呼吸系统用药', 16.80, 260, '12片/盒', '感康', 1, '乙');
INSERT INTO `medicine_info` VALUES (519, '酚麻美敏片', '呼吸系统用药', 19.80, 240, '12片/盒', '泰诺', 1, '乙');
INSERT INTO `medicine_info` VALUES (520, '美敏伪麻溶液', '呼吸系统用药', 28.50, 200, '100ml', '惠菲宁', 1, '乙');
INSERT INTO `medicine_info` VALUES (521, '氨咖黄敏胶囊', '呼吸系统用药', 8.50, 350, '12粒/板', '哈药集团', 1, '甲');
INSERT INTO `medicine_info` VALUES (522, '维C银翘片', '呼吸系统用药', 6.50, 380, '12片*2板', '贵州百灵', 1, '甲');
INSERT INTO `medicine_info` VALUES (523, '连花清瘟胶囊', '呼吸系统用药', 24.90, 210, '0.35g*24粒', '以岭药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (524, '连花清瘟颗粒', '呼吸系统用药', 26.80, 200, '6g*10袋', '以岭药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (525, '999感冒灵颗粒', '呼吸系统用药', 19.90, 230, '10g*15袋', '三九医药', 1, '乙');
INSERT INTO `medicine_info` VALUES (526, '感冒清热颗粒', '呼吸系统用药', 15.80, 260, '12g*10袋', '同仁堂', 1, '甲');
INSERT INTO `medicine_info` VALUES (527, '小柴胡颗粒', '呼吸系统用药', 16.80, 260, '10g*10袋', '白云山', 1, '甲');
INSERT INTO `medicine_info` VALUES (528, '疏风解毒胶囊', '呼吸系统用药', 29.80, 190, '0.52g*24粒', '济人药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (529, '金花清感颗粒', '呼吸系统用药', 26.80, 200, '5g*12袋', '聚协昌', 1, '乙');
INSERT INTO `medicine_info` VALUES (530, '抗病毒口服液', '呼吸系统用药', 19.80, 240, '10ml*10支', '香雪制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (531, '板蓝根颗粒', '呼吸系统用药', 9.90, 350, '10g*20袋', '白云山', 1, '甲');
INSERT INTO `medicine_info` VALUES (532, '双黄连口服液', '呼吸系统用药', 16.50, 280, '10ml*10支', '哈药集团', 1, '甲');
INSERT INTO `medicine_info` VALUES (533, '清开灵颗粒', '呼吸系统用药', 22.00, 240, '3g*12袋', '白云山', 1, '乙');
INSERT INTO `medicine_info` VALUES (534, '氯雷他定片', '呼吸系统用药', 22.50, 230, '10mg*6片', '拜耳', 1, '乙');
INSERT INTO `medicine_info` VALUES (535, '氯雷他定糖浆', '呼吸系统用药', 26.80, 210, '100ml', '拜耳', 1, '乙');
INSERT INTO `medicine_info` VALUES (536, '枸地氯雷他定片', '呼吸系统用药', 38.00, 160, '8.8mg*6片', '扬子江药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (537, '西替利嗪片', '呼吸系统用药', 19.80, 240, '10mg*12片', '联合药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (538, '西替利嗪滴剂', '呼吸系统用药', 28.50, 200, '5ml/瓶', '联合药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (539, '左西替利嗪片', '呼吸系统用药', 26.80, 210, '5mg*12片', '扬子江药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (540, '依巴斯汀片', '呼吸系统用药', 32.50, 180, '10mg*10片', '杭州民生', 1, '乙');
INSERT INTO `medicine_info` VALUES (541, '咪唑斯汀缓释片', '呼吸系统用药', 28.50, 200, '10mg*7片', '西安杨森', 1, '乙');
INSERT INTO `medicine_info` VALUES (542, '盐酸氮卓斯汀片', '呼吸系统用药', 22.80, 220, '2mg*12片', '贵州云峰', 1, '乙');
INSERT INTO `medicine_info` VALUES (543, '盐酸非索非那定片', '呼吸系统用药', 26.80, 210, '60mg*12片', '江苏恒瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (544, '盐酸羟甲唑啉喷雾剂', '呼吸系统用药', 16.80, 250, '10ml/支', '达芬霖', 1, '乙');
INSERT INTO `medicine_info` VALUES (545, '盐酸萘甲唑啉滴鼻液', '呼吸系统用药', 8.50, 350, '8ml/支', '恒健药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (546, '布地奈德鼻喷雾剂', '呼吸系统用药', 58.00, 140, '64μg*120喷', '阿斯利康', 1, '乙');
INSERT INTO `medicine_info` VALUES (547, '糠酸莫米松鼻喷雾剂', '呼吸系统用药', 65.00, 110, '50μg*60喷', '先灵葆雅', 1, '乙');
INSERT INTO `medicine_info` VALUES (548, '丙酸氟替卡松鼻喷雾剂', '呼吸系统用药', 58.00, 120, '50μg*120喷', '葛兰素史克', 1, '乙');
INSERT INTO `medicine_info` VALUES (549, '丙酸倍氯米松鼻喷雾剂', '呼吸系统用药', 45.00, 140, '50μg*200喷', '山东京卫', 1, '乙');
INSERT INTO `medicine_info` VALUES (550, '色甘酸钠滴鼻液', '呼吸系统用药', 9.90, 320, '8ml/支', '恒健药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (551, '西瓜霜含片', '呼吸系统用药', 9.90, 320, '12片/盒', '三金药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (552, '西瓜霜喷剂', '呼吸系统用药', 15.80, 260, '3g/瓶', '三金药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (553, '金嗓子喉片', '呼吸系统用药', 12.50, 300, '12片/盒', '金嗓子', 1, '甲');
INSERT INTO `medicine_info` VALUES (554, '草珊瑚含片', '呼吸系统用药', 12.50, 300, '12片*2板', '江中制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (555, '华素片', '呼吸系统用药', 15.80, 260, '1.5mg*15片', '北京华素', 1, '甲');
INSERT INTO `medicine_info` VALUES (556, '清喉利咽颗粒', '呼吸系统用药', 22.00, 240, '5g*18袋', '慢严舒柠', 1, '乙');
INSERT INTO `medicine_info` VALUES (557, '咽炎片', '呼吸系统用药', 18.50, 250, '12片*2板', '修正药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (558, '喉咽清口服液', '呼吸系统用药', 28.50, 200, '10ml*10支', '湖南天劲', 1, '乙');
INSERT INTO `medicine_info` VALUES (559, '复方鱼腥草片', '呼吸系统用药', 12.50, 300, '12片*2板', '白云山', 1, '甲');
INSERT INTO `medicine_info` VALUES (560, '蒲地蓝消炎口服液', '呼吸系统用药', 38.00, 160, '10ml*10支', '济川药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (561, '蒲地蓝消炎片', '呼吸系统用药', 22.80, 220, '12片*2板', '济川药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (562, '氨溴特罗口服溶液', '呼吸系统用药', 29.80, 170, '60ml/瓶', '易坦静', 1, '乙');
INSERT INTO `medicine_info` VALUES (563, '肺力咳合剂', '呼吸系统用药', 28.50, 200, '100ml/瓶', '健兴药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (564, '小儿肺热咳喘口服液', '呼吸系统用药', 28.50, 200, '10ml*6支', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (565, '小儿肺热咳喘颗粒', '呼吸系统用药', 22.50, 230, '3g*12袋', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (566, '小儿止咳糖浆', '呼吸系统用药', 15.80, 260, '100ml', '葵花药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (567, '小儿化痰止咳颗粒', '呼吸系统用药', 16.80, 260, '5g*12袋', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (568, '小儿咳喘灵颗粒', '呼吸系统用药', 18.50, 250, '2g*12袋', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (569, '小儿麻甘颗粒', '呼吸系统用药', 22.50, 230, '2.5g*12袋', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (570, '小儿清咽颗粒', '呼吸系统用药', 16.80, 260, '6g*10袋', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (571, '小儿咽扁颗粒', '呼吸系统用药', 18.50, 250, '8g*10袋', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (572, '硝苯地平片', '心脑血管用药', 8.50, 350, '10mg*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (573, '硝苯地平缓释片', '心脑血管用药', 18.50, 250, '20mg*30片', '扬子江药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (574, '硝苯地平控释片', '心脑血管用药', 38.00, 160, '30mg*7片', '拜耳', 1, '乙');
INSERT INTO `medicine_info` VALUES (575, '氨氯地平片', '心脑血管用药', 28.50, 200, '5mg*14片', '辉瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (576, '左旋氨氯地平片', '心脑血管用药', 32.50, 180, '2.5mg*14片', '施慧达', 1, '乙');
INSERT INTO `medicine_info` VALUES (577, '非洛地平缓释片', '心脑血管用药', 29.80, 190, '5mg*10片', '阿斯利康', 1, '乙');
INSERT INTO `medicine_info` VALUES (578, '拉西地平片', '心脑血管用药', 26.80, 210, '4mg*7片', '葛兰素史克', 1, '乙');
INSERT INTO `medicine_info` VALUES (579, '尼莫地平片', '心脑血管用药', 15.80, 260, '30mg*20片', '拜耳', 1, '甲');
INSERT INTO `medicine_info` VALUES (580, '尼莫地平注射液', '心脑血管用药', 22.80, 220, '10mg/支', '拜耳', 1, '乙');
INSERT INTO `medicine_info` VALUES (581, '尼群地平片', '心脑血管用药', 6.50, 380, '10mg*100片', '山东鲁西', 1, '甲');
INSERT INTO `medicine_info` VALUES (582, '尼索地平缓释片', '心脑血管用药', 28.50, 200, '10mg*7片', '西安杨森', 1, '乙');
INSERT INTO `medicine_info` VALUES (583, '乐卡地平片', '心脑血管用药', 32.50, 180, '10mg*7片', '意大利利康', 1, '乙');
INSERT INTO `medicine_info` VALUES (584, '卡托普利片', '心脑血管用药', 8.50, 350, '25mg*100片', '施贵宝', 1, '甲');
INSERT INTO `medicine_info` VALUES (585, '依那普利片', '心脑血管用药', 15.80, 260, '10mg*16片', '默沙东', 1, '乙');
INSERT INTO `medicine_info` VALUES (586, '贝那普利片', '心脑血管用药', 28.50, 200, '10mg*14片', '诺华', 1, '乙');
INSERT INTO `medicine_info` VALUES (587, '赖诺普利片', '心脑血管用药', 19.80, 240, '10mg*14片', '默沙东', 1, '乙');
INSERT INTO `medicine_info` VALUES (588, '雷米普利片', '心脑血管用药', 38.00, 160, '5mg*7片', '赛诺菲', 1, '乙');
INSERT INTO `medicine_info` VALUES (589, '咪达普利片', '心脑血管用药', 26.80, 210, '5mg*14片', '天津田边', 1, '乙');
INSERT INTO `medicine_info` VALUES (590, '培哚普利片', '心脑血管用药', 38.00, 160, '4mg*7片', '施维雅', 1, '乙');
INSERT INTO `medicine_info` VALUES (591, '氯沙坦钾片', '心脑血管用药', 28.50, 200, '50mg*7片', '默沙东', 1, '乙');
INSERT INTO `medicine_info` VALUES (592, '缬沙坦胶囊', '心脑血管用药', 26.80, 210, '80mg*7粒', '诺华', 1, '乙');
INSERT INTO `medicine_info` VALUES (593, '缬沙坦氨氯地平片', '心脑血管用药', 65.00, 100, '80mg/5mg*7片', '诺华', 1, '谈判');
INSERT INTO `medicine_info` VALUES (594, '厄贝沙坦片', '心脑血管用药', 28.50, 200, '150mg*7片', '赛诺菲', 1, '乙');
INSERT INTO `medicine_info` VALUES (595, '厄贝沙坦氢氯噻嗪片', '心脑血管用药', 38.00, 160, '150mg/12.5mg*7片', '赛诺菲', 1, '乙');
INSERT INTO `medicine_info` VALUES (596, '替米沙坦片', '心脑血管用药', 22.80, 220, '40mg*7片', '勃林格殷格翰', 1, '乙');
INSERT INTO `medicine_info` VALUES (597, '奥美沙坦酯片', '心脑血管用药', 32.50, 180, '20mg*7片', '第一三共', 1, '乙');
INSERT INTO `medicine_info` VALUES (598, '阿利沙坦酯片', '心脑血管用药', 38.00, 160, '240mg*7片', '信立泰', 1, '乙');
INSERT INTO `medicine_info` VALUES (599, '美托洛尔片', '心脑血管用药', 15.80, 260, '50mg*20片', '阿斯利康', 1, '甲');
INSERT INTO `medicine_info` VALUES (600, '美托洛尔缓释片', '心脑血管用药', 28.50, 200, '47.5mg*7片', '阿斯利康', 1, '乙');
INSERT INTO `medicine_info` VALUES (601, '比索洛尔片', '心脑血管用药', 28.50, 200, '5mg*10片', '默克', 1, '乙');
INSERT INTO `medicine_info` VALUES (602, '阿罗洛尔片', '心脑血管用药', 32.50, 180, '5mg*10片', '住友制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (603, '拉贝洛尔片', '心脑血管用药', 19.80, 240, '50mg*30片', '天津药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (604, '卡维地洛片', '心脑血管用药', 22.80, 220, '10mg*14片', '罗氏', 1, '乙');
INSERT INTO `medicine_info` VALUES (605, '氢氯噻嗪片', '心脑血管用药', 5.50, 400, '25mg*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (606, '吲达帕胺片', '心脑血管用药', 12.50, 300, '2.5mg*30片', '天津药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (607, '吲达帕胺缓释片', '心脑血管用药', 18.50, 250, '1.5mg*10片', '施维雅', 1, '乙');
INSERT INTO `medicine_info` VALUES (608, '呋塞米片', '心脑血管用药', 8.50, 350, '20mg*100片', '上海医药', 1, '甲');
INSERT INTO `medicine_info` VALUES (609, '呋塞米注射液', '心脑血管用药', 6.50, 380, '20mg/支', '上海医药', 1, '甲');
INSERT INTO `medicine_info` VALUES (610, '托拉塞米片', '心脑血管用药', 28.50, 200, '10mg*12片', '南京海辰', 1, '乙');
INSERT INTO `medicine_info` VALUES (611, '托拉塞米注射液', '心脑血管用药', 32.50, 180, '20mg/支', '南京海辰', 1, '乙');
INSERT INTO `medicine_info` VALUES (612, '螺内酯片', '心脑血管用药', 8.50, 350, '20mg*100片', '上海医药', 1, '甲');
INSERT INTO `medicine_info` VALUES (613, '氨苯蝶啶片', '心脑血管用药', 12.50, 300, '50mg*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (614, '可乐定片', '心脑血管用药', 6.50, 380, '75μg*100片', '辽宁王牌', 1, '甲');
INSERT INTO `medicine_info` VALUES (615, '甲基多巴片', '心脑血管用药', 28.50, 200, '250mg*30片', '默沙东', 1, '乙');
INSERT INTO `medicine_info` VALUES (616, '利血平片', '心脑血管用药', 5.50, 400, '0.25mg*100片', '广东华南', 1, '甲');
INSERT INTO `medicine_info` VALUES (617, '硝普钠注射液', '心脑血管用药', 38.00, 160, '50mg/支', '华润双鹤', 1, '乙');
INSERT INTO `medicine_info` VALUES (618, '硫酸镁注射液', '心脑血管用药', 6.50, 380, '10ml/支', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (619, '阿托伐他汀钙片', '心脑血管用药', 28.50, 200, '20mg*7片', '辉瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (620, '瑞舒伐他汀钙片', '心脑血管用药', 38.00, 160, '10mg*7片', '阿斯利康', 1, '乙');
INSERT INTO `medicine_info` VALUES (621, '辛伐他汀片', '心脑血管用药', 15.80, 260, '20mg*14片', '默沙东', 1, '甲');
INSERT INTO `medicine_info` VALUES (622, '普伐他汀钠片', '心脑血管用药', 19.80, 240, '20mg*14片', '三共制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (623, '氟伐他汀钠缓释片', '心脑血管用药', 26.80, 210, '80mg*7片', '诺华', 1, '乙');
INSERT INTO `medicine_info` VALUES (624, '匹伐他汀钙片', '心脑血管用药', 32.50, 180, '2mg*7片', '兴和制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (625, '依折麦布片', '心脑血管用药', 38.00, 160, '10mg*5片', '默沙东', 1, '乙');
INSERT INTO `medicine_info` VALUES (626, '依折麦布阿托伐他汀片', '心脑血管用药', 65.00, 100, '10mg/20mg*7片', '默沙东', 1, '谈判');
INSERT INTO `medicine_info` VALUES (627, '非诺贝特胶囊', '心脑血管用药', 18.50, 250, '200mg*10粒', '法国利博福尼', 1, '乙');
INSERT INTO `medicine_info` VALUES (628, '苯扎贝特片', '心脑血管用药', 19.80, 240, '200mg*20片', '江苏天士力', 1, '乙');
INSERT INTO `medicine_info` VALUES (629, '吉非罗齐胶囊', '心脑血管用药', 12.50, 300, '300mg*30粒', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (630, '普罗布考片', '心脑血管用药', 28.50, 200, '250mg*12片', '齐鲁制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (631, '多廿烷醇片', '心脑血管用药', 32.50, 180, '10mg*7片', '古巴泰利', 1, '乙');
INSERT INTO `medicine_info` VALUES (632, '鱼油软胶囊', '心脑血管用药', 22.80, 220, '1g*60粒', '汤臣倍健', 1, '乙');
INSERT INTO `medicine_info` VALUES (633, '阿司匹林肠溶片', '心脑血管用药', 8.50, 350, '100mg*30片', '拜耳', 1, '甲');
INSERT INTO `medicine_info` VALUES (634, '阿司匹林泡腾片', '心脑血管用药', 15.80, 260, '500mg*10片', '拜耳', 1, '乙');
INSERT INTO `medicine_info` VALUES (635, '氯吡格雷片', '心脑血管用药', 38.00, 160, '75mg*7片', '赛诺菲', 1, '乙');
INSERT INTO `medicine_info` VALUES (636, '替格瑞洛片', '心脑血管用药', 45.00, 140, '90mg*14片', '阿斯利康', 1, '乙');
INSERT INTO `medicine_info` VALUES (637, '西洛他唑片', '心脑血管用药', 28.50, 200, '50mg*12片', '大冢制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (638, '双嘧达莫片', '心脑血管用药', 6.50, 380, '25mg*100片', '亚宝药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (639, '奥扎格雷钠注射液', '心脑血管用药', 22.80, 220, '80mg/支', '山东罗欣', 1, '乙');
INSERT INTO `medicine_info` VALUES (640, '替罗非班注射液', '心脑血管用药', 45.00, 140, '12.5mg/支', '默克', 1, '乙');
INSERT INTO `medicine_info` VALUES (641, '华法林钠片', '心脑血管用药', 12.50, 300, '3mg*20片', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (642, '利伐沙班片', '心脑血管用药', 65.00, 100, '10mg*5片', '拜耳', 1, '谈判');
INSERT INTO `medicine_info` VALUES (643, '阿哌沙班片', '心脑血管用药', 68.00, 100, '2.5mg*14片', '辉瑞', 1, '谈判');
INSERT INTO `medicine_info` VALUES (644, '依度沙班片', '心脑血管用药', 58.00, 120, '15mg*10片', '第一三共', 1, '乙');
INSERT INTO `medicine_info` VALUES (645, '达比加群酯胶囊', '心脑血管用药', 65.00, 100, '110mg*10粒', '勃林格殷格翰', 1, '谈判');
INSERT INTO `medicine_info` VALUES (646, '低分子肝素钙注射液', '心脑血管用药', 38.00, 160, '5000U/支', '葛兰素史克', 1, '乙');
INSERT INTO `medicine_info` VALUES (647, '低分子肝素钠注射液', '心脑血管用药', 32.50, 180, '5000U/支', '辉瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (648, '依诺肝素钠注射液', '心脑血管用药', 45.00, 140, '4000U/支', '赛诺菲', 1, '乙');
INSERT INTO `medicine_info` VALUES (649, '那曲肝素钙注射液', '心脑血管用药', 42.00, 150, '4100U/支', '葛兰素史克', 1, '乙');
INSERT INTO `medicine_info` VALUES (650, '硝酸甘油片', '心脑血管用药', 5.50, 400, '0.5mg*100片', '北京益民', 1, '甲');
INSERT INTO `medicine_info` VALUES (651, '硝酸甘油注射液', '心脑血管用药', 12.50, 300, '5mg/支', '北京益民', 1, '甲');
INSERT INTO `medicine_info` VALUES (652, '单硝酸异山梨酯片', '心脑血管用药', 18.50, 250, '20mg*48片', '鲁南制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (653, '单硝酸异山梨酯缓释片', '心脑血管用药', 28.50, 200, '40mg*14片', '鲁南制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (654, '单硝酸异山梨酯注射液', '心脑血管用药', 22.80, 220, '25mg/支', '鲁南制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (655, '二硝酸异山梨酯片', '心脑血管用药', 8.50, 350, '5mg*100片', '上海医药', 1, '甲');
INSERT INTO `medicine_info` VALUES (656, '曲美他嗪片', '心脑血管用药', 28.50, 200, '20mg*30片', '施维雅', 1, '乙');
INSERT INTO `medicine_info` VALUES (657, '曲美他嗪缓释片', '心脑血管用药', 38.00, 160, '35mg*14片', '施维雅', 1, '乙');
INSERT INTO `medicine_info` VALUES (658, '尼可地尔片', '心脑血管用药', 32.50, 180, '5mg*24片', '天士力', 1, '乙');
INSERT INTO `medicine_info` VALUES (659, '伊伐布雷定片', '心脑血管用药', 45.00, 140, '5mg*14片', '施维雅', 1, '乙');
INSERT INTO `medicine_info` VALUES (660, '雷诺嗪片', '心脑血管用药', 58.00, 120, '500mg*14片', '吉利德', 1, '乙');
INSERT INTO `medicine_info` VALUES (661, '丹参滴丸', '心脑血管用药', 28.50, 200, '27mg*180丸', '天士力', 1, '乙');
INSERT INTO `medicine_info` VALUES (662, '麝香保心丸', '心脑血管用药', 29.80, 190, '22.5mg*42丸', '上药和黄', 1, '乙');
INSERT INTO `medicine_info` VALUES (663, '速效救心丸', '心脑血管用药', 18.50, 250, '40mg*60丸', '天津中新', 1, '甲');
INSERT INTO `medicine_info` VALUES (664, '通心络胶囊', '心脑血管用药', 28.50, 200, '0.26g*30粒', '以岭药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (665, '参松养心胶囊', '心脑血管用药', 29.80, 190, '0.4g*36粒', '以岭药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (666, '地高辛片', '心脑血管用药', 8.50, 350, '0.25mg*100片', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (667, '去乙酰毛花苷注射液', '心脑血管用药', 12.50, 300, '0.4mg/支', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (668, '毒毛花苷K注射液', '心脑血管用药', 15.80, 260, '0.25mg/支', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (669, '米力农注射液', '心脑血管用药', 28.50, 200, '5mg/支', '山东新时代', 1, '乙');
INSERT INTO `medicine_info` VALUES (670, '左西孟旦注射液', '心脑血管用药', 128.00, 80, '12.5mg/支', '芬兰奥立安', 1, '谈判');
INSERT INTO `medicine_info` VALUES (671, '托伐普坦片', '心脑血管用药', 65.00, 100, '15mg*5片', '大冢制药', 1, '谈判');
INSERT INTO `medicine_info` VALUES (672, '奈西立肽注射液', '心脑血管用药', 98.00, 90, '0.5mg/支', '雅培', 1, '乙');
INSERT INTO `medicine_info` VALUES (673, '沙库巴曲缬沙坦片', '心脑血管用药', 68.00, 100, '100mg*14片', '诺华', 1, '谈判');
INSERT INTO `medicine_info` VALUES (674, '普罗帕酮片', '心脑血管用药', 12.50, 300, '50mg*50片', '上海医药', 1, '甲');
INSERT INTO `medicine_info` VALUES (675, '普罗帕酮注射液', '心脑血管用药', 15.80, 260, '35mg/支', '上海医药', 1, '甲');
INSERT INTO `medicine_info` VALUES (676, '美西律片', '心脑血管用药', 8.50, 350, '50mg*100片', '江苏四环', 1, '甲');
INSERT INTO `medicine_info` VALUES (677, '利多卡因注射液', '心脑血管用药', 6.50, 380, '100mg/支', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (678, '胺碘酮片', '心脑血管用药', 18.50, 250, '200mg*24片', '赛诺菲', 1, '乙');
INSERT INTO `medicine_info` VALUES (679, '胺碘酮注射液', '心脑血管用药', 28.50, 200, '150mg/支', '赛诺菲', 1, '乙');
INSERT INTO `medicine_info` VALUES (680, '维拉帕米片', '心脑血管用药', 12.50, 300, '40mg*30片', '雅培', 1, '甲');
INSERT INTO `medicine_info` VALUES (681, '维拉帕米注射液', '心脑血管用药', 19.80, 240, '5mg/支', '雅培', 1, '乙');
INSERT INTO `medicine_info` VALUES (682, '地尔硫卓片', '心脑血管用药', 15.80, 260, '30mg*50片', '田边制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (683, '地尔硫卓缓释片', '心脑血管用药', 28.50, 200, '90mg*10片', '田边制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (684, '腺苷注射液', '心脑血管用药', 38.00, 160, '6mg/支', '辉瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (685, '硫酸镁注射液', '心脑血管用药', 6.50, 380, '10ml/支', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (686, '丁苯酞软胶囊', '心脑血管用药', 128.00, 80, '0.1g*24粒', '石药集团', 1, '谈判');
INSERT INTO `medicine_info` VALUES (687, '丁苯酞注射液', '心脑血管用药', 158.00, 70, '25mg/支', '石药集团', 1, '谈判');
INSERT INTO `medicine_info` VALUES (688, '依达拉奉注射液', '心脑血管用药', 28.50, 200, '30mg/支', '先声药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (689, '长春西汀片', '心脑血管用药', 22.80, 220, '5mg*30片', '天津药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (690, '长春西汀注射液', '心脑血管用药', 28.50, 200, '10mg/支', '天津药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (691, '桂哌齐特注射液', '心脑血管用药', 38.00, 160, '320mg/支', '北京四环', 1, '乙');
INSERT INTO `medicine_info` VALUES (692, '法舒地尔注射液', '心脑血管用药', 45.00, 140, '30mg/支', '日本旭化成', 1, '乙');
INSERT INTO `medicine_info` VALUES (693, '天麻素注射液', '心脑血管用药', 19.80, 240, '200mg/支', '昆明制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (694, '倍他司汀片', '心脑血管用药', 12.50, 300, '6mg*100片', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (695, '倍他司汀注射液', '心脑血管用药', 18.50, 250, '20mg/支', '上海上药', 1, '乙');
INSERT INTO `medicine_info` VALUES (696, '氟桂利嗪胶囊', '心脑血管用药', 15.80, 260, '5mg*20粒', '西安杨森', 1, '甲');
INSERT INTO `medicine_info` VALUES (697, '银杏叶片', '心脑血管用药', 22.80, 220, '9.6mg*24片', '扬子江药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (698, '银杏叶提取物注射液', '心脑血管用药', 38.00, 160, '17.5mg/支', '德国威玛舒培', 1, '乙');
INSERT INTO `medicine_info` VALUES (699, '灯盏花素注射液', '心脑血管用药', 22.80, 220, '20mg/支', '昆明龙津', 1, '乙');
INSERT INTO `medicine_info` VALUES (700, '血塞通注射液', '心脑血管用药', 19.80, 240, '200mg/支', '昆药集团', 1, '乙');
INSERT INTO `medicine_info` VALUES (701, '血栓通注射液', '心脑血管用药', 18.50, 250, '250mg/支', '梧州制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (702, '脑心通胶囊', '心脑血管用药', 28.50, 200, '0.4g*36粒', '步长制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (703, '脑络通胶囊', '心脑血管用药', 18.50, 250, '0.5g*30粒', '广州花城', 1, '乙');
INSERT INTO `medicine_info` VALUES (704, '养血清脑颗粒', '心脑血管用药', 22.80, 220, '4g*15袋', '天士力', 1, '乙');
INSERT INTO `medicine_info` VALUES (705, '华佗再造丸', '心脑血管用药', 28.50, 200, '8g*8袋', '广州白云山', 1, '乙');
INSERT INTO `medicine_info` VALUES (706, '大活络丸', '心脑血管用药', 19.80, 240, '3.5g*10丸', '北京同仁堂', 1, '乙');
INSERT INTO `medicine_info` VALUES (707, '辅酶Q10胶囊', '心脑血管用药', 18.50, 250, '10mg*60粒', '上海医药', 1, '甲');
INSERT INTO `medicine_info` VALUES (708, '左卡尼汀口服液', '心脑血管用药', 38.00, 160, '10ml*6支', '东北制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (709, '左卡尼汀注射液', '心脑血管用药', 28.50, 200, '1g/支', '东北制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (710, '磷酸肌酸钠注射液', '心脑血管用药', 45.00, 140, '1g/支', '吉林英联', 1, '乙');
INSERT INTO `medicine_info` VALUES (711, '三磷酸腺苷注射液', '心脑血管用药', 6.50, 380, '20mg/支', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (712, '肌苷片', '心脑血管用药', 5.50, 400, '0.2g*100片', '山东鲁西', 1, '甲');
INSERT INTO `medicine_info` VALUES (713, '维生素C注射液', '心脑血管用药', 6.50, 380, '1g/支', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (714, '维生素B6注射液', '心脑血管用药', 5.50, 400, '50mg/支', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (715, '氯化钾缓释片', '心脑血管用药', 8.50, 350, '0.5g*24片', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (716, '氯化钾注射液', '心脑血管用药', 6.50, 380, '1g/支', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (717, '门冬氨酸钾镁片', '心脑血管用药', 15.80, 260, '50mg*60片', '德国默克', 1, '乙');
INSERT INTO `medicine_info` VALUES (718, '门冬氨酸钾镁注射液', '心脑血管用药', 12.50, 300, '10ml/支', '德国默克', 1, '乙');
INSERT INTO `medicine_info` VALUES (719, '重组人胰岛素注射液', '内分泌及糖尿病用药', 38.00, 160, '300U/笔芯', '诺和诺德', 1, '乙');
INSERT INTO `medicine_info` VALUES (720, '生物合成人胰岛素注射液', '内分泌及糖尿病用药', 32.50, 180, '400U/瓶', '礼来', 1, '乙');
INSERT INTO `medicine_info` VALUES (721, '门冬胰岛素注射液', '内分泌及糖尿病用药', 58.00, 120, '300U/笔芯', '诺和诺德', 1, '乙');
INSERT INTO `medicine_info` VALUES (722, '门冬胰岛素30注射液', '内分泌及糖尿病用药', 65.00, 100, '300U/笔芯', '诺和诺德', 1, '谈判');
INSERT INTO `medicine_info` VALUES (723, '门冬胰岛素50注射液', '内分泌及糖尿病用药', 68.00, 100, '300U/笔芯', '诺和诺德', 1, '谈判');
INSERT INTO `medicine_info` VALUES (724, '赖脯胰岛素注射液', '内分泌及糖尿病用药', 58.00, 120, '300U/笔芯', '礼来', 1, '乙');
INSERT INTO `medicine_info` VALUES (725, '赖脯胰岛素25注射液', '内分泌及糖尿病用药', 65.00, 100, '300U/笔芯', '礼来', 1, '谈判');
INSERT INTO `medicine_info` VALUES (726, '赖脯胰岛素50注射液', '内分泌及糖尿病用药', 68.00, 100, '300U/笔芯', '礼来', 1, '谈判');
INSERT INTO `medicine_info` VALUES (727, '甘精胰岛素注射液', '内分泌及糖尿病用药', 85.00, 100, '300U/笔芯', '赛诺菲', 1, '谈判');
INSERT INTO `medicine_info` VALUES (728, '地特胰岛素注射液', '内分泌及糖尿病用药', 78.00, 100, '300U/笔芯', '诺和诺德', 1, '谈判');
INSERT INTO `medicine_info` VALUES (729, '德谷胰岛素注射液', '内分泌及糖尿病用药', 98.00, 90, '300U/笔芯', '诺和诺德', 1, '谈判');
INSERT INTO `medicine_info` VALUES (730, '低精蛋白锌胰岛素注射液', '内分泌及糖尿病用药', 28.50, 200, '400U/瓶', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (731, '精蛋白锌胰岛素注射液', '内分泌及糖尿病用药', 32.50, 180, '400U/瓶', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (732, '预混人胰岛素30R', '内分泌及糖尿病用药', 45.00, 140, '300U/笔芯', '诺和诺德', 1, '乙');
INSERT INTO `medicine_info` VALUES (733, '预混人胰岛素50R', '内分泌及糖尿病用药', 48.00, 130, '300U/笔芯', '诺和诺德', 1, '乙');
INSERT INTO `medicine_info` VALUES (734, '盐酸二甲双胍片', '内分泌及糖尿病用药', 8.50, 350, '0.5g*60片', '中美上海施贵宝', 1, '甲');
INSERT INTO `medicine_info` VALUES (735, '盐酸二甲双胍缓释片', '内分泌及糖尿病用药', 15.80, 260, '0.5g*30片', '扬子江药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (736, '盐酸二甲双胍肠溶胶囊', '内分泌及糖尿病用药', 18.50, 250, '0.25g*36粒', '贵州天安', 1, '乙');
INSERT INTO `medicine_info` VALUES (737, '盐酸二甲双胍片', '内分泌及糖尿病用药', 6.50, 380, '0.25g*48片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (738, '格列本脲片', '内分泌及糖尿病用药', 5.50, 400, '2.5mg*100片', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (739, '格列齐特片', '内分泌及糖尿病用药', 12.50, 300, '80mg*60片', '施维雅', 1, '甲');
INSERT INTO `medicine_info` VALUES (740, '格列齐特缓释片', '内分泌及糖尿病用药', 22.80, 220, '30mg*30片', '施维雅', 1, '乙');
INSERT INTO `medicine_info` VALUES (741, '格列吡嗪片', '内分泌及糖尿病用药', 15.80, 260, '5mg*30片', '辉瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (742, '格列吡嗪缓释片', '内分泌及糖尿病用药', 19.80, 240, '5mg*12片', '扬子江药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (743, '格列喹酮片', '内分泌及糖尿病用药', 28.50, 200, '30mg*60片', '北京万辉', 1, '乙');
INSERT INTO `medicine_info` VALUES (744, '格列美脲片', '内分泌及糖尿病用药', 26.80, 210, '2mg*12片', '赛诺菲', 1, '乙');
INSERT INTO `medicine_info` VALUES (745, '阿卡波糖片', '内分泌及糖尿病用药', 28.50, 200, '50mg*30片', '拜耳', 1, '乙');
INSERT INTO `medicine_info` VALUES (746, '阿卡波糖胶囊', '内分泌及糖尿病用药', 22.80, 220, '50mg*30粒', '四川宝光', 1, '乙');
INSERT INTO `medicine_info` VALUES (747, '伏格列波糖片', '内分泌及糖尿病用药', 32.50, 180, '0.2mg*30片', '武田制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (748, '米格列醇片', '内分泌及糖尿病用药', 28.50, 200, '50mg*24片', '山东新时代', 1, '乙');
INSERT INTO `medicine_info` VALUES (749, '瑞格列奈片', '内分泌及糖尿病用药', 38.00, 160, '1mg*30片', '诺和诺德', 1, '乙');
INSERT INTO `medicine_info` VALUES (750, '那格列奈片', '内分泌及糖尿病用药', 28.50, 200, '120mg*36片', '诺华', 1, '乙');
INSERT INTO `medicine_info` VALUES (751, '西格列汀片', '内分泌及糖尿病用药', 45.00, 140, '100mg*7片', '默沙东', 1, '乙');
INSERT INTO `medicine_info` VALUES (752, '沙格列汀片', '内分泌及糖尿病用药', 42.00, 150, '5mg*7片', '阿斯利康', 1, '乙');
INSERT INTO `medicine_info` VALUES (753, '利格列汀片', '内分泌及糖尿病用药', 45.00, 140, '5mg*7片', '勃林格殷格翰', 1, '乙');
INSERT INTO `medicine_info` VALUES (754, '阿格列汀片', '内分泌及糖尿病用药', 38.00, 160, '25mg*7片', '武田制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (755, '维格列汀片', '内分泌及糖尿病用药', 38.00, 160, '50mg*14片', '诺华', 1, '乙');
INSERT INTO `medicine_info` VALUES (756, '达格列净片', '内分泌及糖尿病用药', 58.00, 120, '10mg*14片', '阿斯利康', 1, '谈判');
INSERT INTO `medicine_info` VALUES (757, '恩格列净片', '内分泌及糖尿病用药', 65.00, 100, '10mg*10片', '勃林格殷格翰', 1, '谈判');
INSERT INTO `medicine_info` VALUES (758, '卡格列净片', '内分泌及糖尿病用药', 58.00, 120, '100mg*10片', '强生', 1, '谈判');
INSERT INTO `medicine_info` VALUES (759, '艾托格列净片', '内分泌及糖尿病用药', 68.00, 100, '5mg*14片', '默沙东', 1, '谈判');
INSERT INTO `medicine_info` VALUES (760, '利拉鲁肽注射液', '内分泌及糖尿病用药', 198.00, 70, '300U/笔芯', '诺和诺德', 1, '谈判');
INSERT INTO `medicine_info` VALUES (761, '司美格鲁肽注射液', '内分泌及糖尿病用药', 228.00, 60, '1.5ml/笔', '诺和诺德', 1, '谈判');
INSERT INTO `medicine_info` VALUES (762, '度拉糖肽注射液', '内分泌及糖尿病用药', 228.00, 60, '1.5ml/笔', '礼来', 1, '谈判');
INSERT INTO `medicine_info` VALUES (763, '艾塞那肽注射液', '内分泌及糖尿病用药', 158.00, 70, '1.2ml/笔', '阿斯利康', 1, '谈判');
INSERT INTO `medicine_info` VALUES (764, '利司那肽注射液', '内分泌及糖尿病用药', 128.00, 80, '3ml/笔', '赛诺菲', 1, '谈判');
INSERT INTO `medicine_info` VALUES (765, '聚乙二醇洛塞那肽注射液', '内分泌及糖尿病用药', 98.00, 90, '0.5ml/支', '豪森药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (766, '贝那鲁肽注射液', '内分泌及糖尿病用药', 85.00, 100, '4.5ml/笔', '仁会生物', 1, '乙');
INSERT INTO `medicine_info` VALUES (767, '甲钴胺片', '内分泌及糖尿病用药', 15.80, 260, '0.5mg*20片', '卫材药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (768, '甲钴胺注射液', '内分泌及糖尿病用药', 22.80, 220, '0.5mg/支', '卫材药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (769, '依帕司他片', '内分泌及糖尿病用药', 38.00, 160, '50mg*10片', '扬子江药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (770, '硫辛酸注射液', '内分泌及糖尿病用药', 28.50, 200, '0.3g/支', '亚宝药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (771, '硫辛酸胶囊', '内分泌及糖尿病用药', 32.50, 180, '0.2g*12粒', '山东新时代', 1, '乙');
INSERT INTO `medicine_info` VALUES (772, '羟苯磺酸钙胶囊', '内分泌及糖尿病用药', 28.50, 200, '0.5g*20粒', '西安利君', 1, '乙');
INSERT INTO `medicine_info` VALUES (773, '胰激肽原酶肠溶片', '内分泌及糖尿病用药', 18.50, 250, '120U*60片', '常州千红', 1, '乙');
INSERT INTO `medicine_info` VALUES (774, '左甲状腺素钠片', '内分泌及糖尿病用药', 28.50, 200, '50μg*100片', '默克', 1, '乙');
INSERT INTO `medicine_info` VALUES (775, '左甲状腺素钠片', '内分泌及糖尿病用药', 38.00, 160, '100μg*50片', '默克', 1, '乙');
INSERT INTO `medicine_info` VALUES (776, '甲状腺片', '内分泌及糖尿病用药', 8.50, 350, '40mg*100片', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (777, '丙硫氧嘧啶片', '内分泌及糖尿病用药', 15.80, 260, '50mg*100片', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (778, '甲巯咪唑片', '内分泌及糖尿病用药', 12.50, 300, '5mg*50片', '默克', 1, '甲');
INSERT INTO `medicine_info` VALUES (779, '碘塞罗宁钠片', '内分泌及糖尿病用药', 45.00, 140, '20μg*10片', '江苏正大', 1, '乙');
INSERT INTO `medicine_info` VALUES (780, '碘化钾片', '内分泌及糖尿病用药', 6.50, 380, '10mg*100片', '北京益民', 1, '甲');
INSERT INTO `medicine_info` VALUES (781, '复方碘口服溶液', '内分泌及糖尿病用药', 18.50, 250, '100ml/瓶', '北京益民', 1, '乙');
INSERT INTO `medicine_info` VALUES (782, '别嘌醇片', '内分泌及糖尿病用药', 8.50, 350, '0.1g*100片', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (783, '非布司他片', '内分泌及糖尿病用药', 38.00, 160, '40mg*12片', '江苏恒瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (784, '苯溴马隆片', '内分泌及糖尿病用药', 28.50, 200, '50mg*10片', '德国赫曼', 1, '乙');
INSERT INTO `medicine_info` VALUES (785, '秋水仙碱片', '内分泌及糖尿病用药', 6.50, 380, '0.5mg*20片', '西双版纳制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (786, '碳酸氢钠片', '内分泌及糖尿病用药', 5.50, 400, '0.5g*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (787, '碳酸钙D3片', '内分泌及糖尿病用药', 22.80, 220, '600mg*60片', '惠氏', 1, '乙');
INSERT INTO `medicine_info` VALUES (788, '碳酸钙D3颗粒', '内分泌及糖尿病用药', 28.50, 200, '1.5g*12袋', '北京康远', 1, '乙');
INSERT INTO `medicine_info` VALUES (789, '维D钙咀嚼片', '内分泌及糖尿病用药', 19.80, 240, '100片/瓶', '安士制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (790, '阿仑膦酸钠片', '内分泌及糖尿病用药', 38.00, 160, '70mg*1片', '默沙东', 1, '乙');
INSERT INTO `medicine_info` VALUES (791, '阿仑膦酸钠维D3片', '内分泌及糖尿病用药', 45.00, 140, '70mg*1片', '默沙东', 1, '乙');
INSERT INTO `medicine_info` VALUES (792, '利塞膦酸钠片', '内分泌及糖尿病用药', 32.50, 180, '5mg*12片', '杭州默沙东', 1, '乙');
INSERT INTO `medicine_info` VALUES (793, '唑来膦酸注射液', '内分泌及糖尿病用药', 128.00, 80, '5mg/支', '诺华', 1, '谈判');
INSERT INTO `medicine_info` VALUES (794, '伊班膦酸钠注射液', '内分泌及糖尿病用药', 45.00, 140, '2mg/支', '河北医科大学', 1, '乙');
INSERT INTO `medicine_info` VALUES (795, '鲑降钙素注射液', '内分泌及糖尿病用药', 38.00, 160, '50IU/支', '北京双鹭', 1, '乙');
INSERT INTO `medicine_info` VALUES (796, '鲑降钙素鼻喷雾剂', '内分泌及糖尿病用药', 58.00, 120, '2ml/瓶', '默沙东', 1, '乙');
INSERT INTO `medicine_info` VALUES (797, '雷洛昔芬片', '内分泌及糖尿病用药', 45.00, 140, '60mg*7片', '礼来', 1, '乙');
INSERT INTO `medicine_info` VALUES (798, '特立帕肽注射液', '内分泌及糖尿病用药', 228.00, 60, '3.4ml/笔', '礼来', 1, '谈判');
INSERT INTO `medicine_info` VALUES (799, '骨化三醇胶丸', '内分泌及糖尿病用药', 38.00, 160, '0.25μg*10丸', '罗氏', 1, '乙');
INSERT INTO `medicine_info` VALUES (800, '阿法骨化醇软胶囊', '内分泌及糖尿病用药', 28.50, 200, '0.5μg*20粒', '昆明贝克诺顿', 1, '乙');
INSERT INTO `medicine_info` VALUES (801, '戊酸雌二醇片', '内分泌及糖尿病用药', 28.50, 200, '1mg*21片', '拜耳', 1, '乙');
INSERT INTO `medicine_info` VALUES (802, '结合雌激素片', '内分泌及糖尿病用药', 45.00, 140, '0.625mg*28片', '辉瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (803, '雌二醇凝胶', '内分泌及糖尿病用药', 58.00, 120, '40g/支', '法国 Laboratoire', 1, '乙');
INSERT INTO `medicine_info` VALUES (804, '黄体酮胶囊', '内分泌及糖尿病用药', 28.50, 200, '50mg*20粒', '浙江仙琚', 1, '乙');
INSERT INTO `medicine_info` VALUES (805, '黄体酮注射液', '内分泌及糖尿病用药', 8.50, 350, '20mg/支', '浙江仙琚', 1, '甲');
INSERT INTO `medicine_info` VALUES (806, '地屈孕酮片', '内分泌及糖尿病用药', 45.00, 140, '10mg*20片', '雅培', 1, '乙');
INSERT INTO `medicine_info` VALUES (807, '屈螺酮炔雌醇片', '内分泌及糖尿病用药', 38.00, 160, '21片/盒', '拜耳', 1, '乙');
INSERT INTO `medicine_info` VALUES (808, '炔雌醇环丙孕酮片', '内分泌及糖尿病用药', 38.00, 160, '21片/盒', '拜耳', 1, '乙');
INSERT INTO `medicine_info` VALUES (809, '睾酮胶丸', '内分泌及糖尿病用药', 28.50, 200, '40mg*20丸', '浙江仙琚', 1, '乙');
INSERT INTO `medicine_info` VALUES (810, '十一酸睾酮软胶囊', '内分泌及糖尿病用药', 38.00, 160, '40mg*16粒', '欧加农', 1, '乙');
INSERT INTO `medicine_info` VALUES (811, '十一酸睾酮注射液', '内分泌及糖尿病用药', 28.50, 200, '250mg/支', '浙江仙琚', 1, '乙');
INSERT INTO `medicine_info` VALUES (812, '绒促性素注射液', '内分泌及糖尿病用药', 18.50, 250, '5000U/支', '上海上药', 1, '乙');
INSERT INTO `medicine_info` VALUES (813, '尿促性素注射液', '内分泌及糖尿病用药', 32.50, 180, '75U/支', '上海上药', 1, '乙');
INSERT INTO `medicine_info` VALUES (814, '曲普瑞林注射液', '内分泌及糖尿病用药', 128.00, 80, '3.75mg/支', '益普生', 1, '谈判');
INSERT INTO `medicine_info` VALUES (815, '亮丙瑞林微球注射液', '内分泌及糖尿病用药', 158.00, 70, '3.75mg/支', '武田制药', 1, '谈判');
INSERT INTO `medicine_info` VALUES (816, '醋酸去氨加压素片', '内分泌及糖尿病用药', 65.00, 100, '0.1mg*30片', '辉凌制药', 1, '谈判');
INSERT INTO `medicine_info` VALUES (817, '醋酸去氨加压素注射液', '内分泌及糖尿病用药', 45.00, 140, '4μg/支', '辉凌制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (818, '生长激素注射液', '内分泌及糖尿病用药', 128.00, 80, '4IU/支', '金赛药业', 1, '谈判');
INSERT INTO `medicine_info` VALUES (819, '重组人生长激素注射液', '内分泌及糖尿病用药', 158.00, 70, '10IU/支', '诺和诺德', 1, '谈判');
INSERT INTO `medicine_info` VALUES (820, '氢化可的松片', '内分泌及糖尿病用药', 12.50, 300, '20mg*100片', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (821, '醋酸泼尼松片', '内分泌及糖尿病用药', 6.50, 380, '5mg*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (822, '甲泼尼龙片', '内分泌及糖尿病用药', 45.00, 140, '4mg*30片', '辉瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (823, '地塞米松片', '内分泌及糖尿病用药', 8.50, 350, '0.75mg*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (824, '地塞米松注射液', '内分泌及糖尿病用药', 5.50, 400, '5mg/支', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (825, '醛固酮片', '内分泌及糖尿病用药', 45.00, 140, '0.5mg*10片', 'Sigma', 1, '乙');
INSERT INTO `medicine_info` VALUES (826, '布洛芬片', '神经系统及精神用药', 6.50, 380, '0.1g*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (827, '布洛芬缓释胶囊', '神经系统及精神用药', 15.80, 260, '0.3g*20粒', '中美史克', 1, '乙');
INSERT INTO `medicine_info` VALUES (828, '布洛芬混悬液', '神经系统及精神用药', 19.80, 240, '100ml', '中美史克', 1, '乙');
INSERT INTO `medicine_info` VALUES (829, '对乙酰氨基酚片', '神经系统及精神用药', 5.50, 400, '0.5g*100片', '山东鲁西', 1, '甲');
INSERT INTO `medicine_info` VALUES (830, '对乙酰氨基酚缓释片', '神经系统及精神用药', 12.50, 300, '0.65g*18片', '强生', 1, '乙');
INSERT INTO `medicine_info` VALUES (831, '对乙酰氨基酚栓', '神经系统及精神用药', 8.50, 350, '0.15g*10枚', '白云山', 1, '甲');
INSERT INTO `medicine_info` VALUES (832, '阿司匹林肠溶片', '神经系统及精神用药', 8.50, 350, '100mg*30片', '拜耳', 1, '甲');
INSERT INTO `medicine_info` VALUES (833, '双氯芬酸钠肠溶片', '神经系统及精神用药', 8.50, 350, '25mg*40片', '北京诺华', 1, '甲');
INSERT INTO `medicine_info` VALUES (834, '双氯芬酸钠缓释胶囊', '神经系统及精神用药', 18.50, 250, '0.1g*12粒', '药大制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (835, '双氯芬酸二乙胺乳胶剂', '神经系统及精神用药', 22.80, 220, '20g/支', '诺华', 1, '乙');
INSERT INTO `medicine_info` VALUES (836, '吲哚美辛片', '神经系统及精神用药', 6.50, 380, '25mg*100片', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (837, '吲哚美辛栓', '神经系统及精神用药', 12.50, 300, '0.1g*10枚', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (838, '萘普生片', '神经系统及精神用药', 8.50, 350, '0.1g*100片', '山东新华', 1, '甲');
INSERT INTO `medicine_info` VALUES (839, '萘普生缓释胶囊', '神经系统及精神用药', 19.80, 240, '0.25g*12粒', '山东新华', 1, '乙');
INSERT INTO `medicine_info` VALUES (840, '美洛昔康片', '神经系统及精神用药', 22.80, 220, '7.5mg*10片', '勃林格殷格翰', 1, '乙');
INSERT INTO `medicine_info` VALUES (841, '塞来昔布胶囊', '神经系统及精神用药', 38.00, 160, '0.2g*6粒', '辉瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (842, '依托考昔片', '神经系统及精神用药', 45.00, 140, '60mg*5片', '默沙东', 1, '乙');
INSERT INTO `medicine_info` VALUES (843, '尼美舒利片', '神经系统及精神用药', 15.80, 260, '0.1g*10片', '上海医药', 1, '乙');
INSERT INTO `medicine_info` VALUES (844, '氟比洛芬凝胶贴膏', '神经系统及精神用药', 58.00, 120, '13.6cm*10cm*6贴', '日本三笠', 1, '乙');
INSERT INTO `medicine_info` VALUES (845, '佐米曲普坦片', '神经系统及精神用药', 38.00, 160, '2.5mg*2片', '重庆华森', 1, '乙');
INSERT INTO `medicine_info` VALUES (846, '舒马普坦片', '神经系统及精神用药', 32.50, 180, '50mg*2片', '先声药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (847, '利扎曲普坦片', '神经系统及精神用药', 42.00, 150, '5mg*3片', '默沙东', 1, '乙');
INSERT INTO `medicine_info` VALUES (848, '苯甲酸利扎曲普坦片', '神经系统及精神用药', 45.00, 140, '5mg*6片', '欧立停', 1, '乙');
INSERT INTO `medicine_info` VALUES (849, '加巴喷丁胶囊', '神经系统及精神用药', 28.50, 200, '0.3g*24粒', '辉瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (850, '普瑞巴林胶囊', '神经系统及精神用药', 45.00, 140, '75mg*8粒', '辉瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (851, '卡马西平片', '神经系统及精神用药', 12.50, 300, '0.1g*100片', '北京诺华', 1, '甲');
INSERT INTO `medicine_info` VALUES (852, '奥卡西平片', '神经系统及精神用药', 38.00, 160, '0.3g*30片', '北京诺华', 1, '乙');
INSERT INTO `medicine_info` VALUES (853, '甲钴胺片', '神经系统及精神用药', 15.80, 260, '0.5mg*20片', '卫材药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (854, '维生素B1片', '神经系统及精神用药', 5.50, 400, '10mg*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (855, '维生素B12注射液', '神经系统及精神用药', 6.50, 380, '0.5mg/支', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (856, '牛痘疫苗接种家兔炎症皮肤提取物片', '神经系统及精神用药', 45.00, 140, '4.0单位*30片', '日本脏器', 1, '乙');
INSERT INTO `medicine_info` VALUES (857, '丙戊酸钠片', '神经系统及精神用药', 12.50, 300, '0.2g*100片', '湖南湘中', 1, '甲');
INSERT INTO `medicine_info` VALUES (858, '丙戊酸钠缓释片', '神经系统及精神用药', 28.50, 200, '0.5g*30片', '赛诺菲', 1, '乙');
INSERT INTO `medicine_info` VALUES (859, '丙戊酸镁缓释片', '神经系统及精神用药', 26.80, 210, '0.25g*30片', '湖南省湘中制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (860, '卡马西平片', '神经系统及精神用药', 12.50, 300, '0.1g*100片', '北京诺华', 1, '甲');
INSERT INTO `medicine_info` VALUES (861, '奥卡西平片', '神经系统及精神用药', 38.00, 160, '0.3g*30片', '北京诺华', 1, '乙');
INSERT INTO `medicine_info` VALUES (862, '苯妥英钠片', '神经系统及精神用药', 8.50, 350, '0.1g*100片', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (863, '苯巴比妥片', '神经系统及精神用药', 6.50, 380, '30mg*100片', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (864, '拉莫三嗪片', '神经系统及精神用药', 38.00, 160, '50mg*30片', '葛兰素史克', 1, '乙');
INSERT INTO `medicine_info` VALUES (865, '左乙拉西坦片', '神经系统及精神用药', 65.00, 100, '0.25g*30片', '优时比', 1, '谈判');
INSERT INTO `medicine_info` VALUES (866, '左乙拉西坦口服溶液', '神经系统及精神用药', 58.00, 120, '150ml', '优时比', 1, '乙');
INSERT INTO `medicine_info` VALUES (867, '托吡酯片', '神经系统及精神用药', 38.00, 160, '25mg*60片', '西安杨森', 1, '乙');
INSERT INTO `medicine_info` VALUES (868, '乙琥胺糖浆', '神经系统及精神用药', 28.50, 200, '100ml', '上海上药', 1, '乙');
INSERT INTO `medicine_info` VALUES (869, '氯硝西泮片', '神经系统及精神用药', 15.80, 260, '2mg*100片', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (870, '唑尼沙胺片', '神经系统及精神用药', 45.00, 140, '100mg*30片', '日本大日本住友', 1, '乙');
INSERT INTO `medicine_info` VALUES (871, '吡仑帕奈片', '神经系统及精神用药', 98.00, 90, '2mg*28片', '卫材药业', 1, '谈判');
INSERT INTO `medicine_info` VALUES (872, '多巴丝肼片', '神经系统及精神用药', 58.00, 120, '0.25g*40片', '上海罗氏', 1, '乙');
INSERT INTO `medicine_info` VALUES (873, '卡左双多巴缓释片', '神经系统及精神用药', 65.00, 100, '250mg*30片', '默沙东', 1, '乙');
INSERT INTO `medicine_info` VALUES (874, '盐酸普拉克索片', '神经系统及精神用药', 68.00, 100, '0.25mg*30片', '勃林格殷格翰', 1, '谈判');
INSERT INTO `medicine_info` VALUES (875, '盐酸罗匹尼罗片', '神经系统及精神用药', 45.00, 140, '2mg*30片', '重庆植恩', 1, '乙');
INSERT INTO `medicine_info` VALUES (876, '恩他卡朋片', '神经系统及精神用药', 45.00, 140, '0.2g*30片', '诺华', 1, '乙');
INSERT INTO `medicine_info` VALUES (877, '托卡朋片', '神经系统及精神用药', 38.00, 160, '100mg*30片', '罗氏', 1, '乙');
INSERT INTO `medicine_info` VALUES (878, '司来吉兰片', '神经系统及精神用药', 38.00, 160, '5mg*10片', '山东新时代', 1, '乙');
INSERT INTO `medicine_info` VALUES (879, '雷沙吉兰片', '神经系统及精神用药', 65.00, 100, '1mg*14片', '梯瓦', 1, '谈判');
INSERT INTO `medicine_info` VALUES (880, '金刚烷胺片', '神经系统及精神用药', 8.50, 350, '0.1g*100片', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (881, '苯海索片', '神经系统及精神用药', 6.50, 380, '2mg*100片', '天津药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (882, '溴隐亭片', '神经系统及精神用药', 45.00, 140, '2.5mg*30片', '诺华', 1, '乙');
INSERT INTO `medicine_info` VALUES (883, '尼莫地平片', '神经系统及精神用药', 15.80, 260, '30mg*20片', '拜耳', 1, '甲');
INSERT INTO `medicine_info` VALUES (884, '氟桂利嗪胶囊', '神经系统及精神用药', 15.80, 260, '5mg*20粒', '西安杨森', 1, '甲');
INSERT INTO `medicine_info` VALUES (885, '倍他司汀片', '神经系统及精神用药', 12.50, 300, '6mg*100片', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (886, '长春西汀片', '神经系统及精神用药', 22.80, 220, '5mg*30片', '天津药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (887, '丁苯酞软胶囊', '神经系统及精神用药', 128.00, 80, '0.1g*24粒', '石药集团', 1, '谈判');
INSERT INTO `medicine_info` VALUES (888, '依达拉奉注射液', '神经系统及精神用药', 28.50, 200, '30mg/支', '先声药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (889, '桂哌齐特注射液', '神经系统及精神用药', 38.00, 160, '320mg/支', '北京四环', 1, '乙');
INSERT INTO `medicine_info` VALUES (890, '法舒地尔注射液', '神经系统及精神用药', 45.00, 140, '30mg/支', '日本旭化成', 1, '乙');
INSERT INTO `medicine_info` VALUES (891, '银杏叶片', '神经系统及精神用药', 22.80, 220, '9.6mg*24片', '扬子江药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (892, '胞磷胆碱钠片', '神经系统及精神用药', 22.80, 220, '0.1g*12片', '齐鲁制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (893, '奥拉西坦胶囊', '神经系统及精神用药', 45.00, 140, '0.4g*24粒', '石药集团', 1, '乙');
INSERT INTO `medicine_info` VALUES (894, '吡拉西坦片', '神经系统及精神用药', 8.50, 350, '0.4g*100片', '东北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (895, '茴拉西坦胶囊', '神经系统及精神用药', 28.50, 200, '0.1g*36粒', '海南健祥', 1, '乙');
INSERT INTO `medicine_info` VALUES (896, '利伐斯的明胶囊', '神经系统及精神用药', 65.00, 100, '1.5mg*28粒', '诺华', 1, '谈判');
INSERT INTO `medicine_info` VALUES (897, '盐酸多奈哌齐片', '神经系统及精神用药', 45.00, 140, '5mg*7片', '卫材药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (898, '美金刚片', '神经系统及精神用药', 68.00, 100, '10mg*28片', ' Forest', 1, '谈判');
INSERT INTO `medicine_info` VALUES (899, '甘露特钠胶囊', '神经系统及精神用药', 98.00, 90, '150mg*42粒', '绿谷制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (900, '艾司唑仑片', '神经系统及精神用药', 6.50, 380, '1mg*100片', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (901, '阿普唑仑片', '神经系统及精神用药', 8.50, 350, '0.4mg*100片', '山东鲁西', 1, '甲');
INSERT INTO `medicine_info` VALUES (902, '地西泮片', '神经系统及精神用药', 5.50, 400, '2.5mg*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (903, '地西泮注射液', '神经系统及精神用药', 6.50, 380, '10mg/支', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (904, '氯硝西泮片', '神经系统及精神用药', 15.80, 260, '2mg*100片', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (905, '硝西泮片', '神经系统及精神用药', 8.50, 350, '5mg*100片', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (906, '佐匹克隆片', '神经系统及精神用药', 22.80, 220, '3.75mg*12片', '齐鲁制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (907, '右佐匹克隆片', '神经系统及精神用药', 38.00, 160, '3mg*7片', '江苏天士力', 1, '乙');
INSERT INTO `medicine_info` VALUES (908, '唑吡坦片', '神经系统及精神用药', 32.50, 180, '10mg*7片', '赛诺菲', 1, '乙');
INSERT INTO `medicine_info` VALUES (909, '扎来普隆片', '神经系统及精神用药', 28.50, 200, '5mg*14片', '云南玉溪', 1, '乙');
INSERT INTO `medicine_info` VALUES (910, '氟西汀片', '神经系统及精神用药', 28.50, 200, '20mg*14片', '礼来', 1, '乙');
INSERT INTO `medicine_info` VALUES (911, '帕罗西汀片', '神经系统及精神用药', 38.00, 160, '20mg*10片', '葛兰素史克', 1, '乙');
INSERT INTO `medicine_info` VALUES (912, '舍曲林片', '神经系统及精神用药', 32.50, 180, '50mg*14片', '辉瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (913, '氟伏沙明片', '神经系统及精神用药', 28.50, 200, '50mg*30片', '丽珠药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (914, '西酞普兰片', '神经系统及精神用药', 28.50, 200, '20mg*14片', '西安杨森', 1, '乙');
INSERT INTO `medicine_info` VALUES (915, '艾司西酞普兰片', '神经系统及精神用药', 45.00, 140, '10mg*7片', '灵北', 1, '乙');
INSERT INTO `medicine_info` VALUES (916, '文拉法辛缓释胶囊', '神经系统及精神用药', 45.00, 140, '75mg*14粒', '辉瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (917, '度洛西汀肠溶胶囊', '神经系统及精神用药', 45.00, 140, '20mg*20粒', '礼来', 1, '乙');
INSERT INTO `medicine_info` VALUES (918, '米氮平片', '神经系统及精神用药', 38.00, 160, '30mg*10片', '欧加农', 1, '乙');
INSERT INTO `medicine_info` VALUES (919, '曲唑酮片', '神经系统及精神用药', 28.50, 200, '50mg*20片', '华源制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (920, '安非他酮片', '神经系统及精神用药', 28.50, 200, '75mg*20片', '万特制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (921, '瑞波西汀片', '神经系统及精神用药', 32.50, 180, '4mg*14片', '海南辉能', 1, '乙');
INSERT INTO `medicine_info` VALUES (922, '阿戈美拉汀片', '神经系统及精神用药', 65.00, 100, '25mg*14片', '施维雅', 1, '谈判');
INSERT INTO `medicine_info` VALUES (923, '伏硫西汀片', '神经系统及精神用药', 68.00, 100, '10mg*7片', '灵北', 1, '谈判');
INSERT INTO `medicine_info` VALUES (924, '圣约翰草提取物片', '神经系统及精神用药', 38.00, 160, '300mg*15片', '德国威玛舒培', 1, '乙');
INSERT INTO `medicine_info` VALUES (925, '丁螺环酮片', '神经系统及精神用药', 22.80, 220, '5mg*60片', '北大医药', 1, '乙');
INSERT INTO `medicine_info` VALUES (926, '坦度螺酮片', '神经系统及精神用药', 28.50, 200, '10mg*30片', '住友制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (927, '谷维素片', '神经系统及精神用药', 5.50, 400, '10mg*100片', '山东鲁西', 1, '甲');
INSERT INTO `medicine_info` VALUES (928, '多塞平片', '神经系统及精神用药', 8.50, 350, '25mg*100片', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (929, '美利曲辛片', '神经系统及精神用药', 28.50, 200, '20片/盒', '丹麦灵北', 1, '乙');
INSERT INTO `medicine_info` VALUES (930, '氯丙嗪片', '神经系统及精神用药', 8.50, 350, '25mg*100片', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (931, '奋乃静片', '神经系统及精神用药', 8.50, 350, '2mg*100片', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (932, '氟哌啶醇片', '神经系统及精神用药', 12.50, 300, '2mg*100片', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (933, '舒必利片', '神经系统及精神用药', 15.80, 260, '0.1g*100片', '天津药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (934, '利培酮片', '神经系统及精神用药', 28.50, 200, '1mg*20片', '西安杨森', 1, '乙');
INSERT INTO `medicine_info` VALUES (935, '利培酮口服液', '神经系统及精神用药', 38.00, 160, '30ml', '西安杨森', 1, '乙');
INSERT INTO `medicine_info` VALUES (936, '奥氮平片', '神经系统及精神用药', 65.00, 100, '5mg*14片', '礼来', 1, '谈判');
INSERT INTO `medicine_info` VALUES (937, '喹硫平片', '神经系统及精神用药', 45.00, 140, '25mg*20片', '阿斯利康', 1, '乙');
INSERT INTO `medicine_info` VALUES (938, '齐拉西酮胶囊', '神经系统及精神用药', 38.00, 160, '20mg*20粒', '辉瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (939, '阿立哌唑片', '神经系统及精神用药', 45.00, 140, '5mg*20片', '大冢制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (940, '帕利哌酮缓释片', '神经系统及精神用药', 98.00, 90, '3mg*7片', '强生', 1, '谈判');
INSERT INTO `medicine_info` VALUES (941, '氨磺必利片', '神经系统及精神用药', 45.00, 140, '0.2g*20片', '赛诺菲', 1, '乙');
INSERT INTO `medicine_info` VALUES (942, '布南色林片', '神经系统及精神用药', 58.00, 120, '4mg*10片', '住友制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (943, '鲁拉西酮片', '神经系统及精神用药', 65.00, 100, '40mg*10片', '住友制药', 1, '谈判');
INSERT INTO `medicine_info` VALUES (944, '胞磷胆碱钠片', '神经系统及精神用药', 22.80, 220, '0.1g*12片', '齐鲁制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (945, '吡拉西坦片', '神经系统及精神用药', 8.50, 350, '0.4g*100片', '东北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (946, '醋谷胺注射液', '神经系统及精神用药', 18.50, 250, '0.25g/支', '上海上药', 1, '乙');
INSERT INTO `medicine_info` VALUES (947, '甲氯芬酯胶囊', '神经系统及精神用药', 22.80, 220, '0.1g*36粒', '上海上药', 1, '乙');
INSERT INTO `medicine_info` VALUES (948, '尼可刹米注射液', '神经系统及精神用药', 6.50, 380, '0.375g/支', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (949, '洛贝林注射液', '神经系统及精神用药', 8.50, 350, '3mg/支', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (950, '二甲弗林注射液', '神经系统及精神用药', 12.50, 300, '8mg/支', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (951, '哌甲酯片', '神经系统及精神用药', 28.50, 200, '10mg*20片', '西安杨森', 1, '乙');
INSERT INTO `medicine_info` VALUES (952, '托莫西汀胶囊', '神经系统及精神用药', 65.00, 100, '10mg*10粒', '礼来', 1, '谈判');
INSERT INTO `medicine_info` VALUES (953, '硫必利片', '神经系统及精神用药', 22.80, 220, '0.1g*50片', '江苏天士力', 1, '乙');
INSERT INTO `medicine_info` VALUES (954, '注射用青霉素钠', '抗感染用药', 8.50, 350, '80万U/支', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (955, '注射用青霉素钾', '抗感染用药', 8.50, 350, '80万U/支', '鲁抗医药', 1, '甲');
INSERT INTO `medicine_info` VALUES (956, '阿莫西林胶囊', '抗感染用药', 12.50, 300, '0.25g*24粒', '联邦制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (957, '阿莫西林颗粒', '抗感染用药', 15.80, 260, '0.125g*12袋', '葵花药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (958, '阿莫西林克拉维酸钾片', '抗感染用药', 28.50, 200, '0.375g*6片', '辉瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (959, '注射用阿莫西林钠克拉维酸钾', '抗感染用药', 32.50, 180, '1.2g/支', '华北制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (960, '氨苄西林胶囊', '抗感染用药', 15.80, 260, '0.25g*24粒', '白云山', 1, '甲');
INSERT INTO `medicine_info` VALUES (961, '注射用氨苄西林钠', '抗感染用药', 18.50, 250, '1g/支', '鲁抗医药', 1, '甲');
INSERT INTO `medicine_info` VALUES (962, '哌拉西林钠他唑巴坦钠', '抗感染用药', 45.00, 140, '4.5g/支', '联邦制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (963, '美洛西林钠舒巴坦钠', '抗感染用药', 38.00, 160, '1.25g/支', '华北制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (964, '羧苄西林钠', '抗感染用药', 22.80, 220, '1g/支', '上海上药', 1, '乙');
INSERT INTO `medicine_info` VALUES (965, '苯唑西林钠', '抗感染用药', 18.50, 250, '0.5g/支', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (966, '氯唑西林钠', '抗感染用药', 19.80, 240, '0.5g/支', '鲁抗医药', 1, '甲');
INSERT INTO `medicine_info` VALUES (967, '头孢氨苄胶囊', '抗感染用药', 12.50, 300, '0.125g*24粒', '白云山', 1, '甲');
INSERT INTO `medicine_info` VALUES (968, '头孢唑林钠', '抗感染用药', 18.50, 250, '0.5g/支', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (969, '头孢拉定胶囊', '抗感染用药', 15.80, 260, '0.25g*24粒', '联邦制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (970, '头孢羟氨苄胶囊', '抗感染用药', 19.80, 240, '0.25g*12粒', '石药集团', 1, '乙');
INSERT INTO `medicine_info` VALUES (971, '头孢呋辛酯片', '抗感染用药', 22.80, 220, '0.125g*12片', '葛兰素史克', 1, '乙');
INSERT INTO `medicine_info` VALUES (972, '注射用头孢呋辛钠', '抗感染用药', 28.50, 200, '0.75g/支', '罗氏', 1, '乙');
INSERT INTO `medicine_info` VALUES (973, '头孢克洛胶囊', '抗感染用药', 26.80, 210, '0.25g*12粒', '礼来', 1, '乙');
INSERT INTO `medicine_info` VALUES (974, '头孢克洛干混悬剂', '抗感染用药', 28.50, 200, '0.125g*6袋', '礼来', 1, '乙');
INSERT INTO `medicine_info` VALUES (975, '头孢丙烯片', '抗感染用药', 32.50, 180, '0.25g*6片', '施贵宝', 1, '乙');
INSERT INTO `medicine_info` VALUES (976, '头孢替安', '抗感染用药', 38.00, 160, '0.5g/支', '武田制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (977, '头孢克肟胶囊', '抗感染用药', 28.50, 200, '0.1g*6粒', '白云山', 1, '乙');
INSERT INTO `medicine_info` VALUES (978, '头孢克肟颗粒', '抗感染用药', 26.80, 210, '50mg*6袋', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (979, '注射用头孢曲松钠', '抗感染用药', 22.80, 220, '1g/支', '罗氏', 1, '甲');
INSERT INTO `medicine_info` VALUES (980, '注射用头孢噻肟钠', '抗感染用药', 25.80, 210, '1g/支', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (981, '注射用头孢他啶', '抗感染用药', 28.50, 200, '1g/支', '葛兰素史克', 1, '乙');
INSERT INTO `medicine_info` VALUES (982, '注射用头孢哌酮钠舒巴坦钠', '抗感染用药', 38.00, 160, '1.5g/支', '辉瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (983, '头孢地尼胶囊', '抗感染用药', 32.50, 180, '0.1g*6粒', '天津田边', 1, '乙');
INSERT INTO `medicine_info` VALUES (984, '头孢泊肟酯片', '抗感染用药', 38.00, 160, '0.1g*6片', '第一三共', 1, '乙');
INSERT INTO `medicine_info` VALUES (985, '注射用头孢吡肟', '抗感染用药', 45.00, 140, '1g/支', '施贵宝', 1, '乙');
INSERT INTO `medicine_info` VALUES (986, '注射用头孢匹罗', '抗感染用药', 58.00, 120, '1g/支', '德国赫斯特', 1, '乙');
INSERT INTO `medicine_info` VALUES (987, '亚胺培南西司他丁钠', '抗感染用药', 65.00, 100, '0.5g/支', '默沙东', 1, '谈判');
INSERT INTO `medicine_info` VALUES (988, '美罗培南', '抗感染用药', 58.00, 120, '0.5g/支', '住友制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (989, '厄他培南', '抗感染用药', 68.00, 100, '1g/支', '默沙东', 1, '谈判');
INSERT INTO `medicine_info` VALUES (990, '比阿培南', '抗感染用药', 65.00, 100, '0.3g/支', '江苏正大', 1, '乙');
INSERT INTO `medicine_info` VALUES (991, '诺氟沙星胶囊', '抗感染用药', 6.50, 380, '0.1g*24粒', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (992, '环丙沙星片', '抗感染用药', 12.50, 300, '0.25g*12片', '拜耳', 1, '甲');
INSERT INTO `medicine_info` VALUES (993, '盐酸左氧氟沙星片', '抗感染用药', 18.50, 250, '0.1g*12片', '第一三共', 1, '甲');
INSERT INTO `medicine_info` VALUES (994, '左氧氟沙星注射液', '抗感染用药', 22.80, 220, '0.2g/瓶', '扬子江药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (995, '盐酸莫西沙星片', '抗感染用药', 38.00, 160, '0.4g*3片', '拜耳', 1, '乙');
INSERT INTO `medicine_info` VALUES (996, '莫西沙星注射液', '抗感染用药', 45.00, 140, '0.4g/瓶', '拜耳', 1, '乙');
INSERT INTO `medicine_info` VALUES (997, '加替沙星胶囊', '抗感染用药', 28.50, 200, '0.1g*6粒', '山东罗欣', 1, '乙');
INSERT INTO `medicine_info` VALUES (998, '吉米沙星片', '抗感染用药', 32.50, 180, '0.32g*6片', '辉瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (999, '红霉素肠溶片', '抗感染用药', 8.50, 350, '0.125g*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1000, '红霉素软膏', '抗感染用药', 5.50, 400, '10g/支', '白云山', 1, '甲');
INSERT INTO `medicine_info` VALUES (1001, '阿奇霉素片', '抗感染用药', 22.80, 220, '0.25g*6片', '辉瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (1002, '阿奇霉素颗粒', '抗感染用药', 19.80, 240, '0.1g*6袋', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (1003, '注射用阿奇霉素', '抗感染用药', 28.50, 200, '0.25g/支', '辉瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (1004, '罗红霉素胶囊', '抗感染用药', 18.50, 250, '0.15g*12粒', '扬子江药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1005, '克拉霉素片', '抗感染用药', 22.80, 220, '0.25g*6片', '雅培', 1, '乙');
INSERT INTO `medicine_info` VALUES (1006, '地红霉素肠溶片', '抗感染用药', 28.50, 200, '0.25g*6片', '山东新时代', 1, '乙');
INSERT INTO `medicine_info` VALUES (1007, '硫酸庆大霉素注射液', '抗感染用药', 6.50, 380, '8万U/支', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1008, '硫酸庆大霉素片', '抗感染用药', 8.50, 350, '40mg*100片', '鲁抗医药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1009, '硫酸阿米卡星注射液', '抗感染用药', 12.50, 300, '0.2g/支', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1010, '硫酸妥布霉素注射液', '抗感染用药', 18.50, 250, '80mg/支', '礼来', 1, '乙');
INSERT INTO `medicine_info` VALUES (1011, '注射用硫酸奈替米星', '抗感染用药', 28.50, 200, '0.1g/支', '山东罗欣', 1, '乙');
INSERT INTO `medicine_info` VALUES (1012, '注射用依替米星', '抗感染用药', 26.80, 210, '0.1g/支', '无锡山禾', 1, '乙');
INSERT INTO `medicine_info` VALUES (1013, '大观霉素', '抗感染用药', 38.00, 160, '2g/支', '山东鲁抗', 1, '乙');
INSERT INTO `medicine_info` VALUES (1014, '盐酸多西环素片', '抗感染用药', 12.50, 300, '0.1g*12片', '辉瑞', 1, '甲');
INSERT INTO `medicine_info` VALUES (1015, '米诺环素胶囊', '抗感染用药', 28.50, 200, '50mg*10粒', '惠氏', 1, '乙');
INSERT INTO `medicine_info` VALUES (1016, '氯霉素片', '抗感染用药', 8.50, 350, '0.25g*100片', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1017, '氯霉素注射液', '抗感染用药', 12.50, 300, '0.25g/支', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1018, '甲砜霉素胶囊', '抗感染用药', 18.50, 250, '0.25g*12粒', '哈药集团', 1, '乙');
INSERT INTO `medicine_info` VALUES (1019, '异烟肼片', '抗感染用药', 5.50, 400, '0.1g*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1020, '利福平胶囊', '抗感染用药', 8.50, 350, '0.15g*100粒', '沈阳药大', 1, '甲');
INSERT INTO `medicine_info` VALUES (1021, '利福喷丁胶囊', '抗感染用药', 22.80, 220, '0.15g*20粒', '四川明欣', 1, '乙');
INSERT INTO `medicine_info` VALUES (1022, '盐酸乙胺丁醇片', '抗感染用药', 12.50, 300, '0.25g*100片', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1023, '吡嗪酰胺片', '抗感染用药', 15.80, 260, '0.25g*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1024, '对氨基水杨酸钠片', '抗感染用药', 18.50, 250, '0.5g*100片', '北京双鹤', 1, '乙');
INSERT INTO `medicine_info` VALUES (1025, '利奈唑胺片', '抗感染用药', 65.00, 100, '0.6g*10片', '辉瑞', 1, '谈判');
INSERT INTO `medicine_info` VALUES (1026, '利巴韦林片', '抗感染用药', 6.50, 380, '0.1g*24片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1027, '利巴韦林注射液', '抗感染用药', 8.50, 350, '0.1g/支', '鲁抗医药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1028, '利巴韦林颗粒', '抗感染用药', 12.50, 300, '50mg*18袋', '葵花药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1029, '阿昔洛韦片', '抗感染用药', 12.50, 300, '0.1g*24片', '中美史克', 1, '甲');
INSERT INTO `medicine_info` VALUES (1030, '阿昔洛韦乳膏', '抗感染用药', 5.50, 400, '10g/支', '白云山', 1, '甲');
INSERT INTO `medicine_info` VALUES (1031, '注射用阿昔洛韦', '抗感染用药', 18.50, 250, '0.25g/支', '湖北午时', 1, '乙');
INSERT INTO `medicine_info` VALUES (1032, '伐昔洛韦片', '抗感染用药', 28.50, 200, '0.15g*6片', '葛兰素史克', 1, '乙');
INSERT INTO `medicine_info` VALUES (1033, '泛昔洛韦片', '抗感染用药', 26.80, 210, '0.125g*6片', '史克', 1, '乙');
INSERT INTO `medicine_info` VALUES (1034, '更昔洛韦注射液', '抗感染用药', 32.50, 180, '0.25g/支', '湖北科益', 1, '乙');
INSERT INTO `medicine_info` VALUES (1035, '喷昔洛韦乳膏', '抗感染用药', 15.80, 260, '10g/支', '中美史克', 1, '乙');
INSERT INTO `medicine_info` VALUES (1036, '奥司他韦胶囊', '抗感染用药', 58.00, 120, '75mg*10粒', '罗氏', 1, '乙');
INSERT INTO `medicine_info` VALUES (1037, '奥司他韦颗粒', '抗感染用药', 45.00, 140, '15mg*10袋', '罗氏', 1, '乙');
INSERT INTO `medicine_info` VALUES (1038, '玛巴洛沙韦片', '抗感染用药', 68.00, 100, '20mg*1片', '盐野义', 1, '谈判');
INSERT INTO `medicine_info` VALUES (1039, '扎那米韦吸入粉雾剂', '抗感染用药', 65.00, 100, '5mg*12吸', '葛兰素史克', 1, '乙');
INSERT INTO `medicine_info` VALUES (1040, '帕拉米韦注射液', '抗感染用药', 45.00, 140, '0.15g/支', '山东新时代', 1, '乙');
INSERT INTO `medicine_info` VALUES (1041, '恩替卡韦片', '抗感染用药', 38.00, 160, '0.5mg*7片', '施贵宝', 1, '乙');
INSERT INTO `medicine_info` VALUES (1042, '替诺福韦酯片', '抗感染用药', 45.00, 140, '0.3g*30片', '吉利德', 1, '乙');
INSERT INTO `medicine_info` VALUES (1043, '丙酚替诺福韦片', '抗感染用药', 68.00, 100, '25mg*30片', '吉利德', 1, '谈判');
INSERT INTO `medicine_info` VALUES (1044, '拉米夫定片', '抗感染用药', 28.50, 200, '0.1g*14片', '葛兰素史克', 1, '乙');
INSERT INTO `medicine_info` VALUES (1045, '阿德福韦酯片', '抗感染用药', 26.80, 210, '10mg*14片', '天津药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (1046, '聚乙二醇干扰素α2a', '抗感染用药', 128.00, 80, '180μg/支', '罗氏', 1, '谈判');
INSERT INTO `medicine_info` VALUES (1047, '氟康唑胶囊', '抗感染用药', 18.50, 250, '0.15g*6粒', '辉瑞', 1, '甲');
INSERT INTO `medicine_info` VALUES (1048, '氟康唑注射液', '抗感染用药', 22.80, 220, '0.2g/瓶', '辉瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (1049, '伊曲康唑胶囊', '抗感染用药', 32.50, 180, '0.1g*14粒', '西安杨森', 1, '乙');
INSERT INTO `medicine_info` VALUES (1050, '伏立康唑片', '抗感染用药', 58.00, 120, '0.2g*10片', '辉瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (1051, '伏立康唑注射液', '抗感染用药', 65.00, 100, '0.2g/支', '辉瑞', 1, '谈判');
INSERT INTO `medicine_info` VALUES (1052, '卡泊芬净', '抗感染用药', 68.00, 100, '50mg/支', '默沙东', 1, '谈判');
INSERT INTO `medicine_info` VALUES (1053, '米卡芬净', '抗感染用药', 65.00, 100, '50mg/支', '安斯泰来', 1, '谈判');
INSERT INTO `medicine_info` VALUES (1054, '特比萘芬片', '抗感染用药', 28.50, 200, '0.25g*6片', '诺华', 1, '乙');
INSERT INTO `medicine_info` VALUES (1055, '特比萘芬乳膏', '抗感染用药', 15.80, 260, '10g/支', '诺华', 1, '甲');
INSERT INTO `medicine_info` VALUES (1056, '克霉唑乳膏', '抗感染用药', 5.50, 400, '10g/支', '白云山', 1, '甲');
INSERT INTO `medicine_info` VALUES (1057, '咪康唑乳膏', '抗感染用药', 6.50, 380, '20g/支', '西安杨森', 1, '甲');
INSERT INTO `medicine_info` VALUES (1058, '甲硝唑片', '抗感染用药', 5.50, 400, '0.2g*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1059, '甲硝唑注射液', '抗感染用药', 8.50, 350, '0.5g/瓶', '鲁抗医药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1060, '甲硝唑栓', '抗感染用药', 8.50, 350, '0.5g*10枚', '白云山', 1, '甲');
INSERT INTO `medicine_info` VALUES (1061, '替硝唑片', '抗感染用药', 12.50, 300, '0.5g*8片', '山东鲁抗', 1, '甲');
INSERT INTO `medicine_info` VALUES (1062, '奥硝唑片', '抗感染用药', 18.50, 250, '0.25g*12片', '湖南九典', 1, '乙');
INSERT INTO `medicine_info` VALUES (1063, '奥硝唑注射液', '抗感染用药', 22.80, 220, '0.5g/支', '陕西金裕', 1, '乙');
INSERT INTO `medicine_info` VALUES (1064, '克林霉素胶囊', '抗感染用药', 15.80, 260, '0.15g*12粒', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1065, '克林霉素注射液', '抗感染用药', 18.50, 250, '0.6g/支', '山东罗欣', 1, '甲');
INSERT INTO `medicine_info` VALUES (1066, '林可霉素注射液', '抗感染用药', 8.50, 350, '0.6g/支', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1067, '磷霉素钠', '抗感染用药', 19.80, 240, '2g/支', '东北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1068, '夫西地酸乳膏', '抗感染用药', 22.80, 220, '15g/支', '香港澳美', 1, '乙');
INSERT INTO `medicine_info` VALUES (1069, '利福平乳膏', '抗感染用药', 15.80, 260, '10g/支', '广州白云山', 1, '乙');
INSERT INTO `medicine_info` VALUES (1070, '磺胺嘧啶片', '抗感染用药', 6.50, 380, '0.5g*100片', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1071, '复方磺胺甲恶唑片', '抗感染用药', 5.50, 400, '100片/瓶', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1072, '奥美拉唑肠溶胶囊', '消化系统用药', 8.50, 350, '20mg*14粒', '阿斯利康', 1, '甲');
INSERT INTO `medicine_info` VALUES (1073, '奥美拉唑肠溶片', '消化系统用药', 6.50, 380, '20mg*24片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1074, '注射用奥美拉唑钠', '消化系统用药', 18.50, 250, '40mg/支', '扬子江药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (1075, '兰索拉唑肠溶片', '消化系统用药', 15.80, 260, '15mg*14片', '武田制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1076, '泮托拉唑钠肠溶胶囊', '消化系统用药', 18.50, 250, '40mg*14粒', '中美华东', 1, '乙');
INSERT INTO `medicine_info` VALUES (1077, '注射用泮托拉唑钠', '消化系统用药', 22.80, 220, '40mg/支', '扬子江药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (1078, '雷贝拉唑钠肠溶片', '消化系统用药', 28.50, 200, '10mg*7片', '卫材药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (1079, '艾司奥美拉唑镁肠溶片', '消化系统用药', 38.00, 160, '20mg*7片', '阿斯利康', 1, '乙');
INSERT INTO `medicine_info` VALUES (1080, '注射用艾司奥美拉唑钠', '消化系统用药', 45.00, 140, '40mg/支', '阿斯利康', 1, '乙');
INSERT INTO `medicine_info` VALUES (1081, '西咪替丁片', '消化系统用药', 5.50, 400, '0.2g*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1082, '雷尼替丁胶囊', '消化系统用药', 6.50, 380, '150mg*30粒', '恒瑞医药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1083, '法莫替丁片', '消化系统用药', 8.50, 350, '20mg*24片', '安斯泰来', 1, '甲');
INSERT INTO `medicine_info` VALUES (1084, '注射用法莫替丁', '消化系统用药', 15.80, 260, '20mg/支', '上海上药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1085, '硫糖铝口服混悬液', '消化系统用药', 12.50, 300, '120ml/瓶', '广东华南', 1, '甲');
INSERT INTO `medicine_info` VALUES (1086, '枸橼酸铋钾颗粒', '消化系统用药', 15.80, 260, '1.0g*56袋', '丽珠药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1087, '胶体果胶铋胶囊', '消化系统用药', 18.50, 250, '50mg*24粒', '山西振东', 1, '甲');
INSERT INTO `medicine_info` VALUES (1088, '铝碳酸镁咀嚼片', '消化系统用药', 19.80, 240, '0.5g*30片', '拜耳', 1, '乙');
INSERT INTO `medicine_info` VALUES (1089, '氢氧化铝凝胶', '消化系统用药', 8.50, 350, '500g/瓶', '北京益民', 1, '甲');
INSERT INTO `medicine_info` VALUES (1090, '磷酸铝凝胶', '消化系统用药', 28.50, 200, '20g*6袋', '博福-益普生', 1, '乙');
INSERT INTO `medicine_info` VALUES (1091, '瑞巴派特片', '消化系统用药', 22.80, 220, '0.1g*24片', '浙江大冢', 1, '乙');
INSERT INTO `medicine_info` VALUES (1092, '替普瑞酮胶囊', '消化系统用药', 32.50, 180, '50mg*20粒', '卫材药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (1093, '伊索拉定片', '消化系统用药', 28.50, 200, '2mg*12片', '山东新时代', 1, '乙');
INSERT INTO `medicine_info` VALUES (1094, '颠茄片', '消化系统用药', 5.50, 400, '10mg*100片', '天津药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1095, '山莨菪碱片', '消化系统用药', 6.50, 380, '5mg*100片', '杭州民生', 1, '甲');
INSERT INTO `medicine_info` VALUES (1096, '注射用山莨菪碱', '消化系统用药', 8.50, 350, '10mg/支', '杭州民生', 1, '甲');
INSERT INTO `medicine_info` VALUES (1097, '匹维溴铵片', '消化系统用药', 38.00, 160, '50mg*15片', '苏威制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1098, '奥替溴铵片', '消化系统用药', 28.50, 200, '40mg*20片', '海南金岛', 1, '乙');
INSERT INTO `medicine_info` VALUES (1099, '曲美布汀片', '消化系统用药', 22.80, 220, '0.1g*20片', '天津药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (1100, '多潘立酮片', '消化系统用药', 15.80, 260, '10mg*30片', '西安杨森', 1, '甲');
INSERT INTO `medicine_info` VALUES (1101, '莫沙必利片', '消化系统用药', 18.50, 250, '5mg*24片', '鲁南制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1102, '伊托必利片', '消化系统用药', 22.80, 220, '50mg*12片', '哈药集团', 1, '乙');
INSERT INTO `medicine_info` VALUES (1103, '甲氧氯普胺片', '消化系统用药', 5.50, 400, '5mg*100片', '天津药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1104, '昂丹司琼注射液', '消化系统用药', 28.50, 200, '8mg/支', '齐鲁制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1105, '托烷司琼注射液', '消化系统用药', 32.50, 180, '5mg/支', '山东罗欣', 1, '乙');
INSERT INTO `medicine_info` VALUES (1106, '帕洛诺司琼注射液', '消化系统用药', 45.00, 140, '0.25mg/支', '齐鲁制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1107, '阿瑞匹坦胶囊', '消化系统用药', 65.00, 100, '125mg*1粒', '默沙东', 1, '谈判');
INSERT INTO `medicine_info` VALUES (1108, '蒙脱石散', '消化系统用药', 8.50, 350, '3g*10袋', '博福-益普生', 1, '甲');
INSERT INTO `medicine_info` VALUES (1109, '洛哌丁胺胶囊', '消化系统用药', 15.80, 260, '2mg*6粒', '西安杨森', 1, '乙');
INSERT INTO `medicine_info` VALUES (1110, '地芬诺酯片', '消化系统用药', 6.50, 380, '2.5mg*100片', '天津药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1111, '消旋卡多曲颗粒', '消化系统用药', 19.80, 240, '10mg*12袋', '四川百利', 1, '乙');
INSERT INTO `medicine_info` VALUES (1112, '乳果糖口服溶液', '消化系统用药', 28.50, 200, '15ml*6袋', '苏威制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1113, '聚乙二醇4000散', '消化系统用药', 22.80, 220, '10g*10袋', '博福-益普生', 1, '乙');
INSERT INTO `medicine_info` VALUES (1114, '聚乙二醇电解质散', '消化系统用药', 32.50, 180, '69.56g/袋', '舒泰神', 1, '乙');
INSERT INTO `medicine_info` VALUES (1115, '酚酞片', '消化系统用药', 5.50, 400, '100mg*100片', '天津药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1116, '比沙可啶肠溶片', '消化系统用药', 15.80, 260, '5mg*12片', '德国勃林格', 1, '乙');
INSERT INTO `medicine_info` VALUES (1117, '甘油灌肠剂', '消化系统用药', 8.50, 350, '110ml/支', '北京麦迪海', 1, '甲');
INSERT INTO `medicine_info` VALUES (1118, '开塞露', '消化系统用药', 2.50, 400, '20ml/支', '天津药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1119, '双歧杆菌三联活菌胶囊', '消化系统用药', 22.80, 220, '210mg*36粒', '上海信谊', 1, '乙');
INSERT INTO `medicine_info` VALUES (1120, '双歧杆菌四联活菌片', '消化系统用药', 28.50, 200, '0.5g*24片', '杭州远大', 1, '乙');
INSERT INTO `medicine_info` VALUES (1121, '地衣芽孢杆菌活菌胶囊', '消化系统用药', 18.50, 250, '0.25g*24粒', '东北制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1122, '布拉氏酵母菌散', '消化系统用药', 38.00, 160, '0.25g*6袋', '法国百科达', 1, '乙');
INSERT INTO `medicine_info` VALUES (1123, '酪酸梭菌活菌片', '消化系统用药', 26.80, 210, '350mg*18片', '青岛东海', 1, '乙');
INSERT INTO `medicine_info` VALUES (1124, '乳酸菌素片', '消化系统用药', 8.50, 350, '1.2g*36片', '哈药集团', 1, '甲');
INSERT INTO `medicine_info` VALUES (1125, '多烯磷脂酰胆碱胶囊', '消化系统用药', 32.50, 180, '228mg*36粒', '赛诺菲', 1, '乙');
INSERT INTO `medicine_info` VALUES (1126, '注射用多烯磷脂酰胆碱', '消化系统用药', 45.00, 140, '10ml/支', '赛诺菲', 1, '乙');
INSERT INTO `medicine_info` VALUES (1127, '还原型谷胱甘肽片', '消化系统用药', 28.50, 200, '0.1g*36片', '重庆药友', 1, '乙');
INSERT INTO `medicine_info` VALUES (1128, '注射用还原型谷胱甘肽', '消化系统用药', 22.80, 220, '1.2g/支', '重庆药友', 1, '乙');
INSERT INTO `medicine_info` VALUES (1129, '甘草酸二铵胶囊', '消化系统用药', 15.80, 260, '50mg*24粒', '江苏正大', 1, '甲');
INSERT INTO `medicine_info` VALUES (1130, '异甘草酸镁注射液', '消化系统用药', 38.00, 160, '50mg/支', '江苏正大', 1, '乙');
INSERT INTO `medicine_info` VALUES (1131, '双环醇片', '消化系统用药', 28.50, 200, '25mg*18片', '北京协和药厂', 1, '乙');
INSERT INTO `medicine_info` VALUES (1132, '联苯双酯滴丸', '消化系统用药', 5.50, 400, '1.5mg*250丸', '北京协和药厂', 1, '甲');
INSERT INTO `medicine_info` VALUES (1133, '熊去氧胆酸胶囊', '消化系统用药', 45.00, 140, '250mg*25粒', '德国福克', 1, '乙');
INSERT INTO `medicine_info` VALUES (1134, '鹅去氧胆酸胶囊', '消化系统用药', 28.50, 200, '0.25g*24粒', '四川迪康', 1, '乙');
INSERT INTO `medicine_info` VALUES (1135, '腺苷蛋氨酸肠溶片', '消化系统用药', 68.00, 100, '500mg*10片', '雅培', 1, '谈判');
INSERT INTO `medicine_info` VALUES (1136, '注射用腺苷蛋氨酸', '消化系统用药', 58.00, 120, '500mg/支', '雅培', 1, '乙');
INSERT INTO `medicine_info` VALUES (1137, '消炎利胆片', '消化系统用药', 8.50, 350, '100片/瓶', '广东罗浮山', 1, '甲');
INSERT INTO `medicine_info` VALUES (1138, '茴三硫片', '消化系统用药', 18.50, 250, '25mg*24片', '成都国嘉', 1, '乙');
INSERT INTO `medicine_info` VALUES (1139, '注射用生长抑素', '消化系统用药', 45.00, 140, '3mg/支', '海南双成', 1, '乙');
INSERT INTO `medicine_info` VALUES (1140, '注射用奥曲肽', '消化系统用药', 58.00, 120, '0.1mg/支', '诺华', 1, '乙');
INSERT INTO `medicine_info` VALUES (1141, '胰酶肠溶胶囊', '消化系统用药', 19.80, 240, '0.15g*24粒', '德国苏威', 1, '乙');
INSERT INTO `medicine_info` VALUES (1142, '复方消化酶胶囊', '消化系统用药', 22.80, 220, '20粒/盒', '星昊药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (1143, '米曲菌胰酶片', '消化系统用药', 32.50, 180, '20片/盒', '德国康哲', 1, '乙');
INSERT INTO `medicine_info` VALUES (1144, '美沙拉嗪肠溶片', '消化系统用药', 38.00, 160, '0.25g*24片', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (1145, '美沙拉嗪栓', '消化系统用药', 45.00, 140, '1g*7枚', '德国福克', 1, '乙');
INSERT INTO `medicine_info` VALUES (1146, '柳氮磺吡啶肠溶片', '消化系统用药', 12.50, 300, '0.25g*60片', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1147, '巴柳氮钠胶囊', '消化系统用药', 58.00, 120, '0.75g*36粒', '河北天成', 1, '乙');
INSERT INTO `medicine_info` VALUES (1148, '英夫利西单抗注射液', '消化系统用药', 128.00, 80, '100mg/支', '强生', 1, '谈判');
INSERT INTO `medicine_info` VALUES (1149, '马应龙麝香痔疮膏', '消化系统用药', 12.50, 300, '10g/支', '马应龙药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1150, '马应龙麝香痔疮栓', '消化系统用药', 15.80, 260, '1.5g*12枚', '马应龙药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1151, '肛泰栓', '消化系统用药', 18.50, 250, '1g*12枚', '烟台荣昌', 1, '乙');
INSERT INTO `medicine_info` VALUES (1152, '地奥司明片', '消化系统用药', 28.50, 200, '0.5g*24片', '法国施维雅', 1, '乙');
INSERT INTO `medicine_info` VALUES (1153, '迈之灵片', '消化系统用药', 38.00, 160, '150mg*20片', '德国礼达', 1, '乙');
INSERT INTO `medicine_info` VALUES (1154, '奥美拉唑肠溶胶囊', '消化系统用药', 8.50, 350, '20mg*14粒', '阿斯利康', 1, '甲');
INSERT INTO `medicine_info` VALUES (1155, '奥美拉唑肠溶片', '消化系统用药', 6.50, 380, '20mg*24片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1156, '注射用奥美拉唑钠', '消化系统用药', 18.50, 250, '40mg/支', '扬子江药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (1157, '兰索拉唑肠溶片', '消化系统用药', 15.80, 260, '15mg*14片', '武田制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1158, '泮托拉唑钠肠溶胶囊', '消化系统用药', 18.50, 250, '40mg*14粒', '中美华东', 1, '乙');
INSERT INTO `medicine_info` VALUES (1159, '注射用泮托拉唑钠', '消化系统用药', 22.80, 220, '40mg/支', '扬子江药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (1160, '雷贝拉唑钠肠溶片', '消化系统用药', 28.50, 200, '10mg*7片', '卫材药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (1161, '艾司奥美拉唑镁肠溶片', '消化系统用药', 38.00, 160, '20mg*7片', '阿斯利康', 1, '乙');
INSERT INTO `medicine_info` VALUES (1162, '注射用艾司奥美拉唑钠', '消化系统用药', 45.00, 140, '40mg/支', '阿斯利康', 1, '乙');
INSERT INTO `medicine_info` VALUES (1163, '西咪替丁片', '消化系统用药', 5.50, 400, '0.2g*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1164, '雷尼替丁胶囊', '消化系统用药', 6.50, 380, '150mg*30粒', '恒瑞医药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1165, '法莫替丁片', '消化系统用药', 8.50, 350, '20mg*24片', '安斯泰来', 1, '甲');
INSERT INTO `medicine_info` VALUES (1166, '注射用法莫替丁', '消化系统用药', 15.80, 260, '20mg/支', '上海上药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1167, '硫糖铝口服混悬液', '消化系统用药', 12.50, 300, '120ml/瓶', '广东华南', 1, '甲');
INSERT INTO `medicine_info` VALUES (1168, '枸橼酸铋钾颗粒', '消化系统用药', 15.80, 260, '1.0g*56袋', '丽珠药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1169, '胶体果胶铋胶囊', '消化系统用药', 18.50, 250, '50mg*24粒', '山西振东', 1, '甲');
INSERT INTO `medicine_info` VALUES (1170, '铝碳酸镁咀嚼片', '消化系统用药', 19.80, 240, '0.5g*30片', '拜耳', 1, '乙');
INSERT INTO `medicine_info` VALUES (1171, '氢氧化铝凝胶', '消化系统用药', 8.50, 350, '500g/瓶', '北京益民', 1, '甲');
INSERT INTO `medicine_info` VALUES (1172, '磷酸铝凝胶', '消化系统用药', 28.50, 200, '20g*6袋', '博福-益普生', 1, '乙');
INSERT INTO `medicine_info` VALUES (1173, '瑞巴派特片', '消化系统用药', 22.80, 220, '0.1g*24片', '浙江大冢', 1, '乙');
INSERT INTO `medicine_info` VALUES (1174, '替普瑞酮胶囊', '消化系统用药', 32.50, 180, '50mg*20粒', '卫材药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (1175, '伊索拉定片', '消化系统用药', 28.50, 200, '2mg*12片', '山东新时代', 1, '乙');
INSERT INTO `medicine_info` VALUES (1176, '颠茄片', '消化系统用药', 5.50, 400, '10mg*100片', '天津药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1177, '山莨菪碱片', '消化系统用药', 6.50, 380, '5mg*100片', '杭州民生', 1, '甲');
INSERT INTO `medicine_info` VALUES (1178, '注射用山莨菪碱', '消化系统用药', 8.50, 350, '10mg/支', '杭州民生', 1, '甲');
INSERT INTO `medicine_info` VALUES (1179, '匹维溴铵片', '消化系统用药', 38.00, 160, '50mg*15片', '苏威制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1180, '奥替溴铵片', '消化系统用药', 28.50, 200, '40mg*20片', '海南金岛', 1, '乙');
INSERT INTO `medicine_info` VALUES (1181, '曲美布汀片', '消化系统用药', 22.80, 220, '0.1g*20片', '天津药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (1182, '多潘立酮片', '消化系统用药', 15.80, 260, '10mg*30片', '西安杨森', 1, '甲');
INSERT INTO `medicine_info` VALUES (1183, '莫沙必利片', '消化系统用药', 18.50, 250, '5mg*24片', '鲁南制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1184, '伊托必利片', '消化系统用药', 22.80, 220, '50mg*12片', '哈药集团', 1, '乙');
INSERT INTO `medicine_info` VALUES (1185, '甲氧氯普胺片', '消化系统用药', 5.50, 400, '5mg*100片', '天津药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1186, '昂丹司琼注射液', '消化系统用药', 28.50, 200, '8mg/支', '齐鲁制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1187, '托烷司琼注射液', '消化系统用药', 32.50, 180, '5mg/支', '山东罗欣', 1, '乙');
INSERT INTO `medicine_info` VALUES (1188, '帕洛诺司琼注射液', '消化系统用药', 45.00, 140, '0.25mg/支', '齐鲁制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1189, '阿瑞匹坦胶囊', '消化系统用药', 65.00, 100, '125mg*1粒', '默沙东', 1, '谈判');
INSERT INTO `medicine_info` VALUES (1190, '蒙脱石散', '消化系统用药', 8.50, 350, '3g*10袋', '博福-益普生', 1, '甲');
INSERT INTO `medicine_info` VALUES (1191, '洛哌丁胺胶囊', '消化系统用药', 15.80, 260, '2mg*6粒', '西安杨森', 1, '乙');
INSERT INTO `medicine_info` VALUES (1192, '地芬诺酯片', '消化系统用药', 6.50, 380, '2.5mg*100片', '天津药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1193, '消旋卡多曲颗粒', '消化系统用药', 19.80, 240, '10mg*12袋', '四川百利', 1, '乙');
INSERT INTO `medicine_info` VALUES (1194, '乳果糖口服溶液', '消化系统用药', 28.50, 200, '15ml*6袋', '苏威制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1195, '聚乙二醇4000散', '消化系统用药', 22.80, 220, '10g*10袋', '博福-益普生', 1, '乙');
INSERT INTO `medicine_info` VALUES (1196, '聚乙二醇电解质散', '消化系统用药', 32.50, 180, '69.56g/袋', '舒泰神', 1, '乙');
INSERT INTO `medicine_info` VALUES (1197, '酚酞片', '消化系统用药', 5.50, 400, '100mg*100片', '天津药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1198, '比沙可啶肠溶片', '消化系统用药', 15.80, 260, '5mg*12片', '德国勃林格', 1, '乙');
INSERT INTO `medicine_info` VALUES (1199, '甘油灌肠剂', '消化系统用药', 8.50, 350, '110ml/支', '北京麦迪海', 1, '甲');
INSERT INTO `medicine_info` VALUES (1200, '开塞露', '消化系统用药', 2.50, 400, '20ml/支', '天津药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1201, '双歧杆菌三联活菌胶囊', '消化系统用药', 22.80, 220, '210mg*36粒', '上海信谊', 1, '乙');
INSERT INTO `medicine_info` VALUES (1202, '双歧杆菌四联活菌片', '消化系统用药', 28.50, 200, '0.5g*24片', '杭州远大', 1, '乙');
INSERT INTO `medicine_info` VALUES (1203, '地衣芽孢杆菌活菌胶囊', '消化系统用药', 18.50, 250, '0.25g*24粒', '东北制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1204, '布拉氏酵母菌散', '消化系统用药', 38.00, 160, '0.25g*6袋', '法国百科达', 1, '乙');
INSERT INTO `medicine_info` VALUES (1205, '酪酸梭菌活菌片', '消化系统用药', 26.80, 210, '350mg*18片', '青岛东海', 1, '乙');
INSERT INTO `medicine_info` VALUES (1206, '乳酸菌素片', '消化系统用药', 8.50, 350, '1.2g*36片', '哈药集团', 1, '甲');
INSERT INTO `medicine_info` VALUES (1207, '多烯磷脂酰胆碱胶囊', '消化系统用药', 32.50, 180, '228mg*36粒', '赛诺菲', 1, '乙');
INSERT INTO `medicine_info` VALUES (1208, '注射用多烯磷脂酰胆碱', '消化系统用药', 45.00, 140, '10ml/支', '赛诺菲', 1, '乙');
INSERT INTO `medicine_info` VALUES (1209, '还原型谷胱甘肽片', '消化系统用药', 28.50, 200, '0.1g*36片', '重庆药友', 1, '乙');
INSERT INTO `medicine_info` VALUES (1210, '注射用还原型谷胱甘肽', '消化系统用药', 22.80, 220, '1.2g/支', '重庆药友', 1, '乙');
INSERT INTO `medicine_info` VALUES (1211, '甘草酸二铵胶囊', '消化系统用药', 15.80, 260, '50mg*24粒', '江苏正大', 1, '甲');
INSERT INTO `medicine_info` VALUES (1212, '异甘草酸镁注射液', '消化系统用药', 38.00, 160, '50mg/支', '江苏正大', 1, '乙');
INSERT INTO `medicine_info` VALUES (1213, '双环醇片', '消化系统用药', 28.50, 200, '25mg*18片', '北京协和药厂', 1, '乙');
INSERT INTO `medicine_info` VALUES (1214, '联苯双酯滴丸', '消化系统用药', 5.50, 400, '1.5mg*250丸', '北京协和药厂', 1, '甲');
INSERT INTO `medicine_info` VALUES (1215, '熊去氧胆酸胶囊', '消化系统用药', 45.00, 140, '250mg*25粒', '德国福克', 1, '乙');
INSERT INTO `medicine_info` VALUES (1216, '鹅去氧胆酸胶囊', '消化系统用药', 28.50, 200, '0.25g*24粒', '四川迪康', 1, '乙');
INSERT INTO `medicine_info` VALUES (1217, '腺苷蛋氨酸肠溶片', '消化系统用药', 68.00, 100, '500mg*10片', '雅培', 1, '谈判');
INSERT INTO `medicine_info` VALUES (1218, '注射用腺苷蛋氨酸', '消化系统用药', 58.00, 120, '500mg/支', '雅培', 1, '乙');
INSERT INTO `medicine_info` VALUES (1219, '消炎利胆片', '消化系统用药', 8.50, 350, '100片/瓶', '广东罗浮山', 1, '甲');
INSERT INTO `medicine_info` VALUES (1220, '茴三硫片', '消化系统用药', 18.50, 250, '25mg*24片', '成都国嘉', 1, '乙');
INSERT INTO `medicine_info` VALUES (1221, '注射用生长抑素', '消化系统用药', 45.00, 140, '3mg/支', '海南双成', 1, '乙');
INSERT INTO `medicine_info` VALUES (1222, '注射用奥曲肽', '消化系统用药', 58.00, 120, '0.1mg/支', '诺华', 1, '乙');
INSERT INTO `medicine_info` VALUES (1223, '胰酶肠溶胶囊', '消化系统用药', 19.80, 240, '0.15g*24粒', '德国苏威', 1, '乙');
INSERT INTO `medicine_info` VALUES (1224, '复方消化酶胶囊', '消化系统用药', 22.80, 220, '20粒/盒', '星昊药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (1225, '米曲菌胰酶片', '消化系统用药', 32.50, 180, '20片/盒', '德国康哲', 1, '乙');
INSERT INTO `medicine_info` VALUES (1226, '美沙拉嗪肠溶片', '消化系统用药', 38.00, 160, '0.25g*24片', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (1227, '美沙拉嗪栓', '消化系统用药', 45.00, 140, '1g*7枚', '德国福克', 1, '乙');
INSERT INTO `medicine_info` VALUES (1228, '柳氮磺吡啶肠溶片', '消化系统用药', 12.50, 300, '0.25g*60片', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1229, '巴柳氮钠胶囊', '消化系统用药', 58.00, 120, '0.75g*36粒', '河北天成', 1, '乙');
INSERT INTO `medicine_info` VALUES (1230, '英夫利西单抗注射液', '消化系统用药', 128.00, 80, '100mg/支', '强生', 1, '谈判');
INSERT INTO `medicine_info` VALUES (1231, '马应龙麝香痔疮膏', '消化系统用药', 12.50, 300, '10g/支', '马应龙药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1232, '马应龙麝香痔疮栓', '消化系统用药', 15.80, 260, '1.5g*12枚', '马应龙药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1233, '肛泰栓', '消化系统用药', 18.50, 250, '1g*12枚', '烟台荣昌', 1, '乙');
INSERT INTO `medicine_info` VALUES (1234, '地奥司明片', '消化系统用药', 28.50, 200, '0.5g*24片', '法国施维雅', 1, '乙');
INSERT INTO `medicine_info` VALUES (1235, '迈之灵片', '消化系统用药', 38.00, 160, '150mg*20片', '德国礼达', 1, '乙');
INSERT INTO `medicine_info` VALUES (1236, '呋塞米片', '泌尿系统用药', 5.50, 400, '20mg*100片', '天津药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1237, '呋塞米注射液', '泌尿系统用药', 8.50, 350, '20mg/支', '天津药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1238, '氢氯噻嗪片', '泌尿系统用药', 6.50, 380, '25mg*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1239, '螺内酯片', '泌尿系统用药', 8.50, 350, '20mg*100片', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1240, '托拉塞米片', '泌尿系统用药', 22.80, 220, '5mg*12片', '南京海辰', 1, '乙');
INSERT INTO `medicine_info` VALUES (1241, '托拉塞米注射液', '泌尿系统用药', 28.50, 200, '10mg/支', '南京海辰', 1, '乙');
INSERT INTO `medicine_info` VALUES (1242, '布美他尼片', '泌尿系统用药', 15.80, 260, '1mg*10片', '桂林南药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1243, '氨苯蝶啶片', '泌尿系统用药', 8.50, 350, '50mg*100片', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1244, '醋酸泼尼松片', '泌尿系统用药', 6.50, 380, '5mg*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1245, '甲泼尼龙片', '泌尿系统用药', 45.00, 140, '4mg*30片', '辉瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (1246, '环磷酰胺片', '泌尿系统用药', 18.50, 250, '50mg*100片', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1247, '吗替麦考酚酯胶囊', '泌尿系统用药', 65.00, 100, '250mg*40粒', '罗氏', 1, '谈判');
INSERT INTO `medicine_info` VALUES (1248, '他克莫司胶囊', '泌尿系统用药', 58.00, 120, '0.5mg*10粒', '安斯泰来', 1, '乙');
INSERT INTO `medicine_info` VALUES (1249, '环孢素软胶囊', '泌尿系统用药', 45.00, 140, '25mg*50粒', '华北制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1250, '雷公藤多苷片', '泌尿系统用药', 15.80, 260, '10mg*50片', '上海医药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1251, '百令胶囊', '泌尿系统用药', 28.50, 200, '0.5g*42粒', '杭州中美华东', 1, '乙');
INSERT INTO `medicine_info` VALUES (1252, '黄葵胶囊', '泌尿系统用药', 22.80, 220, '0.5g*30粒', '江苏苏中药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (1253, '重组人促红素注射液', '泌尿系统用药', 38.00, 160, '3000IU/支', '上海上药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1254, '蔗糖铁注射液', '泌尿系统用药', 28.50, 200, '100mg/支', '南京恒生', 1, '乙');
INSERT INTO `medicine_info` VALUES (1255, '多糖铁复合物胶囊', '泌尿系统用药', 32.50, 180, '0.15g*10粒', '惠氏', 1, '乙');
INSERT INTO `medicine_info` VALUES (1256, '琥珀酸亚铁片', '泌尿系统用药', 18.50, 250, '0.1g*20片', '金陵药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1257, '叶酸片', '泌尿系统用药', 5.50, 400, '5mg*100片', '天津药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1258, '维生素B12注射液', '泌尿系统用药', 6.50, 380, '0.5mg/支', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1259, '骨化三醇胶丸', '泌尿系统用药', 38.00, 160, '0.25μg*10丸', '罗氏', 1, '乙');
INSERT INTO `medicine_info` VALUES (1260, '阿法骨化醇软胶囊', '泌尿系统用药', 28.50, 200, '0.5μg*20粒', '昆明贝克诺顿', 1, '乙');
INSERT INTO `medicine_info` VALUES (1261, '碳酸钙D3片', '泌尿系统用药', 22.80, 220, '600mg*60片', '惠氏', 1, '乙');
INSERT INTO `medicine_info` VALUES (1262, '司维拉姆片', '泌尿系统用药', 68.00, 100, '800mg*30片', '赛诺菲', 1, '谈判');
INSERT INTO `medicine_info` VALUES (1263, '西那卡塞片', '泌尿系统用药', 58.00, 120, '25mg*10片', '协和发酵麒麟', 1, '乙');
INSERT INTO `medicine_info` VALUES (1264, '非布司他片', '泌尿系统用药', 38.00, 160, '40mg*12片', '江苏恒瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (1265, '别嘌醇片', '泌尿系统用药', 8.50, 350, '0.1g*100片', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1266, '苯溴马隆片', '泌尿系统用药', 28.50, 200, '50mg*10片', '德国赫曼', 1, '乙');
INSERT INTO `medicine_info` VALUES (1267, '秋水仙碱片', '泌尿系统用药', 6.50, 380, '0.5mg*20片', '西双版纳制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1268, '碳酸氢钠片', '泌尿系统用药', 5.50, 400, '0.5g*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1269, '排石颗粒', '泌尿系统用药', 18.50, 250, '20g*12袋', '南京同仁堂', 1, '甲');
INSERT INTO `medicine_info` VALUES (1270, '肾石通颗粒', '泌尿系统用药', 15.80, 260, '15g*10袋', '江西山香', 1, '甲');
INSERT INTO `medicine_info` VALUES (1271, '枸橼酸氢钾钠颗粒', '泌尿系统用药', 45.00, 140, '97.1g/瓶', '德国马博士', 1, '乙');
INSERT INTO `medicine_info` VALUES (1272, '坦索罗辛缓释胶囊', '泌尿系统用药', 28.50, 200, '0.2mg*10粒', '安斯泰来', 1, '乙');
INSERT INTO `medicine_info` VALUES (1273, '非那雄胺片', '泌尿系统用药', 22.80, 220, '5mg*10片', '杭州默沙东', 1, '乙');
INSERT INTO `medicine_info` VALUES (1274, '度他雄胺软胶囊', '泌尿系统用药', 38.00, 160, '0.5mg*10粒', '葛兰素史克', 1, '乙');
INSERT INTO `medicine_info` VALUES (1275, '坦索罗辛缓释胶囊', '泌尿系统用药', 28.50, 200, '0.2mg*10粒', '安斯泰来', 1, '乙');
INSERT INTO `medicine_info` VALUES (1276, '特拉唑嗪片', '泌尿系统用药', 15.80, 260, '2mg*14片', '雅培', 1, '甲');
INSERT INTO `medicine_info` VALUES (1277, '多沙唑嗪片', '泌尿系统用药', 19.80, 240, '4mg*10片', '辉瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (1278, '赛洛多辛胶囊', '泌尿系统用药', 45.00, 140, '40mg*14粒', '第一三共', 1, '乙');
INSERT INTO `medicine_info` VALUES (1279, '普乐安片', '泌尿系统用药', 8.50, 350, '0.5g*60片', '云南白药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1280, '前列舒通胶囊', '泌尿系统用药', 22.80, 220, '0.4g*36粒', '保定步长天浩', 1, '乙');
INSERT INTO `medicine_info` VALUES (1281, '癃闭舒胶囊', '泌尿系统用药', 18.50, 250, '0.3g*24粒', '石家庄科迪', 1, '甲');
INSERT INTO `medicine_info` VALUES (1282, '西地那非片', '泌尿系统用药', 58.00, 120, '50mg*1片', '辉瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (1283, '他达拉非片', '泌尿系统用药', 65.00, 100, '20mg*1片', '礼来', 1, '乙');
INSERT INTO `medicine_info` VALUES (1284, '伐地那非片', '泌尿系统用药', 45.00, 140, '20mg*1片', '拜耳', 1, '乙');
INSERT INTO `medicine_info` VALUES (1285, '十一酸睾酮软胶囊', '泌尿系统用药', 38.00, 160, '40mg*16粒', '欧加农', 1, '乙');
INSERT INTO `medicine_info` VALUES (1286, '复方玄驹胶囊', '泌尿系统用药', 28.50, 200, '0.42g*36粒', '浙江施强制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1287, '托特罗定片', '泌尿系统用药', 22.80, 220, '2mg*14片', '南京美瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (1288, '索利那新片', '泌尿系统用药', 38.00, 160, '5mg*10片', '安斯泰来', 1, '乙');
INSERT INTO `medicine_info` VALUES (1289, '米拉贝隆缓释片', '泌尿系统用药', 45.00, 140, '50mg*10片', '安斯泰来', 1, '乙');
INSERT INTO `medicine_info` VALUES (1290, '奥昔布宁片', '泌尿系统用药', 15.80, 260, '5mg*14片', '湖南千金', 1, '乙');
INSERT INTO `medicine_info` VALUES (1291, '左氧氟沙星片', '泌尿系统用药', 18.50, 250, '0.1g*12片', '第一三共', 1, '甲');
INSERT INTO `medicine_info` VALUES (1292, '头孢克肟胶囊', '泌尿系统用药', 28.50, 200, '0.1g*6粒', '白云山', 1, '乙');
INSERT INTO `medicine_info` VALUES (1293, '呋喃妥因片', '泌尿系统用药', 6.50, 380, '50mg*100片', '天津药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1294, '磷霉素氨丁三醇散', '泌尿系统用药', 32.50, 180, '3g/瓶', '东北制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1295, '三金片', '泌尿系统用药', 12.50, 300, '72片/瓶', '桂林三金', 1, '甲');
INSERT INTO `medicine_info` VALUES (1296, '热淋清颗粒', '泌尿系统用药', 18.50, 250, '8g*10袋', '贵州威门', 1, '甲');
INSERT INTO `medicine_info` VALUES (1297, '氢化可的松乳膏', '皮肤科用药', 5.50, 400, '10g/支', '华润三九', 1, '甲');
INSERT INTO `medicine_info` VALUES (1298, '地塞米松乳膏', '皮肤科用药', 6.50, 380, '10g/支', '白云山', 1, '甲');
INSERT INTO `medicine_info` VALUES (1299, '丁酸氢化可的松乳膏', '皮肤科用药', 12.50, 300, '10g/支', '天津药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1300, '醋酸泼尼松龙乳膏', '皮肤科用药', 15.80, 260, '10g/支', '上海上药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1301, '糠酸莫米松乳膏', '皮肤科用药', 18.50, 250, '10g/支', '拜耳', 1, '乙');
INSERT INTO `medicine_info` VALUES (1302, '卤米松乳膏', '皮肤科用药', 22.80, 220, '10g/支', '澳美制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1303, '丙酸氯倍他索乳膏', '皮肤科用药', 15.80, 260, '10g/支', '湖南五洲通', 1, '乙');
INSERT INTO `medicine_info` VALUES (1304, '氟轻松软膏', '皮肤科用药', 8.50, 350, '10g/支', '天津药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1305, '克霉唑乳膏', '皮肤科用药', 5.50, 400, '10g/支', '白云山', 1, '甲');
INSERT INTO `medicine_info` VALUES (1306, '咪康唑乳膏', '皮肤科用药', 6.50, 380, '20g/支', '西安杨森', 1, '甲');
INSERT INTO `medicine_info` VALUES (1307, '酮康唑乳膏', '皮肤科用药', 12.50, 300, '10g/支', '西安杨森', 1, '甲');
INSERT INTO `medicine_info` VALUES (1308, '特比萘芬乳膏', '皮肤科用药', 15.80, 260, '10g/支', '诺华', 1, '甲');
INSERT INTO `medicine_info` VALUES (1309, '布替萘芬乳膏', '皮肤科用药', 18.50, 250, '10g/支', '山东鲁抗', 1, '乙');
INSERT INTO `medicine_info` VALUES (1310, '联苯苄唑乳膏', '皮肤科用药', 12.50, 300, '10g/支', '拜耳', 1, '甲');
INSERT INTO `medicine_info` VALUES (1311, '环吡酮胺乳膏', '皮肤科用药', 15.80, 260, '10g/支', '北京双吉', 1, '乙');
INSERT INTO `medicine_info` VALUES (1312, '阿莫罗芬擦剂', '皮肤科用药', 58.00, 120, '2.5ml/瓶', '法国高德美', 1, '乙');
INSERT INTO `medicine_info` VALUES (1313, '硝酸咪康唑散', '皮肤科用药', 15.80, 260, '20g/瓶', '西安杨森', 1, '甲');
INSERT INTO `medicine_info` VALUES (1314, '阿昔洛韦乳膏', '皮肤科用药', 5.50, 400, '10g/支', '白云山', 1, '甲');
INSERT INTO `medicine_info` VALUES (1315, '喷昔洛韦乳膏', '皮肤科用药', 15.80, 260, '10g/支', '中美史克', 1, '乙');
INSERT INTO `medicine_info` VALUES (1316, '鬼臼毒素酊', '皮肤科用药', 38.00, 160, '3ml/瓶', '辽宁华卫', 1, '乙');
INSERT INTO `medicine_info` VALUES (1317, '咪喹莫特乳膏', '皮肤科用药', 45.00, 140, '3g/支', '四川明欣', 1, '乙');
INSERT INTO `medicine_info` VALUES (1318, '重组人干扰素α2b凝胶', '皮肤科用药', 28.50, 200, '5g/支', '兆科药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (1319, '红霉素软膏', '皮肤科用药', 5.50, 400, '10g/支', '白云山', 1, '甲');
INSERT INTO `medicine_info` VALUES (1320, '金霉素软膏', '皮肤科用药', 6.50, 380, '10g/支', '浙江医药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1321, '莫匹罗星软膏', '皮肤科用药', 18.50, 250, '5g/支', '中美史克', 1, '乙');
INSERT INTO `medicine_info` VALUES (1322, '夫西地酸乳膏', '皮肤科用药', 22.80, 220, '15g/支', '香港澳美', 1, '乙');
INSERT INTO `medicine_info` VALUES (1323, '复方多粘菌素B软膏', '皮肤科用药', 32.50, 180, '10g/支', '浙江日升昌', 1, '乙');
INSERT INTO `medicine_info` VALUES (1324, '氧氟沙星凝胶', '皮肤科用药', 15.80, 260, '10g/支', '湖北恒安', 1, '乙');
INSERT INTO `medicine_info` VALUES (1325, '阿达帕林凝胶', '皮肤科用药', 28.50, 200, '30g/支', '法国高德美', 1, '乙');
INSERT INTO `medicine_info` VALUES (1326, '异维A酸凝胶', '皮肤科用药', 18.50, 250, '10g/支', '山东方明', 1, '乙');
INSERT INTO `medicine_info` VALUES (1327, '维A酸乳膏', '皮肤科用药', 8.50, 350, '10g/支', '重庆华邦', 1, '甲');
INSERT INTO `medicine_info` VALUES (1328, '过氧苯甲酰凝胶', '皮肤科用药', 22.80, 220, '15g/支', '法国高德美', 1, '乙');
INSERT INTO `medicine_info` VALUES (1329, '克林霉素凝胶', '皮肤科用药', 15.80, 260, '10g/支', '湖北康正', 1, '乙');
INSERT INTO `medicine_info` VALUES (1330, '甲硝唑凝胶', '皮肤科用药', 12.50, 300, '10g/支', '江苏晨牌', 1, '甲');
INSERT INTO `medicine_info` VALUES (1331, '壬二酸乳膏', '皮肤科用药', 38.00, 160, '15g/支', '山东希尔康', 1, '乙');
INSERT INTO `medicine_info` VALUES (1332, '赛庚啶乳膏', '皮肤科用药', 8.50, 350, '10g/支', '湖南五洲通', 1, '甲');
INSERT INTO `medicine_info` VALUES (1333, '盐酸氯环利嗪乳膏', '皮肤科用药', 18.50, 250, '10g/支', '焦作福瑞堂', 1, '乙');
INSERT INTO `medicine_info` VALUES (1334, '丁苯羟酸乳膏', '皮肤科用药', 15.80, 260, '10g/支', '湖南迪诺', 1, '乙');
INSERT INTO `medicine_info` VALUES (1335, '乙氧苯柳胺软膏', '皮肤科用药', 22.80, 220, '10g/支', '山东新华', 1, '乙');
INSERT INTO `medicine_info` VALUES (1336, '氟芬那酸丁酯软膏', '皮肤科用药', 28.50, 200, '10g/支', '沈阳绿洲', 1, '乙');
INSERT INTO `medicine_info` VALUES (1337, '尿素软膏', '皮肤科用药', 5.50, 400, '10g/支', '天津药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1338, '维生素E乳膏', '皮肤科用药', 8.50, 350, '10g/支', '华润三九', 1, '甲');
INSERT INTO `medicine_info` VALUES (1339, '氧化锌软膏', '皮肤科用药', 6.50, 380, '20g/支', '天津药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1340, '炉甘石洗剂', '皮肤科用药', 8.50, 350, '100ml/瓶', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1341, '多磺酸粘多糖乳膏', '皮肤科用药', 38.00, 160, '14g/支', '德国礼达', 1, '乙');
INSERT INTO `medicine_info` VALUES (1342, '复方肝素钠尿囊素凝胶', '皮肤科用药', 28.50, 200, '10g/支', '德国康瑞保', 1, '乙');
INSERT INTO `medicine_info` VALUES (1343, '重组人表皮生长因子凝胶', '皮肤科用药', 45.00, 140, '10g/支', '桂林华诺威', 1, '乙');
INSERT INTO `medicine_info` VALUES (1344, '医用保湿修复霜', '皮肤科用药', 32.50, 180, '50g/瓶', '薇诺娜', 1, '乙');
INSERT INTO `medicine_info` VALUES (1345, '卡泊三醇软膏', '皮肤科用药', 45.00, 140, '15g/支', '利奥制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1346, '他卡西醇软膏', '皮肤科用药', 38.00, 160, '10g/支', '帝人制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1347, '他扎罗汀凝胶', '皮肤科用药', 28.50, 200, '15g/支', '重庆华邦', 1, '乙');
INSERT INTO `medicine_info` VALUES (1348, '吡硫翁锌气雾剂', '皮肤科用药', 58.00, 120, '100ml/瓶', '西班牙凯泰康', 1, '乙');
INSERT INTO `medicine_info` VALUES (1349, '卤米松三氯生乳膏', '皮肤科用药', 28.50, 200, '10g/支', '诺华', 1, '乙');
INSERT INTO `medicine_info` VALUES (1350, '氢醌乳膏', '皮肤科用药', 38.00, 160, '10g/支', '广东人人康', 1, '乙');
INSERT INTO `medicine_info` VALUES (1351, '熊果苷乳膏', '皮肤科用药', 22.80, 220, '10g/支', '武汉诺安', 1, '乙');
INSERT INTO `medicine_info` VALUES (1352, '积雪苷霜软膏', '皮肤科用药', 15.80, 260, '10g/支', '上海现代', 1, '甲');
INSERT INTO `medicine_info` VALUES (1353, '烟酰胺凝胶', '皮肤科用药', 18.50, 250, '10g/支', '江苏远恒', 1, '乙');
INSERT INTO `medicine_info` VALUES (1354, '双氯芬酸钠凝胶', '皮肤科用药', 12.50, 300, '15g/支', '北京诺华', 1, '甲');
INSERT INTO `medicine_info` VALUES (1355, '布洛芬凝胶', '皮肤科用药', 15.80, 260, '15g/支', '湖北舒邦', 1, '乙');
INSERT INTO `medicine_info` VALUES (1356, '酮洛芬凝胶', '皮肤科用药', 18.50, 250, '30g/支', '德国美乐', 1, '乙');
INSERT INTO `medicine_info` VALUES (1357, '硫磺软膏', '皮肤科用药', 5.50, 400, '10g/支', '天津药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1358, '林旦乳膏', '皮肤科用药', 8.50, 350, '10g/支', '天津药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1359, '克罗米通乳膏', '皮肤科用药', 12.50, 300, '10g/支', '广州白云山', 1, '甲');
INSERT INTO `medicine_info` VALUES (1360, '氯雷他定片', '皮肤科用药', 12.50, 300, '10mg*6片', '拜耳', 1, '甲');
INSERT INTO `medicine_info` VALUES (1361, '氯雷他定糖浆', '皮肤科用药', 18.50, 250, '60ml/瓶', '拜耳', 1, '乙');
INSERT INTO `medicine_info` VALUES (1362, '西替利嗪片', '皮肤科用药', 8.50, 350, '10mg*12片', '联合药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1363, '左西替利嗪片', '皮肤科用药', 18.50, 250, '5mg*12片', '山东鲁南', 1, '乙');
INSERT INTO `medicine_info` VALUES (1364, '依巴斯汀片', '皮肤科用药', 28.50, 200, '10mg*7片', '杭州澳医保灵', 1, '乙');
INSERT INTO `medicine_info` VALUES (1365, '非索非那定片', '皮肤科用药', 22.80, 220, '60mg*12片', '江苏恒瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (1366, '复方甘草酸苷片', '皮肤科用药', 28.50, 200, '25mg*30片', '日本米诺发源', 1, '乙');
INSERT INTO `medicine_info` VALUES (1367, '异维A酸软胶囊', '皮肤科用药', 38.00, 160, '10mg*20粒', '上海信谊', 1, '乙');
INSERT INTO `medicine_info` VALUES (1368, '阿维A胶囊', '皮肤科用药', 45.00, 140, '10mg*30粒', '重庆华邦', 1, '乙');
INSERT INTO `medicine_info` VALUES (1369, '伊曲康唑胶囊', '皮肤科用药', 32.50, 180, '0.1g*14粒', '西安杨森', 1, '乙');
INSERT INTO `medicine_info` VALUES (1370, '盐酸特比萘芬片', '皮肤科用药', 28.50, 200, '0.25g*6片', '诺华', 1, '乙');
INSERT INTO `medicine_info` VALUES (1371, '氟康唑胶囊', '皮肤科用药', 18.50, 250, '0.15g*6粒', '辉瑞', 1, '甲');
INSERT INTO `medicine_info` VALUES (1372, '白芍总苷胶囊', '皮肤科用药', 22.80, 220, '0.3g*36粒', '宁波立华', 1, '乙');
INSERT INTO `medicine_info` VALUES (1373, '雷公藤多苷片', '皮肤科用药', 15.80, 260, '10mg*50片', '上海医药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1374, '左氧氟沙星滴眼液', '五官科用药', 18.50, 250, '5ml/支', '参天制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1375, '妥布霉素滴眼液', '五官科用药', 15.80, 260, '5ml/支', '爱尔康', 1, '乙');
INSERT INTO `medicine_info` VALUES (1376, '氯霉素滴眼液', '五官科用药', 5.50, 400, '8ml/支', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1377, '红霉素眼膏', '五官科用药', 5.50, 400, '2.5g/支', '白云山', 1, '甲');
INSERT INTO `medicine_info` VALUES (1378, '金霉素眼膏', '五官科用药', 6.50, 380, '2.5g/支', '浙江医药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1379, '氧氟沙星滴眼液', '五官科用药', 12.50, 300, '5ml/支', '参天制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1380, '加替沙星滴眼液', '五官科用药', 22.80, 220, '5ml/支', '山东博士伦', 1, '乙');
INSERT INTO `medicine_info` VALUES (1381, '阿昔洛韦滴眼液', '五官科用药', 8.50, 350, '8ml/支', '潜江制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1382, '更昔洛韦眼用凝胶', '五官科用药', 28.50, 200, '5g/支', '湖北科益', 1, '乙');
INSERT INTO `medicine_info` VALUES (1383, '色甘酸钠滴眼液', '五官科用药', 6.50, 380, '8ml/支', '武汉五景', 1, '甲');
INSERT INTO `medicine_info` VALUES (1384, '奥洛他定滴眼液', '五官科用药', 38.00, 160, '5ml/支', '参天制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1385, '洛美沙星滴眼液', '五官科用药', 15.80, 260, '5ml/支', '山东正大', 1, '乙');
INSERT INTO `medicine_info` VALUES (1386, '普拉洛芬滴眼液', '五官科用药', 32.50, 180, '5ml/支', '参天制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1387, '玻璃酸钠滴眼液', '五官科用药', 28.50, 200, '5ml/支', '参天制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1388, '聚乙二醇滴眼液', '五官科用药', 22.80, 220, '5ml/支', '爱尔康', 1, '乙');
INSERT INTO `medicine_info` VALUES (1389, '羧甲基纤维素钠滴眼液', '五官科用药', 19.80, 240, '0.4ml*10支', '爱尔康', 1, '乙');
INSERT INTO `medicine_info` VALUES (1390, '七叶洋地黄双苷滴眼液', '五官科用药', 45.00, 140, '0.4ml*10支', '施图伦', 1, '乙');
INSERT INTO `medicine_info` VALUES (1391, '珍珠明目滴眼液', '五官科用药', 8.50, 350, '8ml/支', '天目山制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1392, '布林佐胺滴眼液', '五官科用药', 45.00, 140, '5ml/支', '爱尔康', 1, '乙');
INSERT INTO `medicine_info` VALUES (1393, '噻吗洛尔滴眼液', '五官科用药', 12.50, 300, '5ml/支', '山东博士伦', 1, '甲');
INSERT INTO `medicine_info` VALUES (1394, '溴莫尼定滴眼液', '五官科用药', 58.00, 120, '5ml/支', '艾尔建', 1, '乙');
INSERT INTO `medicine_info` VALUES (1395, '拉坦前列素滴眼液', '五官科用药', 68.00, 100, '2.5ml/支', ' Pfizer', 1, '谈判');
INSERT INTO `medicine_info` VALUES (1396, '托吡卡胺滴眼液', '五官科用药', 15.80, 260, '5ml/支', '山东博士伦', 1, '甲');
INSERT INTO `medicine_info` VALUES (1397, '普罗碘铵注射液', '五官科用药', 22.80, 220, '2ml/支', '无锡济民', 1, '乙');
INSERT INTO `medicine_info` VALUES (1398, '氟米龙滴眼液', '五官科用药', 28.50, 200, '5ml/支', '参天制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1399, '地塞米松磷酸钠滴眼液', '五官科用药', 6.50, 380, '5ml/支', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1400, '糠酸莫米松鼻喷雾剂', '五官科用药', 38.00, 160, '50μg*60喷', '默沙东', 1, '乙');
INSERT INTO `medicine_info` VALUES (1401, '布地奈德鼻喷雾剂', '五官科用药', 32.50, 180, '64μg*120喷', '阿斯利康', 1, '乙');
INSERT INTO `medicine_info` VALUES (1402, '丙酸氟替卡松鼻喷雾剂', '五官科用药', 28.50, 200, '50μg*120喷', '葛兰素史克', 1, '乙');
INSERT INTO `medicine_info` VALUES (1403, '盐酸羟甲唑啉喷雾剂', '五官科用药', 12.50, 300, '10ml/支', '浙江仙琚', 1, '甲');
INSERT INTO `medicine_info` VALUES (1404, '生理性海水鼻腔喷雾', '五官科用药', 18.50, 250, '60ml/瓶', '诺斯清', 1, '乙');
INSERT INTO `medicine_info` VALUES (1405, '色甘萘甲那敏鼻喷雾剂', '五官科用药', 45.00, 140, '10ml/支', '青山利康', 1, '乙');
INSERT INTO `medicine_info` VALUES (1406, '氧氟沙星滴耳液', '五官科用药', 12.50, 300, '5ml/支', '中山制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1407, '氯霉素滴耳液', '五官科用药', 6.50, 380, '8ml/支', '天津药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1408, '硼酸冰片滴耳液', '五官科用药', 8.50, 350, '5ml/支', '湖北广济', 1, '甲');
INSERT INTO `medicine_info` VALUES (1409, '过氧化氢溶液', '五官科用药', 5.50, 400, '100ml/瓶', '北京益民', 1, '甲');
INSERT INTO `medicine_info` VALUES (1410, '开喉剑喷雾剂', '五官科用药', 22.80, 220, '20ml/瓶', '贵州三力', 1, '乙');
INSERT INTO `medicine_info` VALUES (1411, '西瓜霜喷剂', '五官科用药', 8.50, 350, '3.5g/瓶', '三金药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1412, '冰硼散', '五官科用药', 5.50, 400, '3g/瓶', '河南天地', 1, '甲');
INSERT INTO `medicine_info` VALUES (1413, '复方氯己定含漱液', '五官科用药', 12.50, 300, '200ml/瓶', '江苏晨牌', 1, '甲');
INSERT INTO `medicine_info` VALUES (1414, '西地碘含片', '五官科用药', 8.50, 350, '1.5mg*30片', '华素制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1415, '地喹氯铵含片', '五官科用药', 18.50, 250, '0.5mg*24片', '汕头经济特区', 1, '乙');
INSERT INTO `medicine_info` VALUES (1416, '口腔溃疡散', '五官科用药', 5.50, 400, '3g/瓶', '北京同仁堂', 1, '甲');
INSERT INTO `medicine_info` VALUES (1417, '重组人表皮生长因子凝胶', '五官科用药', 28.50, 200, '5g/支', '桂林华诺威', 1, '乙');
INSERT INTO `medicine_info` VALUES (1418, '曲安奈德口腔软膏', '五官科用药', 38.00, 160, '5g/支', '泰国大西洋', 1, '乙');
INSERT INTO `medicine_info` VALUES (1419, '丁硼乳膏', '五官科用药', 8.50, 350, '36g/支', '宁波立华', 1, '甲');
INSERT INTO `medicine_info` VALUES (1420, '甲硝唑口腔粘贴片', '五官科用药', 12.50, 300, '5mg*12片', '贵州安泰', 1, '甲');
INSERT INTO `medicine_info` VALUES (1421, '糠甾醇片', '五官科用药', 6.50, 380, '40mg*100片', '山东鲁抗', 1, '甲');
INSERT INTO `medicine_info` VALUES (1422, '牙痛水', '五官科用药', 5.50, 400, '5ml/瓶', '上海运佳', 1, '甲');
INSERT INTO `medicine_info` VALUES (1423, '复方甘菊利多卡因凝胶', '五官科用药', 28.50, 200, '10g/支', '德国美达', 1, '乙');
INSERT INTO `medicine_info` VALUES (1424, '氢化可的松片', '激素及免疫抗肿瘤用药', 12.50, 300, '20mg*100片', '上药信谊', 1, '甲');
INSERT INTO `medicine_info` VALUES (1425, '氢化可的松注射液', '激素及免疫抗肿瘤用药', 15.80, 260, '100mg/支', '天津药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1426, '醋酸泼尼松片', '激素及免疫抗肿瘤用药', 6.50, 380, '5mg*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1427, '泼尼松龙片', '激素及免疫抗肿瘤用药', 18.50, 250, '5mg*100片', '浙江仙琚', 1, '乙');
INSERT INTO `medicine_info` VALUES (1428, '甲泼尼龙片', '激素及免疫抗肿瘤用药', 45.00, 140, '4mg*30片', '辉瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (1429, '注射用甲泼尼龙琥珀酸钠', '激素及免疫抗肿瘤用药', 38.00, 160, '40mg/支', '辉瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (1430, '地塞米松片', '激素及免疫抗肿瘤用药', 8.50, 350, '0.75mg*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1431, '地塞米松磷酸钠注射液', '激素及免疫抗肿瘤用药', 5.50, 400, '5mg/支', '西南药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1432, '倍他米松片', '激素及免疫抗肿瘤用药', 12.50, 300, '0.5mg*100片', '上药信谊', 1, '甲');
INSERT INTO `medicine_info` VALUES (1433, '复方倍他米松注射液', '激素及免疫抗肿瘤用药', 45.00, 140, '1ml/支', '默沙东', 1, '乙');
INSERT INTO `medicine_info` VALUES (1434, '己烯雌酚片', '激素及免疫抗肿瘤用药', 8.50, 350, '1mg*100片', '上药信谊', 1, '甲');
INSERT INTO `medicine_info` VALUES (1435, '尼尔雌醇片', '激素及免疫抗肿瘤用药', 18.50, 250, '2mg*12片', '上海新华', 1, '乙');
INSERT INTO `medicine_info` VALUES (1436, '黄体酮注射液', '激素及免疫抗肿瘤用药', 8.50, 350, '20mg/支', '浙江仙琚', 1, '甲');
INSERT INTO `medicine_info` VALUES (1437, '醋酸甲羟孕酮片', '激素及免疫抗肿瘤用药', 12.50, 300, '2mg*100片', '上药信谊', 1, '甲');
INSERT INTO `medicine_info` VALUES (1438, '炔诺酮片', '激素及免疫抗肿瘤用药', 12.50, 300, '0.625mg*100片', '上药信谊', 1, '甲');
INSERT INTO `medicine_info` VALUES (1439, '丙酸睾酮注射液', '激素及免疫抗肿瘤用药', 15.80, 260, '25mg/支', '上海通用药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1440, '十一酸睾酮软胶囊', '激素及免疫抗肿瘤用药', 38.00, 160, '40mg*16粒', '欧加农', 1, '乙');
INSERT INTO `medicine_info` VALUES (1441, '环孢素软胶囊', '激素及免疫抗肿瘤用药', 45.00, 140, '25mg*50粒', '华北制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1442, '他克莫司胶囊', '激素及免疫抗肿瘤用药', 58.00, 120, '0.5mg*10粒', '安斯泰来', 1, '乙');
INSERT INTO `medicine_info` VALUES (1443, '吗替麦考酚酯胶囊', '激素及免疫抗肿瘤用药', 65.00, 100, '0.25g*40粒', '罗氏', 1, '谈判');
INSERT INTO `medicine_info` VALUES (1444, '麦考酚钠肠溶片', '激素及免疫抗肿瘤用药', 68.00, 100, '360mg*50片', '诺华', 1, '谈判');
INSERT INTO `medicine_info` VALUES (1445, '硫唑嘌呤片', '激素及免疫抗肿瘤用药', 18.50, 250, '50mg*100片', '上药信谊', 1, '甲');
INSERT INTO `medicine_info` VALUES (1446, '环磷酰胺片', '激素及免疫抗肿瘤用药', 18.50, 250, '50mg*100片', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1447, '雷公藤多苷片', '激素及免疫抗肿瘤用药', 15.80, 260, '10mg*50片', '上海医药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1448, '胸腺肽肠溶片', '激素及免疫抗肿瘤用药', 22.80, 220, '20mg*15片', '黑龙江迪龙', 1, '乙');
INSERT INTO `medicine_info` VALUES (1449, '注射用胸腺法新', '激素及免疫抗肿瘤用药', 58.00, 120, '1.6mg/支', '日达仙', 1, '谈判');
INSERT INTO `medicine_info` VALUES (1450, '转移因子口服溶液', '激素及免疫抗肿瘤用药', 18.50, 250, '10ml*6支', '金花企业', 1, '乙');
INSERT INTO `medicine_info` VALUES (1451, '匹多莫德分散片', '激素及免疫抗肿瘤用药', 28.50, 200, '0.4g*8片', '金城医药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1452, '脾氨肽口服冻干粉', '激素及免疫抗肿瘤用药', 38.00, 160, '2g*5瓶', '复可托', 1, '乙');
INSERT INTO `medicine_info` VALUES (1453, '重组人白介素-2注射液', '激素及免疫抗肿瘤用药', 45.00, 140, '10万IU/支', '双鹭药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (1454, '注射用环磷酰胺', '激素及免疫抗肿瘤用药', 28.50, 200, '0.2g/支', '恒瑞医药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1455, '注射用异环磷酰胺', '激素及免疫抗肿瘤用药', 45.00, 140, '1g/支', '恒瑞医药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1456, '司莫司汀胶囊', '激素及免疫抗肿瘤用药', 38.00, 160, '50mg*5粒', '浙江瑞新', 1, '乙');
INSERT INTO `medicine_info` VALUES (1457, '白消安片', '激素及免疫抗肿瘤用药', 22.80, 220, '2mg*100片', '上药信谊', 1, '乙');
INSERT INTO `medicine_info` VALUES (1458, '甲氨蝶呤片', '激素及免疫抗肿瘤用药', 18.50, 250, '2.5mg*100片', '上药信谊', 1, '甲');
INSERT INTO `medicine_info` VALUES (1459, '注射用甲氨蝶呤', '激素及免疫抗肿瘤用药', 28.50, 200, '5mg/支', '恒瑞医药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1460, '氟尿嘧啶注射液', '激素及免疫抗肿瘤用药', 15.80, 260, '10ml:0.25g', '天津金耀', 1, '甲');
INSERT INTO `medicine_info` VALUES (1461, '卡培他滨片', '激素及免疫抗肿瘤用药', 65.00, 100, '0.5g*12片', '罗氏', 1, '谈判');
INSERT INTO `medicine_info` VALUES (1462, '替吉奥胶囊', '激素及免疫抗肿瘤用药', 58.00, 120, '20mg*28粒', '维维药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (1463, '注射用吉西他滨', '激素及免疫抗肿瘤用药', 58.00, 120, '0.2g/支', '礼来', 1, '乙');
INSERT INTO `medicine_info` VALUES (1464, '注射用多柔比星', '激素及免疫抗肿瘤用药', 45.00, 140, '10mg/支', '海正药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1465, '注射用表柔比星', '激素及免疫抗肿瘤用药', 45.00, 140, '10mg/支', '辉瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (1466, '注射用吡柔比星', '激素及免疫抗肿瘤用药', 38.00, 160, '10mg/支', '深圳万乐', 1, '乙');
INSERT INTO `medicine_info` VALUES (1467, '博来霉素注射液', '激素及免疫抗肿瘤用药', 58.00, 120, '15mg/支', '日本化药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1468, '紫杉醇注射液', '激素及免疫抗肿瘤用药', 58.00, 120, '30mg/支', '恒瑞医药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1469, '多西他赛注射液', '激素及免疫抗肿瘤用药', 65.00, 100, '20mg/支', '赛诺菲', 1, '乙');
INSERT INTO `medicine_info` VALUES (1470, '注射用长春瑞滨', '激素及免疫抗肿瘤用药', 45.00, 140, '10mg/支', '皮尔法伯', 1, '乙');
INSERT INTO `medicine_info` VALUES (1471, '依托泊苷注射液', '激素及免疫抗肿瘤用药', 28.50, 200, '100mg/支', '齐鲁制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1472, '高三尖杉酯碱注射液', '激素及免疫抗肿瘤用药', 32.50, 180, '1mg/支', '上药华联', 1, '甲');
INSERT INTO `medicine_info` VALUES (1473, '吉非替尼片', '激素及免疫抗肿瘤用药', 68.00, 100, '250mg*10片', '阿斯利康', 1, '谈判');
INSERT INTO `medicine_info` VALUES (1474, '厄洛替尼片', '激素及免疫抗肿瘤用药', 98.00, 90, '150mg*7片', '罗氏', 1, '谈判');
INSERT INTO `medicine_info` VALUES (1475, '奥希替尼片', '激素及免疫抗肿瘤用药', 128.00, 80, '80mg*30片', '阿斯利康', 1, '谈判');
INSERT INTO `medicine_info` VALUES (1476, '阿帕替尼片', '激素及免疫抗肿瘤用药', 65.00, 100, '250mg*10片', '恒瑞医药', 1, '谈判');
INSERT INTO `medicine_info` VALUES (1477, '索拉非尼片', '激素及免疫抗肿瘤用药', 98.00, 90, '0.2g*60片', '拜耳', 1, '谈判');
INSERT INTO `medicine_info` VALUES (1478, '盐酸格拉司琼注射液', '激素及免疫抗肿瘤用药', 22.80, 220, '3mg/支', '太极制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1479, '盐酸帕洛诺司琼注射液', '激素及免疫抗肿瘤用药', 45.00, 140, '0.25mg/支', '齐鲁制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1480, '重组人粒细胞刺激因子注射液', '激素及免疫抗肿瘤用药', 38.00, 160, '150μg/支', '齐鲁制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1481, '鲨肝醇片', '激素及免疫抗肿瘤用药', 8.50, 350, '50mg*100片', '江苏鹏鹞', 1, '甲');
INSERT INTO `medicine_info` VALUES (1482, '维生素B4片', '激素及免疫抗肿瘤用药', 6.50, 380, '10mg*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1483, '来氟米特片', '激素及免疫抗肿瘤用药', 28.50, 200, '10mg*14片', '长征欣凯', 1, '乙');
INSERT INTO `medicine_info` VALUES (1484, '柳氮磺吡啶肠溶片', '激素及免疫抗肿瘤用药', 12.50, 300, '0.25g*60片', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1485, '艾拉莫德片', '激素及免疫抗肿瘤用药', 45.00, 140, '25mg*14片', '先声药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (1486, '托法替布片', '激素及免疫抗肿瘤用药', 68.00, 100, '5mg*28片', '辉瑞', 1, '谈判');
INSERT INTO `medicine_info` VALUES (1487, '维生素A软胶囊', '营养补液用药', 6.50, 380, '5000U*100粒', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1488, '维生素B1片', '营养补液用药', 5.50, 400, '10mg*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1489, '维生素B2片', '营养补液用药', 5.50, 400, '5mg*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1490, '维生素B6片', '营养补液用药', 6.50, 380, '10mg*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1491, '维生素B6注射液', '营养补液用药', 5.50, 400, '0.1g/支', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1492, '维生素C片', '营养补液用药', 5.50, 400, '0.1g*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1493, '维生素C注射液', '营养补液用药', 6.50, 380, '2ml:0.5g', '西南药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1494, '维生素D软胶囊', '营养补液用药', 8.50, 350, '400IU*60粒', '青岛双鲸', 1, '乙');
INSERT INTO `medicine_info` VALUES (1495, '维生素E软胶囊', '营养补液用药', 12.50, 300, '100mg*60粒', '浙江医药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1496, '烟酰胺片', '营养补液用药', 8.50, 350, '50mg*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1497, '叶酸片', '营养补液用药', 5.50, 400, '5mg*100片', '天津药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1498, '泛酸钙片', '营养补液用药', 6.50, 380, '10mg*100片', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1499, '复合维生素B片', '营养补液用药', 5.50, 400, '100片/瓶', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1500, '多维元素片21', '营养补液用药', 18.50, 250, '60片/瓶', '杭州民生', 1, '乙');
INSERT INTO `medicine_info` VALUES (1501, '多维元素片29', '营养补液用药', 28.50, 200, '30片/瓶', '善存', 1, '乙');
INSERT INTO `medicine_info` VALUES (1502, '孕妇复合维生素', '营养补液用药', 38.00, 160, '30片/瓶', '爱乐维', 1, '乙');
INSERT INTO `medicine_info` VALUES (1503, '注射用复方维生素', '营养补液用药', 22.80, 220, '1支/瓶', '山西普德', 1, '乙');
INSERT INTO `medicine_info` VALUES (1504, '碳酸钙片', '营养补液用药', 8.50, 350, '0.5g*60片', '江西汇仁', 1, '甲');
INSERT INTO `medicine_info` VALUES (1505, '葡萄糖酸钙片', '营养补液用药', 12.50, 300, '0.5g*48片', '哈药集团', 1, '甲');
INSERT INTO `medicine_info` VALUES (1506, '葡萄糖酸钙口服液', '营养补液用药', 18.50, 250, '10ml*12支', '哈药集团', 1, '乙');
INSERT INTO `medicine_info` VALUES (1507, '乳酸钙片', '营养补液用药', 6.50, 380, '0.25g*100片', '四川迪康', 1, '甲');
INSERT INTO `medicine_info` VALUES (1508, '硫酸亚铁片', '营养补液用药', 8.50, 350, '0.3g*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1509, '葡萄糖酸锌口服液', '营养补液用药', 15.80, 260, '10ml*12支', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (1510, '硒酵母片', '营养补液用药', 12.50, 300, '50μg*50片', '牡丹江灵泰', 1, '乙');
INSERT INTO `medicine_info` VALUES (1511, '硫酸镁注射液', '营养补液用药', 8.50, 350, '10ml:2.5g', '华润三九', 1, '甲');
INSERT INTO `medicine_info` VALUES (1512, '氯化钾缓释片', '营养补液用药', 12.50, 300, '0.5g*48片', '深圳海王', 1, '甲');
INSERT INTO `medicine_info` VALUES (1513, '氯化钾注射液', '营养补液用药', 5.50, 400, '10ml:1g', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1514, '0.9%氯化钠注射液', '营养补液用药', 3.50, 500, '250ml/袋', '科伦药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1515, '0.9%氯化钠注射液', '营养补液用药', 4.50, 480, '500ml/袋', '科伦药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1516, '5%葡萄糖注射液', '营养补液用药', 3.50, 500, '250ml/袋', '科伦药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1517, '5%葡萄糖注射液', '营养补液用药', 4.50, 480, '500ml/袋', '科伦药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1518, '10%葡萄糖注射液', '营养补液用药', 5.50, 400, '250ml/袋', '科伦药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1519, '复方氯化钠注射液', '营养补液用药', 5.50, 400, '500ml/袋', '华源药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1520, '乳酸林格氏液', '营养补液用药', 8.50, 350, '500ml/袋', '山东华鲁', 1, '乙');
INSERT INTO `medicine_info` VALUES (1521, '口服补液盐散', '营养补液用药', 6.50, 380, '14.75g*5袋', '西安安健', 1, '甲');
INSERT INTO `medicine_info` VALUES (1522, '复方氨基酸注射液18AA', '营养补液用药', 22.80, 220, '250ml/瓶', '辰欣药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (1523, '脂肪乳注射液', '营养补液用药', 32.50, 180, '250ml/瓶', '华瑞制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1524, '丙氨酰谷氨酰胺注射液', '营养补液用药', 38.00, 160, '100ml/瓶', '力太', 1, '乙');
INSERT INTO `medicine_info` VALUES (1525, '整蛋白型肠内营养粉', '营养补液用药', 45.00, 140, '500g/罐', '纽迪希亚', 1, '乙');
INSERT INTO `medicine_info` VALUES (1526, '短肽型肠内营养混悬液', '营养补液用药', 58.00, 120, '500ml/瓶', '百普力', 1, '乙');
INSERT INTO `medicine_info` VALUES (1527, '三磷酸腺苷二钠注射液', '营养补液用药', 6.50, 380, '20mg/支', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1528, '辅酶Q10片', '营养补液用药', 22.80, 220, '10mg*30片', '卫材药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (1529, '辅酶A注射液', '营养补液用药', 8.50, 350, '100U/支', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1530, '左卡尼汀口服液', '营养补液用药', 28.50, 200, '10ml*6支', '东北制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1531, '门冬氨酸钾镁注射液', '营养补液用药', 12.50, 300, '10ml/支', '齐鲁制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1532, '马来酸氯苯那敏片', '抗变态反应用药', 5.50, 400, '4mg*100片', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1533, '马来酸氯苯那敏注射液', '抗变态反应用药', 6.50, 380, '1ml:10mg/支', '天津药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1534, '盐酸苯海拉明片', '抗变态反应用药', 6.50, 380, '25mg*100片', '天津药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1535, '盐酸苯海拉明注射液', '抗变态反应用药', 8.50, 350, '1ml:20mg/支', '西南药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1536, '盐酸异丙嗪片', '抗变态反应用药', 8.50, 350, '12.5mg*100片', '上药信谊', 1, '甲');
INSERT INTO `medicine_info` VALUES (1537, '盐酸异丙嗪注射液', '抗变态反应用药', 9.50, 340, '2ml:50mg/支', '上药信谊', 1, '甲');
INSERT INTO `medicine_info` VALUES (1538, '盐酸赛庚啶片', '抗变态反应用药', 7.50, 360, '2mg*100片', '湖南五洲通', 1, '甲');
INSERT INTO `medicine_info` VALUES (1539, '富马酸酮替芬片', '抗变态反应用药', 6.50, 380, '1mg*60片', '江苏鹏鹞', 1, '甲');
INSERT INTO `medicine_info` VALUES (1540, '富马酸酮替芬分散片', '抗变态反应用药', 12.50, 300, '1mg*24片', '山东罗欣', 1, '乙');
INSERT INTO `medicine_info` VALUES (1541, '氯雷他定片', '抗变态反应用药', 12.50, 300, '10mg*6片', '拜耳', 1, '甲');
INSERT INTO `medicine_info` VALUES (1542, '氯雷他定胶囊', '抗变态反应用药', 15.80, 260, '10mg*12粒', '山东新时代', 1, '乙');
INSERT INTO `medicine_info` VALUES (1543, '氯雷他定糖浆', '抗变态反应用药', 18.50, 250, '60ml/瓶', '拜耳', 1, '乙');
INSERT INTO `medicine_info` VALUES (1544, '地氯雷他定片', '抗变态反应用药', 18.50, 250, '5mg*12片', '海南普利', 1, '乙');
INSERT INTO `medicine_info` VALUES (1545, '地氯雷他定干混悬剂', '抗变态反应用药', 26.80, 210, '0.5g*10袋', '广东华润', 1, '乙');
INSERT INTO `medicine_info` VALUES (1546, '盐酸西替利嗪片', '抗变态反应用药', 8.50, 350, '10mg*12片', '鲁南制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1547, '盐酸西替利嗪滴剂', '抗变态反应用药', 19.80, 240, '10ml/瓶', '意大利菲尔', 1, '乙');
INSERT INTO `medicine_info` VALUES (1548, '盐酸左西替利嗪片', '抗变态反应用药', 18.50, 250, '5mg*12片', '鲁南制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1549, '盐酸左西替利嗪口服液', '抗变态反应用药', 22.80, 220, '10ml*6支', '重庆华邦', 1, '乙');
INSERT INTO `medicine_info` VALUES (1550, '依巴斯汀片', '抗变态反应用药', 28.50, 200, '10mg*7片', '杭州澳医保灵', 1, '乙');
INSERT INTO `medicine_info` VALUES (1551, '依巴斯汀干混悬剂', '抗变态反应用药', 32.50, 180, '0.625g*12袋', '西班牙艾美罗', 1, '乙');
INSERT INTO `medicine_info` VALUES (1552, '咪唑斯汀缓释片', '抗变态反应用药', 28.50, 200, '10mg*14片', '法国施维雅', 1, '乙');
INSERT INTO `medicine_info` VALUES (1553, '非索非那定片', '抗变态反应用药', 22.80, 220, '60mg*12片', '江苏恒瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (1554, '非索非那定胶囊', '抗变态反应用药', 26.80, 210, '60mg*12粒', '浙江万晟', 1, '乙');
INSERT INTO `medicine_info` VALUES (1555, '孟鲁司特钠片', '抗变态反应用药', 22.80, 220, '10mg*7片', '默沙东', 1, '乙');
INSERT INTO `medicine_info` VALUES (1556, '孟鲁司特钠咀嚼片', '抗变态反应用药', 28.50, 200, '5mg*7片', '默沙东', 1, '乙');
INSERT INTO `medicine_info` VALUES (1557, '孟鲁司特钠颗粒', '抗变态反应用药', 38.00, 160, '4mg*14袋', '默沙东', 1, '乙');
INSERT INTO `medicine_info` VALUES (1558, '扎鲁司特片', '抗变态反应用药', 32.50, 180, '20mg*14片', '阿斯利康', 1, '乙');
INSERT INTO `medicine_info` VALUES (1559, '色甘酸钠胶囊', '抗变态反应用药', 12.50, 300, '20mg*24粒', '山东鲁抗', 1, '甲');
INSERT INTO `medicine_info` VALUES (1560, '色甘酸钠气雾剂', '抗变态反应用药', 22.80, 220, '14g/瓶', '上海上药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1561, '曲尼司特胶囊', '抗变态反应用药', 18.50, 250, '0.1g*24粒', '中国药大', 1, '乙');
INSERT INTO `medicine_info` VALUES (1562, '复方甘草酸苷片', '抗变态反应用药', 28.50, 200, '25mg*30片', '日本米诺发源', 1, '乙');
INSERT INTO `medicine_info` VALUES (1563, '复方甘草酸苷注射液', '抗变态反应用药', 22.80, 220, '20ml/支', '美能', 1, '乙');
INSERT INTO `medicine_info` VALUES (1564, '白芍总苷胶囊', '抗变态反应用药', 22.80, 220, '0.3g*36粒', '宁波立华', 1, '乙');
INSERT INTO `medicine_info` VALUES (1565, '粉尘螨滴剂', '抗变态反应用药', 58.00, 120, '10ml/瓶', '浙江我武生物', 1, '乙');
INSERT INTO `medicine_info` VALUES (1566, '屋尘螨变应原制剂', '抗变态反应用药', 65.00, 100, '5ml/瓶', '丹麦爱尔开', 1, '谈判');
INSERT INTO `medicine_info` VALUES (1567, '盐酸纳洛酮注射液', '解毒用药', 38.00, 160, '0.4mg/支', '成都倍特', 1, '乙');
INSERT INTO `medicine_info` VALUES (1568, '盐酸纳美芬注射液', '解毒用药', 45.00, 140, '0.1mg/支', '辽宁海思科', 1, '乙');
INSERT INTO `medicine_info` VALUES (1569, '硫代硫酸钠注射液', '解毒用药', 8.50, 350, '10ml:0.5g', '西南药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1570, '亚甲蓝注射液', '解毒用药', 15.80, 260, '2ml:20mg', '江苏济川', 1, '甲');
INSERT INTO `medicine_info` VALUES (1571, '依地酸钙钠注射液', '解毒用药', 22.80, 220, '5ml:1g', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1572, '二巯丙磺钠注射液', '解毒用药', 18.50, 250, '2ml:0.125g', '上海禾丰', 1, '甲');
INSERT INTO `medicine_info` VALUES (1573, '氟马西尼注射液', '解毒用药', 45.00, 140, '5ml:0.5mg', '浙江仙琚', 1, '乙');
INSERT INTO `medicine_info` VALUES (1574, '乙酰半胱氨酸注射液', '解毒用药', 28.50, 200, '4g/瓶', '海南灵康', 1, '乙');
INSERT INTO `medicine_info` VALUES (1575, '注射用还原型谷胱甘肽', '解毒用药', 22.80, 220, '1.2g/支', '重庆药友', 1, '乙');
INSERT INTO `medicine_info` VALUES (1576, '药用炭片', '解毒用药', 12.50, 300, '0.3g*100片', '河北长天', 1, '甲');
INSERT INTO `medicine_info` VALUES (1577, '蒙脱石散', '解毒用药', 8.50, 350, '3g*10袋', '博福-益普生', 1, '甲');
INSERT INTO `medicine_info` VALUES (1578, '硫酸阿托品注射液', '解毒用药', 5.50, 400, '1ml:0.5mg', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1579, '盐酸氯解磷定注射液', '解毒用药', 12.50, 300, '2ml:0.5g', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1580, '乳果糖口服溶液', '解毒用药', 28.50, 200, '15ml*6袋', '苏威制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1581, '盐酸利多卡因注射液', '麻醉镇痛用药', 6.50, 380, '5ml:0.1g', '华北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1582, '盐酸罗哌卡因注射液', '麻醉镇痛用药', 28.50, 200, '10ml:75mg', '阿斯利康', 1, '乙');
INSERT INTO `medicine_info` VALUES (1583, '盐酸布比卡因注射液', '麻醉镇痛用药', 22.80, 220, '5ml:25mg', '山东华鲁', 1, '乙');
INSERT INTO `medicine_info` VALUES (1584, '盐酸左布比卡因注射液', '麻醉镇痛用药', 32.50, 180, '5ml:37.5mg', '江苏恒瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (1585, '盐酸丁卡因注射液', '麻醉镇痛用药', 15.80, 260, '5ml:50mg', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1586, '苯佐卡因凝胶', '麻醉镇痛用药', 12.50, 300, '10g/支', '湖北恒安', 1, '乙');
INSERT INTO `medicine_info` VALUES (1587, '丙泊酚注射液', '麻醉镇痛用药', 38.00, 160, '20ml:0.2g', '西安力邦', 1, '乙');
INSERT INTO `medicine_info` VALUES (1588, '依托咪酯注射液', '麻醉镇痛用药', 45.00, 140, '10ml:20mg', '江苏恩华', 1, '乙');
INSERT INTO `medicine_info` VALUES (1589, '七氟烷吸入溶液', '麻醉镇痛用药', 68.00, 100, '100ml/瓶', '丸石制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1590, '异氟烷吸入溶液', '麻醉镇痛用药', 58.00, 120, '100ml/瓶', '鲁南制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1591, '盐酸吗啡注射液', '麻醉镇痛用药', 45.00, 140, '1ml:10mg', '东北制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1592, '盐酸哌替啶注射液', '麻醉镇痛用药', 28.50, 200, '2ml:100mg', '宜昌人福', 1, '甲');
INSERT INTO `medicine_info` VALUES (1593, '枸橼酸芬太尼注射液', '麻醉镇痛用药', 38.00, 160, '2ml:0.1mg', '宜昌人福', 1, '乙');
INSERT INTO `medicine_info` VALUES (1594, '舒芬太尼注射液', '麻醉镇痛用药', 58.00, 120, '5ml:50μg', '宜昌人福', 1, '乙');
INSERT INTO `medicine_info` VALUES (1595, '瑞芬太尼注射用粉针', '麻醉镇痛用药', 65.00, 100, '1mg/支', '江苏恩华', 1, '乙');
INSERT INTO `medicine_info` VALUES (1596, '盐酸曲马多注射液', '麻醉镇痛用药', 18.50, 250, '2ml:100mg', '石药集团', 1, '甲');
INSERT INTO `medicine_info` VALUES (1597, '盐酸曲马多缓释片', '麻醉镇痛用药', 22.80, 220, '0.1g*10片', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (1598, '氨酚曲马多片', '麻醉镇痛用药', 26.80, 210, '12片/盒', '西安杨森', 1, '乙');
INSERT INTO `medicine_info` VALUES (1599, '氟比洛芬酯注射液', '麻醉镇痛用药', 32.50, 180, '5ml:50mg', '北京泰德', 1, '乙');
INSERT INTO `medicine_info` VALUES (1600, '帕瑞昔布钠注射用粉针', '麻醉镇痛用药', 38.00, 160, '40mg/支', '江苏恒瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (1601, '酮咯酸氨丁三醇注射液', '麻醉镇痛用药', 28.50, 200, '1ml:30mg', '山东罗欣', 1, '乙');
INSERT INTO `medicine_info` VALUES (1602, '加巴喷丁胶囊', '麻醉镇痛用药', 22.80, 220, '0.1g*24粒', '江苏恒瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (1603, '普瑞巴林胶囊', '麻醉镇痛用药', 38.00, 160, '75mg*14粒', '辉瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (1604, '盐酸度洛西汀肠溶胶囊', '麻醉镇痛用药', 45.00, 140, '20mg*28粒', '礼来', 1, '乙');
INSERT INTO `medicine_info` VALUES (1605, '甲硝唑栓', '妇科用药', 8.50, 350, '0.5g*10枚', '白云山', 1, '甲');
INSERT INTO `medicine_info` VALUES (1606, '甲硝唑阴道泡腾片', '妇科用药', 9.80, 330, '0.2g*14片', '华润三九', 1, '甲');
INSERT INTO `medicine_info` VALUES (1607, '替硝唑栓', '妇科用药', 15.80, 260, '1g*6枚', '江苏远恒', 1, '乙');
INSERT INTO `medicine_info` VALUES (1608, '克林霉素磷酸酯阴道凝胶', '妇科用药', 22.80, 220, '5g/支', '湖北恒安', 1, '乙');
INSERT INTO `medicine_info` VALUES (1609, '克霉唑栓', '妇科用药', 12.50, 300, '0.15g*10枚', '千金药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1610, '克霉唑阴道片', '妇科用药', 18.50, 250, '0.5g*1片', '拜耳', 1, '乙');
INSERT INTO `medicine_info` VALUES (1611, '硝酸咪康唑栓', '妇科用药', 15.80, 260, '0.2g*7枚', '西安杨森', 1, '甲');
INSERT INTO `medicine_info` VALUES (1612, '制霉菌素片', '妇科用药', 8.50, 350, '50万U*100片', '鲁抗医药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1613, '氟康唑阴道软胶囊', '妇科用药', 26.80, 210, '0.15g*6粒', '山东新时代', 1, '乙');
INSERT INTO `medicine_info` VALUES (1614, '硝呋太尔片', '妇科用药', 19.80, 240, '0.2g*20片', '意大利多帕', 1, '乙');
INSERT INTO `medicine_info` VALUES (1615, '硝呋太尔制霉素阴道软胶囊', '妇科用药', 22.80, 220, '6粒/盒', '北京朗依', 1, '乙');
INSERT INTO `medicine_info` VALUES (1616, '复方沙棘籽油栓', '妇科用药', 25.80, 210, '2.7g*6枚', '陕西海天', 1, '乙');
INSERT INTO `medicine_info` VALUES (1617, '保妇康栓', '妇科用药', 18.50, 250, '1.74g*8枚', '海南碧凯', 1, '甲');
INSERT INTO `medicine_info` VALUES (1618, '消糜栓', '妇科用药', 22.80, 220, '3g*5枚', '通化万通', 1, '甲');
INSERT INTO `medicine_info` VALUES (1619, '抗宫炎片', '妇科用药', 12.50, 300, '60片/瓶', '江西诚志', 1, '甲');
INSERT INTO `medicine_info` VALUES (1620, '妇科千金片', '妇科用药', 15.80, 260, '108片/盒', '千金药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1621, '金刚藤胶囊', '妇科用药', 18.50, 250, '0.5g*24粒', '湖北福人', 1, '乙');
INSERT INTO `medicine_info` VALUES (1622, '红核妇洁洗液', '妇科用药', 28.50, 200, '150ml/瓶', '山东步长', 1, '乙');
INSERT INTO `medicine_info` VALUES (1623, '洁尔阴洗液', '妇科用药', 12.50, 300, '240ml/瓶', '四川恩威', 1, '甲');
INSERT INTO `medicine_info` VALUES (1624, '妇炎洁洗液', '妇科用药', 9.80, 330, '300ml/瓶', '仁和药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1625, '聚甲酚磺醛溶液', '妇科用药', 32.50, 180, '25ml/瓶', '德国百克顿', 1, '乙');
INSERT INTO `medicine_info` VALUES (1626, '益母草颗粒', '妇科用药', 8.50, 350, '15g*10袋', '云南白药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1627, '益母草注射液', '妇科用药', 12.50, 300, '2ml/支', '成都第一', 1, '甲');
INSERT INTO `medicine_info` VALUES (1628, '缩宫素注射液', '妇科用药', 8.50, 350, '1ml:10U', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1629, '宫血宁胶囊', '妇科用药', 15.80, 260, '0.13g*18粒', '云南白药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1630, '断血流分散片', '妇科用药', 18.50, 250, '0.5g*24片', '湖南九典', 1, '乙');
INSERT INTO `medicine_info` VALUES (1631, '黄体酮软胶囊', '妇科用药', 28.50, 200, '100mg*12粒', '浙江仙琚', 1, '乙');
INSERT INTO `medicine_info` VALUES (1632, '地屈孕酮片', '妇科用药', 38.00, 160, '10mg*20片', '荷兰雅培', 1, '乙');
INSERT INTO `medicine_info` VALUES (1633, '坤宝丸', '妇科用药', 19.80, 240, '50丸*10袋', '北京同仁堂', 1, '乙');
INSERT INTO `medicine_info` VALUES (1634, '甲硝唑栓', '妇科用药', 8.50, 350, '0.5g*10枚', '白云山', 1, '甲');
INSERT INTO `medicine_info` VALUES (1635, '甲硝唑阴道泡腾片', '妇科用药', 9.80, 330, '0.2g*14片', '华润三九', 1, '甲');
INSERT INTO `medicine_info` VALUES (1636, '替硝唑栓', '妇科用药', 15.80, 260, '1g*6枚', '江苏远恒', 1, '乙');
INSERT INTO `medicine_info` VALUES (1637, '克林霉素磷酸酯阴道凝胶', '妇科用药', 22.80, 220, '5g/支', '湖北恒安', 1, '乙');
INSERT INTO `medicine_info` VALUES (1638, '克霉唑栓', '妇科用药', 12.50, 300, '0.15g*10枚', '千金药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1639, '克霉唑阴道片', '妇科用药', 18.50, 250, '0.5g*1片', '拜耳', 1, '乙');
INSERT INTO `medicine_info` VALUES (1640, '硝酸咪康唑栓', '妇科用药', 15.80, 260, '0.2g*7枚', '西安杨森', 1, '甲');
INSERT INTO `medicine_info` VALUES (1641, '制霉菌素片', '妇科用药', 8.50, 350, '50万U*100片', '鲁抗医药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1642, '氟康唑阴道软胶囊', '妇科用药', 26.80, 210, '0.15g*6粒', '山东新时代', 1, '乙');
INSERT INTO `medicine_info` VALUES (1643, '硝呋太尔片', '妇科用药', 19.80, 240, '0.2g*20片', '意大利多帕', 1, '乙');
INSERT INTO `medicine_info` VALUES (1644, '硝呋太尔制霉素阴道软胶囊', '妇科用药', 22.80, 220, '6粒/盒', '北京朗依', 1, '乙');
INSERT INTO `medicine_info` VALUES (1645, '复方沙棘籽油栓', '妇科用药', 25.80, 210, '2.7g*6枚', '陕西海天', 1, '乙');
INSERT INTO `medicine_info` VALUES (1646, '保妇康栓', '妇科用药', 18.50, 250, '1.74g*8枚', '海南碧凯', 1, '甲');
INSERT INTO `medicine_info` VALUES (1647, '消糜栓', '妇科用药', 22.80, 220, '3g*5枚', '通化万通', 1, '甲');
INSERT INTO `medicine_info` VALUES (1648, '抗宫炎片', '妇科用药', 12.50, 300, '60片/瓶', '江西诚志', 1, '甲');
INSERT INTO `medicine_info` VALUES (1649, '妇科千金片', '妇科用药', 15.80, 260, '108片/盒', '千金药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1650, '金刚藤胶囊', '妇科用药', 18.50, 250, '0.5g*24粒', '湖北福人', 1, '乙');
INSERT INTO `medicine_info` VALUES (1651, '红核妇洁洗液', '妇科用药', 28.50, 200, '150ml/瓶', '山东步长', 1, '乙');
INSERT INTO `medicine_info` VALUES (1652, '洁尔阴洗液', '妇科用药', 12.50, 300, '240ml/瓶', '四川恩威', 1, '甲');
INSERT INTO `medicine_info` VALUES (1653, '妇炎洁洗液', '妇科用药', 9.80, 330, '300ml/瓶', '仁和药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1654, '聚甲酚磺醛溶液', '妇科用药', 32.50, 180, '25ml/瓶', '德国百克顿', 1, '乙');
INSERT INTO `medicine_info` VALUES (1655, '益母草颗粒', '妇科用药', 8.50, 350, '15g*10袋', '云南白药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1656, '益母草注射液', '妇科用药', 12.50, 300, '2ml/支', '成都第一', 1, '甲');
INSERT INTO `medicine_info` VALUES (1657, '缩宫素注射液', '妇科用药', 8.50, 350, '1ml:10U', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1658, '宫血宁胶囊', '妇科用药', 15.80, 260, '0.13g*18粒', '云南白药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1659, '断血流分散片', '妇科用药', 18.50, 250, '0.5g*24片', '湖南九典', 1, '乙');
INSERT INTO `medicine_info` VALUES (1660, '黄体酮软胶囊', '妇科用药', 28.50, 200, '100mg*12粒', '浙江仙琚', 1, '乙');
INSERT INTO `medicine_info` VALUES (1661, '地屈孕酮片', '妇科用药', 38.00, 160, '10mg*20片', '荷兰雅培', 1, '乙');
INSERT INTO `medicine_info` VALUES (1662, '坤宝丸', '妇科用药', 19.80, 240, '50丸*10袋', '北京同仁堂', 1, '乙');
INSERT INTO `medicine_info` VALUES (1663, '甲硝唑栓', '妇科用药', 8.50, 350, '0.5g*10枚', '白云山', 1, '甲');
INSERT INTO `medicine_info` VALUES (1664, '甲硝唑阴道泡腾片', '妇科用药', 9.80, 330, '0.2g*14片', '华润三九', 1, '甲');
INSERT INTO `medicine_info` VALUES (1665, '替硝唑栓', '妇科用药', 15.80, 260, '1g*6枚', '江苏远恒', 1, '乙');
INSERT INTO `medicine_info` VALUES (1666, '克林霉素磷酸酯阴道凝胶', '妇科用药', 22.80, 220, '5g/支', '湖北恒安', 1, '乙');
INSERT INTO `medicine_info` VALUES (1667, '克霉唑栓', '妇科用药', 12.50, 300, '0.15g*10枚', '千金药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1668, '克霉唑阴道片', '妇科用药', 18.50, 250, '0.5g*1片', '拜耳', 1, '乙');
INSERT INTO `medicine_info` VALUES (1669, '硝酸咪康唑栓', '妇科用药', 15.80, 260, '0.2g*7枚', '西安杨森', 1, '甲');
INSERT INTO `medicine_info` VALUES (1670, '制霉菌素片', '妇科用药', 8.50, 350, '50万U*100片', '鲁抗医药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1671, '氟康唑阴道软胶囊', '妇科用药', 26.80, 210, '0.15g*6粒', '山东新时代', 1, '乙');
INSERT INTO `medicine_info` VALUES (1672, '硝呋太尔片', '妇科用药', 19.80, 240, '0.2g*20片', '意大利多帕', 1, '乙');
INSERT INTO `medicine_info` VALUES (1673, '硝呋太尔制霉素阴道软胶囊', '妇科用药', 22.80, 220, '6粒/盒', '北京朗依', 1, '乙');
INSERT INTO `medicine_info` VALUES (1674, '复方沙棘籽油栓', '妇科用药', 25.80, 210, '2.7g*6枚', '陕西海天', 1, '乙');
INSERT INTO `medicine_info` VALUES (1675, '保妇康栓', '妇科用药', 18.50, 250, '1.74g*8枚', '海南碧凯', 1, '甲');
INSERT INTO `medicine_info` VALUES (1676, '消糜栓', '妇科用药', 22.80, 220, '3g*5枚', '通化万通', 1, '甲');
INSERT INTO `medicine_info` VALUES (1677, '抗宫炎片', '妇科用药', 12.50, 300, '60片/瓶', '江西诚志', 1, '甲');
INSERT INTO `medicine_info` VALUES (1678, '妇科千金片', '妇科用药', 15.80, 260, '108片/盒', '千金药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1679, '金刚藤胶囊', '妇科用药', 18.50, 250, '0.5g*24粒', '湖北福人', 1, '乙');
INSERT INTO `medicine_info` VALUES (1680, '红核妇洁洗液', '妇科用药', 28.50, 200, '150ml/瓶', '山东步长', 1, '乙');
INSERT INTO `medicine_info` VALUES (1681, '洁尔阴洗液', '妇科用药', 12.50, 300, '240ml/瓶', '四川恩威', 1, '甲');
INSERT INTO `medicine_info` VALUES (1682, '妇炎洁洗液', '妇科用药', 9.80, 330, '300ml/瓶', '仁和药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1683, '聚甲酚磺醛溶液', '妇科用药', 32.50, 180, '25ml/瓶', '德国百克顿', 1, '乙');
INSERT INTO `medicine_info` VALUES (1684, '益母草颗粒', '妇科用药', 8.50, 350, '15g*10袋', '云南白药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1685, '益母草注射液', '妇科用药', 12.50, 300, '2ml/支', '成都第一', 1, '甲');
INSERT INTO `medicine_info` VALUES (1686, '缩宫素注射液', '妇科用药', 8.50, 350, '1ml:10U', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1687, '宫血宁胶囊', '妇科用药', 15.80, 260, '0.13g*18粒', '云南白药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1688, '断血流分散片', '妇科用药', 18.50, 250, '0.5g*24片', '湖南九典', 1, '乙');
INSERT INTO `medicine_info` VALUES (1689, '黄体酮软胶囊', '妇科用药', 28.50, 200, '100mg*12粒', '浙江仙琚', 1, '乙');
INSERT INTO `medicine_info` VALUES (1690, '地屈孕酮片', '妇科用药', 38.00, 160, '10mg*20片', '荷兰雅培', 1, '乙');
INSERT INTO `medicine_info` VALUES (1691, '坤宝丸', '妇科用药', 19.80, 240, '50丸*10袋', '北京同仁堂', 1, '乙');
INSERT INTO `medicine_info` VALUES (1692, '小儿氨酚黄那敏颗粒', '儿科用药', 8.50, 350, '12袋/盒', '葵花药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1693, '小儿氨酚烷胺颗粒', '儿科用药', 9.50, 340, '12袋/盒', '仁和药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1694, '小儿柴桂退热颗粒', '儿科用药', 12.50, 300, '5g*10袋', '河南辅仁', 1, '甲');
INSERT INTO `medicine_info` VALUES (1695, '小儿豉翘清热颗粒', '儿科用药', 28.50, 200, '2g*6袋', '济川药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (1696, '儿童回春颗粒', '儿科用药', 15.80, 260, '5g*12袋', '贵州汉方', 1, '乙');
INSERT INTO `medicine_info` VALUES (1697, '布洛芬混悬液', '儿科用药', 12.50, 300, '100ml/瓶', '美林', 1, '甲');
INSERT INTO `medicine_info` VALUES (1698, '对乙酰氨基酚混悬滴剂', '儿科用药', 15.80, 260, '15ml/瓶', '泰诺林', 1, '甲');
INSERT INTO `medicine_info` VALUES (1699, '氨溴特罗口服溶液', '儿科用药', 19.80, 240, '100ml/瓶', '北京韩美', 1, '乙');
INSERT INTO `medicine_info` VALUES (1700, '盐酸氨溴索口服溶液', '儿科用药', 12.50, 300, '100ml/瓶', '山东罗欣', 1, '甲');
INSERT INTO `medicine_info` VALUES (1701, '小儿肺咳颗粒', '儿科用药', 18.50, 250, '3g*12袋', '天圣制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1702, '小儿消积止咳口服液', '儿科用药', 22.80, 220, '10ml*6支', '鲁南制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1703, '复方福尔可定口服溶液', '儿科用药', 26.80, 210, '100ml/瓶', '香港澳美', 1, '乙');
INSERT INTO `medicine_info` VALUES (1704, '醒脾养儿颗粒', '儿科用药', 22.80, 220, '2g*12袋', '贵州健兴', 1, '乙');
INSERT INTO `medicine_info` VALUES (1705, '小儿健脾化积口服液', '儿科用药', 25.80, 210, '10ml*12支', '吉林益盛', 1, '乙');
INSERT INTO `medicine_info` VALUES (1706, '婴儿健脾散', '儿科用药', 8.50, 350, '1g*12袋', '葵花药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1707, '小儿麦枣咀嚼片', '儿科用药', 12.50, 300, '0.45g*60片', '葵花药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1708, '蒙脱石散', '儿科用药', 8.50, 350, '3g*10袋', '博福-益普生', 1, '甲');
INSERT INTO `medicine_info` VALUES (1709, '布拉氏酵母菌散', '儿科用药', 38.00, 160, '0.25g*6袋', '法国百科达', 1, '乙');
INSERT INTO `medicine_info` VALUES (1710, '地衣芽孢杆菌活菌颗粒', '儿科用药', 18.50, 250, '0.25g*12袋', '东北制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1711, '双歧杆菌三联活菌散', '儿科用药', 22.80, 220, '1g*7袋', '上海信谊', 1, '乙');
INSERT INTO `medicine_info` VALUES (1712, '消旋卡多曲颗粒', '儿科用药', 19.80, 240, '10mg*12袋', '四川百利', 1, '乙');
INSERT INTO `medicine_info` VALUES (1713, '阿莫西林颗粒', '儿科用药', 15.80, 260, '0.125g*12袋', '葵花药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1714, '头孢克洛干混悬剂', '儿科用药', 28.50, 200, '0.125g*6袋', '礼来', 1, '乙');
INSERT INTO `medicine_info` VALUES (1715, '阿奇霉素干混悬剂', '儿科用药', 26.80, 210, '0.1g*6袋', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (1716, '复方碳酸钙泡腾颗粒', '儿科用药', 22.80, 220, '1.5g*30袋', '迪巧', 1, '乙');
INSERT INTO `medicine_info` VALUES (1717, '维生素D3滴剂', '儿科用药', 18.50, 250, '400IU*30粒', '青岛双鲸', 1, '乙');
INSERT INTO `medicine_info` VALUES (1718, '葡萄糖酸钙口服溶液', '儿科用药', 18.50, 250, '10ml*12支', '哈药集团', 1, '乙');
INSERT INTO `medicine_info` VALUES (1719, '复方左炔诺孕酮片', '生殖避孕用药', 12.50, 300, '22片/盒', '华润紫竹', 1, '甲');
INSERT INTO `medicine_info` VALUES (1720, '去氧孕烯炔雌醇片', '生殖避孕用药', 28.50, 200, '21片/盒', '荷兰欧加农', 1, '乙');
INSERT INTO `medicine_info` VALUES (1721, '炔雌醇环丙孕酮片', '生殖避孕用药', 38.00, 160, '21片/盒', '拜耳', 1, '乙');
INSERT INTO `medicine_info` VALUES (1722, '复方炔诺酮片', '生殖避孕用药', 9.50, 330, '22片/盒', '上药信谊', 1, '甲');
INSERT INTO `medicine_info` VALUES (1723, '左炔诺孕酮片', '生殖避孕用药', 28.50, 200, '1片/盒', '华润紫竹', 1, '乙');
INSERT INTO `medicine_info` VALUES (1724, '左炔诺孕酮肠溶片', '生殖避孕用药', 32.50, 180, '1片/盒', '广州朗圣', 1, '乙');
INSERT INTO `medicine_info` VALUES (1725, '米非司酮片紧急避孕', '生殖避孕用药', 25.80, 210, '10mg*1片', '湖北葛店', 1, '乙');
INSERT INTO `medicine_info` VALUES (1726, '米非司酮片', '生殖避孕用药', 32.50, 180, '25mg*6片', '湖北葛店', 1, '乙');
INSERT INTO `medicine_info` VALUES (1727, '米索前列醇片', '生殖避孕用药', 18.50, 250, '0.2mg*3片', '新华联药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1728, '生精胶囊', '生殖避孕用药', 45.00, 140, '0.4g*24粒', '遵义廖元和堂', 1, '乙');
INSERT INTO `medicine_info` VALUES (1729, '麒麟丸', '生殖避孕用药', 38.00, 160, '90g/瓶', '广东太安堂', 1, '乙');
INSERT INTO `medicine_info` VALUES (1730, '复方玄驹胶囊', '生殖避孕用药', 28.50, 200, '0.42g*36粒', '浙江施强', 1, '乙');
INSERT INTO `medicine_info` VALUES (1731, '枸橼酸氯米芬胶囊', '生殖避孕用药', 22.80, 220, '50mg*15粒', '上海衡山', 1, '乙');
INSERT INTO `medicine_info` VALUES (1732, '来曲唑片', '生殖避孕用药', 38.00, 160, '2.5mg*10片', '江苏恒瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (1733, '壬苯醇醚栓', '生殖避孕用药', 15.80, 260, '10枚/盒', '天津药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (1734, '壬苯醇醚凝胶', '生殖避孕用药', 19.80, 240, '3g/支', '江苏远恒', 1, '乙');
INSERT INTO `medicine_info` VALUES (1735, '甲硝唑栓', '妇科用药', 8.50, 350, '0.5g*10枚', '白云山', 1, '甲');
INSERT INTO `medicine_info` VALUES (1736, '甲硝唑阴道泡腾片', '妇科用药', 9.80, 330, '0.2g*14片', '华润三九', 1, '甲');
INSERT INTO `medicine_info` VALUES (1737, '替硝唑栓', '妇科用药', 15.80, 260, '1g*6枚', '江苏远恒', 1, '乙');
INSERT INTO `medicine_info` VALUES (1738, '克林霉素磷酸酯阴道凝胶', '妇科用药', 22.80, 220, '5g/支', '湖北恒安', 1, '乙');
INSERT INTO `medicine_info` VALUES (1739, '克霉唑栓', '妇科用药', 12.50, 300, '0.15g*10枚', '千金药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1740, '克霉唑阴道片', '妇科用药', 18.50, 250, '0.5g*1片', '拜耳', 1, '乙');
INSERT INTO `medicine_info` VALUES (1741, '硝酸咪康唑栓', '妇科用药', 15.80, 260, '0.2g*7枚', '西安杨森', 1, '甲');
INSERT INTO `medicine_info` VALUES (1742, '制霉菌素片', '妇科用药', 8.50, 350, '50万U*100片', '鲁抗医药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1743, '氟康唑阴道软胶囊', '妇科用药', 26.80, 210, '0.15g*6粒', '山东新时代', 1, '乙');
INSERT INTO `medicine_info` VALUES (1744, '硝呋太尔片', '妇科用药', 19.80, 240, '0.2g*20片', '意大利多帕', 1, '乙');
INSERT INTO `medicine_info` VALUES (1745, '硝呋太尔制霉素阴道软胶囊', '妇科用药', 22.80, 220, '6粒/盒', '北京朗依', 1, '乙');
INSERT INTO `medicine_info` VALUES (1746, '复方沙棘籽油栓', '妇科用药', 25.80, 210, '2.7g*6枚', '陕西海天', 1, '乙');
INSERT INTO `medicine_info` VALUES (1747, '保妇康栓', '妇科用药', 18.50, 250, '1.74g*8枚', '海南碧凯', 1, '甲');
INSERT INTO `medicine_info` VALUES (1748, '消糜栓', '妇科用药', 22.80, 220, '3g*5枚', '通化万通', 1, '甲');
INSERT INTO `medicine_info` VALUES (1749, '抗宫炎片', '妇科用药', 12.50, 300, '60片/瓶', '江西诚志', 1, '甲');
INSERT INTO `medicine_info` VALUES (1750, '妇科千金片', '妇科用药', 15.80, 260, '108片/盒', '千金药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1751, '金刚藤胶囊', '妇科用药', 18.50, 250, '0.5g*24粒', '湖北福人', 1, '乙');
INSERT INTO `medicine_info` VALUES (1752, '红核妇洁洗液', '妇科用药', 28.50, 200, '150ml/瓶', '山东步长', 1, '乙');
INSERT INTO `medicine_info` VALUES (1753, '洁尔阴洗液', '妇科用药', 12.50, 300, '240ml/瓶', '四川恩威', 1, '甲');
INSERT INTO `medicine_info` VALUES (1754, '妇炎洁洗液', '妇科用药', 9.80, 330, '300ml/瓶', '仁和药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1755, '聚甲酚磺醛溶液', '妇科用药', 32.50, 180, '25ml/瓶', '德国百克顿', 1, '乙');
INSERT INTO `medicine_info` VALUES (1756, '益母草颗粒', '妇科用药', 8.50, 350, '15g*10袋', '云南白药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1757, '益母草注射液', '妇科用药', 12.50, 300, '2ml/支', '成都第一', 1, '甲');
INSERT INTO `medicine_info` VALUES (1758, '缩宫素注射液', '妇科用药', 8.50, 350, '1ml:10U', '上海上药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1759, '宫血宁胶囊', '妇科用药', 15.80, 260, '0.13g*18粒', '云南白药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1760, '断血流分散片', '妇科用药', 18.50, 250, '0.5g*24片', '湖南九典', 1, '乙');
INSERT INTO `medicine_info` VALUES (1761, '黄体酮软胶囊', '妇科用药', 28.50, 200, '100mg*12粒', '浙江仙琚', 1, '乙');
INSERT INTO `medicine_info` VALUES (1762, '地屈孕酮片', '妇科用药', 38.00, 160, '10mg*20片', '荷兰雅培', 1, '乙');
INSERT INTO `medicine_info` VALUES (1763, '坤宝丸', '妇科用药', 19.80, 240, '50丸*10袋', '北京同仁堂', 1, '乙');
INSERT INTO `medicine_info` VALUES (1764, '小儿氨酚黄那敏颗粒', '儿科用药', 8.50, 350, '12袋/盒', '葵花药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1765, '小儿氨酚烷胺颗粒', '儿科用药', 9.50, 340, '12袋/盒', '仁和药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1766, '小儿柴桂退热颗粒', '儿科用药', 12.50, 300, '5g*10袋', '河南辅仁', 1, '甲');
INSERT INTO `medicine_info` VALUES (1767, '小儿豉翘清热颗粒', '儿科用药', 28.50, 200, '2g*6袋', '济川药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (1768, '儿童回春颗粒', '儿科用药', 15.80, 260, '5g*12袋', '贵州汉方', 1, '乙');
INSERT INTO `medicine_info` VALUES (1769, '布洛芬混悬液', '儿科用药', 12.50, 300, '100ml/瓶', '美林', 1, '甲');
INSERT INTO `medicine_info` VALUES (1770, '对乙酰氨基酚混悬滴剂', '儿科用药', 15.80, 260, '15ml/瓶', '泰诺林', 1, '甲');
INSERT INTO `medicine_info` VALUES (1771, '氨溴特罗口服溶液', '儿科用药', 19.80, 240, '100ml/瓶', '北京韩美', 1, '乙');
INSERT INTO `medicine_info` VALUES (1772, '盐酸氨溴索口服溶液', '儿科用药', 12.50, 300, '100ml/瓶', '山东罗欣', 1, '甲');
INSERT INTO `medicine_info` VALUES (1773, '小儿肺咳颗粒', '儿科用药', 18.50, 250, '3g*12袋', '天圣制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1774, '小儿消积止咳口服液', '儿科用药', 22.80, 220, '10ml*6支', '鲁南制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1775, '复方福尔可定口服溶液', '儿科用药', 26.80, 210, '100ml/瓶', '香港澳美', 1, '乙');
INSERT INTO `medicine_info` VALUES (1776, '醒脾养儿颗粒', '儿科用药', 22.80, 220, '2g*12袋', '贵州健兴', 1, '乙');
INSERT INTO `medicine_info` VALUES (1777, '小儿健脾化积口服液', '儿科用药', 25.80, 210, '10ml*12支', '吉林益盛', 1, '乙');
INSERT INTO `medicine_info` VALUES (1778, '婴儿健脾散', '儿科用药', 8.50, 350, '1g*12袋', '葵花药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1779, '小儿麦枣咀嚼片', '儿科用药', 12.50, 300, '0.45g*60片', '葵花药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1780, '蒙脱石散', '儿科用药', 8.50, 350, '3g*10袋', '博福-益普生', 1, '甲');
INSERT INTO `medicine_info` VALUES (1781, '布拉氏酵母菌散', '儿科用药', 38.00, 160, '0.25g*6袋', '法国百科达', 1, '乙');
INSERT INTO `medicine_info` VALUES (1782, '地衣芽孢杆菌活菌颗粒', '儿科用药', 18.50, 250, '0.25g*12袋', '东北制药', 1, '乙');
INSERT INTO `medicine_info` VALUES (1783, '双歧杆菌三联活菌散', '儿科用药', 22.80, 220, '1g*7袋', '上海信谊', 1, '乙');
INSERT INTO `medicine_info` VALUES (1784, '消旋卡多曲颗粒', '儿科用药', 19.80, 240, '10mg*12袋', '四川百利', 1, '乙');
INSERT INTO `medicine_info` VALUES (1785, '阿莫西林颗粒', '儿科用药', 15.80, 260, '0.125g*12袋', '葵花药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1786, '头孢克洛干混悬剂', '儿科用药', 28.50, 200, '0.125g*6袋', '礼来', 1, '乙');
INSERT INTO `medicine_info` VALUES (1787, '阿奇霉素干混悬剂', '儿科用药', 26.80, 210, '0.1g*6袋', '葵花药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (1788, '复方碳酸钙泡腾颗粒', '儿科用药', 22.80, 220, '1.5g*30袋', '迪巧', 1, '乙');
INSERT INTO `medicine_info` VALUES (1789, '维生素D3滴剂', '儿科用药', 18.50, 250, '400IU*30粒', '青岛双鲸', 1, '乙');
INSERT INTO `medicine_info` VALUES (1790, '葡萄糖酸钙口服溶液', '儿科用药', 18.50, 250, '10ml*12支', '哈药集团', 1, '乙');
INSERT INTO `medicine_info` VALUES (1791, '复方左炔诺孕酮片', '生殖避孕用药', 12.50, 300, '22片/盒', '华润紫竹', 1, '甲');
INSERT INTO `medicine_info` VALUES (1792, '去氧孕烯炔雌醇片', '生殖避孕用药', 28.50, 200, '21片/盒', '荷兰欧加农', 1, '乙');
INSERT INTO `medicine_info` VALUES (1793, '炔雌醇环丙孕酮片', '生殖避孕用药', 38.00, 160, '21片/盒', '拜耳', 1, '乙');
INSERT INTO `medicine_info` VALUES (1794, '复方炔诺酮片', '生殖避孕用药', 9.50, 330, '22片/盒', '上药信谊', 1, '甲');
INSERT INTO `medicine_info` VALUES (1795, '左炔诺孕酮片', '生殖避孕用药', 28.50, 200, '1片/盒', '华润紫竹', 1, '乙');
INSERT INTO `medicine_info` VALUES (1796, '左炔诺孕酮肠溶片', '生殖避孕用药', 32.50, 180, '1片/盒', '广州朗圣', 1, '乙');
INSERT INTO `medicine_info` VALUES (1797, '米非司酮片紧急避孕', '生殖避孕用药', 25.80, 210, '10mg*1片', '湖北葛店', 1, '乙');
INSERT INTO `medicine_info` VALUES (1798, '米非司酮片', '生殖避孕用药', 32.50, 180, '25mg*6片', '湖北葛店', 1, '乙');
INSERT INTO `medicine_info` VALUES (1799, '米索前列醇片', '生殖避孕用药', 18.50, 250, '0.2mg*3片', '新华联药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1800, '生精胶囊', '生殖避孕用药', 45.00, 140, '0.4g*24粒', '遵义廖元和堂', 1, '乙');
INSERT INTO `medicine_info` VALUES (1801, '麒麟丸', '生殖避孕用药', 38.00, 160, '90g/瓶', '广东太安堂', 1, '乙');
INSERT INTO `medicine_info` VALUES (1802, '复方玄驹胶囊', '生殖避孕用药', 28.50, 200, '0.42g*36粒', '浙江施强', 1, '乙');
INSERT INTO `medicine_info` VALUES (1803, '枸橼酸氯米芬胶囊', '生殖避孕用药', 22.80, 220, '50mg*15粒', '上海衡山', 1, '乙');
INSERT INTO `medicine_info` VALUES (1804, '来曲唑片', '生殖避孕用药', 38.00, 160, '2.5mg*10片', '江苏恒瑞', 1, '乙');
INSERT INTO `medicine_info` VALUES (1805, '壬苯醇醚栓', '生殖避孕用药', 15.80, 260, '10枚/盒', '天津药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (1806, '壬苯醇醚凝胶', '生殖避孕用药', 19.80, 240, '3g/支', '江苏远恒', 1, '乙');
INSERT INTO `medicine_info` VALUES (1807, '酚磺乙胺注射液', '外科创伤用药', 8.50, 350, '2ml:0.5g', '西南药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1808, '氨甲环酸注射液', '外科创伤用药', 22.80, 220, '5ml:0.5g', '上海信谊', 1, '乙');
INSERT INTO `medicine_info` VALUES (1809, '氨甲苯酸注射液', '外科创伤用药', 15.80, 260, '10ml:0.1g', '常州兰陵', 1, '甲');
INSERT INTO `medicine_info` VALUES (1810, '血凝酶注射液', '外科创伤用药', 28.50, 200, '1KU/支', '蓬莱诺康', 1, '乙');
INSERT INTO `medicine_info` VALUES (1811, '维生素K1注射液', '外科创伤用药', 6.50, 380, '1ml:10mg', '华润三九', 1, '甲');
INSERT INTO `medicine_info` VALUES (1812, '云南白药胶囊', '外科创伤用药', 18.50, 250, '0.25g*32粒', '云南白药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1813, '云南白药粉', '外科创伤用药', 12.50, 300, '4g/瓶', '云南白药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1814, '裸花紫珠分散片', '外科创伤用药', 19.80, 240, '0.5g*24片', '湖南九典', 1, '乙');
INSERT INTO `medicine_info` VALUES (1815, '止血宁胶囊', '外科创伤用药', 15.80, 260, '0.35g*36粒', '陕西健民', 1, '甲');
INSERT INTO `medicine_info` VALUES (1816, '康复新液', '外科创伤用药', 18.50, 250, '100ml/瓶', '四川好医生', 1, '甲');
INSERT INTO `medicine_info` VALUES (1817, '重组人表皮生长因子凝胶', '外科创伤用药', 45.00, 140, '10g/支', '桂林华诺威', 1, '乙');
INSERT INTO `medicine_info` VALUES (1818, '成纤维细胞生长因子凝胶', '外科创伤用药', 38.00, 160, '5g/支', '珠海亿胜', 1, '乙');
INSERT INTO `medicine_info` VALUES (1819, '复方肝素钠尿囊素凝胶', '外科创伤用药', 28.50, 200, '10g/支', '德国康瑞保', 1, '乙');
INSERT INTO `medicine_info` VALUES (1820, '多磺酸粘多糖乳膏', '外科创伤用药', 32.50, 180, '14g/支', '德国礼达', 1, '乙');
INSERT INTO `medicine_info` VALUES (1821, '医用碘伏', '外科创伤用药', 5.50, 400, '100ml/瓶', '山东安捷', 1, '甲');
INSERT INTO `medicine_info` VALUES (1822, '过氧化氢溶液', '外科创伤用药', 5.50, 400, '100ml/瓶', '北京益民', 1, '甲');
INSERT INTO `medicine_info` VALUES (1823, '苯扎溴铵溶液', '外科创伤用药', 6.50, 380, '500ml/瓶', '恒健制药', 1, '甲');
INSERT INTO `medicine_info` VALUES (1824, '氯己定消毒液', '外科创伤用药', 8.50, 250, '250ml/瓶', '江苏晨牌', 1, '甲');
INSERT INTO `medicine_info` VALUES (1825, '地奥司明片', '外科创伤用药', 28.50, 200, '0.5g*24片', '法国施维雅', 1, '乙');
INSERT INTO `medicine_info` VALUES (1826, '迈之灵片', '外科创伤用药', 38.00, 160, '150mg*20片', '德国礼达', 1, '乙');
INSERT INTO `medicine_info` VALUES (1827, '草木犀流浸液片', '外科创伤用药', 22.80, 220, '400mg*40片', '日本生晃', 1, '乙');
INSERT INTO `medicine_info` VALUES (1828, '风湿骨痛胶囊', '风湿骨病中成药', 12.50, 300, '0.3g*24粒', '安徽古井', 1, '甲');
INSERT INTO `medicine_info` VALUES (1829, '舒筋活血片', '风湿骨病中成药', 8.50, 350, '60片/瓶', '河南宛东', 1, '甲');
INSERT INTO `medicine_info` VALUES (1830, '活血止痛胶囊', '风湿骨病中成药', 15.80, 260, '0.25g*30粒', '南京中山', 1, '甲');
INSERT INTO `medicine_info` VALUES (1831, '仙灵骨葆胶囊', '风湿骨病中成药', 22.80, 220, '0.5g*40粒', '贵州同济堂', 1, '乙');
INSERT INTO `medicine_info` VALUES (1832, '金乌骨通胶囊', '风湿骨病中成药', 28.50, 200, '0.5g*36粒', '贵州盛世龙方', 1, '乙');
INSERT INTO `medicine_info` VALUES (1833, '大活络胶囊', '风湿骨病中成药', 32.50, 180, '0.25g*36粒', '江西药都', 1, '乙');
INSERT INTO `medicine_info` VALUES (1834, '尪痹胶囊', '风湿骨病中成药', 38.00, 160, '0.5g*24粒', '辽宁华润', 1, '乙');
INSERT INTO `medicine_info` VALUES (1835, '颈复康颗粒', '风湿骨病中成药', 18.50, 250, '5g*10袋', '承德颈复康', 1, '甲');
INSERT INTO `medicine_info` VALUES (1836, '腰痛宁胶囊', '风湿骨病中成药', 26.80, 210, '0.3g*20粒', '河北承德', 1, '乙');
INSERT INTO `medicine_info` VALUES (1837, '木瓜丸', '风湿骨病中成药', 9.80, 330, '120丸/瓶', '同仁堂', 1, '甲');
INSERT INTO `medicine_info` VALUES (1838, '小活络丸', '风湿骨病中成药', 12.50, 300, '3g*10丸', '北京同仁堂', 1, '甲');
INSERT INTO `medicine_info` VALUES (1839, '天麻丸', '风湿骨病中成药', 10.50, 320, '60g/瓶', '太极集团', 1, '甲');
INSERT INTO `medicine_info` VALUES (1840, '骨刺消痛胶囊', '风湿骨病中成药', 15.80, 260, '0.4g*36粒', '吉林万通', 1, '乙');
INSERT INTO `medicine_info` VALUES (1841, '骨康胶囊', '风湿骨病中成药', 22.80, 220, '0.4g*48粒', '贵州维康', 1, '乙');
INSERT INTO `medicine_info` VALUES (1842, '壮骨关节丸', '风湿骨病中成药', 18.50, 250, '60g/瓶', '华润三九', 1, '甲');
INSERT INTO `medicine_info` VALUES (1843, '连花清瘟胶囊', '清热解毒中成药', 18.50, 250, '0.35g*24粒', '石家庄以岭', 1, '甲');
INSERT INTO `medicine_info` VALUES (1844, '清开灵颗粒', '清热解毒中成药', 12.50, 300, '10g*12袋', '广州白云山', 1, '甲');
INSERT INTO `medicine_info` VALUES (1845, '清开灵口服液', '清热解毒中成药', 15.80, 260, '10ml*12支', '北京同仁堂', 1, '甲');
INSERT INTO `medicine_info` VALUES (1846, '蒲地蓝消炎口服液', '清热解毒中成药', 28.50, 200, '10ml*12支', '江苏济川', 1, '乙');
INSERT INTO `medicine_info` VALUES (1847, '蓝芩口服液', '清热解毒中成药', 26.80, 210, '10ml*12支', '扬子江药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (1848, '板蓝根颗粒', '清热解毒中成药', 8.50, 350, '10g*20袋', '华润三九', 1, '甲');
INSERT INTO `medicine_info` VALUES (1849, '金银花颗粒', '清热解毒中成药', 9.80, 330, '10g*15袋', '修正药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1850, '牛黄解毒片', '清热解毒中成药', 5.50, 400, '24片/盒', '北京同仁堂', 1, '甲');
INSERT INTO `medicine_info` VALUES (1851, '黄连上清片', '清热解毒中成药', 6.50, 380, '48片/盒', '河南辅仁', 1, '甲');
INSERT INTO `medicine_info` VALUES (1852, '牛黄上清胶囊', '清热解毒中成药', 15.80, 260, '0.3g*36粒', '江西天施康', 1, '乙');
INSERT INTO `medicine_info` VALUES (1853, '三黄片', '清热解毒中成药', 5.50, 400, '36片/盒', '太极集团', 1, '甲');
INSERT INTO `medicine_info` VALUES (1854, '穿心莲内酯滴丸', '清热解毒中成药', 19.80, 240, '0.15g*12袋', '天士力', 1, '乙');
INSERT INTO `medicine_info` VALUES (1855, '炎可宁片', '清热解毒中成药', 8.50, 350, '36片/盒', '吉林华侨', 1, '甲');
INSERT INTO `medicine_info` VALUES (1856, '复方金银花颗粒', '清热解毒中成药', 12.50, 300, '10g*10袋', '黑龙江乌苏里江', 1, '甲');
INSERT INTO `medicine_info` VALUES (1857, '小儿豉翘清热颗粒', '清热解毒中成药', 28.50, 200, '2g*6袋', '济川药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (1858, '疏风解毒胶囊', '清热解毒中成药', 22.80, 220, '0.36g*24粒', '安徽济人', 1, '乙');
INSERT INTO `medicine_info` VALUES (1859, '金花清感颗粒', '清热解毒中成药', 38.00, 160, '5g*6袋', '聚协昌药业', 1, '谈判');
INSERT INTO `medicine_info` VALUES (1860, '抗病毒口服液', '清热解毒中成药', 12.50, 300, '10ml*12支', '广州香雪', 1, '甲');
INSERT INTO `medicine_info` VALUES (1861, '四季抗病毒合剂', '清热解毒中成药', 18.50, 250, '120ml/瓶', '陕西海天', 1, '乙');
INSERT INTO `medicine_info` VALUES (1862, '冬凌草片', '清热解毒中成药', 9.80, 330, '60片/瓶', '河南济源', 1, '甲');
INSERT INTO `medicine_info` VALUES (1863, '补中益气丸', '补益调理中成药', 8.50, 350, '60g/瓶', '北京同仁堂', 1, '甲');
INSERT INTO `medicine_info` VALUES (1864, '补中益气颗粒', '补益调理中成药', 18.50, 250, '3g*15袋', '江西山香', 1, '乙');
INSERT INTO `medicine_info` VALUES (1865, '人参健脾丸', '补益调理中成药', 12.50, 300, '9g*10丸', '同仁堂', 1, '甲');
INSERT INTO `medicine_info` VALUES (1866, '参苓白术散', '补益调理中成药', 9.80, 330, '6g*10袋', '太极集团', 1, '甲');
INSERT INTO `medicine_info` VALUES (1867, '参苓白术丸', '补益调理中成药', 8.50, 350, '100丸/瓶', '仲景宛西', 1, '甲');
INSERT INTO `medicine_info` VALUES (1868, '玉屏风颗粒', '补益调理中成药', 18.50, 250, '5g*15袋', '广东环球', 1, '甲');
INSERT INTO `medicine_info` VALUES (1869, '黄芪精口服液', '补益调理中成药', 22.80, 220, '10ml*12支', '扬子江药业', 1, '乙');
INSERT INTO `medicine_info` VALUES (1870, '当归补血口服液', '补益调理中成药', 15.80, 260, '10ml*12支', '河南辅仁', 1, '甲');
INSERT INTO `medicine_info` VALUES (1871, '四物合剂', '补益调理中成药', 12.50, 300, '10ml*12支', '四川吉泰安', 1, '甲');
INSERT INTO `medicine_info` VALUES (1872, '归脾丸', '补益调理中成药', 8.50, 350, '60g/瓶', '仲景宛西', 1, '甲');
INSERT INTO `medicine_info` VALUES (1873, '人参归脾丸', '补益调理中成药', 18.50, 250, '9g*10丸', '北京同仁堂', 1, '乙');
INSERT INTO `medicine_info` VALUES (1874, '阿胶补血膏', '补益调理中成药', 28.50, 200, '200g/瓶', '山东东阿', 1, '乙');
INSERT INTO `medicine_info` VALUES (1875, '八珍颗粒', '补益调理中成药', 15.80, 260, '3.5g*10袋', '浙江维康', 1, '甲');
INSERT INTO `medicine_info` VALUES (1876, '十全大补丸', '补益调理中成药', 9.80, 330, '60g/瓶', '九芝堂', 1, '甲');
INSERT INTO `medicine_info` VALUES (1877, '生脉饮口服液', '补益调理中成药', 12.50, 300, '10ml*10支', '华润三九', 1, '甲');
INSERT INTO `medicine_info` VALUES (1878, '生脉胶囊', '补益调理中成药', 18.50, 250, '0.3g*24粒', '正大青春宝', 1, '乙');
INSERT INTO `medicine_info` VALUES (1879, '金匮肾气丸', '补益调理中成药', 8.50, 350, '60g/瓶', '北京同仁堂', 1, '甲');
INSERT INTO `medicine_info` VALUES (1880, '桂附地黄丸', '补益调理中成药', 9.80, 330, '120丸/瓶', '仲景宛西', 1, '甲');
INSERT INTO `medicine_info` VALUES (1881, '右归丸', '补益调理中成药', 22.80, 220, '9g*10丸', '北京同仁堂', 1, '乙');
INSERT INTO `medicine_info` VALUES (1882, '锁阳固精丸', '补益调理中成药', 18.50, 250, '60g/瓶', '北京同仁堂', 1, '乙');
INSERT INTO `medicine_info` VALUES (1883, '五子衍宗丸', '补益调理中成药', 12.50, 300, '60g/瓶', '太极集团', 1, '甲');
INSERT INTO `medicine_info` VALUES (1884, '六味地黄丸', '补益调理中成药', 8.50, 350, '120丸/瓶', '仲景宛西', 1, '甲');
INSERT INTO `medicine_info` VALUES (1885, '知柏地黄丸', '补益调理中成药', 9.80, 330, '120丸/瓶', '九芝堂', 1, '甲');
INSERT INTO `medicine_info` VALUES (1886, '麦味地黄丸', '补益调理中成药', 12.50, 300, '60g/瓶', '北京同仁堂', 1, '甲');
INSERT INTO `medicine_info` VALUES (1887, '杞菊地黄丸', '补益调理中成药', 12.50, 300, '120丸/瓶', '仲景宛西', 1, '甲');
INSERT INTO `medicine_info` VALUES (1888, '左归丸', '补益调理中成药', 28.50, 200, '9g*10丸', '北京同仁堂', 1, '乙');
INSERT INTO `medicine_info` VALUES (1889, '护肝片', '补益调理中成药', 12.50, 300, '100片/瓶', '葵花药业', 1, '甲');
INSERT INTO `medicine_info` VALUES (1890, '杞菊明目丸', '补益调理中成药', 15.80, 260, '60g/瓶', '兰州佛慈', 1, '乙');
INSERT INTO `medicine_info` VALUES (1891, '金水宝胶囊', '补益调理中成药', 22.80, 220, '0.33g*36粒', '江西济民可信', 1, '乙');
INSERT INTO `medicine_info` VALUES (1892, '百令胶囊', '补益调理中成药', 28.50, 200, '0.5g*42粒', '中美华东', 1, '乙');
INSERT INTO `medicine_info` VALUES (1893, '香砂养胃丸', '补益调理中成药', 8.50, 350, '60g/瓶', '九芝堂', 1, '甲');
INSERT INTO `medicine_info` VALUES (1894, '香砂六君丸', '补益调理中成药', 9.80, 330, '100丸/瓶', '仲景宛西', 1, '甲');
INSERT INTO `medicine_info` VALUES (1895, '木香顺气丸', '补益调理中成药', 8.50, 350, '60g/瓶', '山东孔府', 1, '甲');

-- ----------------------------
-- Table structure for message_info
-- ----------------------------
DROP TABLE IF EXISTS `message_info`;
CREATE TABLE `message_info`  (
  `msg_id` int NOT NULL AUTO_INCREMENT,
  `msg_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `msg_time` datetime NOT NULL,
  `sender_id` int NOT NULL,
  `receiver_id` int NOT NULL,
  `reply_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `msg_type` int NULL DEFAULT NULL,
  PRIMARY KEY (`msg_id`) USING BTREE,
  INDEX `sender_id`(`sender_id`) USING BTREE,
  INDEX `receiver_id`(`receiver_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of message_info
-- ----------------------------
INSERT INTO `message_info` VALUES (18, '良医', '2026-06-03 09:06:42', 14, 1, '谢谢', NULL);
INSERT INTO `message_info` VALUES (1, '华佗再世', '2026-05-08 11:28:39', 14, 1, '谢谢夸奖、', NULL);
INSERT INTO `message_info` VALUES (2, '华佗再世', '2026-05-29 08:01:50', 14, 1, '谢谢夸奖', NULL);
INSERT INTO `message_info` VALUES (3, 'ascy', '2026-05-29 08:18:37', 1, 14, '啥?', NULL);
INSERT INTO `message_info` VALUES (4, '华佗再世', '2026-05-29 08:12:43', 14, 1, '感谢', NULL);

-- ----------------------------
-- Table structure for patient_info
-- ----------------------------
DROP TABLE IF EXISTS `patient_info`;
CREATE TABLE `patient_info`  (
  `patient_id` int NOT NULL AUTO_INCREMENT,
  `id_card` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `age` int NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `history` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int NOT NULL,
  `patient_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `marriage` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '婚姻状况',
  `allergy` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '过敏史',
  `height` decimal(5, 2) NULL DEFAULT NULL COMMENT '身高(cm)',
  `weight` decimal(5, 2) NULL DEFAULT NULL COMMENT '体重(kg)',
  `blood_pressure` decimal(5, 2) NULL DEFAULT NULL COMMENT '血压(mmHg)',
  `blood_sugar` decimal(5, 2) NULL DEFAULT NULL COMMENT '血糖(mmol/L)',
  PRIMARY KEY (`patient_id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`) USING BTREE,
  UNIQUE INDEX `id_card`(`id_card`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of patient_info
-- ----------------------------
INSERT INTO `patient_info` VALUES (1, '110101199001011111', '男', 34, '北京海淀', '无', '2026-04-16 20:14:13', 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `patient_info` VALUES (2, '110101199001012222', '女', 28, '北京朝阳', '无', '2026-04-16 20:14:13', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `patient_info` VALUES (3, '110101199001013333', '1', 18, 'xx区', '高血压', '2026-04-16 20:14:13', 14, '张钊', '18991927135', NULL, NULL, 188.00, 80.00, 90.00, 3.90);
INSERT INTO `patient_info` VALUES (4, '110101199001014444', '女', 32, '北京东城', '无', '2026-04-16 20:14:13', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `patient_info` VALUES (5, '110101199001015555', '男', 56, '北京丰台', '糖尿病', '2026-04-16 20:14:13', 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `patient_info` VALUES (6, '110101199001016666', '女', 25, '北京通州', '无', '2026-04-16 20:14:13', 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `patient_info` VALUES (7, '110101199001017777', '男', 41, '北京顺义', '无', '2026-04-16 20:14:13', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `patient_info` VALUES (8, '110101199001018888', '女', 30, '北京昌平', '无', '2026-04-16 20:14:13', 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `patient_info` VALUES (9, '110101199001019999', '男', 29, '北京大兴', '无', '2026-04-16 20:14:13', 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `patient_info` VALUES (10, '110101199001010000', '女', 36, '北京房山', '无', '2026-04-16 20:14:13', 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `patient_info` VALUES (11, NULL, NULL, NULL, NULL, NULL, '2026-05-08 09:42:16', 171, '郑永康', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `patient_info` VALUES (12, '610125200000000000', '1', 19, 'xx区', '无', '2026-05-08 09:54:12', 172, '张钊', '18991927135', '已婚', '无', 188.00, 80.00, 100.00, 50.00);
INSERT INTO `patient_info` VALUES (13, '610125200000000331', '1', 18, 'xx区', '抑郁症', '2026-05-20 09:26:53', 184, '谢孟勋', '18991927137', '未婚', '无', 178.00, 55.00, NULL, NULL);
INSERT INTO `patient_info` VALUES (14, '610125200011100331', '1', 22, 'xx区', 'wu', '2026-05-20 09:41:44', 186, '万顺治', '18991927137', '未婚', 'wu', 178.00, 55.00, NULL, NULL);
INSERT INTO `patient_info` VALUES (15, '610125200000000371', '1', 20, 'xx区', '无', '2026-05-25 21:04:54', 187, 'wangsenxu', '18991927137', '未婚', '无', 199.00, 55.00, NULL, NULL);
INSERT INTO `patient_info` VALUES (16, '110101199001013332', '1', 30, 'xx区', 'wu', '2026-05-29 07:58:37', 188, '邓宇航', '18991927135', '未婚', 'wu', 188.00, 80.00, 90.00, 3.90);
INSERT INTO `patient_info` VALUES (17, '110101199001013337', '1', 19, 'xx区', '无', '2026-05-29 08:14:22', 189, '邓宇航', '18991927135', '未婚', '无', 188.00, 80.00, 90.00, 3.90);

-- ----------------------------
-- Table structure for pres_detail_info
-- ----------------------------
DROP TABLE IF EXISTS `pres_detail_info`;
CREATE TABLE `pres_detail_info`  (
  `detail_id` int NOT NULL AUTO_INCREMENT,
  `record_id` int NOT NULL,
  `medicine_id` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`detail_id`) USING BTREE,
  INDEX `record_id`(`record_id`) USING BTREE,
  INDEX `medicine_id`(`medicine_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Records of pres_detail_info
-- ----------------------------
INSERT INTO `pres_detail_info` VALUES (1, 1, 1, 2);
INSERT INTO `pres_detail_info` VALUES (2, 2, 2, 2);
INSERT INTO `pres_detail_info` VALUES (3, 3, 3, 2);
INSERT INTO `pres_detail_info` VALUES (4, 4, 4, 2);
INSERT INTO `pres_detail_info` VALUES (5, 5, 5, 2);
INSERT INTO `pres_detail_info` VALUES (6, 6, 6, 2);
INSERT INTO `pres_detail_info` VALUES (7, 7, 7, 2);
INSERT INTO `pres_detail_info` VALUES (8, 8, 8, 2);
INSERT INTO `pres_detail_info` VALUES (9, 9, 9, 2);
INSERT INTO `pres_detail_info` VALUES (10, 10, 10, 2);
INSERT INTO `pres_detail_info` VALUES (15, 12, 1873, 1);
INSERT INTO `pres_detail_info` VALUES (16, 12, 1863, 2);
INSERT INTO `pres_detail_info` VALUES (13, 13, 1895, 1);
INSERT INTO `pres_detail_info` VALUES (14, 14, 1895, 2);
INSERT INTO `pres_detail_info` VALUES (17, 12, 1891, 1);
INSERT INTO `pres_detail_info` VALUES (18, 15, 1890, 1);
INSERT INTO `pres_detail_info` VALUES (21, 16, 1894, 1);
INSERT INTO `pres_detail_info` VALUES (23, 17, 1886, 1);
INSERT INTO `pres_detail_info` VALUES (24, 17, 1893, 1);
INSERT INTO `pres_detail_info` VALUES (25, 17, 1892, 1);
INSERT INTO `pres_detail_info` VALUES (26, 18, 1892, 1);
INSERT INTO `pres_detail_info` VALUES (27, 19, 1891, 5);
INSERT INTO `pres_detail_info` VALUES (28, 20, 1865, 2);
INSERT INTO `pres_detail_info` VALUES (29, 20, 1854, 1);
INSERT INTO `pres_detail_info` VALUES (30, 21, 1895, 4);
INSERT INTO `pres_detail_info` VALUES (31, 21, 1894, 1);

-- ----------------------------
-- Table structure for record_info
-- ----------------------------
DROP TABLE IF EXISTS `record_info`;
CREATE TABLE `record_info`  (
  `record_id` int NOT NULL AUTO_INCREMENT,
  `record_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `record_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `chief_complaint` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `diagnosis` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `treatment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `follow_up` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `pres_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `pres_date` datetime NULL DEFAULT NULL,
  `pres_usage` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `med_status` int NULL DEFAULT 0,
  `register_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `patient_id` int NOT NULL,
  PRIMARY KEY (`record_id`) USING BTREE,
  UNIQUE INDEX `record_no`(`record_no`) USING BTREE,
  UNIQUE INDEX `pres_no`(`pres_no`) USING BTREE,
  INDEX `doctor_id`(`doctor_id`) USING BTREE,
  INDEX `patient_id`(`patient_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of record_info
-- ----------------------------
INSERT INTO `record_info` VALUES (1, 'REC001', '2026-04-16 20:14:13', '感冒', '上感', '药物', '复诊', 'PRES001', '2026-04-16 20:14:13', '口服', 1, 1, 1, 1);
INSERT INTO `record_info` VALUES (2, 'REC002', '2026-04-16 20:14:13', '咳嗽', '支气管炎', '药物', '复诊', 'PRES002', '2026-04-16 20:14:13', '口服', 1, 2, 2, 2);
INSERT INTO `record_info` VALUES (3, 'REC003', '2026-04-16 20:14:13', '发烧', '感冒', '药物', '复诊', 'PRES003', '2026-04-16 20:14:13', '口服', 1, 3, 3, 3);
INSERT INTO `record_info` VALUES (4, 'REC004', '2026-04-16 20:14:13', '头痛', '偏头痛', '药物', '复诊', 'PRES004', '2026-04-16 20:14:13', '口服', 1, 4, 4, 4);
INSERT INTO `record_info` VALUES (5, 'REC005', '2026-04-16 20:14:13', '腹痛', '肠胃炎', '药物', '复诊', 'PRES005', '2026-04-16 20:14:13', '口服', 1, 5, 5, 5);
INSERT INTO `record_info` VALUES (6, 'REC006', '2026-04-16 20:14:13', '咽痛', '咽炎', '药物', '复诊', 'PRES006', '2026-04-16 20:14:13', '口服', 1, 6, 6, 6);
INSERT INTO `record_info` VALUES (7, 'REC007', '2026-04-16 20:14:13', '皮疹', '过敏', '药物', '复诊', 'PRES007', '2026-04-16 20:14:13', '口服', 1, 7, 7, 7);
INSERT INTO `record_info` VALUES (8, 'REC008', '2026-04-16 20:14:13', '关节痛', '关节炎', '药物', '复诊', 'PRES008', '2026-04-16 20:14:13', '口服', 1, 8, 8, 8);
INSERT INTO `record_info` VALUES (9, 'REC009', '2026-04-16 20:14:13', '失眠', '神经衰弱', '药物', '复诊', 'PRES009', '2026-04-16 20:14:13', '口服', 1, 9, 9, 9);
INSERT INTO `record_info` VALUES (10, 'REC010', '2026-04-16 20:14:13', '乏力', '体虚', '药物', '复诊', 'PRES010', '2026-04-16 20:14:13', '口服', 1, 10, 10, 10);
INSERT INTO `record_info` VALUES (11, 'REC-1778725312774', '2026-05-14 10:21:52', NULL, '蚊虫叮咬', '未抓破时可涂炉甘石洗剂止痒', NULL, NULL, NULL, NULL, 0, 0, 1, 12);
INSERT INTO `record_info` VALUES (12, 'REC-1779236038259', '2026-05-20 08:13:58', '浑身乏力、精神倦怠，气短懒言，食欲不振，心悸失眠，面色萎黄，肢体酸软，气血不足，脾胃虚弱，日常容易体虚劳累。', '脾胃气虚、心脾两虚，气血亏虚，体虚乏力。', '口服补中益气丸调理脾胃、补中益气，改善体虚乏力；\n搭配人参归脾丸益气补血、养心健脾，缓解心悸失眠、气血不足；\n规律作息，避免熬夜劳累，清淡饮食，少吃生冷油腻食物；\n适度静养调理，循序渐进恢复体质，坚持服药巩固调理。', NULL, NULL, NULL, NULL, 0, 39, 1, 14);
INSERT INTO `record_info` VALUES (13, 'REC-1779238698107', '2026-05-20 08:58:18', '浑身乏力、精神倦怠，气短懒言，食欲不振，心悸失眠，面色萎黄，肢体酸软，气血不足，脾胃虚弱，日常容易体虚劳累。', '脾胃气虚、心脾两虚，气血亏虚，体虚乏力。', '按时吃药', NULL, NULL, NULL, NULL, 0, 38, 1, 14);
INSERT INTO `record_info` VALUES (14, 'REC-1779241740330', '2026-05-20 09:49:00', '浑身乏力、精神倦怠，气短懒言，食欲不振，心悸失眠，面色萎黄，肢体酸软，气血不足，脾胃虚弱，日常容易体虚劳累。', '脾胃气虚、心脾两虚，气血亏虚，体虚乏力。', 'anshichiyao', NULL, NULL, NULL, NULL, 0, 41, 1, 186);
INSERT INTO `record_info` VALUES (15, 'REC-1779243546937', '2026-05-20 10:19:06', '浑身乏力、精神倦怠，气短懒言，食欲不振，心悸失眠，面色萎黄，肢体酸软，气血不足，脾胃虚弱，日常容易体虚劳累。', '脾胃气虚、心脾两虚，气血亏虚，体虚乏力。', 'ascy', NULL, NULL, NULL, NULL, 0, 37, 1, 14);
INSERT INTO `record_info` VALUES (16, 'REC-1779251261280', '2026-05-20 12:27:41', '浑身乏力、精神倦怠，气短懒言，食欲不振，心悸失眠，面色萎黄，肢体酸软，气血不足，脾胃虚弱，日常容易体虚劳累。', '脾胃气虚、心脾两虚，气血亏虚，体虚乏力。', '', NULL, NULL, NULL, NULL, 0, 42, 1, 14);
INSERT INTO `record_info` VALUES (17, 'REC-1779713407550', '2026-05-25 20:50:07', '浑身乏力、精神倦怠，气短懒言，食欲不振，心悸失眠，面色萎黄，肢体酸软，气血不足，脾胃虚弱，日常容易体虚劳累。', '脾胃气虚、心脾两虚，气血亏虚，体虚乏力。', 'anshichiyyao', NULL, NULL, NULL, NULL, 0, 43, 1, 14);
INSERT INTO `record_info` VALUES (18, 'REC-1779843151149', '2026-05-27 08:52:31', '浑身乏力、精神倦怠，气短懒言，食欲不振，心悸失眠，面色萎黄，肢体酸软，气血不足，脾胃虚弱，日常容易体虚劳累。', '脾胃气虚、心脾两虚，气血亏虚，体虚乏力。', 'duohciyao', NULL, NULL, NULL, NULL, 0, 49, 1, 14);
INSERT INTO `record_info` VALUES (19, 'REC-1779847552068', '2026-05-27 10:05:52', '浑身乏力、精神倦怠，气短懒言，食欲不振，心悸失眠，面色萎黄，肢体酸软，气血不足，脾胃虚弱，日常容易体虚劳累。', '脾胃气虚、心脾两虚，气血亏虚，体虚乏力。', 'nscy', NULL, NULL, NULL, NULL, 0, 48, 1, 14);
INSERT INTO `record_info` VALUES (20, 'REC-1780012878873', '2026-05-29 08:01:18', '浑身乏力、精神倦怠，气短懒言，食欲不振，心悸失眠，面色萎黄，肢体酸软，气血不足，脾胃虚弱，日常容易体虚劳累。', '脾胃气虚、心脾两虚，气血亏虚，体虚乏力。', '按时吃药', NULL, NULL, NULL, NULL, 0, 51, 1, 14);
INSERT INTO `record_info` VALUES (21, 'REC-1780013506546', '2026-05-29 08:11:46', '浑身乏力、精神倦怠，气短懒言，食欲不振，心悸失眠，面色萎黄，肢体酸软，气血不足，脾胃虚弱，日常容易体虚劳累。', '脾胃气虚、心脾两虚，气血亏虚，体虚乏力。', '无', NULL, NULL, NULL, NULL, 0, 52, 1, 14);

-- ----------------------------
-- Table structure for register_info
-- ----------------------------
DROP TABLE IF EXISTS `register_info`;
CREATE TABLE `register_info`  (
  `register_id` int NOT NULL AUTO_INCREMENT,
  `reg_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reg_time` datetime NOT NULL,
  `visit_time` datetime NULL DEFAULT NULL,
  `reg_status` int NULL DEFAULT 0,
  `fee` decimal(10, 2) NULL DEFAULT NULL,
  `patient_id` int NOT NULL,
  `dept_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  PRIMARY KEY (`register_id`) USING BTREE,
  UNIQUE INDEX `reg_no`(`reg_no`) USING BTREE,
  INDEX `patient_id`(`patient_id`) USING BTREE,
  INDEX `dept_id`(`dept_id`) USING BTREE,
  INDEX `doctor_id`(`doctor_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of register_info
-- ----------------------------
INSERT INTO `register_info` VALUES (1, 'REG001', '2026-04-16 20:14:13', '2026-04-16 20:14:13', 1, 50.00, 1, 1, 1);
INSERT INTO `register_info` VALUES (2, 'REG002', '2026-04-16 20:14:13', '2026-04-16 20:14:13', 1, 50.00, 2, 2, 2);
INSERT INTO `register_info` VALUES (3, 'REG003', '2026-04-16 20:14:13', '2026-04-16 20:14:13', 1, 50.00, 3, 3, 3);
INSERT INTO `register_info` VALUES (4, 'REG004', '2026-04-16 20:14:13', '2026-04-16 20:14:13', 1, 50.00, 4, 4, 4);
INSERT INTO `register_info` VALUES (5, 'REG005', '2026-04-16 20:14:13', '2026-04-16 20:14:13', 1, 50.00, 5, 5, 5);
INSERT INTO `register_info` VALUES (6, 'REG006', '2026-04-16 20:14:13', '2026-04-16 20:14:13', 1, 50.00, 6, 6, 6);
INSERT INTO `register_info` VALUES (7, 'REG007', '2026-04-16 20:14:13', '2026-04-16 20:14:13', 1, 50.00, 7, 7, 7);
INSERT INTO `register_info` VALUES (8, 'REG008', '2026-04-16 20:14:13', '2026-04-16 20:14:13', 1, 50.00, 8, 8, 8);
INSERT INTO `register_info` VALUES (9, 'REG009', '2026-04-16 20:14:13', '2026-04-16 20:14:13', 1, 50.00, 9, 9, 9);
INSERT INTO `register_info` VALUES (10, 'REG010', '2026-04-16 20:14:13', '2026-04-16 20:14:13', 1, 50.00, 10, 10, 10);
INSERT INTO `register_info` VALUES (11, 'REG-1778208053491', '2026-05-08 00:00:00', '2026-05-08 00:00:00', 1, 0.00, 172, 1, 1);
INSERT INTO `register_info` VALUES (12, 'REG-1778208067698', '2026-05-08 00:00:00', '2026-05-08 00:00:00', 1, 0.00, 172, 1, 1);
INSERT INTO `register_info` VALUES (13, 'REG-1778212136558', '2026-05-08 00:00:00', '2026-05-08 00:00:00', 1, 0.00, 14, 1, 1);
INSERT INTO `register_info` VALUES (14, 'REG-1778212142766', '2026-05-08 00:00:00', '2026-05-08 00:00:00', 1, 0.00, 14, 1, 1);
INSERT INTO `register_info` VALUES (15, 'REG-1778553520890', '2026-05-12 00:00:00', '2026-05-12 00:00:00', 1, 0.00, 14, 1, 1);
INSERT INTO `register_info` VALUES (16, 'REG-1778553777988', '2026-05-12 10:42:57', NULL, 1, 0.00, 14, 1, 1);
INSERT INTO `register_info` VALUES (17, 'REG-1778553786646', '2026-05-12 10:43:06', NULL, 1, 0.00, 14, 1, 1);
INSERT INTO `register_info` VALUES (18, 'REG-1778553917098', '2026-05-12 10:45:17', NULL, 1, 0.00, 14, 1, 1);
INSERT INTO `register_info` VALUES (19, 'REG-1778553986444', '2026-05-12 10:46:26', NULL, 1, 0.00, 14, 1, 1);
INSERT INTO `register_info` VALUES (20, 'REG-1778554086522', '2026-05-12 10:48:06', NULL, 0, 0.00, 14, 1, 1);
INSERT INTO `register_info` VALUES (21, 'REG-1778554367492', '2026-05-12 10:52:47', NULL, 0, 0.00, 14, 1, 1);
INSERT INTO `register_info` VALUES (22, 'REG-1778554381995', '2026-05-12 10:53:01', NULL, 1, 0.00, 14, 1, 1);
INSERT INTO `register_info` VALUES (23, 'REG-1778630284875', '2026-05-13 07:58:04', NULL, 1, 0.00, 14, 1, 1);
INSERT INTO `register_info` VALUES (24, 'REG-1778630305828', '2026-05-13 07:58:25', NULL, 1, 0.00, 14, 1, 1);
INSERT INTO `register_info` VALUES (25, 'REG-1778630315616', '2026-05-13 07:58:35', NULL, 1, 0.00, 14, 1, 1);
INSERT INTO `register_info` VALUES (26, 'REG-1778643857536', '2026-05-13 11:44:17', NULL, 1, 0.00, 14, 1, 1);
INSERT INTO `register_info` VALUES (27, 'REG-1778643898910', '2026-05-13 11:44:58', NULL, 1, 0.00, 14, 1, 1);
INSERT INTO `register_info` VALUES (28, 'REG-1778643972657', '2026-05-13 11:46:12', NULL, 1, 0.00, 14, 1, 1);
INSERT INTO `register_info` VALUES (29, 'REG-1778644158796', '2026-05-13 11:49:18', NULL, 1, 0.00, 14, 1, 1);
INSERT INTO `register_info` VALUES (30, 'REG-1778644442912', '2026-05-13 11:54:02', NULL, 1, 0.00, 14, 1, 1);
INSERT INTO `register_info` VALUES (31, 'REG-1778717624643', '2026-05-14 09:00:00', '2026-05-14 09:00:00', 1, 0.00, 14, 1, 1);
INSERT INTO `register_info` VALUES (32, 'REG-1778717754097', '2026-05-14 09:00:00', '2026-05-14 09:00:00', 1, 0.00, 14, 1, 1);
INSERT INTO `register_info` VALUES (33, 'REG-1778717762954', '2026-05-14 09:00:00', '2026-05-14 09:00:00', 1, 0.00, 14, 1, 1);
INSERT INTO `register_info` VALUES (34, 'REG-1778718250694', '2026-05-14 09:00:00', '2026-05-14 09:00:00', 1, 0.00, 14, 1, 1);
INSERT INTO `register_info` VALUES (35, 'REG-1778718472257', '2026-05-14 09:00:00', '2026-05-14 09:00:00', 1, 0.00, 14, 1, 1);
INSERT INTO `register_info` VALUES (36, 'REG-1778718636339', '2026-05-14 09:00:00', '2026-05-14 09:00:00', 1, 0.00, 14, 1, 1);
INSERT INTO `register_info` VALUES (37, 'REG-1778718650809', '2026-05-14 09:00:00', '2026-05-14 09:00:00', 1, 0.00, 14, 1, 1);
INSERT INTO `register_info` VALUES (38, 'REG-1778718836652', '2026-05-14 09:00:00', '2026-05-14 09:00:00', 1, 0.00, 14, 1, 1);
INSERT INTO `register_info` VALUES (39, 'REG-1779065655501', '2026-05-18 09:00:00', '2026-05-18 09:00:00', 1, 0.00, 14, 1, 1);
INSERT INTO `register_info` VALUES (40, 'REG-1779240426912', '2026-05-20 09:00:00', '2026-05-20 09:00:00', 1, 0.00, 184, 1, 1);
INSERT INTO `register_info` VALUES (41, 'REG-1779241685084', '2026-05-20 09:00:00', '2026-05-20 09:00:00', 1, 0.00, 186, 1, 1);
INSERT INTO `register_info` VALUES (42, 'REG-1779251226793', '2026-05-20 09:00:00', '2026-05-20 09:00:00', 1, 0.00, 14, 1, 1);
INSERT INTO `register_info` VALUES (43, 'REG-1779713367037', '2026-05-25 09:00:00', '2026-05-25 09:00:00', 1, 0.00, 14, 1, 1);
INSERT INTO `register_info` VALUES (44, 'REG-1779764422170', '2026-05-26 09:00:00', '2026-05-26 09:00:00', 1, 0.00, 14, 1, 1);
INSERT INTO `register_info` VALUES (45, 'REG-1779764638530', '2026-05-26 09:00:00', '2026-05-26 09:00:00', 1, 0.00, 14, 1, 1);
INSERT INTO `register_info` VALUES (46, 'REG-1779764684037', '2026-05-26 09:00:00', '2026-05-26 09:00:00', 1, 0.00, 14, 1, 1);
INSERT INTO `register_info` VALUES (47, 'REG-1779764718930', '2026-05-26 09:00:00', '2026-05-26 09:00:00', 1, 0.00, 14, 1, 1);
INSERT INTO `register_info` VALUES (48, 'REG-1779765288051', '2026-05-26 09:00:00', '2026-05-26 09:00:00', 1, 0.00, 14, 1, 1);
INSERT INTO `register_info` VALUES (49, 'REG-1779766990325', '2026-05-26 11:43:10', '2026-05-26 11:43:10', 1, 0.00, 14, 1, 1);
INSERT INTO `register_info` VALUES (50, 'REG-1779847949712', '2026-05-27 10:12:29', '2026-05-27 10:12:29', 0, 0.00, 14, 1, 1);
INSERT INTO `register_info` VALUES (51, 'REG-1780012839284', '2026-05-29 08:00:39', '2026-05-29 08:00:39', 1, 0.00, 14, 1, 1);
INSERT INTO `register_info` VALUES (52, 'REG-1780013475313', '2026-05-29 08:11:15', '2026-05-29 08:11:15', 1, 0.00, 14, 1, 1);
INSERT INTO `register_info` VALUES (53, 'REG-1780448771422', '2026-06-03 09:06:11', '2026-06-03 09:06:11', 1, 0.00, 14, 1, 1);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `real_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `role_type` int NOT NULL,
  `status` int NULL DEFAULT 1,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 191 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, 'admin', '123456', '系统管理员', '13800001111', 'admin@qq.com', 0, 1, '2026-04-16 20:14:13');
INSERT INTO `user_info` VALUES (2, 'patient1', 'e10adc3949ba59abbe56e057f20f883e', '周患者', '13900001111', 'pt1@qq.com', 2, 1, '2026-04-16 20:14:13');
INSERT INTO `user_info` VALUES (3, 'patient2', 'e10adc3949ba59abbe56e057f20f883e', '郑患者', '13900002222', 'pt2@qq.com', 2, 1, '2026-04-16 20:14:13');
INSERT INTO `user_info` VALUES (4, 'patient3', 'e10adc3949ba59abbe56e057f20f883e', '孙患者', '13900003333', 'pt3@qq.com', 2, 1, '2026-04-16 20:14:13');
INSERT INTO `user_info` VALUES (5, 'patient4', 'e10adc3949ba59abbe56e057f20f883e', '马患者', '13900004444', 'pt4@qq.com', 2, 1, '2026-04-16 20:14:13');
INSERT INTO `user_info` VALUES (6, 'patient5', 'e10adc3949ba59abbe56e057f20f883e', '朱患者', '13900005555', 'pt5@qq.com', 2, 1, '2026-04-16 20:14:13');
INSERT INTO `user_info` VALUES (7, 'patient6', 'e10adc3949ba59abbe56e057f20f883e', '胡患者', '13900006666', 'pt6@qq.com', 2, 1, '2026-04-16 20:14:13');
INSERT INTO `user_info` VALUES (8, 'patient7', 'e10adc3949ba59abbe56e057f20f883e', '郭患者', '13900007777', 'pt7@qq.com', 2, 1, '2026-04-16 20:14:13');
INSERT INTO `user_info` VALUES (9, 'patient8', 'e10adc3949ba59abbe56e057f20f883e', '何患者', '13900008888', 'pt8@qq.com', 2, 1, '2026-04-16 20:14:13');
INSERT INTO `user_info` VALUES (10, 'patient9', 'e10adc3949ba59abbe56e057f20f883e', '高患者', '13900009999', 'pt9@qq.com', 2, 1, '2026-04-16 20:14:13');
INSERT INTO `user_info` VALUES (11, 'patient10', 'e10adc3949ba59abbe56e057f20f883e', '梁患者', '13900010000', 'pt10@qq.com', 2, 1, '2026-04-16 20:14:13');
INSERT INTO `user_info` VALUES (12, 'dengyuhang', 'jfZHsTs1jySdJfT/C4KCPQ==', '邓宇航', '18991927135', NULL, 0, 1, '2026-04-26 18:03:45');
INSERT INTO `user_info` VALUES (13, 'admin1', 'jfZHsTs1jySdJfT/C4KCPQ==', '邓宇航', '1623832078', NULL, 0, 1, '2026-04-27 10:27:20');
INSERT INTO `user_info` VALUES (14, 'smoogy', '7PiO4lw04OYGN0VZvCoWkA==', '张钊', '12345678901', NULL, 2, 1, '2026-05-06 10:37:40');
INSERT INTO `user_info` VALUES (15, 'doctor_001', '123456', '张建国', '13800100001', 'zhangjianguo@hospital.com', 1, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (16, 'doctor_002', '123456', '李秀华', '13800100002', 'lixiuhua@hospital.com', 1, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (17, 'doctor_003', '123456', '王志强', '13800100003', 'wangzhiqiang@hospital.com', 1, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (18, 'doctor_004', '123456', '赵伟', '13800100004', 'zhaowei@hospital.com', 1, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (19, 'doctor_005', '123456', '孙丽', '13800100005', 'sunli@hospital.com', 1, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (20, 'doctor_006', '123456', '周强', '13800100006', 'zhouqiang@hospital.com', 1, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (21, 'doctor_007', '123456', '冯燕', '13800100007', 'fengyan@hospital.com', 1, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (22, 'doctor_008', '123456', '何亮', '13800100008', 'heliang@hospital.com', 1, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (23, 'doctor_009', '123456', '梁敏', '13800100009', 'liangmin@hospital.com', 1, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (24, 'doctor_010', '123456', '韩梅', '13800100010', 'hanmei@hospital.com', 1, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (25, 'doctor_011', '123456', '唐杰', '13800100011', 'tangjie@hospital.com', 1, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (26, 'doctor_012', '123456', '许静', '13800100012', 'xujing@hospital.com', 1, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (27, 'doctor_013', '123456', '彭伟', '13800100013', 'pengwei@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (28, 'doctor_014', '123456', '曾芳', '13800100014', 'zengfang@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (29, 'doctor_015', '123456', '吕强', '13800100015', 'luqiang@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (30, 'doctor_016', '123456', '叶伟', '13800100016', 'yewei@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (31, 'doctor_017', '123456', '戴芳', '13800100017', 'daifang@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (32, 'doctor_018', '123456', '钟强', '13800100018', 'zhongqiang@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (33, 'doctor_019', '123456', '黄涛', '13800100019', 'huangtao@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (34, 'doctor_020', '123456', '冯静', '13800100020', 'fengjing@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (35, 'doctor_021', '123456', '陈强', '13800100021', 'chenqiang@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (36, 'doctor_022', '123456', '林涛', '13800100022', 'linta o@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (37, 'doctor_023', '123456', '何芳', '13800100023', 'hefang@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (38, 'doctor_024', '123456', '梁伟', '13800100024', 'liangwei@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (39, 'doctor_025', '123456', '韩杰', '13800100025', 'hanjie@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (40, 'doctor_026', '123456', '唐静', '13800100026', 'tangjing@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (41, 'doctor_027', '123456', '许强', '13800100027', 'xuqiang@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (42, 'doctor_028', '123456', '彭伟', '13800100028', 'pengwei2@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (43, 'doctor_029', '123456', '曾强', '13800100029', 'zengqiang@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (44, 'doctor_030', '123456', '吕芳', '13800100030', 'lufang@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (45, 'doctor_031', '123456', '叶华', '13800100031', 'yehua@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (46, 'doctor_032', '123456', '戴静', '13800100032', 'daijing@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (47, 'doctor_033', '123456', '钟芳', '13800100033', 'zhongfang@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (48, 'doctor_034', '123456', '黄静', '13800100034', 'huangjing@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (49, 'doctor_035', '123456', '冯强', '13800100035', 'fengqiang@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (50, 'doctor_036', '123456', '陈丽', '13800100036', 'chenli@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (51, 'doctor_037', '123456', '林强', '13800100037', 'linqiang@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (52, 'doctor_038', '123456', '何芳', '13800100038', 'hefang2@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (53, 'doctor_039', '123456', '梁静', '13800100039', 'liangjing@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (54, 'doctor_040', '123456', '韩伟', '13800100040', 'hanwei@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (55, 'doctor_041', '123456', '唐芳', '13800100041', 'tangfang@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (56, 'doctor_042', '123456', '许静', '13800100042', 'xujing2@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (57, 'doctor_043', '123456', '彭芳', '13800100043', 'pengfang@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (58, 'doctor_044', '123456', '曾丽', '13800100044', 'zengli@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (59, 'doctor_045', '123456', '吕强', '13800100045', 'luqiang2@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (60, 'doctor_046', '123456', '叶强', '13800100046', 'yeqiang@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (61, 'doctor_047', '123456', '戴芳', '13800100047', 'daifang2@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (62, 'doctor_048', '123456', '钟伟', '13800100048', 'zhongwei@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (63, 'doctor_049', '123456', '黄涛', '13800100049', 'huangtao2@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (64, 'doctor_050', '123456', '冯丽', '13800100050', 'fengli@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (65, 'doctor_051', '123456', '陈强', '13800100051', 'chenqiang2@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (66, 'doctor_052', '123456', '林芳', '13800100052', 'linfang@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (67, 'doctor_053', '123456', '何强', '13800100053', 'heqiang@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (68, 'doctor_054', '123456', '梁静', '13800100054', 'liangjing2@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (69, 'doctor_055', '123456', '韩静', '13800100055', 'hanjing@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (70, 'doctor_056', '123456', '唐强', '13800100056', 'tangqiang@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (71, 'doctor_057', '123456', '许芳', '13800100057', 'xufang@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (72, 'doctor_058', '123456', '彭伟', '13800100058', 'pengwei3@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (73, 'doctor_059', '123456', '曾芳', '13800100059', 'zengfang2@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (74, 'doctor_060', '123456', '吕强', '13800100060', 'luqiang3@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (75, 'doctor_061', '123456', '苏静', '13800100061', 'sujing@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (76, 'doctor_062', '123456', '魏涛', '13800100062', 'weitao@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (77, 'doctor_063', '123456', '叶华', '13800100063', 'yehua2@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (78, 'doctor_064', '123456', '戴静', '13800100064', 'daijing2@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (79, 'doctor_065', '123456', '钟芳', '13800100065', 'zhongfang2@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (80, 'doctor_066', '123456', '黄静', '13800100066', 'huangjing2@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (81, 'doctor_067', '123456', '冯强', '13800100067', 'fengqiang2@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (82, 'doctor_068', '123456', '陈丽', '13800100068', 'chenli2@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (83, 'doctor_069', '123456', '林强', '13800100069', 'linqiang2@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (84, 'doctor_070', '123456', '何芳', '13800100070', 'hefang3@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (85, 'doctor_071', '123456', '梁静', '13800100071', 'liangjing3@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (86, 'doctor_072', '123456', '韩伟', '13800100072', 'hanwei2@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (87, 'doctor_073', '123456', '唐芳', '13800100073', 'tangfang2@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (88, 'doctor_074', '123456', '许静', '13800100074', 'xujing3@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (89, 'doctor_075', '123456', '彭芳', '13800100075', 'pengfang2@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (90, 'doctor_076', '123456', '曾丽', '13800100076', 'zengli2@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (91, 'doctor_077', '123456', '叶强', '13800100077', 'yeqiang2@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (92, 'doctor_078', '123456', '戴芳', '13800100078', 'daifang3@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (93, 'doctor_079', '123456', '钟伟', '13800100079', 'zhongwei2@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (94, 'doctor_080', '123456', '黄涛', '13800100080', 'huangtao3@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (95, 'doctor_081', '123456', '冯丽', '13800100081', 'fengli2@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (96, 'doctor_082', '123456', '陈强', '13800100082', 'chenqiang3@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (97, 'doctor_083', '123456', '林芳', '13800100083', 'linfang2@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (98, 'doctor_084', '123456', '何强', '13800100084', 'heqiang2@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (99, 'doctor_085', '123456', '梁静', '13800100085', 'liangjing4@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (100, 'doctor_086', '123456', '韩静', '13800100086', 'hanjing2@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (101, 'doctor_087', '123456', '唐强', '13800100087', 'tangqiang2@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (102, 'doctor_088', '123456', '许芳', '13800100088', 'xufang2@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (103, 'doctor_089', '123456', '彭伟', '13800100089', 'pengwei4@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (104, 'doctor_090', '123456', '曾芳', '13800100090', 'zengfang3@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (105, 'doctor_091', '123456', '吕强', '13800100091', 'luqiang4@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (106, 'doctor_092', '123456', '苏静', '13800100092', 'sujing2@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (107, 'doctor_093', '123456', '魏涛', '13800100093', 'weitao2@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (108, 'doctor_094', '123456', '叶华', '13800100094', 'yehua3@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (109, 'doctor_095', '123456', '戴静', '13800100095', 'daijing3@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (110, 'doctor_096', '123456', '钟芳', '13800100096', 'zhongfang3@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (111, 'doctor_097', '123456', '黄静', '13800100097', 'huangjing3@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (112, 'doctor_098', '123456', '冯强', '13800100098', 'fengqiang3@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (113, 'doctor_099', '123456', '陈丽', '13800100099', 'chenli3@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (114, 'doctor_100', '123456', '林强', '13800100100', 'linqiang3@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (115, 'doctor_101', '123456', '何芳', '13800100101', 'hefang4@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (116, 'doctor_102', '123456', '梁静', '13800100102', 'liangjing5@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (117, 'doctor_103', '123456', '韩伟', '13800100103', 'hanwei3@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (118, 'doctor_104', '123456', '唐芳', '13800100104', 'tangfang3@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (119, 'doctor_105', '123456', '许静', '13800100105', 'xujing4@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (120, 'doctor_106', '123456', '彭芳', '13800100106', 'pengfang3@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (121, 'doctor_107', '123456', '曾丽', '13800100107', 'zengli3@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (122, 'doctor_108', '123456', '叶强', '13800100108', 'yeqiang3@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (123, 'doctor_109', '123456', '戴芳', '13800100109', 'daifang4@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (124, 'doctor_110', '123456', '钟伟', '13800100110', 'zhongwei3@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (125, 'doctor_111', '123456', '黄涛', '13800100111', 'huangtao4@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (126, 'doctor_112', '123456', '冯丽', '13800100112', 'fengli3@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (127, 'doctor_113', '123456', '陈强', '13800100113', 'chenqiang4@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (128, 'doctor_114', '123456', '林芳', '13800100114', 'linfang3@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (129, 'doctor_115', '123456', '何强', '13800100115', 'heqiang3@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (130, 'doctor_116', '123456', '梁静', '13800100116', 'liangjing6@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (131, 'doctor_117', '123456', '韩静', '13800100117', 'hanjing3@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (132, 'doctor_118', '123456', '唐强', '13800100118', 'tangqiang3@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (133, 'doctor_119', '123456', '许芳', '13800100119', 'xufang3@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (134, 'doctor_120', '123456', '彭伟', '13800100120', 'pengwei5@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (135, 'doctor_121', '123456', '曾芳', '13800100121', 'zengfang4@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (136, 'doctor_122', '123456', '吕强', '13800100122', 'luqiang5@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (137, 'doctor_123', '123456', '苏静', '13800100123', 'sujing3@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (138, 'doctor_124', '123456', '魏涛', '13800100124', 'weitao3@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (139, 'doctor_125', '123456', '叶华', '13800100125', 'yehua4@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (140, 'doctor_126', '123456', '戴静', '13800100126', 'daijing4@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (141, 'doctor_127', '123456', '钟芳', '13800100127', 'zhongfang4@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (142, 'doctor_128', '123456', '黄静', '13800100128', 'huangjing4@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (143, 'doctor_129', '123456', '冯强', '13800100129', 'fengqiang4@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (144, 'doctor_130', '123456', '陈丽', '13800100130', 'chenli4@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (145, 'doctor_131', '123456', '林强', '13800100131', 'linqiang4@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (146, 'doctor_132', '123456', '何芳', '13800100132', 'hefang5@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (147, 'doctor_133', '123456', '梁静', '13800100133', 'liangjing7@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (148, 'doctor_134', '123456', '韩伟', '13800100134', 'hanwei4@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (149, 'doctor_135', '123456', '唐芳', '13800100135', 'tangfang4@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (150, 'doctor_136', '123456', '许静', '13800100136', 'xujing5@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (151, 'doctor_137', '123456', '彭芳', '13800100137', 'pengfang4@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (152, 'doctor_138', '123456', '曾丽', '13800100138', 'zengli4@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (153, 'doctor_139', '123456', '叶强', '13800100139', 'yeqiang4@hospital.com', 2, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (154, 'doctor_140', '123456', '戴芳', '13800100140', 'daifang5@hospital.com', 1, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (155, 'doctor_141', '123456', '钟伟', '13800100141', 'zhongwei4@hospital.com', 1, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (156, 'doctor_142', '123456', '黄涛', '13800100142', 'huangtao5@hospital.com', 1, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (157, 'doctor_143', '123456', '冯丽', '13800100143', 'fengli4@hospital.com', 1, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (158, 'doctor_144', '123456', '陈强', '13800100144', 'chenqiang5@hospital.com', 1, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (159, 'doctor_145', '123456', '林芳', '13800100145', 'linfang4@hospital.com', 1, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (160, 'doctor_146', '123456', '何强', '13800100146', 'heqiang4@hospital.com', 1, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (161, 'doctor_147', '123456', '梁静', '13800100147', 'liangjing8@hospital.com', 1, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (162, 'doctor_148', '123456', '韩静', '13800100148', 'hanjing4@hospital.com', 1, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (163, 'doctor_149', '123456', '唐强', '13800100149', 'tangqiang4@hospital.com', 1, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (164, 'doctor_150', '123456', '许芳', '13800100150', 'xufang4@hospital.com', 1, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (165, 'doctor_151', '123456', '彭伟', '13800100151', 'pengwei6@hospital.com', 1, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (166, 'doctor_152', '123456', '曾芳', '13800100152', 'zengfang5@hospital.com', 1, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (167, 'doctor_153', '123456', '吕强', '13800100153', 'luqiang6@hospital.com', 1, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (168, 'doctor_154', '123456', '苏静', '13800100154', 'sujing4@hospital.com', 1, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (169, 'doctor_155', '123456', '魏涛', '13800100155', 'weitao4@hospital.com', 1, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (170, 'doctor_156', '123456', '叶华', '13800100156', 'yehua5@hospital.com', 1, 1, '2026-05-07 11:27:49');
INSERT INTO `user_info` VALUES (171, 'zmjjkk', '7PiO4lw04OYGN0VZvCoWkA==', '郑永康', '', NULL, 2, 1, '2026-05-08 09:42:16');
INSERT INTO `user_info` VALUES (172, 'yingyang001', '123456', '李明华', '13800138001', 'limh@hospital.com', 1, 1, '2026-05-08 11:23:57');
INSERT INTO `user_info` VALUES (173, 'yingyang002', '123456', '王芳', '13800138002', 'wangf@hospital.com', 1, 1, '2026-05-08 11:23:57');
INSERT INTO `user_info` VALUES (174, 'yingyang003', '123456', '张伟', '13800138003', 'zhangw@hospital.com', 1, 1, '2026-05-08 11:23:57');
INSERT INTO `user_info` VALUES (175, 'laonian001', '123456', '陈建国', '13800138004', 'chenjg@hospital.com', 1, 1, '2026-05-08 11:23:57');
INSERT INTO `user_info` VALUES (176, 'laonian002', '123456', '刘冬梅', '13800138005', 'liudm@hospital.com', 1, 1, '2026-05-08 11:23:57');
INSERT INTO `user_info` VALUES (177, 'laonian003', '123456', '赵强', '13800138006', 'zhaoq@hospital.com', 1, 1, '2026-05-08 11:23:57');
INSERT INTO `user_info` VALUES (178, 'guomin001', '123456', '孙丽华', '13800138007', 'sunlh@hospital.com', 1, 1, '2026-05-08 11:23:57');
INSERT INTO `user_info` VALUES (179, 'guomin002', '123456', '周伟', '13800138008', 'zhouw@hospital.com', 1, 1, '2026-05-08 11:23:57');
INSERT INTO `user_info` VALUES (180, 'guomin003', '123456', '吴敏', '13800138009', 'wumin@hospital.com', 1, 1, '2026-05-08 11:23:57');
INSERT INTO `user_info` VALUES (181, 'tijian001', '123456', '郑磊', '13800138010', 'zhengL@hospital.com', 1, 1, '2026-05-08 11:23:57');
INSERT INTO `user_info` VALUES (182, 'tijian002', '123456', '黄燕', '13800138011', 'huangy@hospital.com', 1, 1, '2026-05-08 11:23:57');
INSERT INTO `user_info` VALUES (183, 'tijian003', '123456', '许峰', '13800138012', 'xuf@hospital.com', 1, 1, '2026-05-08 11:23:57');
INSERT INTO `user_info` VALUES (184, 'Simon', '7PiO4lw04OYGN0VZvCoWkA==', '谢孟勋', '18991927137', NULL, 2, 1, '2026-05-20 09:11:12');
INSERT INTO `user_info` VALUES (186, 'chichou', 'jfZHsTs1jySdJfT/C4KCPQ==', '万顺治', '18991927137', NULL, 2, 1, '2026-05-20 09:40:23');
INSERT INTO `user_info` VALUES (187, 'nobody', 'jfZHsTs1jySdJfT/C4KCPQ==', 'wangsenxu', '18991927135', NULL, 2, 1, '2026-05-25 21:02:55');
INSERT INTO `user_info` VALUES (188, '11111', 'jfZHsTs1jySdJfT/C4KCPQ==', '邓宇航', '18991927135', NULL, 2, 1, '2026-05-29 07:58:07');
INSERT INTO `user_info` VALUES (189, '111111', 'jfZHsTs1jySdJfT/C4KCPQ==', '邓宇航', '101683479', NULL, 2, 1, '2026-05-29 08:13:56');
INSERT INTO `user_info` VALUES (190, 'doctor_400', 'jfZHsTs1jySdJfT/C4KCPQ==', '邓宇航', '18991927135', NULL, 1, 1, '2026-06-09 08:48:19');

SET FOREIGN_KEY_CHECKS = 1;
