# ************************************************************
# Sequel Ace SQL dump
# 版本号： 20035
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# 主机: 127.0.0.1 (MySQL 8.0.30)
# 数据库: crontab
# 生成时间: 2022-09-26 08:58:55 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# 转储表 host
# ------------------------------------------------------------

DROP TABLE IF EXISTS `host`;

CREATE TABLE `host` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `alias` varchar(32) NOT NULL DEFAULT '',
  `port` int NOT NULL DEFAULT '5921',
  `remark` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `host` WRITE;
/*!40000 ALTER TABLE `host` DISABLE KEYS */;

INSERT INTO `host` (`id`, `name`, `alias`, `port`, `remark`)
VALUES
	(1,'127.0.0.1','本地',5921,'');

/*!40000 ALTER TABLE `host` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 login_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `login_log`;

CREATE TABLE `login_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `login_log` WRITE;
/*!40000 ALTER TABLE `login_log` DISABLE KEYS */;

INSERT INTO `login_log` (`id`, `username`, `ip`, `created`)
VALUES
	(1,'admin','127.0.0.1','2022-09-26 13:55:19'),
	(2,'admin','127.0.0.1','2022-09-26 13:56:44'),
	(3,'admin','127.0.0.1','2022-09-26 15:13:56');

/*!40000 ALTER TABLE `login_log` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 setting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `setting`;

CREATE TABLE `setting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` varchar(4096) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;

INSERT INTO `setting` (`id`, `code`, `key`, `value`)
VALUES
	(1,'slack','url','https://hooks.slack.com/services/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'),
	(2,'slack','template','任务ID:  {{.TaskId}}\n任务名称: {{.TaskName}}\n状态:    {{.Status}}\n执行结果: {{.Result}}\n备注: {{.Remark}}'),
	(3,'mail','server',''),
	(4,'mail','template','\n任务ID:  {{.TaskId}}\n任务名称: {{.TaskName}}\n状态:    {{.Status}}\n执行结果: {{.Result}}\n备注: {{.Remark}}\n'),
	(5,'webhook','template','\n{\n  \"task_id\": \"{{.TaskId}}\",\n  \"task_name\": \"{{.TaskName}}\",\n  \"status\": \"{{.Status}}\",\n  \"result\": \"{{.Result}}\",\n  \"remark\": \"{{.Remark}}\"\n}\n'),
	(6,'webhook','url',''),
	(7,'slack','channel','#定时任务');

/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 task
# ------------------------------------------------------------

DROP TABLE IF EXISTS `task`;

CREATE TABLE `task` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `level` tinyint NOT NULL DEFAULT '1',
  `dependency_task_id` varchar(64) NOT NULL DEFAULT '',
  `dependency_status` tinyint NOT NULL DEFAULT '1',
  `spec` varchar(64) NOT NULL,
  `protocol` tinyint NOT NULL,
  `command` varchar(256) NOT NULL,
  `http_method` tinyint NOT NULL DEFAULT '1',
  `timeout` mediumint NOT NULL DEFAULT '0',
  `multi` tinyint NOT NULL DEFAULT '1',
  `retry_times` tinyint NOT NULL DEFAULT '0',
  `retry_interval` smallint NOT NULL DEFAULT '0',
  `notify_status` tinyint NOT NULL DEFAULT '1',
  `notify_type` tinyint NOT NULL DEFAULT '0',
  `notify_receiver_id` varchar(256) NOT NULL DEFAULT '',
  `notify_keyword` varchar(128) NOT NULL DEFAULT '',
  `tag` varchar(32) NOT NULL DEFAULT '',
  `remark` varchar(100) NOT NULL DEFAULT '',
  `status` tinyint NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `deleted` datetime DEFAULT NULL,
  `updated` datetime NOT NULL,
  `creater` int NOT NULL DEFAULT '0',
  `updater` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_task_level` (`level`),
  KEY `IDX_task_protocol` (`protocol`),
  KEY `IDX_task_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;

INSERT INTO `task` (`id`, `name`, `level`, `dependency_task_id`, `dependency_status`, `spec`, `protocol`, `command`, `http_method`, `timeout`, `multi`, `retry_times`, `retry_interval`, `notify_status`, `notify_type`, `notify_receiver_id`, `notify_keyword`, `tag`, `remark`, `status`, `created`, `deleted`, `updated`, `creater`, `updater`)
VALUES
	(1,'测试echo任务',1,'',1,'0 0 0 1 * *',2,'echo 1',1,0,0,0,0,2,2,'7','','','',1,'2022-09-26 16:16:59',NULL,'2022-09-26 16:16:59',1,1);

/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 task_host
# ------------------------------------------------------------

DROP TABLE IF EXISTS `task_host`;

CREATE TABLE `task_host` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` int NOT NULL,
  `host_id` smallint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_task_host_host_id` (`host_id`),
  KEY `IDX_task_host_task_id` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `task_host` WRITE;
/*!40000 ALTER TABLE `task_host` DISABLE KEYS */;

INSERT INTO `task_host` (`id`, `task_id`, `host_id`)
VALUES
	(1,1,1);

/*!40000 ALTER TABLE `task_host` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 task_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `task_log`;

CREATE TABLE `task_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `task_id` int NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `spec` varchar(64) NOT NULL,
  `protocol` tinyint NOT NULL,
  `command` varchar(256) NOT NULL,
  `timeout` mediumint NOT NULL DEFAULT '0',
  `retry_times` tinyint NOT NULL DEFAULT '0',
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `result` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_task_log_task_id` (`task_id`),
  KEY `IDX_task_log_protocol` (`protocol`),
  KEY `IDX_task_log_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `task_log` WRITE;
/*!40000 ALTER TABLE `task_log` DISABLE KEYS */;

INSERT INTO `task_log` (`id`, `task_id`, `name`, `spec`, `protocol`, `command`, `timeout`, `retry_times`, `hostname`, `start_time`, `end_time`, `status`, `result`)
VALUES
	(1,1,'测试echo任务','手动运行',2,'echo 1',0,0,'本地 - 127.0.0.1<br>','2022-09-26 16:17:02','2022-09-26 16:17:03',2,'主机: [本地-127.0.0.1:5921]\n\n1\n\n\n'),
	(2,1,'测试echo任务','手动运行',2,'echo 1',0,0,'本地 - 127.0.0.1<br>','2022-09-26 16:45:35','2022-09-26 16:45:35',2,'主机: [本地-127.0.0.1:5921]\n\n1\n\n\n');

/*!40000 ALTER TABLE `task_log` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `password` char(32) NOT NULL,
  `salt` char(6) NOT NULL,
  `email` varchar(50) NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `is_admin` tinyint NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_user_email` (`email`),
  UNIQUE KEY `UQE_user_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `name`, `password`, `salt`, `email`, `created`, `updated`, `is_admin`, `status`)
VALUES
	(1,'admin','514af5b48be94480a268dc96408e1e88','hh67KS','279861795@qq.com','2022-09-26 13:55:14','2022-09-26 13:55:14',1,1);

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
