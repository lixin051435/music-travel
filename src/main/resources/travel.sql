/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : travel

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2020-08-18 21:06:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '北京');
INSERT INTO `category` VALUES ('2', '成都');
INSERT INTO `category` VALUES ('3', '上海');
INSERT INTO `category` VALUES ('4', '西安');
INSERT INTO `category` VALUES ('5', '天津');
INSERT INTO `category` VALUES ('6', '杭州');
INSERT INTO `category` VALUES ('7', '南京');
INSERT INTO `category` VALUES ('8', '重庆');
INSERT INTO `category` VALUES ('10', '安徽');
INSERT INTO `category` VALUES ('12', '山西');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `address` varchar(100) DEFAULT NULL COMMENT '买家地址',
  `phone` varchar(100) DEFAULT NULL COMMENT '买家联系方式',
  `status` int(11) DEFAULT '0' COMMENT '状态，0：普通用户，1：会员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', 'byh', '12345', '5A124', '123456', '1');
INSERT INTO `customer` VALUES ('5', 'zhang3', '123', '11', '123456', '1');
INSERT INTO `customer` VALUES ('6', 'li4', '123', '1234a', '123456789', '0');
INSERT INTO `customer` VALUES ('8', 'wang5', '123', 'wode dizhi ', '1112424212', '0');
INSERT INTO `customer` VALUES ('9', 'xiaohua', '1234', '贵州兴义', '12345678910', '0');
INSERT INTO `customer` VALUES ('10', 'za', '123456', '12345678@qq.com', '12345678900', '0');
INSERT INTO `customer` VALUES ('11', 'zhayang', '123', '天津', '17695473635', '1');
INSERT INTO `customer` VALUES ('12', '么么哒兽在路上', '123', '南京', '159', '1');
INSERT INTO `customer` VALUES ('13', '查杨', '789', '南京', '17695473635', null);
INSERT INTO `customer` VALUES ('14', 'hehe', '123', '天津市西青区', '123456789', null);
INSERT INTO `customer` VALUES ('15', 'chayang', 'dda', '小白', '123', null);
INSERT INTO `customer` VALUES ('16', 'ads', 'sa', 'sad', '', null);
INSERT INTO `customer` VALUES ('18', 'xiao', '123', '天津市西青区', '1753635695', '1');
INSERT INTO `customer` VALUES ('19', 'guofucheng', '123', '天津市西青区', '17695473635', null);
INSERT INTO `customer` VALUES ('20', '111', '111', '111', '111', null);

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL COMMENT '商品id',
  `oid` int(11) DEFAULT NULL COMMENT '订单id',
  `cstid` int(11) DEFAULT NULL COMMENT '买家id',
  `number` int(11) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  KEY `oid` (`oid`) USING BTREE,
  KEY `cstid` (`cstid`) USING BTREE,
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `product` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`oid`) REFERENCES `order_` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `orderitem_ibfk_3` FOREIGN KEY (`cstid`) REFERENCES `customer` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('1', null, '1', '1', '5');
INSERT INTO `orderitem` VALUES ('2', null, '1', '1', '1');
INSERT INTO `orderitem` VALUES ('5', null, '1', '5', '1');
INSERT INTO `orderitem` VALUES ('8', null, '1', '5', '1');
INSERT INTO `orderitem` VALUES ('13', null, '2', '1', '3');
INSERT INTO `orderitem` VALUES ('14', null, '2', '1', '2');
INSERT INTO `orderitem` VALUES ('18', null, '19', '1', '1');
INSERT INTO `orderitem` VALUES ('34', null, '18', '1', '11');
INSERT INTO `orderitem` VALUES ('41', '1', null, '1', '14');
INSERT INTO `orderitem` VALUES ('46', null, '20', '1', '6');
INSERT INTO `orderitem` VALUES ('47', null, '21', '1', '2');
INSERT INTO `orderitem` VALUES ('48', '1', null, '9', '1');
INSERT INTO `orderitem` VALUES ('49', null, '22', '1', '1');
INSERT INTO `orderitem` VALUES ('50', '30', null, '1', '2');
INSERT INTO `orderitem` VALUES ('51', null, '23', '1', '1');
INSERT INTO `orderitem` VALUES ('52', null, '24', '10', '1');
INSERT INTO `orderitem` VALUES ('53', '26', null, '10', '1');
INSERT INTO `orderitem` VALUES ('55', '1', '26', '13', '8');
INSERT INTO `orderitem` VALUES ('56', '30', '26', '13', '2');
INSERT INTO `orderitem` VALUES ('57', '13', '25', '13', '1');
INSERT INTO `orderitem` VALUES ('58', '30', '27', '13', '2');
INSERT INTO `orderitem` VALUES ('59', '13', '28', '13', '5');
INSERT INTO `orderitem` VALUES ('60', '1', '29', '13', '1');
INSERT INTO `orderitem` VALUES ('61', '31', '29', '13', '3');
INSERT INTO `orderitem` VALUES ('62', '30', '30', '13', '1');
INSERT INTO `orderitem` VALUES ('63', '13', '31', '13', '1');
INSERT INTO `orderitem` VALUES ('64', '30', '31', '13', '1');
INSERT INTO `orderitem` VALUES ('65', '13', '33', '13', '1');
INSERT INTO `orderitem` VALUES ('66', '13', '32', '14', '1');
INSERT INTO `orderitem` VALUES ('67', '30', '33', '13', '2');
INSERT INTO `orderitem` VALUES ('68', '61', null, '13', '1');
INSERT INTO `orderitem` VALUES ('69', '1', '34', '20', '2');

