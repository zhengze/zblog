-- MySQL dump 9.11
--
-- Host: localhost    Database: zblog
-- ------------------------------------------------------
-- Server version	4.0.22-nt

--
-- Table structure for table `auth_group`
--

CREATE TABLE auth_group (
  id int(11) NOT NULL auto_increment,
  name varchar(80) NOT NULL default '',
  PRIMARY KEY  (id),
  UNIQUE KEY name (name)
) TYPE=MyISAM;

--
-- Dumping data for table `auth_group`
--


--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE auth_group_permissions (
  id int(11) NOT NULL auto_increment,
  group_id int(11) NOT NULL default '0',
  permission_id int(11) NOT NULL default '0',
  PRIMARY KEY  (id),
  UNIQUE KEY group_id (group_id,permission_id),
  KEY auth_group_permissions_0e939a4f (group_id),
  KEY auth_group_permissions_8373b171 (permission_id)
) TYPE=MyISAM;

--
-- Dumping data for table `auth_group_permissions`
--


--
-- Table structure for table `auth_permission`
--

CREATE TABLE auth_permission (
  id int(11) NOT NULL auto_increment,
  name varchar(50) NOT NULL default '',
  content_type_id int(11) NOT NULL default '0',
  codename varchar(100) NOT NULL default '',
  PRIMARY KEY  (id),
  UNIQUE KEY content_type_id (content_type_id,codename),
  KEY auth_permission_417f1b1c (content_type_id)
) TYPE=MyISAM;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO auth_permission VALUES (1,'Can add permission',1,'add_permission');
INSERT INTO auth_permission VALUES (2,'Can change permission',1,'change_permission');
INSERT INTO auth_permission VALUES (3,'Can delete permission',1,'delete_permission');
INSERT INTO auth_permission VALUES (4,'Can add group',2,'add_group');
INSERT INTO auth_permission VALUES (5,'Can change group',2,'change_group');
INSERT INTO auth_permission VALUES (6,'Can delete group',2,'delete_group');
INSERT INTO auth_permission VALUES (7,'Can add user',3,'add_user');
INSERT INTO auth_permission VALUES (8,'Can change user',3,'change_user');
INSERT INTO auth_permission VALUES (9,'Can delete user',3,'delete_user');
INSERT INTO auth_permission VALUES (10,'Can add content type',4,'add_contenttype');
INSERT INTO auth_permission VALUES (11,'Can change content type',4,'change_contenttype');
INSERT INTO auth_permission VALUES (12,'Can delete content type',4,'delete_contenttype');
INSERT INTO auth_permission VALUES (13,'Can add session',5,'add_session');
INSERT INTO auth_permission VALUES (14,'Can change session',5,'change_session');
INSERT INTO auth_permission VALUES (15,'Can delete session',5,'delete_session');
INSERT INTO auth_permission VALUES (16,'Can add site',6,'add_site');
INSERT INTO auth_permission VALUES (17,'Can change site',6,'change_site');
INSERT INTO auth_permission VALUES (18,'Can delete site',6,'delete_site');
INSERT INTO auth_permission VALUES (19,'Can add log entry',7,'add_logentry');
INSERT INTO auth_permission VALUES (20,'Can change log entry',7,'change_logentry');
INSERT INTO auth_permission VALUES (21,'Can delete log entry',7,'delete_logentry');
INSERT INTO auth_permission VALUES (22,'Can add article',8,'add_article');
INSERT INTO auth_permission VALUES (23,'Can change article',8,'change_article');
INSERT INTO auth_permission VALUES (24,'Can delete article',8,'delete_article');
INSERT INTO auth_permission VALUES (25,'Can add classify',9,'add_classify');
INSERT INTO auth_permission VALUES (26,'Can change classify',9,'change_classify');
INSERT INTO auth_permission VALUES (27,'Can delete classify',9,'delete_classify');
INSERT INTO auth_permission VALUES (28,'Can add poll',10,'add_poll');
INSERT INTO auth_permission VALUES (29,'Can change poll',10,'change_poll');
INSERT INTO auth_permission VALUES (30,'Can delete poll',10,'delete_poll');
INSERT INTO auth_permission VALUES (31,'Can add choice',11,'add_choice');
INSERT INTO auth_permission VALUES (32,'Can change choice',11,'change_choice');
INSERT INTO auth_permission VALUES (33,'Can delete choice',11,'delete_choice');
INSERT INTO auth_permission VALUES (34,'Can add tag',12,'add_tag');
INSERT INTO auth_permission VALUES (35,'Can change tag',12,'change_tag');
INSERT INTO auth_permission VALUES (36,'Can delete tag',12,'delete_tag');

