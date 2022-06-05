-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: shop
-- ------------------------------------------------------
-- Server version	5.7.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `browse`
--

DROP TABLE IF EXISTS `browse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `browse` (
  `user_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `begin_time` varchar(100) NOT NULL,
  `end_time` varchar(100) NOT NULL,
  `time` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `browse`
--

LOCK TABLES `browse` WRITE;
/*!40000 ALTER TABLE `browse` DISABLE KEYS */;
INSERT INTO `browse` VALUES (1,2,4,'2022/5/31 22:35:00','2022/5/31 22:38:03','183'),(1,2,4,'2022/5/31 22:38:03','2022/5/31 22:39:54','111'),(1,15,5,'2022/5/31 22:45:17','2022/5/31 22:45:45','28'),(1,1,4,'2022/5/31 22:48:37','2022/5/31 22:49:24','47'),(1,15,5,'2022/5/31 22:51:03','2022/5/31 22:51:24','21'),(1,15,5,'2022/5/31 22:56:36','2022/5/31 22:56:42','6'),(1,15,5,'2022/5/31 22:56:57','2022/5/31 22:57:35','38');
/*!40000 ALTER TABLE `browse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `sales` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `img_path` varchar(100) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `goods_info` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,'沙发',400,0,100,'static/img/491369abd793435c846f52e33d38498d.jpg',1,4,'轻奢豪华，坐起来非常舒服，可供三人使用'),(2,'衣柜',200,0,100,'static/img/624f7522b2864b42a95d5292d64ac022.jpg',1,4,'多层衣柜，方便实用'),(3,'衣帽架',200,0,100,'static/img/0765ee00afc049d7972b21ddd742df75.jpg',1,4,'简单方便，可以折叠，占地空间小'),(4,'双人木床',500,0,100,'static/img/874965c3e595457bb1629c6ebad2c30d.jpg',1,4,'床头可以通电，置有充电插口可以使用'),(5,'洗衣机',300,0,100,'static/img/350c4e09d70d46a8bd9c2d94eb2528c2.jpg',1,4,'内部空间大，可以放置多件衣服，去污能力强'),(6,'凳子',50,0,100,'static/img/866c7625d16e43379450fca960f84de5.jpg',1,4,'柔软实用，小巧便携'),(7,'零食大礼包',40,0,100,'static/img/37c3722fd574483b82715c5e942b4004.jpg',2,1,'里面含有多种零食，多袋合作一袋，一次性吃个够！'),(8,'全麦面包',30,0,100,'static/img/ea529b774bbe4be6af7c7eb713da05f4.jpg',2,1,'多种吃法，健康又好吃！'),(9,'泡椒凤爪',20,0,100,'static/img/d44bde49afca46849b6084e398a81c63.jpg',2,1,'各打肉多，口感清脆爽口，轻松食用！'),(10,'新疆椒麻鸡',40,0,100,'static/img/efcf4910be75450094a573ebb5cb6364.jpg',2,1,'产自新疆，正宗配方，让你吃了就忘不了！'),(11,'速食米线',8,0,100,'static/img/9a4ce70735ed45569a15691bb3a53cf0.jpg',2,1,'开袋即食，汤汁美味可口，配料十足'),(12,'混合坚果',80,0,100,'static/img/7578a38939b143c88998a97bb1e92928.jpg',2,1,'意大利进口坚果，富含各类营养物质！'),(13,'蓝牙耳机',200,0,100,'static/img/d26fd88e19734ea2b3130d1e515a1ecc.jpg',3,5,'音质清晰，超长续航，头戴舒服'),(14,'平板电脑',3500,0,100,'static/img/ea834070bbbd4be5a5943d80551e4d34.jpg',3,5,'新款平板电脑，多种功能一次满足'),(15,'苹果手机',7000,0,100,'static/img/653d35ef4e324dcc89a7b3d274dd1389.jpg',3,5,'商家暂未提供该商品的描述信息'),(16,'电子手表',300,0,100,'static/img/4c1365838f36400c86b316b7c405f5e7.jpg',3,5,'多功能电子手表，可以连接蓝牙，内置运动模式，实时监控您的身体'),(17,'相机',1500,0,100,'static/img/595712c109444e9488d889e3181bf438.jpg',3,5,'超大像素，拍出精美照片，漂亮机身，展示出众颜值'),(18,'笔记本电脑',6000,0,100,'static/img/90ed82e67ed24b94a0e9cd7259c6aa88.jpg',3,5,'高性能笔记本电脑，机身轻薄，散热强劲'),(19,'迷你游戏机',400,0,100,'static/img/7ed95e5e63904ceb897a838dc2ef5607.jpg',4,6,'携带方便，支持多款游戏，让你随时随地回味童年'),(20,'飞镖盘',30,0,100,'static/img/f73d46cdc79f4b91b3c6a818defdb6c7.jpg',4,6,'商家暂未提供该商品的描述信息'),(21,'扑克牌',1,0,100,'static/img/26083d1f3d4c4b17a453da0d5cf1c6aa.jpg',4,6,'价格便宜，物美价廉，只支持大量订购'),(22,'投篮机',1000,0,100,'static/img/7426429b3d704565b0a32ac1e8dd570e.jpg',4,6,'娱乐城一体式投篮机，支持家用'),(23,'桌面足球机',400,0,100,'static/img/05f2e575dcde4eeb9eb23d285a2207fd.jpg',4,6,'一起来享受亲子时光吧！'),(24,'台球桌',1200,0,100,'static/img/a0235d9a850745a1b99da2077dc22e27.jpg',4,6,'商家暂未提供该商品的描述信息'),(25,'玛丽珍鞋',150,0,100,'static/img/52bb0482189a4c2c8378db2048834a08.jpg',5,2,'秀珍小巧，风格清新'),(26,'夏季潮流短袖',30,0,100,'static/img/76b335bf7eaf4db1bd771679ba9d7c56.jpg',5,2,'舒适柔软，穿着清爽，非常适合夏季'),(27,'夏季长裤',40,0,100,'static/img/be4dd1b1cb784ff68a9547c4e45a197b.jpg',5,2,'冰丝长裤，透气十足，夏季穿不热'),(28,'尖头高跟鞋',200,0,100,'static/img/a0454ea49c5c4d64b4d90151407fdbd2.jpg',5,2,'商家暂未提供该商品的描述信息'),(29,'男士polo衫',200,0,100,'static/img/013ad0525ae54d168872f93117a6b367.jpg',5,2,'正品纯棉polo衬衫，非常修身，尽显身材'),(30,'篮球鞋',200,0,100,'static/img/8e5ad9bc38da46dba2468ab93c2f49dc.jpg',5,2,'商家暂未提供该商品的描述信息'),(31,'杯子礼盒',70,0,100,'static/img/a96181fc57124bcea9c1eed1052fd6b5.jpg',6,3,'适合赠送朋友，耐用实惠'),(32,'凉水壶',60,0,100,'static/img/b0bec430ff7046cfa43203ab1f8a5b53.jpg',6,3,'3.9升大号凉水壶，支持反复利用'),(33,'收纳箱',100,0,100,'static/img/b8cb1fe832954e91b823bd695eccfd5a.jpg',6,3,'商家暂未提供该商品的描述信息'),(34,'置物架',30,0,100,'static/img/f3d96360c30a4ea48a123066d8e55e9c.jpg',6,3,'厨房专用多功能置物架，成为您的厨房小帮手！'),(35,'毛巾',20,0,100,'static/img/55f3d0eade2c43f595461438d5bcf307.jpg',6,3,'强吸水，不沾油，易清洁'),(36,'筷子',5,0,100,'static/img/fb83d04978d441c3987112502f93a78e.jpg',6,3,'只支持大量购买，量大可以优惠！'),(37,'液晶电视',2500,0,100,'static/img/00b52fa720a04c508019977fa8687364.jpg',1,4,'大屏！适合全家一起观看！');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `sales` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `img_path` varchar(100) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logininfo`
--

DROP TABLE IF EXISTS `logininfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logininfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `operation` varchar(100) NOT NULL,
  `role` varchar(30) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logininfo`
--

LOCK TABLES `logininfo` WRITE;
/*!40000 ALTER TABLE `logininfo` DISABLE KEYS */;
INSERT INTO `logininfo` VALUES (1,'125.216.248.72','2022/5/31 20:45:43','广东省广州市','登录','商家',1),(2,'125.216.248.72','2022/5/31 20:56:36','广东省广州市','登录','管理员',1),(3,'125.216.248.72','2022/5/31 21:02:54','广东省广州市','登录','商家',2),(4,'125.216.248.72','2022/5/31 21:13:58','广东省广州市','登录','商家',3),(5,'125.216.248.72','2022/5/31 21:25:24','广东省广州市','登录','商家',4),(6,'125.216.248.72','2022/5/31 21:32:07','广东省广州市','登录','商家',5),(7,'125.216.248.72','2022/5/31 21:50:25','广东省广州市','登录','商家',6),(8,'125.216.248.72','2022/5/31 21:56:49','广东省广州市','登录','用户',1),(9,'125.216.248.72','2022/5/31 22:14:51','广东省广州市','登录','用户',1),(10,'125.216.248.72','2022/5/31 22:18:23','广东省广州市','登录','用户',1),(11,'125.216.248.72','2022/5/31 22:24:37','广东省广州市','登录','用户',1),(12,'125.216.248.72','2022/5/31 22:28:04','广东省广州市','登录','用户',1),(13,'125.216.248.72','2022/5/31 22:29:54','广东省广州市','登录','用户',1),(14,'125.216.248.72','2022/5/31 22:32:27','广东省广州市','登录','用户',1),(15,'125.216.248.72','2022/5/31 22:45:00','广东省广州市','登录','用户',1),(16,'125.216.248.72','2022/5/31 22:48:31','广东省广州市','登录','用户',1),(17,'125.216.248.72','2022/5/31 22:56:18','广东省广州市','登录','用户',1),(18,'125.216.248.72','2022/5/31 23:13:20','广东省广州市','登录','用户',1),(19,'125.216.248.72','2022/5/31 23:41:47','广东省广州市','登录','商家',1);
/*!40000 ALTER TABLE `logininfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1,'admin','admin');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation`
--

DROP TABLE IF EXISTS `operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `role` varchar(30) NOT NULL,
  `role_id` int(11) NOT NULL,
  `operate` varchar(100) NOT NULL,
  `target` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation`
--

LOCK TABLES `operation` WRITE;
/*!40000 ALTER TABLE `operation` DISABLE KEYS */;
INSERT INTO `operation` VALUES (1,'125.216.248.72','2022/5/28 14:14:23','???',1,'??','??'),(2,'125.216.248.72','2022/5/28 14:28:45','??',1,'??','??2'),(3,'125.216.248.72','2022/5/29 00:34:52','商家',1,'查询','111'),(4,'125.216.248.72','2022/5/29 04:28:01','用户',1,'查询','111'),(5,'125.216.248.72','2022/5/29 04:40:35','用户',1,'查询','111'),(6,'125.216.248.72','2022/5/29 05:14:56','管理员',1,'查询','1'),(7,'125.216.248.72','2022/5/29 05:15:03','管理员',1,'查询','kangkang'),(8,'125.216.248.72','2022/5/29 10:54:08','用户',1,'提交','订单'),(9,'125.216.248.72','2022/5/29 12:18:52','用户',0,'查询','111'),(10,'125.216.248.72','2022/5/29 12:36:02','用户',0,'查询',''),(11,'125.216.248.72','2022/5/29 14:35:59','用户',0,'查询','111'),(12,'125.216.248.72','2022/5/29 14:36:38','用户',0,'查询','111'),(13,'125.216.248.72','2022/5/29 14:37:19','用户',0,'查询',''),(14,'125.216.248.72','2022/5/29 14:37:31','用户',0,'查询',''),(15,'125.216.248.72','2022/5/29 14:37:53','用户',1,'查询','111'),(16,'125.216.248.72','2022/5/29 15:39:30','用户',0,'查询','111'),(17,'125.216.248.72','2022/5/29 17:55:40','用户',2,'提交','订单'),(18,'125.216.248.72','2022/5/29 18:00:27','商家',1,'修改','商品1'),(19,'125.216.248.72','2022/5/29 18:00:55','商家',1,'修改','商品2'),(20,'125.216.248.72','','用户',2,'提交','订单'),(21,'125.216.248.72','','用户',2,'提交','订单'),(22,'125.216.248.72','2022/5/29 19:21:24','商家',1,'修改','商品2'),(23,'125.216.248.72','2022/5/29 19:21:35','商家',1,'修改','商品1'),(24,'125.216.248.72','','用户',2,'提交','订单'),(25,'125.216.248.72','','用户',2,'提交','订单'),(26,'125.216.248.72','','用户',2,'提交','订单'),(27,'125.216.248.72','','用户',2,'提交','订单'),(28,'125.216.248.72','','用户',2,'提交','订单'),(29,'125.216.248.72','','用户',2,'提交','订单'),(30,'125.216.248.72','','用户',2,'提交','订单'),(31,'125.216.248.72','','用户',2,'提交','订单'),(32,'125.216.248.72','','用户',2,'提交','订单'),(33,'125.216.248.72','2022/5/29 20:13:03','用户',2,'提交','订单'),(34,'125.216.248.72','2022/5/29 20:13:37','用户',2,'提交','订单'),(35,'125.216.248.72','2022/5/29 20:16:11','用户',2,'提交','订单'),(36,'125.216.248.72','2022/5/29 20:31:31','用户',2,'提交','订单'),(37,'125.216.248.72','2022/5/29 20:32:56','用户',2,'提交','订单'),(38,'125.216.248.72','2022/5/29 20:44:42','商家',1,'修改','商品1'),(39,'125.216.248.72','2022/5/29 20:44:51','商家',1,'修改','商品2'),(40,'125.216.248.72','2022/5/29 20:45:04','商家',1,'查询','111'),(41,'125.216.248.72','2022/5/29 20:58:03','商家',1,'修改','商品1'),(42,'125.216.248.72','2022/5/29 21:10:44','商家',1,'查询','111'),(43,'','','商家',1,'添加','商品'),(44,'125.216.248.72','2022/5/30 17:39:33','用户',0,'查询','糖'),(45,'125.216.248.72','2022/5/30 19:03:35','用户',2,'查询',''),(46,'125.216.248.72','2022/5/30 19:09:30','商家',1,'添加','商品'),(47,'125.216.248.72','2022/5/30 19:10:04','商家',1,'添加','商品'),(48,'125.216.248.72','2022/5/30 19:10:20','商家',1,'添加','商品'),(49,'125.216.248.72','2022/5/30 19:10:37','商家',1,'添加','商品'),(50,'125.216.248.72','2022/5/30 19:12:00','商家',1,'添加','商品'),(51,'125.216.248.72','2022/5/30 21:42:57','商家',1,'添加','商品'),(52,'125.216.248.72','2022/5/31 20:49:51','商家',1,'添加','商品'),(53,'125.216.248.72','2022/5/31 20:51:06','商家',1,'添加','商品'),(54,'125.216.248.72','2022/5/31 20:52:18','商家',1,'添加','商品'),(55,'125.216.248.72','2022/5/31 20:53:56','商家',1,'添加','商品'),(56,'125.216.248.72','2022/5/31 20:54:51','商家',1,'添加','商品'),(57,'125.216.248.72','2022/5/31 20:56:14','商家',1,'添加','商品'),(58,'125.216.248.72','2022/5/31 20:57:05','管理员',1,'添加','商家'),(59,'125.216.248.72','2022/5/31 20:57:12','管理员',1,'添加','商家'),(60,'125.216.248.72','2022/5/31 20:57:16','管理员',1,'添加','商家'),(61,'125.216.248.72','2022/5/31 20:57:20','管理员',1,'添加','商家'),(62,'125.216.248.72','2022/5/31 20:57:25','管理员',1,'添加','商家'),(63,'125.216.248.72','2022/5/31 21:04:19','商家',2,'添加','商品'),(64,'125.216.248.72','2022/5/31 21:05:15','商家',2,'添加','商品'),(65,'125.216.248.72','2022/5/31 21:06:20','商家',2,'添加','商品'),(66,'125.216.248.72','2022/5/31 21:07:11','商家',2,'添加','商品'),(67,'125.216.248.72','2022/5/31 21:08:21','商家',2,'添加','商品'),(68,'125.216.248.72','2022/5/31 21:09:13','商家',2,'添加','商品'),(69,'125.216.248.72','2022/5/31 21:15:59','商家',3,'添加','商品'),(70,'125.216.248.72','2022/5/31 21:16:55','商家',3,'添加','商品'),(71,'125.216.248.72','2022/5/31 21:18:00','商家',3,'添加','商品'),(72,'125.216.248.72','2022/5/31 21:19:42','商家',3,'添加','商品'),(73,'125.216.248.72','2022/5/31 21:20:57','商家',3,'添加','商品'),(74,'125.216.248.72','2022/5/31 21:22:37','商家',3,'添加','商品'),(75,'125.216.248.72','2022/5/31 21:26:34','商家',4,'添加','商品'),(76,'125.216.248.72','2022/5/31 21:27:14','商家',4,'添加','商品'),(77,'125.216.248.72','2022/5/31 21:28:20','商家',4,'添加','商品'),(78,'125.216.248.72','2022/5/31 21:29:14','商家',4,'添加','商品'),(79,'125.216.248.72','2022/5/31 21:30:32','商家',4,'添加','商品'),(80,'125.216.248.72','2022/5/31 21:31:53','商家',4,'添加','商品'),(81,'125.216.248.72','2022/5/31 21:45:19','商家',5,'添加','商品'),(82,'125.216.248.72','2022/5/31 21:46:32','商家',5,'添加','商品'),(83,'125.216.248.72','2022/5/31 21:47:32','商家',5,'添加','商品'),(84,'125.216.248.72','2022/5/31 21:48:15','商家',5,'添加','商品'),(85,'125.216.248.72','2022/5/31 21:49:41','商家',5,'添加','商品'),(86,'125.216.248.72','2022/5/31 21:50:13','商家',5,'添加','商品'),(87,'125.216.248.72','2022/5/31 21:51:09','商家',6,'添加','商品'),(88,'125.216.248.72','2022/5/31 21:51:59','商家',6,'添加','商品'),(89,'125.216.248.72','2022/5/31 21:52:28','商家',6,'添加','商品'),(90,'125.216.248.72','2022/5/31 21:53:22','商家',6,'添加','商品'),(91,'125.216.248.72','2022/5/31 21:54:07','商家',6,'添加','商品'),(92,'125.216.248.72','2022/5/31 21:55:25','商家',6,'添加','商品'),(93,'125.216.248.72','2022/5/31 22:27:50','用户',0,'查询','新'),(94,'125.216.248.72','2022/5/31 22:56:28','用户',1,'查询','苹果'),(95,'125.216.248.72','','用户',1,'提交','订单'),(96,'125.216.248.72','2022/5/31 23:43:09','商家',1,'添加','商品');
/*!40000 ALTER TABLE `operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` varchar(100) NOT NULL,
  `create_time` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES ('16540100176751','2022年5月31日 下午11:13:37',200,0,1);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `total_price` int(11) DEFAULT NULL,
  `order_id` varchar(100) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `create_time` varchar(100) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,'衣帽架',1,200,200,'16540100176751',1,'2022年5月31日 下午11:13:37',3,1);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `sales_volume` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (1,'kangkang','kangkang',1815),(2,'111','111',0),(3,'222','222',0),(4,'333','333',0),(5,'444','444',0),(6,'555','555',0);
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'111','111','282955402@qq.com',3);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_like`
--

DROP TABLE IF EXISTS `user_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_like` (
  `user_id` int(11) NOT NULL,
  `food` int(11) DEFAULT NULL,
  `clothes` int(11) DEFAULT NULL,
  `daily` int(11) DEFAULT NULL,
  `furniture` int(11) DEFAULT NULL,
  `electric` int(11) DEFAULT NULL,
  `fun` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_like`
--

LOCK TABLES `user_like` WRITE;
/*!40000 ALTER TABLE `user_like` DISABLE KEYS */;
INSERT INTO `user_like` VALUES (1,0,0,14,16,3,0);
/*!40000 ALTER TABLE `user_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'shop'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-01  1:14:25
