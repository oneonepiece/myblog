/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 8.0.15 : Database - my_blog_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
USE `my_blog_db`;

/*Table structure for table `demoj_freetime` */

DROP TABLE IF EXISTS `demoj_freetime`;

CREATE TABLE `demoj_freetime` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `stuid` bigint(32) DEFAULT NULL,
  `startTime` varchar(64) DEFAULT NULL,
  `endTime` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `demoj_freetime` */

insert  into `demoj_freetime`(`id`,`stuid`,`startTime`,`endTime`) values (1,12,'2019-07-14 15:20','2019-07-14 15:25');

/*Table structure for table `demoj_student` */

DROP TABLE IF EXISTS `demoj_student`;

CREATE TABLE `demoj_student` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `stuid` int(8) DEFAULT NULL,
  `name` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `demoj_student` */

insert  into `demoj_student`(`id`,`stuid`,`name`) values (1,12,'Lin'),(2,13,'Li'),(3,14,'梁'),(4,15,'g'),(5,16,'t'),(6,17,'17'),(7,18,'h'),(8,8,'y'),(9,19,'l'),(10,20,'g'),(11,21,'21'),(12,22,'rr'),(13,23,'tt');

/*Table structure for table `tb_admin_user` */

DROP TABLE IF EXISTS `tb_admin_user`;

