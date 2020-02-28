/*
Navicat MySQL Data Transfer

Source Server         : 公网
Source Server Version : 50646
Source Host           : 47.100.188.220:3306
Source Database       : hagoubang

Target Server Type    : MYSQL
Target Server Version : 50646
File Encoding         : 65001

Date: 2020-02-28 15:36:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `GUID` int(10) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `login_time` varchar(50) DEFAULT NULL,
  `equipment` varchar(255) DEFAULT NULL,
  `only_one` varchar(4) DEFAULT NULL,
  `admin_logo_url` varchar(255) DEFAULT NULL,
  `admin_state` varchar(8) DEFAULT NULL,
  `admin_operate` varchar(255) DEFAULT NULL,
  `admin_role` varchar(255) DEFAULT NULL,
  `admin_createtime` varchar(60) DEFAULT NULL,
  `admin_modifytime` varchar(60) DEFAULT NULL,
  `admin_ownrole` varchar(255) DEFAULT NULL,
  `admin_remarks` varchar(255) DEFAULT NULL,
  `is_exist` int(2) DEFAULT '1',
  PRIMARY KEY (`GUID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('5', 'liutianxiang', '5e80855ae8b5abc1d0ee61157a4da2d9', null, null, null, 'http://127.0.0.1:7001/app/public/uploadfile/1575541298608timg.jpg', null, null, null, null, null, null, null, '1');

-- ----------------------------
-- Table structure for daily
-- ----------------------------
DROP TABLE IF EXISTS `daily`;
CREATE TABLE `daily` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `pics` text,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of daily
-- ----------------------------

-- ----------------------------
-- Table structure for gallery
-- ----------------------------
DROP TABLE IF EXISTS `gallery`;
CREATE TABLE `gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gallery_id` int(25) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `publish_time` int(11) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1257 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gallery
-- ----------------------------

-- ----------------------------
-- Table structure for messageHistory
-- ----------------------------
DROP TABLE IF EXISTS `messageHistory`;
CREATE TABLE `messageHistory` (
  `id` int(11) NOT NULL,
  `from` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of messageHistory
-- ----------------------------

-- ----------------------------
-- Table structure for newsType
-- ----------------------------
DROP TABLE IF EXISTS `newsType`;
CREATE TABLE `newsType` (
  `id` int(11) NOT NULL,
  `type_label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of newsType
-- ----------------------------

-- ----------------------------
-- Table structure for petPics
-- ----------------------------
DROP TABLE IF EXISTS `petPics`;
CREATE TABLE `petPics` (
  `pet_pic_id` int(11) NOT NULL AUTO_INCREMENT,
  `pet_id` int(11) DEFAULT NULL,
  `pet_pic_src` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pet_pic_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of petPics
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `user_roleName` varchar(30) NOT NULL,
  `user_power` varchar(255) DEFAULT NULL,
  `user_state` varchar(20) DEFAULT NULL,
  `user_remarks` varchar(40) DEFAULT NULL,
  `user_createtime` varchar(50) DEFAULT NULL,
  `user_modifytime` varchar(50) DEFAULT NULL,
  `user_operate` varchar(255) DEFAULT NULL,
  `user_ownrole` varchar(255) NOT NULL,
  `user_lastlogintime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------

-- ----------------------------
-- Table structure for source
-- ----------------------------
DROP TABLE IF EXISTS `source`;
CREATE TABLE `source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `file_url` varchar(255) DEFAULT NULL,
  `file_width` varchar(255) DEFAULT NULL,
  `file_height` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `mp4_url` varchar(255) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40091 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of source
-- ----------------------------

-- ----------------------------
-- Table structure for tb_adopt
-- ----------------------------
DROP TABLE IF EXISTS `tb_adopt`;
CREATE TABLE `tb_adopt` (
  `uid` int(12) NOT NULL AUTO_INCREMENT,
  `promoter_id` int(12) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `pet_name` varchar(255) DEFAULT NULL COMMENT '宠物名称',
  `pet_cate` int(2) DEFAULT NULL COMMENT '宠物类别：1-狗；2-猫；3-其他',
  `pet_img_list` text,
  `gender` int(2) DEFAULT NULL COMMENT '宠物性别',
  `is_free` int(2) DEFAULT NULL COMMENT '1-有偿;2-无偿',
  `description` varchar(255) DEFAULT NULL COMMENT '宠物描述',
  `adopt_condition` varchar(255) DEFAULT NULL COMMENT '领养条件',
  `state` int(2) DEFAULT NULL COMMENT '状态:1-正在审核；2-通过审核；3-用户已删除；4-已被领养',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_adopt
-- ----------------------------
INSERT INTO `tb_adopt` VALUES ('7', '4', '13512121212', '挖掘基', '2', 'http://tmp/wx5ece4812b0b66de9.o6zAJs5kAL_x1rieGI_8f0QOSTSs.3y0wjbss7a5Baa8b0350da3fbcbd098f4cb8565b8c81.jpg,http://tmp/wx5ece4812b0b66de9.o6zAJs5kAL_x1rieGI_8f0QOSTSs.6MiKiNbOTzshab1b916853f4257e1f005259e680a90f.jpg', '1', '1', '213313', '12313', '1', '2019-10-09 20:08:00');
INSERT INTO `tb_adopt` VALUES ('8', '2', '联系方式测试', '臭狗屎', '1', '', '1', '1', '描述测试', '领养条件测试', '1', '2019-10-10 15:42:55');
INSERT INTO `tb_adopt` VALUES ('9', '2', '联系方式测试', '臭狗屎2', '1', '', '1', '1', '描述测试', '领养条件测试', '1', '2019-10-10 15:43:58');
INSERT INTO `tb_adopt` VALUES ('10', '2', '联系方式测试', '臭狗屎2', '1', '', '1', '1', '描述测试', '领养条件测试', '1', '2019-10-11 15:25:22');

-- ----------------------------
-- Table structure for tb_article
-- ----------------------------
DROP TABLE IF EXISTS `tb_article`;
CREATE TABLE `tb_article` (
  `id` varchar(255) NOT NULL,
  `author_id` varchar(255) DEFAULT NULL COMMENT '作者id，已废弃，目前用作者名字',
  `type` varchar(255) DEFAULT NULL COMMENT '文章类型：由tb_articel_type表中的数据决定',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `summary` varchar(255) DEFAULT NULL COMMENT '简介（副标题）',
  `img_url` varchar(255) DEFAULT NULL COMMENT '封面图的地址',
  `content` text COMMENT '正文-富文本',
  `author_name` varchar(30) DEFAULT NULL COMMENT '作者名字，为最后一次维护的人',
  `state` varchar(8) DEFAULT NULL COMMENT '状态 0 - 正常   1 - 禁用',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间,自动记录',
  `edit_type` varchar(20) DEFAULT NULL COMMENT '编辑器的类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_article
-- ----------------------------
INSERT INTO `tb_article` VALUES ('1', '5', '3', '1', '1', null, '<p>1</p>', 'liutianxiang', '0', '2019-12-13 15:34:59', 'quillEditor');
INSERT INTO `tb_article` VALUES ('1d654ac0-1d78-11ea-bce3-73c3e7ca5811', null, 'null', '以前基于gitee的静态托管不更新啦，转到发布了', '以前基于gitee的静态托管不更新啦，转到发布了', null, '<p>以前用的码云的静态托管，地址为https://l1334101793.gitee.io，之后那边的文章不更新啦，都在这里了。服务器购买于2019.11.08，欢迎大家来玩。</p>', 'liutianxiang', null, '2019-12-13 15:15:35', null);
INSERT INTO `tb_article` VALUES ('3', null, '1', '123', '123', null, '<p>123</p>', 'liutianxiang', null, '2019-10-29 15:18:59', 'quillEditor');
INSERT INTO `tb_article` VALUES ('5', null, '4', '金毛-金毛寻回犬', '金毛寻回犬（Golden Retriever）是单猎犬，比较流行的狗的品种。在猎捕野禽的寻回犬中培养出来的，游泳的续航力极佳。', null, '<p>	<span style=\"color: rgb(51, 51, 51);\">金毛寻回犬是最常见的家犬之一，它很容易养，有耐心并且对主人要求不多，只要定期运动，食物和</span>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(19, 110, 194);\">兽医</span>	<span style=\"color: rgb(51, 51, 51);\">体检就可以了。它属于匀称、有力、活泼的一个犬种，特征是稳固、身体各部位配合合理，腿既不太长也不笨拙，表情友善，个性热情、机警、自信而且不怕生，性格讨人喜欢。金毛犬最早是一种寻回猎犬，现在大多作为</span>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(19, 110, 194);\">导盲犬</span>	<span style=\"color: rgb(51, 51, 51);\">与 </span><span style=\"background-color: rgb(255, 255, 255); color: rgb(19, 110, 194);\">宠物狗</span>	<span style=\"color: rgb(51, 51, 51);\">。对小孩子或者婴儿十分友善。金毛犬是位列</span>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(19, 110, 194);\">世界犬种智商排行</span>	<span style=\"color: rgb(51, 51, 51);\">的第四名。</span></p><h2>发展历史</h2><p>    源自苏格兰的金毛寻回犬能够风靡世人，除了它一身金黄色的被毛吸引众生外，同时也因它们天生温驯的个性，令人对它爱不释手。要追溯金毛寻回犬的历史，大概要穿梭到1865年的时候，那时苏格兰流行打猎，因此擅于捕猎野生动物的中型犬种就大受狩猎家欢迎。</p><p>	其后苏格兰有一位贵族就尝试以黄色的拉布拉多寻回犬(Labrador Retriever)同现在己绝种的拉布水猎犬混合繁殖，品种经过改良后，成为了今天的金毛寻回犬。</p><p>	金毛寻回犬在英国风行一时，知名度不断提高，深受英国人的欢迎，1903年第一只金毛寻回犬在英国狗会正式登记，8年后英国金毛寻回犬会成立，可谓名噪英伦。其后有一些到英国旅行的游客，更把金毛寻回犬带回美国、加拿大等地，作为打猎之用。直到1932年，AKC成立了金毛寻回犬会(GRCA)，如今会员已多达数千名。50年后，金毛寻回犬在AKC犬只服从比赛中连续获得三届冠军。2001年，金毛寻回犬被AKC选为十大最受欢迎注册犬种之一，排名紧次于<span style=\"color: rgb(19, 110, 194);\">拉布拉多猎犬</span>，风头可谓一时无二<span style=\"color: rgb(51, 102, 204);\">&nbsp;</span>。</p><h2>形态特征</h2><p>	<span style=\"color: rgb(51, 51, 51);\">头上眉头分明，头盖宽阔，头盖与鼻口相连。两眼间距离较宽，眼睛是暗褐色，黑且明亮。鼻子呈黑色。有强壮的上颚，完全剪状咬合。前后肢挺直力强、肌肉发达。足部呈圆形，坚挺如猫足。体型匀称，胸部厚实，水平的背腰部肌肉结实。尾部跟背部保持平行，尾端卷曲或朝背部上卷，但力度稍差。</span></p><p>                                                                                                                                                      <img src=\"http://127.0.0.1:7001/app/public/uploadfile/1572580732714金毛.jpg\"></p>', 'liutianxiang', null, '2019-11-01 11:59:33', 'quillEditor');
INSERT INTO `tb_article` VALUES ('6', null, '1', '金毛', '我家金毛真的傻', null, '<p>你好ergou，二狗你好ergou，二狗你好ergou，二狗你好ergou，二狗你好ergou，二狗<img src=\"http://127.0.0.1:7001/app/public/uploadfile/15725076992511.jpg\"><img src=\"http://127.0.0.1:7001/app/public/uploadfile/15725076992511.jpg\"></p>', 'liutianxiang', null, '2019-11-04 20:52:05', 'quillEditor');
INSERT INTO `tb_article` VALUES ('79012330-27ab-11ea-8b9c-61a13e4c555d', null, '2', '阿福丁中毒', '阿福丁中毒', null, '<h2>概述</h2><p>阿福丁是阿维菌素的商品名，也称作虫克星。该品可以驱杀动物体内的各种线虫和体外寄生虫，是近些年一种新型广谱高效的抗寄生虫类药物，但由于阿福丁也是一种低毒、药液持久的新型广谱驱虫类药物，所以适宜的剂量是安全有效的，而过大的剂量则会引发动物中毒。</p><h2>发病原因</h2><p>超大剂量的使用阿福丁导致犬中毒。</p><h2>主要症状</h2><p>主要的临床症状表现为精神萎顿、不食、喜卧、不愿行走、步态蹒跚，继而神经症状出现，全身表现震颤性痉挛、流涎、舌体外伸因麻痹难以缩回，呼吸快而浅，心率迟缓。口、鼻、耳和四肢末端触感发凉。无听觉、痛觉，最后全身瘫软，处于休克状。</p><h2>诊断标准</h2><p>根据临床症状，用药时间和主人提供介绍的对幼犬没有计量的情况以及使用剂量超过常规剂量的十倍及以上，由此便可确诊为阿福丁中毒。</p><h2>治疗方法</h2><p>对尚存有呼吸心跳的幼犬，一是可以增强肝脏机能及解毒作用。第头肌注入医用强力解毒敏2ml，每次1~2支；二是改善微循环，解除血管痉挛，肌注VC500mg，每次2支，肌苷2ml，每次2支；同时灌服口服液盐或者葡萄溶液若干。</p>', 'liutianxiang', null, '2019-12-26 14:48:13', null);
INSERT INTO `tb_article` VALUES ('7ee30a30-27af-11ea-8b9c-61a13e4c555d', null, null, '埃里克氏体病', '埃里克氏体病', null, '\n                        <h2>病况星级</h2>\n\n            <p>\n                严重程度：<i class=\"star-6\"></i><br>\n                紧急程度：<i class=\"star-6\"></i><br>\n                危险级别：<i class=\"star-6\"></i><br>\n                治愈率：<i class=\"star-8\"></i><br>\n            </p>\n			\n			\n			\n            <h2>概述</h2>\n\n            <p>埃里克氏体病是由蜱引起的全身性疾病。通过立克次氏体属的几种立克次氏体引起。尽管犬埃里克氏体是最常见的侵害单核细胞埃里克氏体病临床疾病的病原体，但其实还有多种埃里克氏体可以引起犬的感染，比如侵害粒细胞的马埃里克氏体和侵害血小板的扁平埃里克氏体，能使犬周期性血小板减少，就是有不同种的埃里克氏体引起的。</p>\n			\n			 <h2>发病原因</h2>\n			\n			   <p>犬埃里克氏体是一种小的多形态的立克次氏病原体，它能感染循环血液中的单核细胞。棕色犬蜱、血红扇头蜱是传播本病的媒介。\n</p>\n			   \n				 <h2>主要症状</h2>\n			   <p>患病狗狗表现出全身症状，有淋巴结肿大、发热、流鼻涕、血小板减少和各类血细胞减少症，并伴有隐性血管炎。眼部症状有：初期由于视网膜血管周围有病灶而出现视网膜血管扭曲。晚期有脉络膜视网膜炎和视网膜脉管炎、视网膜下出血、视网膜脱落、视神经炎、视乳头水肿等。也可见前葡萄膜炎、虹膜瘀点、前房积血和角膜后沉淀物。\n</p>\n			\n			 <h2>诊断标准</h2>\n			   <p>通常根据临床症状，血液学异常和血清学诊断，非再生性贫血和血小板减少症是血液学的主要变化。</p>\n			   \n			    <h2>治疗方法</h2>\n			   <p>用四环素对病犬作全身治疗，局部可以使用皮质类固醇和阿托品治疗前葡萄膜炎。</p>\n			      <h2>防治方法</h2>\n			   <p>对生活在流行区的犬口服四环素预防(每天6.6mg/kg)。另外还建议使用局部杀螨剂防止蜱和跳蚤感染。</p>\n                    ', null, null, '2019-12-26 15:15:57', null);
INSERT INTO `tb_article` VALUES ('83682f10-27ad-11ea-8b9c-61a13e4c555d', null, null, '阿司匹林中毒', '阿司匹林中毒', null, '\n                        <h2>病况星级</h2>\n\n            <p>\n                严重程度：<i class=\"star-8\"></i><br>\n                紧急程度：<i class=\"star-10\"></i><br>\n                危险级别：<i class=\"star-8\"></i><br>\n                治愈率：<i class=\"star-10\"></i><br>\n            </p>\n			\n			\n			\n            <h2>概述</h2>\n\n            <p>抑制前列腺素合成，大剂量阿司匹林能阻止氧化磷酸化的过程，但也可能会引起高血糖。病猫患病初期兴奋呼吸，后期则转为抑制呼吸。会出现代谢性酸中毒、血小板凝集作用下降、骨髓发育受阻症状。</p>\n			\n			 <h2>发病原因</h2>\n			\n			   <p>意外吞食阿司匹林(乙酰水杨酸)或药物使用剂量不当。幼犬由于体内缺乏代谢酶，尤其是缺乏合成葡萄糖醛酸化物的酶，而易发本病。病犬一次服用量&gt;60mg/kg，可引起中毒。\n</p>\n			   \n				 <h2>主要症状</h2>\n			   <p>中毒早期出现呼吸急促，后期则抑制呼吸；会出现体温升高、食欲下降、呕吐、溃疡性肠炎、代谢性酸中毒等症状，严重时出现昏迷、肾脏功能受损、出血等症状，长期用药会引起病犬非再生性贫血；偶见抽搐。\n</p>\n			\n			 <h2>诊断标准</h2>\n			   <p>诊断了解病史对本病的诊断十分有益；代谢性酸中毒、尿酸、阴离子间隙增大；血清或尿中的水杨酸含量具有一定诊断意义，取lml尿液，酸化后加入3滴10％氯化铁，出现红色，表明水杨酸阳性；应与其他引起胃炎及严重代谢性酸中毒的疾病，乙二醇中毒，其他非类固醇抗菌消炎药物，如布洛芬中毒区别。</p>\n			   \n			    <h2>治疗方法</h2>\n			   <p>动物摄入阿司匹林应尽早催吐、洗胃、服用活性炭及导泻药物，阻止毒物进一步吸收；碱化尿液36～48h，促进毒物的排出：碳酸氢钠，50mg/kg，口服，每天2～3次；碳酸氢钠也可缓解机体的代谢性酸中毒。支持疗法：补液、补充电解质，维持酸碱平衡；应用胃肠道保护剂及组胺受体颉颃剂(甲腈咪胍、甲胺呋硫)；病情严重者进行碱性腹膜透析液透析。</p>\n                    ', null, null, '2019-12-26 15:01:47', null);
INSERT INTO `tb_article` VALUES ('ba836710-17d8-11ea-bad2-dd97222667b0', null, '3', '测试唯一id', '测试唯一id测试唯一id', null, '<p>测试唯一id测试唯一id</p>', 'liutianxiang', null, '2019-12-06 11:30:29', 'quillEditor');
INSERT INTO `tb_article` VALUES ('eabb87a0-27af-11ea-8b9c-61a13e4c555d', null, null, '白内障', '白内障', null, '\n                        <h2>概述</h2>\n\n            <p>白内障是指眼睛内晶体的变化。正常的晶体是透明水晶状的，主要作用是帮助聚焦光线和图像。当白内障形成后，晶体就变得混浊或发蓝或发白。通常情况下，白内障分为成熟或不成熟两类。不成熟的白内障指的是只有部分的晶体受到影响，所以视力几乎都不会受影响。如果白内障发展到成熟阶段，整个晶体都会受到影响，视力也就会随之消失。 </p>\n			\n			 <h2>发病原因</h2>\n			\n			   <p>发生白内障的原因为水晶体上紧密结合的蛋白质变性。\n</p>\n			   \n				 <h2>主要症状</h2>\n			   <p>狗狗瞳孔中央（水晶体）变得比较浑浊。白内障也常常合并视网膜病变，所以狗狗常出现类似夜盲症的症状，当环境光线变得比较昏暗时，狗狗便出现疑似失明的症状，无法分辨周围物品的相对位置。\n</p>\n			\n			 <h2>诊断标准</h2>\n			   <p>通过影像学诊断：眼科超声波检查：可以诊断水晶体的大小，如果水晶体变得很小，表示其为过熟期，表明病况可能已经出现了一段时间。<br>\n血液检查：一般要注意血液中的血糖值与血钙值，如果出现糖尿病或低血钙的现象，表示水晶体的病变可能导因于此。\n\n</p>\n			   \n			    <h2>治疗方法</h2>\n			   <p>早期白内障尚可通过持续的使用扩瞳剂提高视力或使用其他药物来缓解发病过程，如使用白内停、卡他林等眼药水防止晶体不溶性蛋白质的形成和积累，一般对老年性白内障，糖尿病性白内障较为有效。但这些药物只能起到延缓晶状体发生浑浊的时间，而且疗效不明显，通常只用于预防用途。也可通过手术治疗：白内障囊内切除术、白内障囊外切除术、白内障超声乳化术。\n</p>\n                    ', null, null, '2019-12-26 15:18:38', null);
INSERT INTO `tb_article` VALUES ('fe6678f0-27af-11ea-8b9c-61a13e4c555d', null, null, '鼻和鼻咽息肉', '鼻和鼻咽息肉', null, '\n                        <h2>病况星级</h2>\n\n            <p>\n                严重程度：<i class=\"star-4\"></i><br>\n                紧急程度：<i class=\"star-2\"></i><br>\n                危险级别：<i class=\"star-2\"></i><br>\n                治愈率：<i class=\"star-10\"></i><br>\n            </p>\n			\n			\n			\n            <h2>概述</h2>\n\n            <p>鼻息肉为鼻部常见病，是由于极度水肿的鼻腔鼻窦黏膜在重力作用下逐渐下垂而形成。</p>\n			\n			 <h2>发病原因</h2>\n			\n			   <p>幼犬的息肉是逐步发展成的，病因可能是鼻甲明显缺失的后遗症，如慢性毁坏性鼻炎的结果，鼻甲切除手术，辐射治疗后留下的后遗症。</p>\n			   \n				 <h2>主要症状</h2>\n			   <p>鼻道阻塞，症状进行性增加，呼吸时有噪声，喘鸣，打喷嚏以及有鼻分泌物。\n</p>\n			\n			 <h2>诊断标准</h2>\n			   <p>对鼻咽进行物理检查的时候要注意病犬打喷嚏，鼻分泌物，作呕，咳嗽等症状。犬的息肉或长在鼻腔或长在鼻咽部，通过软腭触诊可查到有肿块，息肉可以通过向前牵引软腭查看到。</p>\n			   \n			    <h2>治疗方法</h2>\n			   <p>将息肉轻轻牵引，用镊子尽可能紧贴肿物根部，把息肉摘除；当影像显示有大泡时，用腹侧大泡截骨术；医疗可缓解继发症状：泼尼松龙1~2mg/kg,口服，2次/日，用于犬术后会产生的咽黏膜水肿。可使用抗生素控制继发感染。</p>\n                    ', null, null, '2019-12-26 15:19:10', null);

-- ----------------------------
-- Table structure for tb_article_type
-- ----------------------------
DROP TABLE IF EXISTS `tb_article_type`;
CREATE TABLE `tb_article_type` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(30) DEFAULT NULL COMMENT '类型名称-动态',
  `state` varchar(10) DEFAULT NULL COMMENT '是否禁用： 0 正常， 1 禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_article_type
-- ----------------------------
INSERT INTO `tb_article_type` VALUES ('1', '训狗', '0');
INSERT INTO `tb_article_type` VALUES ('2', '日常护理', '0');
INSERT INTO `tb_article_type` VALUES ('3', '小知识', '0');
INSERT INTO `tb_article_type` VALUES ('4', '饮食', '0');
INSERT INTO `tb_article_type` VALUES ('5', '不存在', 'undefined');
INSERT INTO `tb_article_type` VALUES ('6', '1234', '1');

-- ----------------------------
-- Table structure for tb_assembly
-- ----------------------------
DROP TABLE IF EXISTS `tb_assembly`;
CREATE TABLE `tb_assembly` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题或者说是口号',
  `InitiatorId` int(11) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL COMMENT '纬度',
  `longitude` varchar(255) DEFAULT NULL COMMENT '经度',
  `landmark` varchar(255) DEFAULT NULL COMMENT '地标',
  `time` varchar(255) DEFAULT NULL COMMENT '集会时间',
  `status` int(11) DEFAULT '1' COMMENT '0-已结束;1-正在进行;2-已取消;3地点修改过',
  `is_exist` int(11) DEFAULT '1',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_assembly
-- ----------------------------
INSERT INTO `tb_assembly` VALUES ('1', '华阳的狗子们速速来遛!!!', '2', '-123.123123', '123.123123', '华阳地铁站附近的草坝坝', '2019-10-12 12:00', '1', '1');
INSERT INTO `tb_assembly` VALUES ('2', '修改-华阳的狗子们速速来遛!!!', '2', '-123.123123', '123.123123', '华阳地铁站附近的草坝坝', '2019-10-12 12:00', '2', '1');

-- ----------------------------
-- Table structure for tb_assembly_join
-- ----------------------------
DROP TABLE IF EXISTS `tb_assembly_join`;
CREATE TABLE `tb_assembly_join` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_pet_id` int(11) NOT NULL,
  `assembly_id` int(11) NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `assembly_id` (`assembly_id`),
  CONSTRAINT `assembly_id` FOREIGN KEY (`assembly_id`) REFERENCES `tb_assembly` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_assembly_join
-- ----------------------------
INSERT INTO `tb_assembly_join` VALUES ('1', '2', '123', '1');
INSERT INTO `tb_assembly_join` VALUES ('2', '2', '223', '1');
INSERT INTO `tb_assembly_join` VALUES ('3', '2', '323', '2');

-- ----------------------------
-- Table structure for tb_banner
-- ----------------------------
DROP TABLE IF EXISTS `tb_banner`;
CREATE TABLE `tb_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `author_name` varchar(50) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `article_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_banner
-- ----------------------------
INSERT INTO `tb_banner` VALUES ('1', '你好lb', '简介', 'http://127.0.0.1:7001/app/public/uploadfile/1574236480156icon-only.png', 'liutianxiang', '0', '2019-11-20 15:54:38', 'www.baid.com');
INSERT INTO `tb_banner` VALUES ('2', '我是一个轮播图', '今天咋咋咋，然后发布了啥啥啥', 'http://127.0.0.1:7001/app/public/uploadfile/15742346476833.jpg', 'liutianxiang', null, '2019-11-20 15:28:37', 'www.bai.com');
INSERT INTO `tb_banner` VALUES ('3', '我是标题', '我是简介', 'http://127.0.0.1:7001/app/public/uploadfile/15743895003464.jpg', 'liutianxiang', null, '2019-11-22 10:25:03', 'www.baidu.com');

-- ----------------------------
-- Table structure for tb_collect
-- ----------------------------
DROP TABLE IF EXISTS `tb_collect`;
CREATE TABLE `tb_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collect_type` int(11) DEFAULT NULL COMMENT '收藏类型(1-文章;2-动态)',
  `object_id` int(11) NOT NULL COMMENT '收藏对象的id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间\r\n',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_collect
-- ----------------------------
INSERT INTO `tb_collect` VALUES ('10', '2', '8', '4', '2019-12-12 11:15:26');
INSERT INTO `tb_collect` VALUES ('11', '2', '14', '4', '2019-12-12 15:48:13');

-- ----------------------------
-- Table structure for tb_comments
-- ----------------------------
DROP TABLE IF EXISTS `tb_comments`;
CREATE TABLE `tb_comments` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `article_id` varchar(255) DEFAULT NULL COMMENT '主题id',
  `comments_content` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `from_uid` varchar(255) DEFAULT NULL COMMENT '评论用户id',
  `to_uid` varchar(255) DEFAULT NULL COMMENT '评论目标用户id',
  `comments_id` varchar(255) DEFAULT NULL,
  `state` varchar(4) DEFAULT '1',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `repeat_content` varchar(255) DEFAULT NULL COMMENT '回复内容',
  `is_read` int(11) DEFAULT '0' COMMENT '评论目标用户已读',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_comments
-- ----------------------------
INSERT INTO `tb_comments` VALUES ('1', 'ba836710-17d8-11ea-bad2-dd97222667b0', '你好我是评论', '1', '6', '1', '1', '2019-12-09 14:26:01', null, '0');
INSERT INTO `tb_comments` VALUES ('2', 'ba836710-17d8-11ea-bad2-dd97222667b0', '你好二狗', '1', '6', '2', '0', '2020-01-19 14:25:51', null, '0');
INSERT INTO `tb_comments` VALUES ('12', '8', '1', '4', null, 'dc25f870-1b24-11ea-8859-9d7f694c8f69', '1', '2019-12-10 16:12:51', null, '0');
INSERT INTO `tb_comments` VALUES ('13', '8', '2', '4', null, 'de867db0-1b24-11ea-8859-9d7f694c8f69', '1', '2019-12-10 16:12:55', null, '0');
INSERT INTO `tb_comments` VALUES ('14', '8', '1-1', '4', '4', 'dc25f870-1b24-11ea-8859-9d7f694c8f69', '1', '2019-12-10 16:13:04', null, '0');
INSERT INTO `tb_comments` VALUES ('15', '8', '1-2', '4', '4', 'dc25f870-1b24-11ea-8859-9d7f694c8f69', '1', '2019-12-12 17:02:10', null, '0');

-- ----------------------------
-- Table structure for tb_follow
-- ----------------------------
DROP TABLE IF EXISTS `tb_follow`;
CREATE TABLE `tb_follow` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `famous_user_id` int(11) NOT NULL COMMENT '名人(被关注者)的id',
  `follower_id` int(11) NOT NULL COMMENT '粉丝(关注者)的id',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建的时间',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_follow
-- ----------------------------
INSERT INTO `tb_follow` VALUES ('9', '4', '6', '2019-12-10 09:10:58');
INSERT INTO `tb_follow` VALUES ('10', '5', '6', '2019-12-11 10:59:21');
INSERT INTO `tb_follow` VALUES ('12', '5', '4', '2019-12-11 11:13:01');

-- ----------------------------
-- Table structure for tb_formId
-- ----------------------------
DROP TABLE IF EXISTS `tb_formId`;
CREATE TABLE `tb_formId` (
  `id` int(11) NOT NULL,
  `user_uid` varchar(11) NOT NULL,
  `formid` varchar(255) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `useTime` datetime NOT NULL,
  `isUsed` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_formId
-- ----------------------------

-- ----------------------------
-- Table structure for tb_moment
-- ----------------------------
DROP TABLE IF EXISTS `tb_moment`;
CREATE TABLE `tb_moment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '1-普通;2-领养;3-相亲;4-求助',
  `pet_id` int(11) DEFAULT NULL,
  `content` mediumtext,
  `img_list` mediumtext,
  `is_free` int(11) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `views` int(11) DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '1',
  `adopt_pet_name` varchar(255) DEFAULT NULL,
  `adopt_pet_cate` int(11) DEFAULT NULL,
  `adopt_pet_gender` int(11) DEFAULT NULL,
  `moment_longitude` varchar(125) DEFAULT NULL,
  `moment_latitude` varchar(125) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_moment
-- ----------------------------
INSERT INTO `tb_moment` VALUES ('23', '7', '1', null, '嘿嘿嘿', '/public/uploadfile/1577518238156wx5ece4812b0b66de9.o6zAJs5kAL_x1rieGI_8f0QOSTSs.GKF1y0xdkLFdd685f1078f01cfe18c3e7648fd04ea2b.jpg,/public/uploadfile/1577518238177wx5ece4812b0b66de9.o6zAJs5kAL_x1rieGI_8f0QOSTSs.UqZeBhqn0iWj431896f4dca599601e36dd30f218fa51.jpg,/public/uploadfile/1577518238190wx5ece4812b0b66de9.o6zAJs5kAL_x1rieGI_8f0QOSTSs.lVPpE0kdG8Lz0062a66800a8921dbaf12ca54a88bc18.jpg,/public/uploadfile/1577518238220wx5ece4812b0b66de9.o6zAJs5kAL_x1rieGI_8f0QOSTSs.dXyw6rHCtX526b697889719298f07124320069b0b56e.jpg', null, '2019-12-28 15:30:38', '99', '1', null, null, null, null, null);

-- ----------------------------
-- Table structure for tb_pet
-- ----------------------------
DROP TABLE IF EXISTS `tb_pet`;
CREATE TABLE `tb_pet` (
  `pet_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '宠物id',
  `host_id` tinyint(11) DEFAULT NULL COMMENT '宠物主人id',
  `pet_name` varchar(255) DEFAULT NULL,
  `pet_birth` date DEFAULT NULL COMMENT '宠物的生日',
  `pet_cate` int(11) DEFAULT NULL COMMENT '宠物的类别',
  `pet_description` varchar(255) DEFAULT NULL,
  `pet_weight` int(11) DEFAULT NULL,
  `pet_gender` int(11) DEFAULT NULL COMMENT '宠物性别',
  `pet_bear` int(11) DEFAULT NULL COMMENT '宠物是否婚育',
  `pet_avatar` text,
  PRIMARY KEY (`pet_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_pet
-- ----------------------------
INSERT INTO `tb_pet` VALUES ('3', '4', '小柠檬', '2019-07-01', '1002', '爱吃狗屎', '2', '1', '1', 'http://localhost:7001/public/uploadfile/1575444500245wx5ece4812b0b66de9.o6zAJs5kAL_x1rieGI_8f0QOSTSs.rvxJQIMrfy9s0f79e69fcb258ed236fc37e8be9ed77d.png');
INSERT INTO `tb_pet` VALUES ('4', '4', '大柠檬', '2019-12-09', '1002', '说点', '2', '1', '1', 'http://localhost:7001/public/uploadfile/1575444500245wx5ece4812b0b66de9.o6zAJs5kAL_x1rieGI_8f0QOSTSs.rvxJQIMrfy9s0f79e69fcb258ed236fc37e8be9ed77d.png');

-- ----------------------------
-- Table structure for tb_petCate
-- ----------------------------
DROP TABLE IF EXISTS `tb_petCate`;
CREATE TABLE `tb_petCate` (
  `cate_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类的id',
  `host_id` int(11) DEFAULT NULL COMMENT '父级id',
  `cate_name` varchar(255) DEFAULT NULL COMMENT '分类名称',
  `cate_avatar` text COMMENT '分类头像,记得给个默认值',
  `is_exist` int(11) DEFAULT '1',
  PRIMARY KEY (`cate_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2004 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_petCate
-- ----------------------------
INSERT INTO `tb_petCate` VALUES ('1', '0', '猫', null, '1');
INSERT INTO `tb_petCate` VALUES ('2', '0', '狗', null, '1');
INSERT INTO `tb_petCate` VALUES ('3', '0', '其他', null, '1');
INSERT INTO `tb_petCate` VALUES ('11', '1', '中华田园猫', null, '1');
INSERT INTO `tb_petCate` VALUES ('21', '2', '大型犬', null, '1');
INSERT INTO `tb_petCate` VALUES ('22', '2', '大中型犬', null, '1');
INSERT INTO `tb_petCate` VALUES ('23', '2', '中型犬', null, '1');
INSERT INTO `tb_petCate` VALUES ('24', '2', '小型犬', null, '1');
INSERT INTO `tb_petCate` VALUES ('31', '3', '其他', null, '1');
INSERT INTO `tb_petCate` VALUES ('1001', '21', '金毛', null, '1');
INSERT INTO `tb_petCate` VALUES ('1002', '22', '边牧', null, '1');
INSERT INTO `tb_petCate` VALUES ('1003', '11', '大橘', null, '1');
INSERT INTO `tb_petCate` VALUES ('1004', '31', '其他', null, '1');
INSERT INTO `tb_petCate` VALUES ('2003', '11', '没用的大橘', null, '0');

-- ----------------------------
-- Table structure for tb_thumbsUp
-- ----------------------------
DROP TABLE IF EXISTS `tb_thumbsUp`;
CREATE TABLE `tb_thumbsUp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thumbs_up_type` int(11) DEFAULT NULL COMMENT '点赞类型(1-文章;2-动态)',
  `object_id` int(11) NOT NULL COMMENT '点赞对象的id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间\r\n',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_thumbsUp
-- ----------------------------

-- ----------------------------
-- Table structure for tb_users
-- ----------------------------
DROP TABLE IF EXISTS `tb_users`;
CREATE TABLE `tb_users` (
  `uid` int(12) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) DEFAULT NULL,
  `wx_nickname` varchar(255) DEFAULT NULL,
  `province` varchar(15) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `wx_openId` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `password` varchar(60) NOT NULL,
  `phone_num` varchar(12) NOT NULL,
  `sign` varchar(255) DEFAULT NULL,
  `state` varchar(10) DEFAULT '0' COMMENT '0为正常，1为不正常',
  `latitude` varchar(255) DEFAULT NULL COMMENT '纬度',
  `longitude` varchar(255) DEFAULT NULL COMMENT '经度',
  `followers` int(11) DEFAULT '0' COMMENT '粉丝数',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_users
-- ----------------------------
INSERT INTO `tb_users` VALUES ('1', '二狗', '淡蓝色的烟雨云', '四川', null, 'http://localhost:7001/public/uploadfile/1575425762206wx5ece4812b0b66de9.o6zAJs5kAL_x1rieGI_8f0QOSTSs.cqpCHjGl9Bym2037bf86d8f15d7659926534b37c577e.jpg', null, '2020-02-28 15:32:17', '', '1808044325.', null, '0', '104.04311', '30.64242', '0');
INSERT INTO `tb_users` VALUES ('5', '洁锅', null, null, null, 'http://localhost:7001/public/uploadfile/1575513325027wx5ece4812b0b66de9.o6zAJs5kAL_x1rieGI_8f0QOSTSs.LeRGievVUv8Pd685f1078f01cfe18c3e7648fd04ea2b.jpg', null, '2019-12-12 14:22:34', '', '', null, '0', '104.02311', '30.62242', '1');
INSERT INTO `tb_users` VALUES ('6', '刘二狗', null, null, null, 'http://localhost:7001/public/uploadfile/1575513325074wx5ece4812b0b66de9.o6zAJs5kAL_x1rieGI_8f0QOSTSs.LtJmnZ9QVUVP431896f4dca599601e36dd30f218fa51.jpg', null, '2019-12-09 15:18:28', '', '', null, '0', '104.02211', '30.62242', '0');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户Id（递增）',
  `name` varchar(16) NOT NULL COMMENT '用户名',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像路径',
  `phone` tinyint(11) DEFAULT NULL,
  `password` varchar(16) DEFAULT NULL,
  `nick_name` varchar(11) DEFAULT NULL,
  `gender` int(2) DEFAULT NULL,
  `vertify_code` varchar(6) DEFAULT NULL,
  `fans` int(11) DEFAULT NULL,
  `follows` int(11) DEFAULT NULL,
  `vip_level` int(2) DEFAULT NULL,
  `is_active` varchar(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