-- ----------------------------
-- Table structure for order_
-- ----------------------------
DROP TABLE IF EXISTS `order_`;
CREATE TABLE `order_` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL COMMENT '订单编号',
  `address` varchar(255) DEFAULT NULL COMMENT '买家地址',
  `status` int(255) DEFAULT '0' COMMENT '支付状态，0：未支付，1：正在发货，2：已发货，3：已收货',
  `cstid` int(11) DEFAULT NULL COMMENT '买家id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cstid` (`cstid`) USING BTREE,
  CONSTRAINT `order__ibfk_1` FOREIGN KEY (`cstid`) REFERENCES `customer` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of order_
-- ----------------------------
INSERT INTO `order_` VALUES ('1', '201811021055177112826', '5a124', '2', '1');
INSERT INTO `order_` VALUES ('2', '201811021055179112826', '我是地址', '2', '1');
INSERT INTO `order_` VALUES ('18', '201811251731209717398', '姓名：byh,邮箱：1191741799@qq.com,配送地址：wodedizhi敖德萨,手机号：123456', '2', '1');
INSERT INTO `order_` VALUES ('19', '201811251750178958169', '姓名：byh,邮箱：1191741799@qq.com,配送地址：dsaddddddddddddddddddddddd,手机号：123456', '2', '1');
INSERT INTO `order_` VALUES ('20', '201904082044558638375', '姓名：1,邮箱：1@qq.com,配送地址：1,手机号：1', '2', '1');
INSERT INTO `order_` VALUES ('21', '201904091215497211908', '姓名：小白,邮箱：1@qq.com,配送地址：武侯区盛和林语北区,手机号：2222', '2', '1');
INSERT INTO `order_` VALUES ('22', '201904091218117269252', '姓名：小白,邮箱：1@qq.com,配送地址：武侯区盛和林语北区,手机号：2222', '2', '1');
INSERT INTO `order_` VALUES ('23', '201904091232576363092', '姓名：小白,邮箱：1@qq.com,配送地址：武侯区盛和林语北区,手机号：2222', '2', '1');
INSERT INTO `order_` VALUES ('24', '201904101551352024028', '姓名：za,邮箱：123456789@qq.com,配送地址：qwertyy,手机号：12345678900', '2', '10');
INSERT INTO `order_` VALUES ('25', '20200327210117002665', '姓名：小白,邮箱：456,配送地址：南京,手机号：1123', '2', '13');
INSERT INTO `order_` VALUES ('26', '202003272103400415414', '姓名：212,邮箱：212121,配送地址：天津,手机号：212', '2', '13');
INSERT INTO `order_` VALUES ('27', '202003272142138794780', '姓名：南京,邮箱：212121,配送地址：南京,手机号：212', '2', '13');
INSERT INTO `order_` VALUES ('28', '20200327214536505132', '姓名：南京,邮箱：212121,配送地址：南京,手机号：212', '2', '13');
INSERT INTO `order_` VALUES ('29', '202003281027069534316', '姓名：123,邮箱：3262,配送地址：232,手机号：258', '2', '13');
INSERT INTO `order_` VALUES ('30', '202003291526096463277', '姓名：ad,邮箱：asd,配送地址：asd,手机号：ads', '2', '13');
INSERT INTO `order_` VALUES ('31', '20200329160707555889', '姓名：chayang,邮箱：qweq@qq.com,配送地址：qwe q q,手机号：12312321', '2', '13');
INSERT INTO `order_` VALUES ('32', '202003291959544579428', '姓名：hehe,邮箱：2326388575@qq.com,配送地址：天津市西青区软件学院,手机号：17695473635', '2', '14');
INSERT INTO `order_` VALUES ('33', '202003301404394164672', '姓名：dsa ,邮箱：asd,配送地址：sad,手机号：asd', '2', '13');
INSERT INTO `order_` VALUES ('34', '202008182106017224736', '姓名：李四,邮箱：2,配送地址：321321,手机号：2121', '1', '20');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `desc_` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '删除分类', '删除分类', '/category/delCategory');
INSERT INTO `permission` VALUES ('2', '分类列表', '查看分类列表', '/category/list');
INSERT INTO `permission` VALUES ('15', '修改分类页面', '修改分类页面', '/category/editCategory');
INSERT INTO `permission` VALUES ('17', '添加商品分类', '添加商品分类', '/category/addCategory');
INSERT INTO `permission` VALUES ('18', '查看管理员列表', '查看管理员列表', '/config/listUser');
INSERT INTO `permission` VALUES ('20', '查看角色列表', '可增删改查', '/config/listRole');
INSERT INTO `permission` VALUES ('21', '查看权限列表', '无', '/config/listPermission');
INSERT INTO `permission` VALUES ('23', '修改管理员信息界面', '修改界面', '/config/editUser');
INSERT INTO `permission` VALUES ('24', '更新管理员信息', '无', '/config/updateUser');
INSERT INTO `permission` VALUES ('25', '管理员删除', '删除', '/config/deleteUser');
INSERT INTO `permission` VALUES ('26', '添加管理员界面', '无', '/config/adminAdd');
INSERT INTO `permission` VALUES ('27', '添加管理员', '无', '/config/addUser');
INSERT INTO `permission` VALUES ('28', '商品列表', '查看商品列表', '/product/list');
INSERT INTO `permission` VALUES ('29', '添加商品', '添加上线商品', '/product/addProduct');
INSERT INTO `permission` VALUES ('30', '删除商品', '暂无', '/product/deleteProduct');
INSERT INTO `permission` VALUES ('31', '修改商品界面', '暂无', '/product/editProduct');
INSERT INTO `permission` VALUES ('32', '更新商品', '暂无', '/product/updateProduct');
INSERT INTO `permission` VALUES ('33', '添加商品界面', '暂无', '/product/productAddUI');
INSERT INTO `permission` VALUES ('34', '商品上线', '暂无', '/product/enableStatus');
INSERT INTO `permission` VALUES ('35', '商品下线', '暂无', '/product/stopStatus');
INSERT INTO `permission` VALUES ('36', '订单发货', '暂无', '/order/orderDelivery');
INSERT INTO `permission` VALUES ('37', '查看订单项', '暂无', '/order/seeOrderItem');
INSERT INTO `permission` VALUES ('38', '评论列表', '暂无', '/review/list');
INSERT INTO `permission` VALUES ('39', '删除评论', '暂无', '/review/del');
INSERT INTO `permission` VALUES ('40', '查看订单列表', '暂无', '/order/list');
INSERT INTO `permission` VALUES ('41', '添加权限UI', '暂无', '/config/adminPerAddUI');
INSERT INTO `permission` VALUES ('42', '添加权限', '暂无', '/config/addPermission');
INSERT INTO `permission` VALUES ('43', '删除权限', '暂无', '/config/deletePermission');
INSERT INTO `permission` VALUES ('44', '修改权限ui', '暂无', '/config/editPermission');
INSERT INTO `permission` VALUES ('45', '更新权限', '暂无', '/config/updatePermission');
INSERT INTO `permission` VALUES ('46', '查看用户列表', '暂无', '/customer/list');
INSERT INTO `permission` VALUES ('47', '删除角色', '暂无', '/config/deleteRole');
INSERT INTO `permission` VALUES ('48', '添加管理员UI', '暂无', '/config/adminAdd');
INSERT INTO `permission` VALUES ('49', '添加管理员', '暂未', '/config/addUser');
INSERT INTO `permission` VALUES ('50', '修改角色UI', '暂无', '/config/editRole');
INSERT INTO `permission` VALUES ('51', '修改角色', '暂无', '/config/updateRole');
INSERT INTO `permission` VALUES ('52', '添加角色UI', '暂无', '/config/addRoleUI');
INSERT INTO `permission` VALUES ('53', '添加角色', '暂无', '/config/addRole');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `price` float(10,2) DEFAULT NULL COMMENT '价格',
  `zan` int(100) DEFAULT NULL COMMENT '赞',
  `number` int(100) DEFAULT NULL COMMENT '销量',
  `status` int(10) DEFAULT '1' COMMENT '状态，1：上线，0：下线',
  `imageurl` varchar(100) DEFAULT NULL COMMENT '商品图片url',
  `miaoshu` varchar(8000) DEFAULT '' COMMENT '商品描述',
  `cid` int(11) DEFAULT NULL COMMENT '分类id',
  `bid` bigint(11) DEFAULT NULL COMMENT '商家id',
  `musicurl` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `product_ibfk_1` (`cid`) USING BTREE,
  KEY `product_ibfk_2` (`bid`) USING BTREE,
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`bid`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '宽窄巷子', '9.00', '541', '94', '1', 'images/product/1.jpg', '软糯红豆嫩布丁，鲜香甘甜，浓郁的奶香与红豆完美相融，满足感充分体现在你的唇齿和心间', '1', '28', 'music/2.m4a');
INSERT INTO `product` VALUES ('13', '天安门', '105.00', '124', '234', '1', 'images/product/13.jpg', '走进宽窄巷子，你可以街边一坐，要一杯蒙山黄芽，与旁边的老爷子摆摆龙门阵；也可以唤一名“舒耳郎”，舒舒服服的享受掏耳朵的惬意；更可以在小吃摊边，面对着琳琅满目的小吃：三大炮、兔头、豆花……大快朵颐。如果还不尽兴，大妙火锅、成都映象、花间等正宗川菜馆子一定会让你觉得不虚此行。 夜幕下的宽窄巷子也是别有韵味，点醉、白夜、胡里酒吧只有在夜间才绽放它的魅力。微醺之后，如果懒得回去，恰好可以体验一下“有家的感觉”的龙堂客栈。不过，记得不要衣装革履，因为，“西装革履者恕不接待”可是龙堂的个性招牌之一。 宽窄巷子共分为三个主题。宽巷子是“闲生活”区，代表了最成都、最市井的民间文化。古朴但精致的四合院，老人在竹椅上品着盖碗茶，园子里，原住民热火朝天的吃着火锅，小孩子在光阴斑驳的梧桐树下嬉闹。这一切，无时不在展示着成都的休闲。走进宽巷子，你就走进了真正的老成都生活。 窄巷子是“慢生活”区，展示的是老成都的院落文化。街道上古朴的壁灯，店门口休闲的藤椅，院里栽植的黄金竹和院墙上漫漫的爬山虎，凸显老成都不徐不疾的慢生活节奏。', '1', null, 'music/1.mp3');
INSERT INTO `product` VALUES ('26', '大雁塔', '35.00', '23', '43', '1', 'images/product/26.jpg', '牛排+脆骨肠+配菜+饮料+米饭', '8', null, '');
INSERT INTO `product` VALUES ('27', '雷峰塔', '25.00', '34', '53', '1', 'images/product/7.jpg', '牛排+脆骨肠+配菜+饮料+米饭', '4', null, null);
INSERT INTO `product` VALUES ('29', '王府井', '23.00', '43', '65', '1', 'images/product/9.jpg', '暂无介绍', '4', null, null);
INSERT INTO `product` VALUES ('30', '故宫', '98.00', '456', '998', '1', 'images/product/30.jpg', '北京故宫博物院建立于1925年10月10日，位于北京故宫紫禁城内。是在明朝、清朝两代皇宫及其收藏的基础上建立起来的中国综合性博物馆，也是中国比较大的古代文化艺术博物馆，其文物收藏主要来源于清代宫中旧藏，是第一批全国爱国主义教育示范基地。  从2014年1月1日起，北京故宫博物院几乎每周一闭馆。北京故宫博物院位于北京故宫即紫禁城内。北京故宫是第一批全国重点文物保护单位、第一批国家5A级旅游景区，1987年入选《世界文化遗产名录》。  著作权归作者所有。 商业转载请联系作者获得授权,非商业转载请注明出处。 链接:https://www.maigoo.com/citiao/3376.html ====================================================================================', '1', null, null);
INSERT INTO `product` VALUES ('31', '西湖', '45.00', '98', '564', '1', 'images/product/31.jpg', '暂无介绍', '6', '29', null);
INSERT INTO `product` VALUES ('39', '景点1', null, '111', null, '1', 'images/product/39.jpg', '1111', '3', null, null);
INSERT INTO `product` VALUES ('41', '测试景点', null, '2112', null, '1', 'images/product/41.jpg', '2121', '7', null, null);
INSERT INTO `product` VALUES ('42', '景点2', null, '11', null, '1', 'images/product/42.jpg', '11', '5', null, null);
INSERT INTO `product` VALUES ('43', '景点1', null, '111', null, '1', 'images/product/39.jpg', '1111', '3', null, null);
INSERT INTO `product` VALUES ('44', '测试景点', null, '2112', null, '1', 'images/product/39.jpg', '2121', '2', null, null);
INSERT INTO `product` VALUES ('45', '测试景点', null, '2112', null, '1', 'images/product/39.jpg', '2121', '2', null, null);
INSERT INTO `product` VALUES ('46', '测试景点', null, '2112', null, '1', 'images/product/39.jpg', '2121', '2', null, null);
INSERT INTO `product` VALUES ('47', '测试景点', null, '2112', null, '1', 'images/product/39.jpg', '2121', '2', null, null);
INSERT INTO `product` VALUES ('48', '测试景点', null, '2112', null, '1', 'images/product/39.jpg', '2121', '2', null, null);
INSERT INTO `product` VALUES ('49', '测试景点', null, '2112', null, '1', 'images/product/39.jpg', '2121', '2', null, null);
INSERT INTO `product` VALUES ('50', '测试景点', null, '2112', null, '1', 'images/product/39.jpg', '2121', '3', null, null);
INSERT INTO `product` VALUES ('51', '测试景点', null, '2112', null, '1', 'images/product/39.jpg', '2121', '3', null, null);
INSERT INTO `product` VALUES ('52', '测试景点', null, '2112', null, '1', 'images/product/39.jpg', '2121', '3', null, null);
INSERT INTO `product` VALUES ('53', '测试景点', null, '2112', null, '1', 'images/product/39.jpg', '2121', '3', null, null);
INSERT INTO `product` VALUES ('54', '测试景点', null, '2112', null, '1', 'images/product/39.jpg', '2121', '4', null, null);
INSERT INTO `product` VALUES ('55', '测试景点', null, '2112', null, '1', 'images/product/39.jpg', '2121', '4', null, null);
INSERT INTO `product` VALUES ('56', '测试景点', null, '2112', null, '1', 'images/product/39.jpg', '2121', '4', null, null);
INSERT INTO `product` VALUES ('57', '测试景点', null, '2112', null, '1', 'images/product/39.jpg', '2121', '1', null, null);
INSERT INTO `product` VALUES ('58', 'test1', null, '5555', null, '1', 'images/product/58.jpg', '天安门，坐落在中华人民共和国首都北京市的中心、故宫的南端，与天安门广场以及人民英雄纪念碑、毛主席纪念堂、人民大会堂、中国国家博物馆隔长安街相望，占地面积4800平方米，以杰出的建筑艺术和特殊的政治地位为世人所瞩目。 天安门是明清两代北京皇城的正门，始建于明朝永乐十五年（1417年），最初名“承天门”，寓“承天启运、受命于天”之意。设计者为明代御用建筑匠师蒯祥。清朝顺治八年（1651年）更名为天安门。由城台和城楼两部分组成，有汉白玉石的须弥座，总高34.7米。天安门城楼长66米、宽37米。城台下有券门五阙，中间的券门最大，位于北京皇城中轴线上，过去只有皇帝才可以由此出入。正中门洞上方悬挂着毛泽东画像，两边分别是“中华人民共和国万岁”和“世界人民大团结万岁”的大幅标语。 [1]  民国十四年（1925年）十月十日，故宫博物院成立，天安门开始对民众开放。1949年10月1日，在这里举行了中华人民共和国开国大典，由此被设计入国徽，并成为中华人民共和国的象征。1961年，中华人民共和国国务院公布为第一批全国重点文物保护单位之一。 [2]  2018年6月15日，天安门启动修缮，预计2019年4月底恢复对外开放。 [3] ', '7', null, null);
INSERT INTO `product` VALUES ('59', 'test2', null, '112', null, '1', 'images/product/59.jpg', '天安门，坐落在中华人民共和国首都北京市的中心、故宫的南端，与天安门广场以及人民英雄纪念碑、毛主席纪念堂、人民大会堂、中国国家博物馆隔长安街相望，占地面积4800平方米，以杰出的建筑艺术和特殊的政治地位为世人所瞩目。 天安门是明清两代北京皇城的正门，始建于明朝永乐十五年（1417年），最初名“承天门”，寓“承天启运、受命于天”之意。设计者为明代御用建筑匠师蒯祥。清朝顺治八年（1651年）更名为天安门。由城台和城楼两部分组成，有汉白玉石的须弥座，总高34.7米。天安门城楼长66米、宽37米。城台下有券门五阙，中间的券门最大，位于北京皇城中轴线上，过去只有皇帝才可以由此出入。正中门洞上方悬挂着毛泽东画像，两边分别是“中华人民共和国万岁”和“世界人民大团结万岁”的大幅标语。 [1]  民国十四年（1925年）十月十日，故宫博物院成立，天安门开始对民众开放。1949年10月1日，在这里举行了中华人民共和国开国大典，由此被设计入国徽，并成为中华人民共和国的象征。1961年，中华人民共和国国务院公布为第一批全国重点文物保护单位之一。 [2]  2018年6月15日，天安门启动修缮，预计2019年4月底恢复对外开放。 [3] ', '5', null, null);
INSERT INTO `product` VALUES ('60', '芜湖', null, '2323', null, '0', 'images/product/60.jpg', '芜湖，简称“芜”，别称江城，安徽省地级市、长三角城市群中心区城市、华东地区重要的科研教育基地、南京都市圈城市，合肥都市圈城市，G60科创走廊中心城市。芜湖地处长江三角洲西南部，南倚皖南山系，北望江淮平原。是华东重要的工业基地、科教基地和全国综合交通枢纽。芜湖市下辖4个市辖区、3个县，代管1个县级市，总面积6026平方公里。截至2019年，全市常住人口377.8万人，城镇化率66.41% [1]  。 芜湖自古享有“江东名邑”、“吴楚名区”之美誉。芜湖明代中后期是著名的浆染业中心，近代为“江南四大米市”之首。芜湖港是长江水运第五大港、安徽省最大的货运、外贸、集装箱中转港，国家一类口岸。芜湖地处皖南国际旅游文化示范区，旅游资源丰富，有方特旅游度假区、天门山、鸠兹古镇、新华联大白鲸海洋公园、鸠兹广场、雨耕山、丫山风景区、马仁奇峰、赭山公园、雕塑公园等景区。 2017年，芜湖在中国地级市全面小康指数排名第46。 [2]  2018年4月2日，芜湖入选科技部、国家发展改革委发布支持新一批城市开展创新型城市建设名单。 [3]  2018年10月，获得“2018年国家森林城市”荣誉称号。 [4]  2018年11月，入选2018年消费品工业“三品”战略示范城市名单。 [5]  2018年12月，入选2018中国大陆最佳商业城市100强、2018中国大陆最佳地级城市30强、中国创新力最强的30个城市之一。 [6]  2018年12月，被民政部确认第三批全国社区治理和服务创新实验区。 [7]  2019年，芜湖市实现地区生产总值3618.26亿元', '10', null, null);
INSERT INTO `product` VALUES ('61', '芜湖', '123.00', '123', '123', '0', 'images/product/61.jpg', '美呀', '10', null, null);
INSERT INTO `product` VALUES ('62', '山西', '123.00', '123', '123', '1', 'images/product/62.jpg', '很美', '12', null, null);
INSERT INTO `product` VALUES ('68', '臭妹妹', '12.00', '12', '12', '1', 'images/product/68.jpg', '12', '1', null, 'music/68.m4a');

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT '该用户默认给出了好评！！！' COMMENT '评论内容',
  `cstid` int(11) DEFAULT NULL COMMENT '用户id',
  `pid` int(11) DEFAULT NULL COMMENT '商品id',
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cstid` (`cstid`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`cstid`) REFERENCES `customer` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `product` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of review
-- ----------------------------
INSERT INTO `review` VALUES ('9', 'assd', '1', '29', '2019-11-26 09:36:30');
INSERT INTO `review` VALUES ('11', '我是评价', '1', '31', '2019-11-26 09:41:12');
INSERT INTO `review` VALUES ('12', '测试评价', '1', '39', '2019-11-27 16:32:08');
INSERT INTO `review` VALUES ('13', '111111', '13', '13', '2020-03-27 21:38:29');
INSERT INTO `review` VALUES ('14', '很好玩，风景很美', '13', '30', '2020-03-29 16:10:10');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `desc_` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'admin', '超级管理员');
INSERT INTO `role` VALUES ('2', 'productManager', '商品管理员');
INSERT INTO `role` VALUES ('3', '游客', '只能查看，不能增删改');
INSERT INTO `role` VALUES ('4', null, null);

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rid` bigint(20) DEFAULT NULL,
  `pid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=399 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('134', '3', '2');
INSERT INTO `role_permission` VALUES ('135', '3', '18');
INSERT INTO `role_permission` VALUES ('136', '3', '20');
INSERT INTO `role_permission` VALUES ('137', '3', '21');
INSERT INTO `role_permission` VALUES ('138', '3', '28');
INSERT INTO `role_permission` VALUES ('139', '3', '37');
INSERT INTO `role_permission` VALUES ('140', '3', '38');
INSERT INTO `role_permission` VALUES ('141', '3', '40');
INSERT INTO `role_permission` VALUES ('346', '1', '53');
INSERT INTO `role_permission` VALUES ('347', '1', '52');
INSERT INTO `role_permission` VALUES ('348', '1', '51');
INSERT INTO `role_permission` VALUES ('349', '1', '50');
INSERT INTO `role_permission` VALUES ('350', '1', '49');
INSERT INTO `role_permission` VALUES ('351', '1', '48');
INSERT INTO `role_permission` VALUES ('352', '1', '47');
INSERT INTO `role_permission` VALUES ('353', '1', '46');
INSERT INTO `role_permission` VALUES ('354', '1', '45');
INSERT INTO `role_permission` VALUES ('355', '1', '44');
INSERT INTO `role_permission` VALUES ('356', '1', '43');
INSERT INTO `role_permission` VALUES ('357', '1', '42');
INSERT INTO `role_permission` VALUES ('358', '1', '41');
INSERT INTO `role_permission` VALUES ('359', '1', '40');
INSERT INTO `role_permission` VALUES ('360', '1', '39');
INSERT INTO `role_permission` VALUES ('361', '1', '38');
INSERT INTO `role_permission` VALUES ('362', '1', '37');
INSERT INTO `role_permission` VALUES ('363', '1', '36');
INSERT INTO `role_permission` VALUES ('364', '1', '35');
INSERT INTO `role_permission` VALUES ('365', '1', '34');
INSERT INTO `role_permission` VALUES ('366', '1', '33');
INSERT INTO `role_permission` VALUES ('367', '1', '32');
INSERT INTO `role_permission` VALUES ('368', '1', '31');
INSERT INTO `role_permission` VALUES ('369', '1', '30');
INSERT INTO `role_permission` VALUES ('370', '1', '29');
INSERT INTO `role_permission` VALUES ('371', '1', '28');
INSERT INTO `role_permission` VALUES ('372', '1', '27');
INSERT INTO `role_permission` VALUES ('373', '1', '26');
INSERT INTO `role_permission` VALUES ('374', '1', '25');
INSERT INTO `role_permission` VALUES ('375', '1', '24');
INSERT INTO `role_permission` VALUES ('376', '1', '23');
INSERT INTO `role_permission` VALUES ('377', '1', '21');
INSERT INTO `role_permission` VALUES ('378', '1', '20');
INSERT INTO `role_permission` VALUES ('379', '1', '18');
INSERT INTO `role_permission` VALUES ('380', '1', '17');
INSERT INTO `role_permission` VALUES ('381', '1', '15');
INSERT INTO `role_permission` VALUES ('382', '1', '2');
INSERT INTO `role_permission` VALUES ('383', '1', '1');
INSERT INTO `role_permission` VALUES ('384', '2', '40');
INSERT INTO `role_permission` VALUES ('385', '2', '38');
INSERT INTO `role_permission` VALUES ('386', '2', '37');
INSERT INTO `role_permission` VALUES ('387', '2', '36');
INSERT INTO `role_permission` VALUES ('388', '2', '35');
INSERT INTO `role_permission` VALUES ('389', '2', '34');
INSERT INTO `role_permission` VALUES ('390', '2', '33');
INSERT INTO `role_permission` VALUES ('391', '2', '32');
INSERT INTO `role_permission` VALUES ('392', '2', '31');
INSERT INTO `role_permission` VALUES ('393', '2', '30');
INSERT INTO `role_permission` VALUES ('394', '2', '29');
INSERT INTO `role_permission` VALUES ('395', '2', '28');
INSERT INTO `role_permission` VALUES ('396', '2', '17');
INSERT INTO `role_permission` VALUES ('397', '2', '15');
INSERT INTO `role_permission` VALUES ('398', '2', '2');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '管理员姓名',
  `password` varchar(100) DEFAULT NULL COMMENT '管理员密码',
  `salt` varchar(100) DEFAULT NULL,
  `status` int(10) DEFAULT NULL COMMENT '状态，1：启用，0：停用',
  `address` varchar(100) DEFAULT '暂无' COMMENT '商家管理员地址',
  `phone` varchar(50) DEFAULT NULL,
  `lasttime` datetime DEFAULT NULL COMMENT '最后登陆时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '小白', '54ed3fb59e1dc91564f48fa114a917b1', 'IdGVBLxFEgyomZz0O+Pb5A==', '1', '暂无', '12445242532', '2020-04-02 20:20:28');
INSERT INTO `user` VALUES ('28', '避风港', '30b41f4a72e4671a648025046fcdd7d8', 'dalIGt1LeH6FIJ/AcjP+Qg==', '1', '龙马潭区', '18224235623', '2018-11-05 11:25:22');
INSERT INTO `user` VALUES ('29', '小熊早餐店', '2a98f82a96964ca737ec4306d03b75cb', '+IDXoYII9IHDYuX4A3sk2Q==', '1', '商贸城', '12453265428', '2020-03-29 19:23:08');
INSERT INTO `user` VALUES ('32', '查杨', '50ef6ae00687fb021d6b15b760ab5d0c', 'rUY1NIZovNYmwPGR3AkEJQ==', '1', '北京', '13231516161', '2020-03-27 10:25:20');
INSERT INTO `user` VALUES ('34', 'xiaocai', 'ef9ba92c377a10736fdfd0ff27f7b58d', 'tmg62dynuFbxrpu6i0btSg==', '1', '天津', '1959589995', '2020-03-31 10:25:44');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL,
  `rid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('97', '1', '1');
