/*
Navicat MySQL Data Transfer

Source Server         : MyCollection
Source Server Version : 50734
Source Host           : localhost:3306
Source Database       : vueblog

Target Server Type    : MYSQL
Target Server Version : 50734
File Encoding         : 65001

Date: 2021-11-19 16:55:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for m_blog
-- ----------------------------
DROP TABLE IF EXISTS `m_blog`;
CREATE TABLE `m_blog` (
                          `id` bigint(20) NOT NULL AUTO_INCREMENT,
                          `user_id` bigint(20) NOT NULL,
                          `title` varchar(255) NOT NULL,
                          `description` varchar(255) NOT NULL,
                          `content` longtext,
                          `created` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
                          `status` tinyint(4) DEFAULT NULL,
                          PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of m_blog
-- ----------------------------
INSERT INTO `m_blog` VALUES ('1', '1', '生活就像海洋，只有意志坚强的人才能到达彼岸', '她什么都不记得了，却记住了我的不好。——《归来》\n我不能等你一年零一个月了，也不能等你到二十五岁了，但是我会等你一辈子。——《山楂树之恋》\n 如果你不出去走走，就会以为眼前的就是全世界。——《天堂电影院》\n死亡不是生命的终点，遗忘才是。——《寻梦环游记》', '1.“我爱你”“会淡的”———《伦敦生活》\n4.不是所有人都能功成名就，我们中有些人注定要在日常生活的点滴中寻找生命的意义。———《生活大爆炸》\n\n5.人生与电影不同，人生……辛苦多了。———《天堂电影院》\n', '2021-11-18 22:08:42', '0');
INSERT INTO `m_blog` VALUES ('7', '1', '你真的会写单例模式吗?', '单例模式可能是代码最少的模式了，但是少不一定意味着简单，想要用好、用对单例模式，还真得费一番脑筋。本文对 Java 中常见的单例模式写法做了一个总结，如有错漏之处，恳请读者指正。', '> 作者：吃桔子的攻城狮 来源：http://www.tekbroaden.com/singleton-java.html\n\n\n单例模式可能是代码最少的模式了，但是少不一定意味着简单，想要用好、用对单例模式，还真得费一番脑筋。本文对 Java 中常见的单例模式写法做了一个总结，如有错漏之处，恳请读者指正。\n\n饿汉法\n===\n\n顾名思义，饿汉法就是在第一次引用该类的时候就创建对象实例，而不管实际是否需要创建。代码如下：\n\n```\npublic class Singleton {  \n    private static Singleton = new Singleton();\n    private Singleton() {}\n    public static getSignleton(){\n        return singleton;\n    }\n}\n\n```\n\n这样做的好处是编写简单，但是无法做到延迟创建对象。但是我们很多时候都希望对象可以尽可能地延迟加载，从而减小负载，所以就需要下面的懒汉法：\n', '2021-11-18 00:42:44', '0');
INSERT INTO `m_blog` VALUES ('9', '1', '真正理解Mysql的四种隔离级别@', '事务是应用程序中一系列严密的操作，所有操作必须成功完成，否则在每个操作中所作的所有更改都会被撤消。也就是事务具有原子性，一个事务中的一系列的操作要么全部成功，要么一个都不做。\n\n事务的结束有两种，当事务中的所以步骤全部成功执行时，事务提交。如果其中一个步骤失败，将发生回滚操作，撤消撤消之前到事务开始时的所以操作。', '### 什么是事务  \n\n> 事务是应用程序中一系列严密的操作，所有操作必须成功完成，否则在每个操作中所作的所有更改都会被撤消。也就是事务具有原子性，一个事务中的一系列的操作要么全部成功，要么一个都不做。\n> \n> 事务的结束有两种，当事务中的所以步骤全部成功执行时，事务提交。如果其中一个步骤失败，将发生回滚操作，撤消撤消之前到事务开始时的所以操作。\n\n**事务的 ACID**\n\n事务具有四个特征：原子性（ Atomicity ）、一致性（ Consistency ）、隔离性（ Isolation ）和持续性（ Durability ）。这四个特性简称为 ACID 特性。\n\n> 1 、原子性。事务是数据库的逻辑工作单位，事务中包含的各操作要么都做，要么都不做\n> \n> 2 、一致性。事 务执行的结果必须是使数据库从一个一致性状态变到另一个一致性状态。因此当数据库只包含成功事务提交的结果时，就说数据库处于一致性状态。如果数据库系统 运行中发生故障，有些事务尚未完成就被迫中断，这些未完成事务对数据库所做的修改有一部分已写入物理数据库，这时数据库就处于一种不正确的状态，或者说是 不一致的状态。', '2021-11-18 22:04:46', '0');
INSERT INTO `m_blog` VALUES ('18', '2', '最大子序和', '给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。', '​\n题目描述：\n\n给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。\n\n示例 1：\n\n输入：nums = [-2,1,-3,4,-1,2,1,-5,4]\n输出：6\n解释：连续子数组 [4,-1,2,1] 的和最大，为 6 。\n示例 2：\n\n输入：nums = [1]\n输出：1\n示例 3：\n\n输入：nums = [0]\n输出：0\n示例 4：\n\n输入：nums = [-1]\n输出：-1\n示例 5：\n\n输入：nums = [-100000]\n输出：-100000\n\n来源：力扣（LeetCode）\n链接：力扣\n著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。\n\n---------------------------------------------------------------------------------------------------------------------------------\n\n对于序列中下标为i的位置的函数 f(i)，规定 f(i) 为以该位置i为终点的最大子序列的值，由动态规划得 f(i) = Math.max( f(i - 1) , nums[i] )，所以子序列最大值为f(0),f(1),...,f(n)中的最大值。\n\n代码如下\n\n​public class LC53 {\n    public static void main(String[] args) {\n        int[] nums = {-2,1,-3,4,-1,2,1,-5,4};\n        System.out.println(maxSubArray(nums));\n    }\n\n    public static int maxSubArray(int[] nums) {\n        int l = 0;\n        int r = 0;\n        int left = 0;\n        int right = 0;\n        int sum = 0;\n        int result = nums[0];\n        for (int i = 0; i < nums.length; i++) {\n            if(sum > 0){\n                sum = sum + nums[i];\n                r = i;\n            }else {\n                sum = nums[i];\n                l = i;\n            }\n\n            if(sum > result){\n                result = sum;\n                left = l;\n                right = r;\n            }\n        }\n        System.out.println(left+\" \"+right);\n        return result;\n    }\n}', '2021-11-18 10:35:15', '0');
INSERT INTO `m_blog` VALUES ('19', '2', '对链表进行反转', '给你单链表的头节点 head ，请你反转链表，并返回反转后的链表。\n', '题目描述：\n\n给你单链表的头节点 head ，请你反转链表，并返回反转后的链表。\n​\n输入：head = [1,2,3,4,5]\n输出：[5,4,3,2,1]\n\n来源：力扣（LeetCode）\n链接：力扣\n著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。\n\n---------------------------------------------------------------------------------------------------------------------------------\n\n本题主要运用迭代思想，需要注意设置变量pre记录前置节点，并且迭代时也需记录下一个节点。\n\n代码如下\n\n​/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode() {}\n *     ListNode(int val) { this.val = val; }\n *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }\n * }\n */\nclass Solution {\n    public ListNode reverseList(ListNode head) {\n        if(head == null || head.next == null) {\n            return head;\n        }\n        ListNode pre = head;\n        ListNode p = head.next;\n        pre.next = null;\n        while (p != null) {\n            ListNode node = p.next;\n            p.next = pre;\n            pre = p;\n            p = node;\n        }\n \n        return pre;\n    }\n}', '2021-11-18 10:39:23', '0');
INSERT INTO `m_blog` VALUES ('24', '4', 'sql', 'sql', '```sql\ncreate table student\n(stuID char(9) primary key,\nstuName char(10) not null,\nstuBir date,\nstuTel char(12),\nstuMajor char(20)\n);\n\ncreate table major\n(majorID char(20) primary key,\nmajorName char(20),\nmajorCollegeID char(20)\n);\n\ncreate table college\n(collegeID char(20) primary key,\ncollegeName char(20)\n);\n\ncreate table course\n(courseID char(20) primary key,\ncourseName char(20),\ncourseTeacher char(20),\ncourseCredit char(2)\n);\n\ncreate table SC\n(stuID char(20),\ncourseID char(20),\nscore smallint check(成绩>=0 and 成绩<=100),\ncredit char(5),\nPrimary key(stuID,courseID)\n);\n```', '2021-11-18 18:58:16', '0');
INSERT INTO `m_blog` VALUES ('25', '1', '《肖申克的救赎》', '生命可以归结为一种简单的选择：要么忙于生存，要么忙于赶死。\n——《肖申克的救赎》\nI guess it comes down to a simple choice:get busy living or get busy dying.\nfrom The Shawshank Redemption\n1.懦弱囚禁人的灵魂，希望可以令你感受自由。强者自救，圣者渡人。\n2.你知道，有些鸟是注定不会关在牢笼里的，它的每一片羽毛都闪耀着自由的光辉。', '生命可以归结为一种简单的选择：要么忙于生存，要么忙于赶死。\n\n——《肖申克的救赎》\n\nI guess it comes down to a simple choice:get busy living or get busy dying.\n\nfrom The Shawshank Redemption\n\n\n\n1.懦弱囚禁人的灵魂，希望可以令你感受自由。强者自救，圣者渡人。\n\nFear can hold you prisoner,hope can set you free.A strong man can save himself,a great man can save others.\n2.你知道，有些鸟是注定不会关在牢笼里的，它的每一片羽毛都闪耀着自由的光辉。\n\nYou know some birds are not meant to be caged,their feather are just too bright.\n\n3.这些墙很有趣，刚入狱的时候，你痛恨周围的高墙；慢慢地，你习惯了生活在其中；最终你会发现自己不得不依靠它而生存。这就叫体制化。\n\nThese walls are funny.First you hate them,then you get used to them;Enough time passes,gets so you depend on them.That\'s institutionalized.\n\n小编有话说：对于已经工作的我们来说，你是否也想过：我们现在的工作又何尝不是一堵围墙呢？是否因为现在安逸的生活正在一点点地去依附它，离不开它呢？\n\n4. 重要的事情往往难以启齿，因为言语会缩小其重 要性；要让素未平生的人在意你生命中的美好事物，原本就不容易。\n\nThe most important things are hardest to tell,because words shrink their importance.It\'s not\n\neasy to let strangers care about the good things in your life.\n\n小编语：生活中你可以不孤独，但学会怎么处理孤独真的很重要，因为无论是谁，都是忙碌心情烦躁的时候，而恰恰这时候正是他们不愿倾听帮助人的时候。\n\n\n', '2021-11-18 19:14:07', '0');
INSERT INTO `m_blog` VALUES ('26', '1', '何以为家', '世界上有太多孤独的人，害怕先踏出第一步。——《绿皮书》\n很多时候，蒙蔽我们双眼的，不是假象，而是自己的执念。——《赎罪》', '1.如果我有的选，我能比你们所有人都好。——《何以为家》\n\n2. 世界上有太多孤独的人，害怕先踏出第一步。——《绿皮书》\n3. “你为什么老是挑刺？”“因为你可以做的更好。”\n4. 很多时候，蒙蔽我们双眼的，不是假象，而是自己的执念。——《赎罪》\n5. 我们的小缺点，让我们找到对的人。——《心灵捕手》', '2021-11-18 19:17:06', '0');
INSERT INTO `m_blog` VALUES ('27', '2', '电影《误杀》影评 | 对人性、制度、社会正义的拷问', '在迎接2020年跨年之际，我选择了去看《误杀》这部推理悬疑电影，虽改编自印度电影，但补充和更改之处都能够很好地逻辑自洽。对于我来说，《误杀》给我带来的触动不仅仅是缜密推进的剧情、环环相扣的推理，更重要的是这部电影的灵魂——对人性、制度、社会正义的拷问。', '铺设网络电缆的小老板李维杰与阿玉的大女儿平平被人迷奸，犯罪者正是警察局长拉韫与市长竞选人都彭的儿子素察。\n\n当素察以视频相威胁，试图再次强奸时，平平在反抗过程中“误杀”了他。片名《误杀》由此而来。\n\n在明知不会得到公正审判的前提下，作为父亲的李维杰，依靠自己看过无数电影所积累起来的“经验”，利用时间轴的剪辑，精心编制了“不在场证明”，带领全家展开了一场与警察局长拉韫的较量，最终成功脱罪。\n影片的一开头就向观众铺陈了社会背景：泰国灿班镇表面看上去一片祥和，民众在茶余饭后谈论着电影。民众们生活的并不富裕，但温饱已不再是一个问题（主角家中餐食丰富，但作为一个小老板，拿出6000泰铢都很困难），按我们的定义来讲，是基本步入了小康社会。\n\n但影片的细节上可以看出，在祥和的表象之下，是不可调和的阶级矛盾和严重的社会危机。\n\n基层的酷吏、虚伪的高官、被鱼肉的百姓组成了这部电影的主要元素。\n\n桑坤是电影中酷吏的一个缩影，他成功的把自己微小的权力运用到了极致。从吃饭永远不付钱，到利用职权敲竹杠、收税、贪污，在鱼肉百姓方面，无论涉及利益的大小，他紧紧的抓住了每个机会。\n\n电影中一笔最为平常地交易，桑坤都要收取500泰铢的“税”。家属赔偿款的10万泰铢里，他贪没了9万6千。他轻松的拿到了投诉人的信息，用枪指着民众的头，说出了那句“你以为这钱都我一个人拿的吗”。', '2021-11-18 19:24:50', '0');
INSERT INTO `m_blog` VALUES ('28', '2', '《我不是药神》：悲喜交加的电影', '《我不是药神》在18年暑假大获好评，这部电影标志着我国现实主义批判题材重新冉冉上升，电影从一群市井任务入手，从家庭层面逐渐上升到社会层面，向社会抛出一个个问题：当法律与道德对立怎么办，以及逐利还是救命的争议......', '原本的一个小商贩程勇从印度带回了廉价的“天价药”的仿制药，并进行非法售卖，而引起了警察的调查，但后面的发展，程勇从自私到无私，从为己到为他人的转变，为拯救病人而进行反抗，斗争，最后被抓却赢得了尊重赢得了感激。全片电影，围绕“药”展开故事，情节扣人心悬，主题引人深思，引起了人们对社会，生活以及人性的思考。\n\n《我不是药神》电影中有许多的对立点，在我看来他正是电影的看点之一，也正是《我不是药神》这部电影所表达的内涵。这些对立点无法轻易去评判他的对错，他们并非非黑即白的，就像生活，人性。一部好的电影并非是解决了一个问题，而是抛出了一个问题，引起人们的深思。电影中的第一个对立点就是当法律与道德对立的时候，卖仿制药救人命犯法吗？电影中程勇虽然开始贩卖仿制药时是为了赚钱，但后来的药，他2000进500出，他不为名，不为利，只是出于良心，想要救那些白血病病人，就像他自己说的“我上有老下有小，我又没有白血病，我不要坐牢”。最后一次警察捉捕的时候程勇放走拖着药箱的病人自己去拖延时间，可是最后还是被捉了，那些病人的眼里从闪耀着希望，喜悦，最后变成绝望。最后追击的时候黄毛车祸死亡，程勇说的“他才二十岁，他只是想活着，他有什么罪！”（台词）看到这里口中无言，眼泪却再也止不住了。在拘捕人当中有个老奶奶双手捉住警察的双手说了这样一段话“那药才500块钱一瓶药贩子根本不赚钱，谁家能不遇上个病人，你就能保证你这一辈子不生病吗？你把他捉走，我们都得等死”（台词）多么让人心痛让人无奈，警察也是没有办法。\n\n可是程勇确实是违法了，程勇的药被没收，也被判入狱。可是好在法律考虑了道德的层面，予以轻罚。而国家也因此重视， 把这种天价却救命的药列入了医保中。在电影中这个结局是美好的，也许在现实中一切没有那么简单，但我认为，法律与良心其实并不是对立的，法有法情，法也有法的理，即使两者之间平等很难，但这里是有一个平衡点的，理智与情感都是解决社会问题必不可少的，这里谁都没有错，只是社会还需要继续改革进步我相信会像程勇进法庭之前说的那样：我相信，会越来越好的。我也相信！', '2021-11-18 19:26:35', '0');