--
-- Table structure for table `auth_user`
--

CREATE TABLE auth_user (
  id int(11) NOT NULL auto_increment,
  password varchar(128) NOT NULL default '',
  last_login datetime NOT NULL default '0000-00-00 00:00:00',
  is_superuser tinyint(1) NOT NULL default '0',
  username varchar(30) NOT NULL default '',
  first_name varchar(30) NOT NULL default '',
  last_name varchar(30) NOT NULL default '',
  email varchar(75) NOT NULL default '',
  is_staff tinyint(1) NOT NULL default '0',
  is_active tinyint(1) NOT NULL default '0',
  date_joined datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (id),
  UNIQUE KEY username (username)
) TYPE=MyISAM;

--
-- Dumping data for table `auth_user`
--

INSERT INTO auth_user VALUES (1,'pbkdf2_sha256$12000$x3Qdiz1P8nJH$KmZjGC0rNL6Ix9VcQ05/ixFgkzSR2cZ0vVyQ/lalShU=','2015-06-16 12:53:21',1,'admin','','','zhang_zhze@sina.com',1,1,'2015-02-24 06:48:19');

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE auth_user_groups (
  id int(11) NOT NULL auto_increment,
  user_id int(11) NOT NULL default '0',
  group_id int(11) NOT NULL default '0',
  PRIMARY KEY  (id),
  UNIQUE KEY user_id (user_id,group_id),
  KEY auth_user_groups_e8701ad4 (user_id),
  KEY auth_user_groups_0e939a4f (group_id)
) TYPE=MyISAM;

--
-- Dumping data for table `auth_user_groups`
--


--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE auth_user_user_permissions (
  id int(11) NOT NULL auto_increment,
  user_id int(11) NOT NULL default '0',
  permission_id int(11) NOT NULL default '0',
  PRIMARY KEY  (id),
  UNIQUE KEY user_id (user_id,permission_id),
  KEY auth_user_user_permissions_e8701ad4 (user_id),
  KEY auth_user_user_permissions_8373b171 (permission_id)
) TYPE=MyISAM;

--
-- Dumping data for table `auth_user_user_permissions`
--


--
-- Table structure for table `django_admin_log`
--

CREATE TABLE django_admin_log (
  id int(11) NOT NULL auto_increment,
  action_time datetime NOT NULL default '0000-00-00 00:00:00',
  object_id longtext,
  object_repr varchar(200) NOT NULL default '',
  action_flag smallint(5) unsigned NOT NULL default '0',
  change_message longtext NOT NULL,
  content_type_id int(11) default NULL,
  user_id int(11) NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY django_admin_log_417f1b1c (content_type_id),
  KEY django_admin_log_e8701ad4 (user_id)
) TYPE=MyISAM;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO django_admin_log VALUES (1,'2015-05-24 03:04:32','1','what\'s up',1,'',10,1);
INSERT INTO django_admin_log VALUES (2,'2015-05-24 03:09:49','1','what\'s up',2,'没有字段被修改。',10,1);
INSERT INTO django_admin_log VALUES (3,'2015-05-24 03:10:04','1','what\'s up',3,'',10,1);
INSERT INTO django_admin_log VALUES (4,'2015-05-24 03:10:18','2','what\'s up',1,'',10,1);
INSERT INTO django_admin_log VALUES (5,'2015-05-24 03:17:24','1','choice 1',1,'',11,1);
INSERT INTO django_admin_log VALUES (6,'2015-05-24 05:41:18','2','what\'s up',2,'已添加 choice \"choice 2\". 已添加 choice \"choice 3\".',10,1);
INSERT INTO django_admin_log VALUES (7,'2015-06-16 13:10:03','1','django',1,'',9,1);
INSERT INTO django_admin_log VALUES (8,'2015-06-16 13:10:10','2','日记',1,'',9,1);
INSERT INTO django_admin_log VALUES (9,'2015-06-16 13:10:25','1','python',1,'',12,1);
INSERT INTO django_admin_log VALUES (10,'2015-06-16 13:10:35','2','django',1,'',12,1);
INSERT INTO django_admin_log VALUES (11,'2015-06-16 13:12:11','1','django和tornado的比较',1,'',8,1);
INSERT INTO django_admin_log VALUES (12,'2015-06-16 14:49:18','3','生活',1,'',12,1);
INSERT INTO django_admin_log VALUES (13,'2015-06-16 14:49:23','2','生活',1,'',8,1);