INSERT INTO `user_role` VALUES ('99', '29', '1');
INSERT INTO `user_role` VALUES ('100', '28', '1');
INSERT INTO `user_role` VALUES ('103', '32', '1');
INSERT INTO `user_role` VALUES ('105', '34', '1');

-- ----------------------------
-- Table structure for zixun
-- ----------------------------
DROP TABLE IF EXISTS `zixun`;
CREATE TABLE `zixun` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) DEFAULT NULL COMMENT '资讯内容',
  `cstid` int(11) DEFAULT NULL COMMENT '客户id',
  `status` int(255) DEFAULT '0' COMMENT '审核状态，1：通过，0：未通过;',
  `fabudate` datetime DEFAULT NULL COMMENT '发布时间;',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of zixun
-- ----------------------------
INSERT INTO `zixun` VALUES ('8', '111', '11', '1', '2020-03-20 10:49:38');
INSERT INTO `zixun` VALUES ('9', 'sda', '12', '0', '2020-03-23 19:17:59');
INSERT INTO `zixun` VALUES ('10', '我是第二条', '13', '0', '2020-03-27 16:40:10');
INSERT INTO `zixun` VALUES ('11', 'ee ee ', '13', '0', '2020-03-27 16:50:07');
INSERT INTO `zixun` VALUES ('12', '芜湖真的很美嘛', '13', '0', '2020-03-27 17:01:32');
INSERT INTO `zixun` VALUES ('13', '111', '13', '0', '2020-03-27 17:10:29');
INSERT INTO `zixun` VALUES ('14', '我是评论', '13', '0', '2020-03-27 21:32:37');
INSERT INTO `zixun` VALUES ('15', '123333', '13', '0', '2020-03-27 21:36:06');
INSERT INTO `zixun` VALUES ('16', '123333111111', '13', '0', '2020-03-27 21:36:55');
INSERT INTO `zixun` VALUES ('17', '213\n', '13', '0', '2020-03-27 21:42:29');
INSERT INTO `zixun` VALUES ('18', 'woshiadmin', '13', '1', '2020-03-29 15:47:59');
INSERT INTO `zixun` VALUES ('19', 'henmei', '19', '0', '2020-03-31 11:31:51');
