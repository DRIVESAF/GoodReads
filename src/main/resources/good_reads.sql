/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.31 : Database - good_reads
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`good_reads` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `good_reads`;

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `book_id` int NOT NULL AUTO_INCREMENT COMMENT '书籍编号',
  `book_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '书籍名称',
  `book_cover` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '书籍封面',
  `book_price` float DEFAULT NULL COMMENT '书籍价格',
  `book_intro` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '书籍描述',
  `book_stock` int DEFAULT NULL COMMENT '书籍库存',
  `book_type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '书籍类型',
  PRIMARY KEY (`book_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `book` */

insert  into `book`(`book_id`,`book_name`,`book_cover`,`book_price`,`book_intro`,`book_stock`,`book_type`) values 
(1,'教父','教父.webp',25.75,'教父及其继承人——他的小儿子迈克尔本来都是坏透了的坏蛋，但是却并不显得令人痛恨，因为他们杀人是整个不合理的社会逼出来的，因为他们杀的也都是更坏的人，他们同那些在幕后“坐地分赃”的政客比较起来，在“坏”的程度上，可真是小巫见大巫了。\r\n美国纽约五大黑势力集团之一的维托·考利昂一家采用多种极端手段，实现了在整个美国黑暗势力团体中的独尊地位。在这场斗争中有黑团伙之间的火拼；有走私贩毒的嚣张；有赌场的烟云；有红灯区的人欲横流。本书被认为是描写资本主义社会中黑社会现象的最具权威的作品',9,'小说'),
(2,'霍乱时期的爱情','霍乱时期的爱情.webp',48,'《霍乱时期的爱情》是加西亚•马尔克斯获得诺贝尔文学奖之后完成的第一部小说。讲述了一段跨越半个多世纪的爱情史诗，穷尽了所有爱情的可能性：忠贞的、隐秘的、粗暴的、羞怯的、柏拉图式的、放荡的、转瞬即逝的、生死相依的……再现了时光的无情流逝，被誉为“人类有史以来最伟大的爱情小说”，是20世纪最重要的经典文学巨著之一。',8,'小说'),
(3,'活着','活着.webp',28,'《活着(新版)》讲述了农村人福贵悲惨的人生遭遇。福贵本是个阔少爷，可他嗜赌如命，终于赌光了家业，一贫如洗。他的父亲被他活活气死，母亲则在穷困中患了重病，福贵前去求药，却在途中被国民党抓去当壮丁。经过几番波折回到家里，才知道母亲早已去世，妻子家珍含辛茹苦地养大两个儿女。此后更加悲惨的命运一次又一次降临到福贵身上，他的妻子、儿女和孙子相继死去，最后只剩福贵和一头老牛相依为命，但老人依旧活着，仿佛比往日更加洒脱与坚强。',6,'小说'),
(4,'梦的解析','梦的解析.webp',39.84,'弗洛伊德首先回顾了此前关于分析梦的科学著作，他认为虽然有趣但是不够充分。然后他记述了许多梦，来阐明他的理论。他的方法开始于分析他的梦“伊尔玛打针”，但也有许多来自病人的个案研究，书中引用的许多最重要的梦都来自他人。\r\n弗洛伊德进行分析的许多来源来自文学作品，该书更多的是一次文学分析的自觉尝试，超过心理学研究的成分。弗洛伊德在此首次讨论了后来发展的恋母情结理论，也就是俄狄浦斯情结。\r\n书中作者声称他发现了三大真理：梦是无意识欲望和儿时欲望的伪装的满足；俄狄浦斯情结是人类普通的心理情绪；儿童是有性爱意识和动机的。',6,'科学'),
(5,'传习录','传习录.webp',39,'《传习录》是哲学著作，由王阳明的门人弟子对其语录和信件进行整理编撰而成。王阳明是中国明代哲学家、宋明理学中心学一派的代表人。此书记载了他的语录和论学书信。“传习”一词源出自《论语》中的“传不习乎”一语。',0,'哲学');

/*Table structure for table `book_sort` */

DROP TABLE IF EXISTS `book_sort`;

CREATE TABLE `book_sort` (
  `sort_id` bigint NOT NULL AUTO_INCREMENT COMMENT '书籍类别编号',
  `name` varchar(45) DEFAULT NULL COMMENT '书籍类别名称',
  PRIMARY KEY (`sort_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `book_sort` */

insert  into `book_sort`(`sort_id`,`name`) values 
(1,'小说'),
(2,'哲学'),
(3,'心理'),
(4,'纪实'),
(5,'中国历史');

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `order_id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `total` float DEFAULT NULL COMMENT '商品总额',
  `amount` int DEFAULT NULL COMMENT '商品数量',
  `status` tinyint(1) DEFAULT NULL COMMENT '支付状态',
  `paytype` tinyint(1) DEFAULT NULL COMMENT '支付方式',
  `name` varchar(45) DEFAULT NULL COMMENT '用户名称',
  `phone` varchar(45) DEFAULT NULL COMMENT '用户电话',
  `address` varchar(45) DEFAULT NULL COMMENT '用户地址',
  `datetime` datetime DEFAULT NULL COMMENT '订单日期',
  `user_id` int DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `order` */

/*Table structure for table `orderitem` */

DROP TABLE IF EXISTS `orderitem`;

CREATE TABLE `orderitem` (
  `orderitem_id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单项目表编号',
  `price` float DEFAULT NULL COMMENT '商品价格',
  `amount` int DEFAULT NULL COMMENT '商品数量',
  `books_id` int DEFAULT NULL COMMENT '书籍id',
  `order_id` bigint NOT NULL COMMENT '订单id',
  PRIMARY KEY (`orderitem_id`) USING BTREE,
  KEY `order_id` (`order_id`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `orderitem` */

/*Table structure for table `recommend` */

DROP TABLE IF EXISTS `recommend`;

CREATE TABLE `recommend` (
  `recommend_id` int NOT NULL AUTO_INCREMENT COMMENT '推荐编号',
  `book_type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '书籍类型',
  `book_id` int DEFAULT NULL COMMENT '书籍编号',
  PRIMARY KEY (`recommend_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `recommend` */

insert  into `recommend`(`recommend_id`,`book_type`,`book_id`) values 
(1,'小说',1),
(2,'小说',2),
(3,'哲学',4);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户表主键',
  `user_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户密码',
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户姓名',
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户邮箱',
  `phone` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户电话',
  `address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户地址',
  `is_admin` bit(1) NOT NULL COMMENT '是否为管理员',
  `is_validate` bit(1) NOT NULL COMMENT '账户是否有效',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `user` */

insert  into `user`(`user_id`,`user_name`,`password`,`name`,`email`,`phone`,`address`,`is_admin`,`is_validate`) values 
(1,'环游','zs123','张三','2499669698@qq.com','15896153901','江苏省淮安市','',''),
(2,'ryzhrrzs','ls456','李四','ls456@outlook.com','15062278029','广西壮族自治区南宁市','',''),
(3,'比目鱼','ww789','王五','ww789@hotmail.com','13456783456','江苏省常州市','',''),
(4,'半夏','bx111','江蓝生','bx111@163.com','133896775632','上海市','\0',''),
(5,'开到荼蘼','tm888','陶然然','tm888@gmail.com','13089667855','江苏省南京市','\0','');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