--
-- Table structure for table `django_content_type`
--

CREATE TABLE django_content_type (
  id int(11) NOT NULL auto_increment,
  name varchar(100) NOT NULL default '',
  app_label varchar(100) NOT NULL default '',
  model varchar(100) NOT NULL default '',
  PRIMARY KEY  (id),
  UNIQUE KEY app_label (app_label,model)
) TYPE=MyISAM;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO django_content_type VALUES (1,'permission','auth','permission');
INSERT INTO django_content_type VALUES (2,'group','auth','group');
INSERT INTO django_content_type VALUES (3,'user','auth','user');
INSERT INTO django_content_type VALUES (4,'content type','contenttypes','contenttype');
INSERT INTO django_content_type VALUES (5,'session','sessions','session');
INSERT INTO django_content_type VALUES (6,'site','sites','site');
INSERT INTO django_content_type VALUES (7,'log entry','admin','logentry');
INSERT INTO django_content_type VALUES (8,'article','zblog','article');
INSERT INTO django_content_type VALUES (9,'classify','zblog','classify');
INSERT INTO django_content_type VALUES (10,'poll','polls','poll');
INSERT INTO django_content_type VALUES (11,'choice','polls','choice');
INSERT INTO django_content_type VALUES (12,'tag','zblog','tag');

--
-- Table structure for table `django_migrations`
--

CREATE TABLE django_migrations (
  id int(11) NOT NULL auto_increment,
  app varchar(255) NOT NULL default '',
  name varchar(255) NOT NULL default '',
  applied datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (id)
) TYPE=MyISAM;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO django_migrations VALUES (1,'contenttypes','0001_initial','2015-02-24 06:47:35');
INSERT INTO django_migrations VALUES (2,'auth','0001_initial','2015-02-24 06:47:36');
INSERT INTO django_migrations VALUES (3,'admin','0001_initial','2015-02-24 06:47:37');
INSERT INTO django_migrations VALUES (4,'sessions','0001_initial','2015-02-24 06:47:37');
INSERT INTO django_migrations VALUES (5,'sites','0001_initial','2015-02-24 06:47:37');
INSERT INTO django_migrations VALUES (6,'polls','0001_initial','2015-05-24 01:29:51');

--
-- Table structure for table `django_session`
--

CREATE TABLE django_session (
  session_key varchar(40) NOT NULL default '',
  session_data longtext NOT NULL,
  expire_date datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (session_key),
  KEY django_session_de54fa62 (expire_date)
) TYPE=MyISAM;

--
-- Dumping data for table `django_session`
--

INSERT INTO django_session VALUES ('ggtpd871sabj0zijwimtpcgebdm1cbx1','N2NkNjQyZmJlNzE5N2U4NDI5YTJhMjFhYjhjMzFhMjliOGQ1NDI2Njp7Il9hdXRoX3VzZXJfaGFzaCI6ImJlOGJiM2E0YTUwNDUyNjk2MTJlZTc2YzVlMGFmNDQwZmJiNDA5MzQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-03-10 06:49:05');
INSERT INTO django_session VALUES ('vixb5t8ocnb2elvo525kx1ttlgz1ub2h','N2NkNjQyZmJlNzE5N2U4NDI5YTJhMjFhYjhjMzFhMjliOGQ1NDI2Njp7Il9hdXRoX3VzZXJfaGFzaCI6ImJlOGJiM2E0YTUwNDUyNjk2MTJlZTc2YzVlMGFmNDQwZmJiNDA5MzQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-06-07 03:03:43');
INSERT INTO django_session VALUES ('8qkpuqqcoodfq1tnw0a7wy9t6pb5ouwx','N2NkNjQyZmJlNzE5N2U4NDI5YTJhMjFhYjhjMzFhMjliOGQ1NDI2Njp7Il9hdXRoX3VzZXJfaGFzaCI6ImJlOGJiM2E0YTUwNDUyNjk2MTJlZTc2YzVlMGFmNDQwZmJiNDA5MzQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-03-19 03:42:54');
INSERT INTO django_session VALUES ('4l6lqtz7rgqyxa7m4j1ocv7erhhya9tu','N2NkNjQyZmJlNzE5N2U4NDI5YTJhMjFhYjhjMzFhMjliOGQ1NDI2Njp7Il9hdXRoX3VzZXJfaGFzaCI6ImJlOGJiM2E0YTUwNDUyNjk2MTJlZTc2YzVlMGFmNDQwZmJiNDA5MzQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-06-30 12:53:21');

