# Host: localhost  (Version 5.7.22)
# Date: 2020-03-23 17:58:18
# Generator: MySQL-Front 6.0  (Build 2.20)


#
# Structure for table "answer"
#

CREATE TABLE `answer` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `fication` varchar(15) DEFAULT NULL COMMENT '标识（A,B等）',
  `content` varchar(255) DEFAULT NULL COMMENT '选项内容',
  `flag` varchar(255) DEFAULT '1' COMMENT '状态（0删除）',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='答案';

#
# Data for table "answer"
#


#
# Structure for table "category"
#

CREATE TABLE `category` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '类型（科目一，科目二等）',
  `flag` int(11) DEFAULT '1' COMMENT '状态（0删除   1正常）',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='类别';

#
# Data for table "category"
#


#
# Structure for table "item"
#

CREATE TABLE `item` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '题干',
  `url` varchar(255) DEFAULT NULL COMMENT '视屏连接地址',
  `flag` int(11) DEFAULT '1' COMMENT '状态（0删除）',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='题库';

#
# Data for table "item"
#


#
# Structure for table "i_answer"
#

CREATE TABLE `i_answer` (
  `i_Id` int(11) NOT NULL DEFAULT '0' COMMENT '题id',
  `a_Id` int(11) NOT NULL DEFAULT '0' COMMENT '答案id',
  `right` int(11) DEFAULT '0' COMMENT '是否正确答案（0错误，1正确）',
  PRIMARY KEY (`i_Id`,`a_Id`),
  KEY `a_Id` (`a_Id`,`i_Id`),
  CONSTRAINT `i_answer_ibfk_1` FOREIGN KEY (`i_Id`) REFERENCES `item` (`Id`),
  CONSTRAINT `i_answer_ibfk_2` FOREIGN KEY (`a_Id`) REFERENCES `answer` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='题_答案关联表';

#
# Data for table "i_answer"
#


#
# Structure for table "paper"
#

CREATE TABLE `paper` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '试卷名称',
  `time` date DEFAULT NULL COMMENT '生成时间',
  `flag` varchar(255) DEFAULT '1' COMMENT '状态（0禁用）',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='试卷';

#
# Data for table "paper"
#


#
# Structure for table "i_paper"
#

CREATE TABLE `i_paper` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` int(11) DEFAULT NULL COMMENT '试卷id',
  `i_id` int(11) DEFAULT NULL COMMENT '题目id',
  PRIMARY KEY (`Id`),
  KEY `p_id` (`p_id`),
  KEY `i_id` (`i_id`),
  CONSTRAINT `i_paper_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `paper` (`Id`),
  CONSTRAINT `i_paper_ibfk_2` FOREIGN KEY (`i_id`) REFERENCES `item` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='试卷题库关联表';

#
# Data for table "i_paper"
#


#
# Structure for table "sys_log"
#

CREATE TABLE `sys_log` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '请求类型',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '日志标题',
  `remote_addr` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '操作IP地址',
  `username` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '操作用户昵称',
  `request_uri` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '请求URI',
  `http_method` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '操作方式',
  `class_method` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '请求类型.方法',
  `params` text COLLATE utf8_bin COMMENT '操作提交的数据',
  `session_id` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'sessionId',
  `response` longtext COLLATE utf8_bin COMMENT '返回内容',
  `use_time` bigint(11) DEFAULT NULL COMMENT '方法执行时间',
  `browser` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '浏览器信息',
  `area` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '地区',
  `province` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '省',
  `city` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '市',
  `isp` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '网络服务提供商',
  `exception` text COLLATE utf8_bin COMMENT '异常信息',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(64) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `del_flag` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`) USING BTREE,
  KEY `sys_log_request_uri` (`request_uri`) USING BTREE,
  KEY `sys_log_type` (`type`) USING BTREE,
  KEY `sys_log_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统日志';

#
# Data for table "sys_log"
#


#
# Structure for table "sys_menu"
#

CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单',
  `level` bigint(2) DEFAULT NULL COMMENT '菜单层级',
  `parent_ids` varchar(2000) DEFAULT NULL COMMENT '父菜单联集',
  `sort` smallint(6) DEFAULT NULL COMMENT '排序',
  `href` varchar(2000) DEFAULT NULL COMMENT '链接地址',
  `target` varchar(20) DEFAULT NULL COMMENT '打开方式',
  `icon` varchar(100) DEFAULT NULL COMMENT '菜单图标',
  `bg_color` varchar(255) DEFAULT NULL COMMENT '显示背景色',
  `is_show` tinyint(2) DEFAULT NULL COMMENT '是否显示',
  `permission` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `create_by` bigint(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COMMENT='权限表';

#
# Data for table "sys_menu"
#

INSERT INTO `sys_menu` VALUES (1,'系统管理',NULL,1,'1,',20,'',NULL,'',NULL,1,'',1,'2018-01-16 11:29:46',1,'2018-01-20 03:09:26',NULL,0),(2,'系统用户管理',1,2,'1,2,',9,'/admin/system/user/list',NULL,'','#47e69c',1,'sys:user:list',1,'2018-01-16 11:31:18',1,'2018-01-20 05:59:20',NULL,0),(3,'系统角色管理',1,2,'1,3,',10,'/admin/system/role/list',NULL,'','#c23ab9',1,'sys:role:list',1,'2018-01-16 11:32:33',1,'2018-01-20 05:58:58',NULL,0),(4,'系统权限管理',1,2,'1,4,',20,'/admin/system/menu/list',NULL,'','#d4573b',1,'sys:menu:list',1,'2018-01-16 11:33:19',1,'2018-02-08 09:49:28',NULL,0),(5,'系统资源管理',1,2,'1,5,',30,'/admin/system/rescource/list',NULL,'','#f5e42a',1,'sys:rescource:list',1,'2018-01-16 11:34:48',1,'2018-01-20 05:56:35',NULL,1),(6,'系统日志管理',1,2,'1,6,',40,'/admin/system/log/list',NULL,'','#b56c18',1,'sys:log:list',1,'2018-01-16 11:35:31',1,'2018-01-20 05:12:17',NULL,0),(7,'网站基本信息',1,2,'1,7,',50,'/admin/system/site/show',NULL,'','#95deb9',1,'sys:site:list',1,'2018-01-16 11:36:50',1,'2018-01-20 05:55:44',NULL,1),(8,'数据库管理',1,2,'1,8,',60,'/admin/system/table/list',NULL,'','#369e16',1,'sys:table:list',1,'2018-01-16 11:38:29',1,'2018-01-20 03:14:23',NULL,1),(9,'系统字典管理',1,2,'1,9,',70,'/admin/system/dict/list',NULL,'','#1bbcc2',1,'sys:dict:list',1,'2018-01-16 14:51:52',1,'2018-01-20 03:12:27',NULL,1),(10,'博客管理',NULL,1,'10,',10,'',NULL,'',NULL,1,'',1,'2018-01-17 13:21:53',1,'2018-01-22 00:28:28',NULL,1),(11,'栏目管理',10,2,'10,11,',6,'/admin/blogChannel/list',NULL,'',NULL,1,'blog:channel:list',1,'2018-01-17 13:22:57',1,'2018-02-08 10:20:54',NULL,1),(12,'博客评论',10,2,'10,12,',7,'/admin/blogComment/list',NULL,'','#c8e332',1,'blog:comment:list',1,'2018-01-17 13:23:52',1,'2018-02-08 10:25:26',NULL,1),(13,'博客文章',10,2,'10,13,',8,'/admin/blogArticle/list',NULL,'','#1962b5',1,'blog:article:list',1,'2018-01-17 16:02:07',1,'2018-02-08 10:26:13',NULL,1),(14,'定时任务',NULL,1,'14,',5,'',NULL,'',NULL,1,'',1,'2018-01-26 22:39:35',1,'2018-02-08 10:31:05',NULL,1),(15,'任务列表',14,2,'14,15,',15,'/admin/quartzTask/list',NULL,'','#d6d178',1,'quartz:task:list',1,'2018-01-26 22:41:25',1,'2018-02-08 10:31:11',NULL,1),(16,'任务执行日志',14,2,'14,16,',10,'/admin/quartzTaskLog/list',NULL,'','#5158d6',1,'quartz:log:list',1,'2018-01-27 01:07:11',1,'2018-02-08 10:37:51',NULL,1),(17,'新增字典',9,3,'1,9,17,',0,'',NULL,NULL,NULL,0,'sys:dict:add',1,'2018-02-08 09:39:09',1,'2018-02-08 09:39:19',NULL,1),(18,'编辑字典',9,3,'1,9,18,',10,'',NULL,NULL,NULL,0,'sys:dict:edit',1,'2018-02-08 09:40:37',1,'2018-02-08 09:40:46',NULL,1),(19,'编辑字典类型',9,3,'1,9,19,',20,'',NULL,NULL,NULL,0,'sys:dict:editType',1,'2018-02-08 09:42:46',1,'2018-02-08 09:54:07',NULL,1),(20,'新增系统权限',4,3,'1,4,20,',0,'',NULL,NULL,NULL,0,'sys:menu:add',1,'2018-02-08 09:49:15',1,'2018-02-08 09:49:38',NULL,0),(21,'编辑系统权限',4,3,'1,4,21,',10,'',NULL,NULL,NULL,0,'sys:menu:edit',1,'2018-02-08 09:50:16',1,'2018-02-08 09:50:25',NULL,0),(22,'删除系统权限',4,3,'1,4,22,',20,'',NULL,NULL,NULL,0,'sys:menu:delete',1,'2018-02-08 09:51:53',1,'2018-02-08 09:53:42',NULL,0),(23,'删除系统资源',5,3,'1,5,23,',0,'',NULL,NULL,NULL,0,'sys:rescource:delete',1,'2018-02-08 09:56:44',1,'2018-02-08 09:56:53',NULL,1),(24,'新增系统角色',3,3,'1,3,24,',0,'',NULL,NULL,NULL,0,'sys:role:add',1,'2018-02-08 09:58:11',1,'2018-02-08 09:58:11',NULL,0),(25,'编辑菜单权限',3,3,'1,3,25,',10,'',NULL,NULL,NULL,0,'sys:role:edit',1,'2018-02-08 09:59:01',1,'2018-02-08 09:59:01',NULL,0),(26,'删除角色',3,3,'1,3,26,',20,'',NULL,NULL,NULL,0,'sys:role:delete',1,'2018-02-08 09:59:56',1,'2018-02-08 09:59:56',NULL,0),(27,'编辑系统信息',7,3,'1,7,27,',0,'',NULL,NULL,NULL,0,'sys:site:edit',1,'2018-02-08 10:01:40',1,'2018-02-08 10:01:40',NULL,1),(28,'数据库新增',8,3,'1,8,28,',0,'',NULL,NULL,NULL,0,'sys:table:add',1,'2018-02-08 10:02:51',1,'2018-02-08 10:02:51',NULL,1),(29,'编辑数据库',8,3,'1,8,29,',10,'',NULL,NULL,NULL,0,'sys:table:edit',1,'2018-02-08 10:03:58',1,'2018-02-08 10:03:58',NULL,1),(30,'新增数据库字段',8,3,'1,8,30,',20,'',NULL,NULL,NULL,0,'sys:table:addField',1,'2018-02-08 10:05:11',1,'2018-02-08 10:05:11',NULL,1),(31,'编辑数据库字段',8,3,'1,8,31,',30,'',NULL,NULL,NULL,0,'sys:table:editField',1,'2018-02-08 10:05:47',1,'2018-02-08 10:05:47',NULL,1),(32,'删除数据库字段',8,3,'1,8,32,',40,'',NULL,NULL,NULL,0,'sys:table:deleteField',1,'2018-02-08 10:07:29',1,'2018-02-08 10:15:39',NULL,1),(33,'删除数据库',8,3,'1,8,33,',50,'',NULL,NULL,NULL,0,'sys:table:deleteTable',1,'2018-02-08 10:08:16',1,'2018-02-08 10:08:16',NULL,1),(34,'下载源码',8,3,'1,8,34,',60,'',NULL,NULL,NULL,0,'sys:table:download',1,'2018-02-08 10:09:28',1,'2018-02-08 10:09:28',NULL,1),(35,'新增系统用户',2,3,'1,2,35,',0,'',NULL,NULL,NULL,0,'sys:user:add',1,'2018-02-08 10:10:32',1,'2018-02-08 10:10:32',NULL,0),(36,'编辑系统用户',2,3,'1,2,36,',10,'',NULL,NULL,NULL,0,'sys:user:edit',1,'2018-02-08 10:11:49',1,'2018-02-08 10:11:49',NULL,0),(37,'删除系统用户',2,3,'1,2,37,',20,'',NULL,NULL,NULL,0,'sys:user:delete',1,'2018-02-08 10:12:43',1,'2018-02-08 10:12:43',NULL,0),(38,'新增博客文章',13,3,'10,13,38,',0,'',NULL,NULL,NULL,0,'blog:article:add',1,'2018-02-08 10:16:59',1,'2018-02-08 10:16:59',NULL,1),(39,'博客文章编辑',13,3,'10,13,39,',10,'',NULL,NULL,NULL,0,'blog:article:edit',1,'2018-02-08 10:17:16',1,'2018-02-08 10:17:16',NULL,1),(40,'博客文章删除',13,3,'10,13,40,',20,'',NULL,NULL,NULL,0,'blog:article:delete',1,'2018-02-08 10:17:34',1,'2018-02-08 10:44:02',NULL,1),(41,'博客评论回复',12,3,'10,12,41,',0,'',NULL,NULL,NULL,0,'blog:comment:reply',1,'2018-02-08 10:19:29',1,'2018-02-08 10:20:33',NULL,1),(42,'新增博客栏目',11,3,'10,11,42,',0,'',NULL,NULL,NULL,0,'blog:channel:add',1,'2018-02-08 10:22:06',1,'2018-02-08 10:22:06',NULL,1),(43,'编辑博客栏目',11,3,'10,11,43,',10,'',NULL,NULL,NULL,0,'blog:channel:edit',1,'2018-02-08 10:23:31',1,'2018-02-08 10:23:31',NULL,1),(44,'删除博客栏目',11,3,'10,11,44,',20,'',NULL,NULL,NULL,0,'blog:channel:delete',1,'2018-02-08 10:23:57',1,'2018-02-08 10:23:57',NULL,1),(45,'删除博客评论',12,3,'10,12,45,',10,'',NULL,NULL,NULL,0,'blog:comment:delete',1,'2018-02-08 10:28:48',1,'2018-02-08 10:28:48',NULL,1),(46,'新增定时任务',15,3,'14,15,46,',0,'',NULL,NULL,NULL,0,'quartz:task:add',1,'2018-02-08 10:32:46',1,'2018-02-08 10:32:46',NULL,1),(47,'编辑定时任务',15,3,'14,15,47,',10,'',NULL,NULL,NULL,0,'quartz:task:edit',1,'2018-02-08 10:34:18',1,'2018-02-08 10:34:18',NULL,1),(48,'删除定时任务',15,3,'14,15,48,',20,'',NULL,NULL,NULL,0,'quartz:task:delete',1,'2018-02-08 10:35:07',1,'2018-02-08 10:35:07',NULL,1),(49,'暂停定时任务',15,3,'14,15,49,',30,'',NULL,NULL,NULL,0,'quartz:task:paush',1,'2018-02-08 10:35:43',1,'2018-02-08 10:35:43',NULL,1),(50,'恢复运行任务',15,3,'14,15,50,',40,'',NULL,NULL,NULL,0,'quartz:task:resume',1,'2018-02-08 10:36:26',1,'2018-02-08 10:36:26',NULL,1),(51,'立即执行运行任务',15,3,'14,15,51,',50,'',NULL,NULL,NULL,0,'quartz:task:run',1,'2018-02-08 10:36:55',1,'2018-02-08 10:36:55',NULL,1),(52,'删除定时任务日志',16,3,'14,16,52,',0,'',NULL,NULL,NULL,0,'quartz:log:delete',1,'2018-02-08 10:39:04',1,'2018-02-08 10:39:04',NULL,1),(53,'修改密码',2,3,'1,2,53,',30,'',NULL,'',NULL,0,'sys:user:changePassword',1,'2018-03-15 10:14:06',1,'2018-03-15 10:14:06',NULL,0),(54,'删除字典',9,3,'1,9,54,',30,'',NULL,NULL,NULL,0,'sys:dict:delete',1,'2018-03-15 10:16:55',1,'2018-03-15 10:16:55',NULL,1),(55,'系统日志删除',6,3,'1,6,55,',0,'',NULL,NULL,NULL,0,'system:logs:delete',1,'2018-06-16 04:30:32',1,'2018-06-16 04:30:32',NULL,0),(56,'博客标签',10,2,'10,56,',3,'/admin/blogTags/list',NULL,'','#c3e8ce',1,'blog:tags:list',1,'2018-06-16 04:42:15',1,'2018-06-16 04:42:30',NULL,1),(57,'博客标签新增',56,3,'10,56,57,',0,'',NULL,NULL,NULL,0,'blog:tags:add',1,'2018-06-16 04:43:02',1,'2018-06-16 04:43:02',NULL,1),(58,'博客标签编辑',56,3,'10,56,58,',10,'',NULL,NULL,NULL,0,'blog:tags:edit',1,'2018-06-16 04:43:26',1,'2018-06-16 04:43:26',NULL,1),(59,'博客标签删除',56,3,'10,56,59,',20,'',NULL,NULL,NULL,0,'blog:tags:delete',1,'2018-06-16 04:43:56',1,'2018-06-16 04:43:56',NULL,1),(60,'Druid数据监控',1,2,'1,60,',25,'/admin/druid/list',NULL,'','#7e8755',1,'sys:druid:list',1,'2018-06-16 05:06:17',1,'2018-06-16 05:06:26',NULL,1),(61,'七牛云存储信息',7,3,'1,7,61,',10,'',NULL,NULL,NULL,0,'sys:site:editQiniu',1,'2018-07-12 18:46:39',1,'2018-07-12 18:46:39',NULL,1),(62,'阿里云信息存储',7,3,'1,7,62,',20,'',NULL,NULL,NULL,0,'sys:site:editOss',1,'2018-07-12 18:47:05',1,'2018-07-12 18:47:05',NULL,1);

#
# Structure for table "sys_role"
#

CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL COMMENT '角色名称',
  `create_date` datetime DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色表';

#
# Data for table "sys_role"
#

INSERT INTO `sys_role` VALUES (1,'老司机','2017-11-02 14:19:07',1,NULL,NULL,'',0),(2,'系统管理员','2017-11-29 19:36:37',1,NULL,NULL,'',0);

#
# Structure for table "sys_role_menu"
#

CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限表';

#
# Data for table "sys_role_menu"
#

INSERT INTO `sys_role_menu` VALUES (1,1),(1,2),(1,3),(1,4),(2,1),(2,2),(2,3),(2,4),(2,6),(2,20),(2,21),(2,22),(2,24),(2,25),(2,26),(2,35),(2,36),(2,37),(2,53),(2,55);

#
# Structure for table "sys_user"
#

CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `login_name` varchar(36) DEFAULT NULL COMMENT '登录名',
  `nick_name` varchar(40) DEFAULT NULL COMMENT '昵称',
  `icon` varchar(2000) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL COMMENT '密码',
  `salt` varchar(40) DEFAULT NULL COMMENT 'shiro加密盐',
  `tel` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱地址',
  `locked` tinyint(2) DEFAULT NULL COMMENT '是否锁定',
  `create_date` datetime DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

#
# Data for table "sys_user"
#

INSERT INTO `sys_user` VALUES (1,'test','我是管理员','https://static.mysiteforme.com/3c5b69f4-2e39-4f88-b302-a6eb48e4c43a.jpg','810339f5426fe2dcaf92c5cac718acc6471a034b','3fb62b5aeede1bbf','13776055179','b@qq.com',0,'2017-11-27 22:19:39',1,'2018-06-16 04:27:15',1,'',0);

#
# Structure for table "sys_user_role"
#

CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表';

#
# Data for table "sys_user_role"
#

INSERT INTO `sys_user_role` VALUES (1,1),(1,2);

#
# Structure for table "u_c_item"
#

CREATE TABLE `u_c_item` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `c_id` int(11) DEFAULT NULL COMMENT '类型id',
  `i_id` int(11) DEFAULT NULL COMMENT '题目id',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户类别题库关联表';

#
# Data for table "u_c_item"
#