-- ----------------------------
-- Table structure for m_user
-- ----------------------------
DROP TABLE IF EXISTS `m_user`;
CREATE TABLE `m_user` (
                          `id` bigint(20) NOT NULL AUTO_INCREMENT,
                          `username` varchar(64) DEFAULT NULL,
                          `email` varchar(64) DEFAULT NULL,
                          `password` varchar(64) DEFAULT NULL,
                          `created` datetime DEFAULT NULL,
                          `last_login` datetime DEFAULT NULL,
                          PRIMARY KEY (`id`),
                          KEY `UK_USERNAME` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_user
-- ----------------------------
INSERT INTO `m_user` VALUES ('1', 'zhangsan', null, '96e79218965eb72c92a549dd5a330112', '2020-04-20 10:44:01', '2021-11-18 19:47:06');
INSERT INTO `m_user` VALUES ('2', 'xingjingye', '123@qq.com', '2016cd1533bb94b303b2ad39e83b8c6d', '2021-11-17 23:16:31', '2021-11-18 19:47:06');
INSERT INTO `m_user` VALUES ('3', 'xiaoming', 'xiaoming@qq.com', '2016cd1533bb94b303b2ad39e83b8c6d', '2021-11-17 23:47:37', '2021-11-18 19:47:06');
INSERT INTO `m_user` VALUES ('4', '123', '123', '202cb962ac59075b964b07152d234b70', '2021-11-18 18:56:29', '2021-11-18 19:47:06');