--
-- Table structure for table `django_site`
--

CREATE TABLE django_site (
  id int(11) NOT NULL auto_increment,
  domain varchar(100) NOT NULL default '',
  name varchar(50) NOT NULL default '',
  PRIMARY KEY  (id)
) TYPE=MyISAM;

--
-- Dumping data for table `django_site`
--

INSERT INTO django_site VALUES (1,'example.com','example.com');

--
-- Table structure for table `zblog_article`
--

CREATE TABLE zblog_article (
  id int(11) NOT NULL auto_increment,
  title varchar(50) NOT NULL default '',
  content longtext NOT NULL,
  created_time datetime NOT NULL default '0000-00-00 00:00:00',
  classify_id int(11) NOT NULL default '0',
  tag_id int(11) NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY zblog_article_372c5586 (classify_id),
  KEY zblog_article_5659cca2 (tag_id)
) TYPE=MyISAM;

--
-- Dumping data for table `zblog_article`
--

INSERT INTO zblog_article VALUES (1,'django和tornado的比较','在各种语言平台中，python涌现的web框架恐怕是最多的；猜想原因应该是在py中构造框架十分简单，使得轮子不断被发明。\r\n\r\n这里记述一下我了解过的两个py web框架，供大家参考，希望能起他山之石的作用。\r\n\r\n====== Django ======\r\nDjango 应该是最出名的py框架，Google App Engine甚至Erlang都有框架受它影响。\r\n\r\nDjango是走大而全的方向，它最出名的是其全自动化的管理后台：只需要使用起ORM，做简单的对象定义，它就能自动生成数据库结构、以及全功能的管理后台。\r\n\r\nDjango提供的方便，也意味着Django内置的ORM跟框架内的其他模块耦合程度高。\r\n\r\n应用程序必须使用Django内置的ORM，否则就不能享受到框架内提供的种种基于其ORM的便利；理论上可以切换掉其ORM模块，但这就相当于要把装修完毕的房子拆除重新装修，倒不如一开始就去毛胚房做全新的装修。\r\n\r\nDjango的卖点是超高的开发效率，其性能扩展有限；采用Django的项目，在流量达到一定规模后，都需要对其进行重构，才能满足性能的要求。\r\n\r\n\r\nRuby的Rails也有类似的问题；以Twitter为例，推特到了今日的规模，不要说Rails，甚至是连Ruby都需要抛弃重来。\r\n\r\n就我的感觉Django适用的是中小型的网站，或者是作为大型网站快速实现产品雏形的工具。\r\n\r\n===== Django 模板 =====\r\nDjango的模板系统设计十分有意思，也应该其框架内影响最大、争议最大的部分。\r\n\r\nDjango模板的设计哲学是彻底的将代码、样式分离；asp.net提倡将代码/模板分离，但技术上还是可以混合；而Django则是从根本上杜绝在模板中进行编码、处理数据的可能。\r\n\r\n比方说，asp.net模板中可以写：\r\n<%\r\n  int i;\r\n  for(i==0;i<10;i++){\r\n  ....\r\n  }\r\n%>\r\n\r\nDjango是彻底不支持嵌入类似上面的代码，仅能使用其模板内置的函数；这实际上，是为其模板构造了一种“新语言”；由于此“新语言”十分简单，所以也能够将其模板移植到不同平台。\r\n\r\n大多数情况下，Django的模板功能是足够的，但对于特殊（有时“特殊”也不是十分特殊）的情况，还是需要在模板中嵌入代码，那么就需要根据其模板系统的规则做模板扩展。有时候，模板中直接写一行代码能够解决的问题，用模板扩展实现后，会变成十几行代码。\r\n\r\n是否容忍在模板中编程，正是Django模板争议最大之处。\r\n\r\n====== Tornado ======\r\nTornado( http://www.tornadoweb.org )是Facebook开源出来的框架，其哲学跟Django近乎两个极端。\r\n\r\nTornado走的是少而精的方向，它也有提供模板功能；虽然不鼓励，但作者是可以允许在模板进行少量编码（直接嵌入单行py代码）的。\r\n\r\n如果跟asp.net相比，Tornado有点类似仅实现了AsyncHttpHandler；除此之外，全部需要自己去实现。\r\n\r\n好吧，其实它有模板，有国际化支持，甚至还有内置的OAuth/OpenID模块，方便做第三方登录，它其实也直接实现了Http服务器。\r\n\r\n但它没有ORM（仅有一个mysql的超简单封装），甚至没有Session支持，更不要说Django那样自动化的后台。\r\n\r\n假设是一个大型网站，在高性能的要求下，框架的各个部分往往都需要定制，可以复用的模块非常少；一个以Django开发的网站，各部分经过不断的定制，Django框架剩下的，很有可能也就是tornado一开始所能提供的这部分。\r\n\r\n殊途同归。\r\n\r\n===== HTTP服务器 =====\r\nTornado为了高效实现Comet/后端异步调用HTTP接口，是直接内嵌了HTTP服务器。\r\n\r\n前端无需加apache / lighttpd / nginx等也可以供浏览器访问；但它并没有完整实现HTTP 1.1的协议，所以官方文档是推荐用户在生产环境下在前端使用nginx，后端反向代理到多个Tornado实例。\r\n\r\nTornado本身是单线程的异步网络程序，它默认启动时，会根据CPU数量运行多个实例；充分利用CPU多核的优势。\r\n\r\n===== 单线程异步 =====\r\n网站基本都会有数据库操作，而Tornado是单线程的，这意味着如果数据库查询返回过慢，整个服务器响应会被堵塞。\r\n\r\n数据库查询，实质上也是远程的网络调用；理想情况下，是将这些操作也封装成为异步的；但Tornado对此并**没有**提供任何支持。\r\n\r\n这是Tornado的**设计**，而不是缺陷。\r\n\r\n一个系统，要满足高流量；是必须解决数据库查询速度问题的！\r\n\r\n数据库若存在查询性能问题，整个系统无论如何优化，数据库都会是瓶颈，拖慢整个系统！\r\n\r\n异步并**不能**从本质上提到系统的性能；它仅仅是避免多余的网络响应等待，以及切换线程的CPU耗费。\r\n\r\n如果数据库查询响应太慢，需要解决的是数据库的性能问题；而不是调用数据库的前端Web应用。\r\n\r\n对于实时返回的数据查询，理想情况下需要确保所有数据都在内存中，数据库硬盘IO应该为0；这样的查询才能足够快；而如果数据库查询足够快，那么前端web应用也就无将数据查询封装为异步的必要。\r\n\r\n就算是使用协程，异步程序对于同步程序始终还是会提高复杂性；需要衡量的是处理这些额外复杂性是否值得。\r\n\r\n如果后端有查询实在是太慢，无法绕过，Tornaod的建议是将这些查询在后端封装独立封装成为HTTP接口，然后使用Tornado内置的异步HTTP客户端进行调用。','2015-06-16 13:11:54',1,1);
INSERT INTO zblog_article VALUES (2,'生活','生活不相信眼泪','2015-06-16 14:49:02',2,3);

--
-- Table structure for table `zblog_classify`
--

CREATE TABLE zblog_classify (
  id int(11) NOT NULL auto_increment,
  name varchar(20) NOT NULL default '',
  PRIMARY KEY  (id)
) TYPE=MyISAM;

--
-- Dumping data for table `zblog_classify`
--

INSERT INTO zblog_classify VALUES (1,'django');
INSERT INTO zblog_classify VALUES (2,'日记');

--
-- Table structure for table `zblog_tag`
--

CREATE TABLE zblog_tag (
  id int(11) NOT NULL auto_increment,
  name varchar(20) NOT NULL default '',
  PRIMARY KEY  (id)
) TYPE=MyISAM;

--
-- Dumping data for table `zblog_tag`
--

INSERT INTO zblog_tag VALUES (1,'python');
INSERT INTO zblog_tag VALUES (2,'django');
INSERT INTO zblog_tag VALUES (3,'生活');