CREATE TABLE `tb_admin_user` (
  `admin_user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `login_user_name` varchar(50) NOT NULL COMMENT '管理员登陆名称',
  `login_password` varchar(50) NOT NULL COMMENT '管理员登陆密码',
  `nick_name` varchar(50) NOT NULL COMMENT '管理员显示昵称',
  `locked` tinyint(4) DEFAULT '0' COMMENT '是否锁定 0未锁定 1已锁定无法登陆',
  PRIMARY KEY (`admin_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tb_admin_user` */

insert  into `tb_admin_user`(`admin_user_id`,`login_user_name`,`login_password`,`nick_name`,`locked`) values (1,'admin','21232f297a57a5a743894a0e4a801fc3','aLin',0),(2,'gan','f1253bc7b6c0b1d62eb9b97cfebf0f63','月',0);

/*Table structure for table `tb_blog` */

DROP TABLE IF EXISTS `tb_blog`;

CREATE TABLE `tb_blog` (
  `blog_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '博客表主键id',
  `blog_title` varchar(200) NOT NULL COMMENT '博客标题',
  `blog_sub_url` varchar(200) NOT NULL COMMENT '博客自定义路径url',
  `blog_cover_image` varchar(200) NOT NULL COMMENT '博客封面图',
  `blog_content` mediumtext NOT NULL COMMENT '博客内容',
  `blog_category_id` int(11) NOT NULL COMMENT '博客分类id',
  `blog_category_name` varchar(50) NOT NULL COMMENT '博客分类(冗余字段)',
  `blog_tags` varchar(200) NOT NULL COMMENT '博客标签',
  `blog_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-草稿 1-发布',
  `blog_views` bigint(20) NOT NULL DEFAULT '0' COMMENT '阅读量',
  `enable_comment` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-允许评论 1-不允许评论',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除 0=否 1=是',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`blog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

/*Data for the table `tb_blog` */

insert  into `tb_blog`(`blog_id`,`blog_title`,`blog_sub_url`,`blog_cover_image`,`blog_content`,`blog_category_id`,`blog_category_name`,`blog_tags`,`blog_status`,`blog_views`,`enable_comment`,`is_deleted`,`create_time`,`update_time`) values (1,'我是zoro','about','http://127.0.0.1:8080/admin/dist/img/rand/33.jpg','## About me\n\n我是zoro，一名Java开发者,大三学生一枚。共勉！\n\n## Contact\n\n- 我的邮箱：971594738@qq.com\n- 我的网站：待补充',20,'About','',1,256,0,0,'2017-03-12 00:31:15','2019-06-20 00:31:15'),(80,'Day525','','http://127.0.0.1:8080/upload/20190722_13465690.jpg','ffff',25,'JAVA','java',1,7,0,0,'2019-07-22 13:46:57','2019-07-22 13:46:57');

/*Table structure for table `tb_blog_category` */

DROP TABLE IF EXISTS `tb_blog_category`;

CREATE TABLE `tb_blog_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类表主键',
  `category_name` varchar(50) NOT NULL COMMENT '分类的名称',
  `category_icon` varchar(50) NOT NULL COMMENT '分类的图标',
  `category_rank` int(11) NOT NULL DEFAULT '1' COMMENT '分类的排序值 被使用的越多数值越大',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除 0=否 1=是',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `tb_blog_category` */

insert  into `tb_blog_category`(`category_id`,`category_name`,`category_icon`,`category_rank`,`is_deleted`,`create_time`) values (20,'About','/admin/dist/img/category/10.png',26,0,'2019-06-26 00:28:49'),(22,'SSM','/admin/dist/img/category/02.png',19,0,'2019-06-26 00:28:49'),(24,'日常随笔','/admin/dist/img/category/06.png',45,0,'2019-06-26 00:28:49'),(25,'JAVA','/admin/dist/img/category/02.png',79,0,'2019-06-26 00:28:49'),(26,'SS','/admin/dist/img/category/00.png',1,1,'2019-07-02 09:10:21'),(27,'Android','/admin/dist/img/category/03.png',1,0,'2019-07-03 15:18:43');

/*Table structure for table `tb_blog_comment` */

DROP TABLE IF EXISTS `tb_blog_comment`;

CREATE TABLE `tb_blog_comment` (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `blog_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '关联的blog主键',
  `commentator` varchar(50) NOT NULL DEFAULT '' COMMENT '评论者名称',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '评论人的邮箱',
  `website_url` varchar(50) NOT NULL DEFAULT '' COMMENT '网址',
  `comment_body` varchar(200) NOT NULL DEFAULT '' COMMENT '评论内容',
  `comment_create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论提交时间',
  `commentator_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '评论时的ip地址',
  `reply_body` varchar(200) NOT NULL DEFAULT '' COMMENT '回复内容',
  `reply_create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '回复时间',
  `comment_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否审核通过 0-未审核 1-审核通过',
  `is_deleted` tinyint(4) DEFAULT '0' COMMENT '是否删除 0-未删除 1-已删除',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Data for the table `tb_blog_comment` */

insert  into `tb_blog_comment`(`comment_id`,`blog_id`,`commentator`,`email`,`website_url`,`comment_body`,`comment_create_time`,`commentator_ip`,`reply_body`,`reply_create_time`,`comment_status`,`is_deleted`) values (34,80,'45','1455941195@qq.com','','你好','2019-07-25 10:57:26','','','2019-07-25 10:57:26',0,0);

/*Table structure for table `tb_blog_tag` */

DROP TABLE IF EXISTS `tb_blog_tag`;

CREATE TABLE `tb_blog_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标签表主键id',
  `tag_name` varchar(100) NOT NULL COMMENT '标签名称',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除 0=否 1=是',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8;

/*Data for the table `tb_blog_tag` */

insert  into `tb_blog_tag`(`tag_id`,`tag_name`,`is_deleted`,`create_time`) values (142,'java',1,'2019-07-22 13:25:24'),(143,'fdsf',1,'2019-07-22 13:40:02'),(144,'fds',1,'2019-07-22 13:40:02'),(145,'fdfsd',1,'2019-07-22 13:40:02'),(146,'d',1,'2019-07-22 13:40:02'),(147,'fsd',1,'2019-07-22 13:40:02'),(148,'fsdfdsf',1,'2019-07-22 13:40:02'),(149,'java',0,'2019-07-22 13:46:57');

/*Table structure for table `tb_blog_tag_relation` */

DROP TABLE IF EXISTS `tb_blog_tag_relation`;

CREATE TABLE `tb_blog_tag_relation` (
  `relation_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '关系表id',
  `blog_id` bigint(20) NOT NULL COMMENT '博客id',
  `tag_id` int(11) NOT NULL COMMENT '标签id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`relation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=409 DEFAULT CHARSET=utf8;

/*Data for the table `tb_blog_tag_relation` */

insert  into `tb_blog_tag_relation`(`relation_id`,`blog_id`,`tag_id`,`create_time`) values (408,80,149,'2019-07-22 13:46:57');

/*Table structure for table `tb_blog_user` */

DROP TABLE IF EXISTS `tb_blog_user`;

CREATE TABLE `tb_blog_user` (
  `id` int(12) NOT NULL COMMENT 'id',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登陆名称',
  `user_password` int(50) NOT NULL COMMENT '登陆密码',
  `nick_name` varchar(50) DEFAULT NULL COMMENT '显示昵称',
  `locked` tinyint(4) DEFAULT NULL COMMENT '是否锁定 0未锁定 1已锁定无法登陆',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_blog_user` */

/*Table structure for table `tb_config` */

DROP TABLE IF EXISTS `tb_config`;

CREATE TABLE `tb_config` (
  `config_name` varchar(100) NOT NULL DEFAULT '' COMMENT '配置项的名称',
  `config_value` varchar(200) NOT NULL DEFAULT '' COMMENT '配置项的值',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`config_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_config` */

insert  into `tb_config`(`config_name`,`config_value`,`create_time`,`update_time`) values ('footerAbout','NICE','2019-05-02 06:33:07','2019-05-28 06:33:07'),('footerCopyRight','2019 AA','2019-05-02 06:33:07','2019-05-28 06:33:07'),('footerICP','待补充','2019-05-02 06:33:07','2019-05-28 06:33:07'),('footerPoweredBy','https://github.com/oneonepiece','2019-05-02 06:33:07','2019-05-28 06:33:07'),('footerPoweredByURL','https://github.com/oneonepiece','2019-05-02 06:33:07','2019-05-28 06:33:07'),('websiteDescription','这是SpringBoot2+Thymeleaf+Mybatis建造的个人博客网站.该项目代码原作者在GITHUB上已开源','2019-05-02 06:33:07','2019-05-31 14:26:23'),('websiteIcon','/admin/dist/img/favicon.png','2019-05-02 06:33:07','2019-05-31 14:26:23'),('websiteLogo','/admin/dist/img/logo2.png','2019-05-02 06:33:07','2019-05-31 14:26:23'),('websiteName','MY  BLOG','2019-05-02 06:33:07','2019-05-31 14:26:23'),('yourAvatar','/admin/dist/img/13.png','2019-05-02 06:33:07','2019-05-31 14:58:49'),('yourEmail','971594738@qq.com','2019-05-02 06:33:07','2019-05-31 14:58:49'),('yourName','ZORO','2019-05-02 06:33:07','2019-05-31 14:58:49');

/*Table structure for table `tb_link` */

DROP TABLE IF EXISTS `tb_link`;

CREATE TABLE `tb_link` (
  `link_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '友链表主键id',
  `link_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '友链类别 0-友链 1-推荐 2-个人网站',
  `link_name` varchar(50) NOT NULL COMMENT '网站名称',
  `link_url` varchar(100) NOT NULL COMMENT '网站链接',
  `link_description` varchar(100) NOT NULL COMMENT '网站描述',
  `link_rank` int(11) NOT NULL DEFAULT '0' COMMENT '用于列表排序',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除 0-未删除 1-已删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`link_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `tb_link` */

insert  into `tb_link`(`link_id`,`link_type`,`link_name`,`link_url`,`link_description`,`link_rank`,`is_deleted`,`create_time`) values (1,0,'tqr','rqwe','rqw',0,1,'2019-04-24 15:30:19'),(2,2,'十三的GitHub','https://github.com/ZHENFENG13','十三分享代码的地方',1,1,'2019-04-24 15:30:19'),(3,2,'十三的博客','http://13blog.site','个人独立博客13blog',14,1,'2019-04-24 15:30:19'),(4,1,'CSDN 图文课','https://gitchat.csdn.net','IT优质内容平台',6,1,'2019-04-24 15:30:19'),(5,2,'十三的博客园','https://www.cnblogs.com/han-1034683568','最开始写博客的地方',17,1,'2019-04-24 15:30:19'),(6,1,'CSDN','https://www.csdn.net/','CSDN-专业IT技术社区官网',4,1,'2019-04-24 15:30:19'),(7,0,'梁桂钊的博客','http://blog.720ui.com','后端攻城狮',1,1,'2019-04-24 15:30:19'),(8,0,'猿天地','http://cxytiandi.com','一个综合性的网站,以程序猿用户为主,提供各种开发相关的内容',12,1,'2019-04-24 15:30:19'),(9,0,'Giraffe Home','https://yemengying.com/','Giraffe Home',0,1,'2019-04-24 15:30:19'),(10,0,'纯洁的微笑','http://www.ityouknow.com','分享技术，分享生活',3,1,'2019-04-24 15:30:19'),(11,0,'afsdf','http://localhost:28080/admin/links','fad',0,1,'2019-04-24 15:30:19'),(12,1,'afsdf','http://localhost','fad1',0,1,'2019-04-24 15:30:19'),(13,0,'郭赵晖','http://guozh.net/','老郭三分地',0,1,'2019-04-24 15:30:19'),(14,0,'dalaoyang','https://www.dalaoyang.cn/','dalaoyang',0,1,'2019-04-24 15:31:50'),(15,0,'mushblog','https://www.sansani.cn','穆世明博客',0,1,'2019-04-24 15:32:19'),(16,1,'实验楼','https://www.shiyanlou.com/','一家专注于IT技术的在线实训平台',17,1,'2019-04-24 16:03:48'),(17,2,'《SSM 搭建精美实用的管理系统》','https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9','Spring+SpringMVC+MyBatis实战课程',18,1,'2019-04-24 16:06:52'),(18,2,'《Spring Boot 入门及前后端分离项目实践》','https://www.shiyanlou.com/courses/1244','SpringBoot实战课程',19,1,'2019-04-24 16:07:27'),(19,2,'《玩转Spring Boot 系列》','https://www.shiyanlou.com/courses/1274','SpringBoot实战课程',20,1,'2019-04-24 16:10:30'),(20,1,'百度','http://www.baidu.com','baidu',0,0,'2019-07-02 09:14:31');

/*Table structure for table `tb_permission` */

DROP TABLE IF EXISTS `tb_permission`;

CREATE TABLE `tb_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` varchar(20) NOT NULL COMMENT '权限id',
  `name` varchar(100) NOT NULL COMMENT '权限名称',
  `description` varchar(255) DEFAULT NULL COMMENT '权限描述',
  `url` varchar(255) DEFAULT NULL COMMENT '权限访问路径',
  `perms` varchar(255) DEFAULT NULL COMMENT '权限标识',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级权限id',
  `type` int(1) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `order_num` int(3) DEFAULT '0' COMMENT '排序',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `status` int(1) NOT NULL COMMENT '状态：1有效；2删除',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `tb_permission` */

insert  into `tb_permission`(`id`,`permission_id`,`name`,`description`,`url`,`perms`,`parent_id`,`type`,`order_num`,`icon`,`status`,`create_time`,`update_time`) values (32,'1','permit','gai','1','1',1,1,1,'1',1,'2019-08-20 21:53:52','2019-08-20 21:53:55'),(33,'2','delete',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL);

/*Table structure for table `tb_role` */

DROP TABLE IF EXISTS `tb_role`;

CREATE TABLE `tb_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(20) NOT NULL COMMENT '角色id',
  `name` varchar(50) NOT NULL COMMENT '角色名称',
  `description` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `status` int(1) NOT NULL COMMENT '状态：1有效；2删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `tb_role` */

insert  into `tb_role`(`id`,`role_id`,`name`,`description`,`status`,`create_time`,`update_time`) values (5,'1','noruser','普通用户',1,'2019-08-20 20:52:59','2019-08-20 20:53:08'),(6,'2','manage','管理员',1,'2019-08-22 16:00:51','2019-08-22 16:00:53');

/*Table structure for table `tb_role_permission` */

DROP TABLE IF EXISTS `tb_role_permission`;

CREATE TABLE `tb_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(20) NOT NULL COMMENT '角色id',
  `permission_id` varchar(20) NOT NULL COMMENT '权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=873 DEFAULT CHARSET=utf8;

/*Data for the table `tb_role_permission` */

insert  into `tb_role_permission`(`id`,`role_id`,`permission_id`) values (869,'1','1'),(871,'2','1'),(872,'2','2');

/*Table structure for table `tb_test` */

DROP TABLE IF EXISTS `tb_test`;

CREATE TABLE `tb_test` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `test_info` varchar(50) NOT NULL COMMENT '测试内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tb_test` */

insert  into `tb_test`(`id`,`test_info`) values (1,'SpringBoot-MyBatis测试');

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL COMMENT '用户id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名(账号)',
  `password` varchar(50) NOT NULL,
  `salt` varchar(128) DEFAULT NULL COMMENT '加密盐值',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(50) DEFAULT NULL COMMENT '联系方式',
  `sex` tinyint(3) DEFAULT NULL COMMENT '年龄：1男2女',
  `age` tinyint(3) DEFAULT NULL COMMENT '年龄',
  `status` tinyint(1) NOT NULL COMMENT '用户状态：1有效; 2删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

/*Data for the table `tb_user` */

insert  into `tb_user`(`id`,`user_id`,`username`,`password`,`salt`,`email`,`phone`,`sex`,`age`,`status`,`create_time`,`update_time`,`last_login_time`) values (24,'1','Lin','d9b1d7db4cd6e70935368a1efb10e377',NULL,'1455941195@qq.com','13777554688',1,18,0,'2019-08-20 20:44:46',NULL,NULL),(25,'2','Gan','d9b1d7db4cd6e70935368a1efb10e377',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(26,'3','user1','12b6e20ad450e28f00cbbad5b5cb1e8a','b4a8cc4e5d8541c846d7d3cf583dc718',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(27,'4','user2','8efecea996366148a49202bc73219c24','656e10ede4e12ae2407ce04a91b522a3',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL);

/*Table structure for table `tb_user_role` */

DROP TABLE IF EXISTS `tb_user_role`;

CREATE TABLE `tb_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL COMMENT '用户id',
  `role_id` varchar(20) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `tb_user_role` */

insert  into `tb_user_role`(`id`,`user_id`,`role_id`) values (2,'1','1'),(3,'2','1'),(4,'3','1'),(5,'3','2');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
