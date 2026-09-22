-- 补充 hospital_db.sql 中缺失、但后端代码已使用的表
USE `hospital_db`;

SET NAMES utf8mb4;

CREATE TABLE IF NOT EXISTS `site_visit` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `visit_time` datetime DEFAULT NULL COMMENT '访问时间',
  `visit_url` varchar(500) DEFAULT NULL COMMENT '访问页面',
  `visitor_ip` varchar(64) DEFAULT NULL COMMENT '访客 IP',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='站点访问统计';

CREATE TABLE IF NOT EXISTS `announcement_info` (
  `announcement_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL COMMENT '公告标题',
  `content` text COMMENT '公告内容',
  `author_id` int DEFAULT NULL COMMENT '发布人 ID',
  `author_name` varchar(50) DEFAULT NULL COMMENT '发布人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '发布时间',
  `status` int DEFAULT 1 COMMENT '状态：1 发布 0 下线',
  PRIMARY KEY (`announcement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统公告';

INSERT INTO `announcement_info` (`title`, `content`, `author_id`, `author_name`, `create_time`, `status`)
SELECT '智慧门诊系统上线', '欢迎使用医院门诊诊疗系统，支持 AI 预问诊、在线挂号、医生接诊与病历闭环管理。', 1, '系统管理员', NOW(), 1
WHERE NOT EXISTS (SELECT 1 FROM `announcement_info` LIMIT 1);
