/*
Navicat MySQL Data Transfer

Source Server         : admin
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : daxie

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2019-01-20 21:00:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `articleId` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` text,
  `userId` varchar(50) NOT NULL,
  `readCount` int(10) DEFAULT '0',
  `incognito` int(2) DEFAULT '0',
  `likeCount` int(10) DEFAULT '0',
  `tag` varchar(20) DEFAULT NULL,
  `sortId` int(20) DEFAULT '0',
  `createTime` varchar(20) DEFAULT NULL,
  `updateTime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '1', '母猪的产后护理', '<p>五号研究比较深刻&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>', '2019119115750454', null, '1', null, null, null, '201911923350', null);
INSERT INTO `article` VALUES ('2', '2', '如何从开源框架的源码中学习？', '<div><p>理解框架用途不是看源码的，是看文档的</p><p>随便一个开源项目好歹有个文档吧？哪怕是gayhub上的toy project也有readme吧？</p><p>先从那看起</p><p>看不懂正常 你应该多跟开发者交流 现在项目很多都有gitter还有slack，open mail，google group等等，手段多的很，先从提交issue和pr开始，不用一口吃成胖子</p><p>第一步可以先从下载源码并成功编译开始</p></div>', '2019119115750454', null, '0', null, null, null, '201912094214', null);
INSERT INTO `article` VALUES ('3', 'wz201912010018917982', '最新阿里内推Java后端面试题', '<div><div><p><b>阿里一面题目：</b></p><ol><li>osi七层网络模型，五层网络模型，每次层分别有哪些协议</li><li>死锁产生的条件， 以及如何避免死锁，银行家算法，产生死锁后如何解决</li><li>如何判断链表有环</li><li>虚拟机类加载机制，双亲委派模型，以及为什么要实现双亲委派模型</li><li>虚拟机调优参数</li><li>拆箱装箱的原理</li><li>JVM垃圾回收算法</li><li>CMS G1</li><li>hashset和hashmap的区别，haspmap的底层实现put操作，扩容机制，currenthashmap如何解决线程安全,1.7版本以及1.8版本的不同</li><li>md5加密的原理</li><li>有多少种方法可以让线程阻塞，能说多少说多少</li><li>synchronized和reetrantlock锁</li><li>AQS同步器框架，countdowmlatch，cyclebarrier，semaphore，读写锁</li></ol><p><b>阿里二面题目：</b></p><ol><li>B-Tree索引，myisam和innodb中索引的区别</li><li>BIO和NIO的应用场景</li><li>讲讲threadlocal</li><li>数据库隔离级别，每层级别分别用什么方法实现，三级封锁协议,共享锁排它锁，mvcc多版本并发控制协议，间隙锁</li><li>数据库索引？B+树？为什么要建索引？什么样的字段需要建索引，建索引的时候一般考虑什么？索引会不会使插入、删除作效率变低，怎么解决？</li><li>数据库表怎么设计的？数据库范式？设计的过程中需要注意什么？</li><li>共享锁与非共享锁、一个事务锁住了一条数据，另一个事务能查吗？</li><li>Spring bean的生命周期？默认创建的模式是什么？不想单例怎么办？</li></ol><h2><b>阿里三面题：</b></h2><ol><li>高并发时怎么限流</li><li>线程池的拒接任务策略<br></li><li> HashMap和Hashtable的区别<br></li><li>实现一个保证迭代顺序的HashMap</li><li>说一说排序算法，稳定性，复杂度</li><li>说一说GC</li><li>JVM如何加载一个类的过程，双亲委派模型中有哪些方法？</li><li>TCP如何保证可靠传输？三次握手过程？<br></li><li>springboot的启动流程<br></li><li>集群、负载均衡、分布式、数据一致性的区别与关系<br></li><li>数据库如果让你来垂直和水平拆分，谁先拆分，拆分的原则有哪些(单表数据量多大拆)<br></li><li>最后谈谈Redis、Kafka、 Dubbo，各自的设计原理和应用场景</li></ol><p><b>面试总结：</b></p><p><b>通过这次面试题和之前发的阿里面试题来看，可以总结出目前互联网公司面试考点为：</b></p><ol><li>性能调优、算法数据机构</li><li>高并发下数据安全、接口冪等性、原子性等</li><li>分布式下协同、已经锁的处理</li><li>数据库的分库分表、项目之间的垂直拆分</li></ol><p><b>详细技术点为：</b></p><ul><li>HashMap</li><li>JVM  【必问】</li><li>Dubbo</li><li>Mybatis</li><li>Zookeeper</li><li>http tcp/ip</li></ul><p>为了让学习变得轻松、高效！今天给大家免费分享一套教学资源，帮助大家在成为架构师的道路上披荆斩棘。</p></div></div>', '2019119115750454', null, '1', null, null, '3', '201912010018', null);
INSERT INTO `article` VALUES ('4', 'wz201912010438931669', '新手也能看懂，消息队列其实很简单', '<h2>消息队列其实很简单</h2><p>“RabbitMQ？”“Kafka？”“RocketMQ？”...在日常学习与开发过程中，我们常常听到消息队列这个关键词。我也在我的多篇文章中提到了这个概念。可能你是熟练使用消息队列的老手，又或者你是不懂消息队列的新手，不论你了不了解消息队列，本文都将带你搞懂消息队列的一些基本理论。如果你是老手，你可能从本文学到你之前不曾注意的一些关于消息队列的重要概念，如果你是新手，相信本文将是你打开消息队列大门的一板砖。</p><h2>一 什么是消息队列</h2><p>我们可以把消息队列比作是一个存放消息的容器，当我们需要使用消息的时候可以取出消息供自己使用。消息队列是分布式系统中重要的组件，使用消息队列主要是为了通过异步处理提高系统性能和削峰、降低系统耦合性。目前使用较多的消息队列有ActiveMQ，RabbitMQ，Kafka，RocketMQ，我们后面会一一对比这些消息队列。</p><p>另外，我们知道队列 Queue 是一种先进先出的数据结构，所以消费消息时也是按照顺序来消费的。比如生产者发送消息1,2,3...对于消费者就会按照1,2,3...的顺序来消费。但是偶尔也会出现消息被消费的顺序不对的情况，比如某个消息消费失败又或者一个 queue 多个consumer 也会导致消息被消费的顺序不对，我们一定要保证消息被消费的顺序正确。</p><p>除了上面说的消息消费顺序的问题，使用消息队列，我们还要考虑如何保证消息不被重复消费？如何保证消息的可靠性传输（如何处理消息丢失的问题）？......等等问题。所以说使用消息队列也不是十全十美的，使用它也会让系统可用性降低、复杂度提高，另外需要我们保障一致性等问题。</p><h2>二 为什么要用消息队列</h2><p>我觉得使用消息队列主要有两点好处：1.通过异步处理提高系统性能（削峰、减少响应所需时间）;2.降低系统耦合性。如果在面试的时候你被面试官问到这个问题的话，一般情况是你在你的简历上涉及到消息队列这方面的内容，这个时候推荐你结合你自己的项目来回答。</p><p>《大型网站技术架构》第四章和第七章均有提到消息队列对应用性能及扩展性的提升。</p><p><b>(1) 通过异步处理提高系统性能（削峰、减少响应所需时间）</b></p><p><br></p><figure><img src=\"https://pic3.zhimg.com/v2-38d11d9e3a712f558d97ee1149265da2_b.jpg\" width=\"910\"><figcaption>通过异步处理提高系统性能</figcaption></figure><p><br></p><p>如上图，<b>在不使用消息队列服务器的时候，用户的请求数据直接写入数据库，在高并发的情况下数据库压力剧增，使得响应速度变慢。但是在使用消息队列之后，用户的请求数据发送给消息队列之后立即 返回，再由消息队列的消费者进程从消息队列中获取数据，异步写入数据库。由于消息队列服务器处理速度快于数据库（消息队列也比数据库有更好的伸缩性），因此响应速度得到大幅改善。</b></p><p>通过以上分析我们可以得出<b>消息队列具有很好的削峰作用的功能</b>——即<b>通过异步处理，将短时间高并发产生的事务消息存储在消息队列中，从而削平高峰期的并发事务。</b>&nbsp;举例：在电子商务一些秒杀、促销活动中，合理使用消息队列可以有效抵御促销活动刚开始大量订单涌入对系统的冲击。如下图所示：<br></p><figure><img src=\"https://pic3.zhimg.com/v2-d8cc821bcafbf17b08c96b0f5990670a_b.jpg\" width=\"780\"><figcaption>合理使用消息队列可以有效抵御促销活动刚开始大量订单涌入对系统的冲击</figcaption></figure><p><br></p><p>因为<b>用户请求数据写入消息队列之后就立即返回给用户了，但是请求数据在后续的业务校验、写数据库等操作中可能失败</b>。因此使用消息队列进行异步处理之后，需要<b>适当修改业务流程进行配合</b>，比如<b>用户在提交订单之后，订单数据写入消息队列，不能立即返回用户订单提交成功，需要在消息队列的订单消费者进程真正处理完该订单之后，甚至出库后，再通过电子邮件或短信通知用户订单成功</b>，以免交易纠纷。这就类似我们平时手机订火车票和电影票。</p><p><b>(2) 降低系统耦合性</b></p><p>我们知道如果模块之间不存在直接调用，那么新增模块或者修改模块就对其他模块影响较小，这样系统的可扩展性无疑更好一些。</p><p>我们最常见的<b>事件驱动架构</b>类似生产者消费者模式，在大型网站中通常用利用消息队列实现事件驱动结构。如下图所示：</p><p><br></p><figure><img src=\"https://pic1.zhimg.com/v2-89acee0a50ff56e2b63450e831b96924_b.jpg\" width=\"790\"><figcaption>利用消息队列实现事件驱动结构</figcaption></figure><p><br></p><p><b>消息队列使利用发布-订阅模式工作，消息发送者（生产者）发布消息，一个或多个消息接受者（消费者）订阅消息。</b>&nbsp;从上图可以看到<b>消息发送者（生产者）和消息接受者（消费者）之间没有直接耦合</b>，消息发送者将消息发送至分布式消息队列即结束对消息的处理，消息接受者从分布式消息队列获取该消息后进行后续处理，并不需要知道该消息从何而来。<b>对新增业务，只要对该类消息感兴趣，即可订阅该消息，对原有系统和业务没有任何影响，从而实现网站业务的可扩展性设计</b>。</p><p>消息接受者对消息进行过滤、处理、包装后，构造成一个新的消息类型，将消息继续发送出去，等待其他消息接受者订阅该消息。因此基于事件（消息对象）驱动的业务架构可以是一系列流程。</p><p><b>另外为了避免消息队列服务器宕机造成消息丢失，会将成功发送到消息队列的消息存储在消息生产者服务器上，等消息真正被消费者服务器处理后才删除消息。在消息队列服务器宕机后，生产者服务器会选择分布式消息队列服务器集群中的其他服务器发布消息。</b></p><p><b>备注：</b>&nbsp;不要认为消息队列只能利用发布-订阅模式工作，只不过在解耦这个特定业务环境下是使用发布-订阅模式的。<b>除了发布-订阅模式，还有点对点订阅模式（一个消息只有一个消费者），我们比较常用的是发布-订阅模式。</b>&nbsp;另外，这两种消息模型是 JMS 提供的，AMQP 协议还提供了 5 种消息模型。</p><h2>三 使用消息队列带来的一些问题</h2><ul><li><b>系统可用性降低：</b>&nbsp;系统可用性在某种程度上降低，为什么这样说呢？在加入MQ之前，你不用考虑消息丢失或者说MQ挂掉等等的情况，但是，引入MQ之后你就需要去考虑了！</li><li><b>系统复杂性提高：</b>&nbsp;加入MQ之后，你需要保证消息没有被重复消费、处理消息丢失的情况、保证消息传递的顺序性等等问题！</li><li><b>一致性问题：</b>&nbsp;我上面讲了消息队列可以实现异步，消息队列带来的异步确实可以提高系统响应速度。但是，万一消息的真正消费者并没有正确消费消息怎么办？这样就会导致数据不一致的情况了!</li></ul><h2>四 JMS VS AMQP</h2><p><b>4.1 JMS</b></p><p><b>4.1.1 JMS 简介</b></p><p>JMS（JAVA Message Service,java消息服务）是java的消息服务，JMS的客户端之间可以通过JMS服务进行异步的消息传输。<b>JMS（JAVA Message Service,Java消息服务）API是一个消息服务的标准或者说是规范</b>，允许应用程序组件基于JavaEE平台创建、发送、接收和读取消息。它使分布式通信耦合度更低，消息服务更加可靠以及异步性。</p><p><b>ActiveMQ 就是基于 JMS 规范实现的。</b></p><p><b>4.1.2 JMS两种消息模型</b></p><p>①点到点（P2P）模型</p><p><br></p><figure><img src=\"https://pic1.zhimg.com/v2-c402e95086223dde5fee6b7fbc25e63c_b.jpg\" width=\"575\"><figcaption>点到点（P2P）模型</figcaption></figure><p><br></p><p>使用<b>队列（Queue）</b>作为消息通信载体；满足<b>生产者与消费者模式</b>，一条消息只能被一个消费者使用，未被消费的消息在队列中保留直到被消费或超时。比如：我们生产者发送100条消息的话，两个消费者来消费一般情况下两个消费者会按照消息发送的顺序各自消费一半（也就是你一个我一个的消费。）</p><p>② 发布/订阅（Pub/Sub）模型</p><p><br></p><figure><img src=\"https://pic1.zhimg.com/v2-d173a3f73cf6928f49cd48fe18ed3898_b.jpg\" width=\"402\"><figcaption>发布/订阅（Pub/Sub）模型</figcaption></figure><p><br></p><p>发布订阅模型（Pub/Sub） 使用<b>主题（Topic）</b>作为消息通信载体，类似于<b>广播模式</b>；发布者发布一条消息，该消息通过主题传递给所有的订阅者，<b>在一条消息广播之后才订阅的用户则是收不到该条消息的</b>。</p><p><b>4.1.3 JMS 五种不同的消息正文格式</b></p><p>JMS定义了五种不同的消息正文格式，以及调用的消息类型，允许你发送并接收以一些不同形式的数据，提供现有消息格式的一些级别的兼容性。</p><ul><li>StreamMessage -- Java原始值的数据流</li><li>MapMessage--一套名称-值对</li><li>TextMessage--一个字符串对象</li><li>ObjectMessage--一个序列化的 Java对象</li><li>BytesMessage--一个字节的数据流</li></ul><p><b>4.2 AMQP</b></p><p> AMQP，即Advanced Message Queuing Protocol,一个提供统一消息服务的应用层标准&nbsp;<b>高级消息队列协议</b>（二进制应用层协议），是应用层协议的一个开放标准,为面向消息的中间件设计，兼容 JMS。基于此协议的客户端与消息中间件可传递消息，并不受客户端/中间件同产品，不同的开发语言等条件的限制。</p><p><b>RabbitMQ 就是基于 AMQP 协议实现的。</b></p><p><b>4.3 JMS vs AMQP</b></p><p><br></p><figure><img src=\"https://pic4.zhimg.com/v2-d8a225f003571f7e7907618c61b48cd3_b.jpg\" normal\"=\"\" width=\"637\"></figure><p><br></p><p><b>总结：</b></p><ul><li>AMQP 为消息定义了线路层（wire-level protocol）的协议，而JMS所定义的是API规范。在 Java 体系中，多个client均可以通过JMS进行交互，不需要应用修改代码，但是其对跨平台的支持较差。而AMQP天然具有跨平台、跨语言特性。</li><li>JMS 支持TextMessage、MapMessage 等复杂的消息类型；而 AMQP 仅支持 byte[] 消息类型（复杂的类型可序列化后发送）。</li><li>由于Exchange 提供的路由算法，AMQP可以提供多样化的路由方式来传递消息到消息队列，而 JMS 仅支持 队列 和 主题/订阅 方式两种。</li></ul><h2>五 常见的消息队列对比</h2><p><br></p><figure><img src=\"https://pic4.zhimg.com/v2-7e22e0cb2047c64ccdd95d90cdff9d2f_b.jpg\" normal\"=\"\" width=\"638\"></figure><p><br></p><p><b>总结：</b></p><ul><li>ActiveMQ 的社区算是比较成熟，但是较目前来说，ActiveMQ 的性能比较差，而且版本迭代很慢，不推荐使用。</li><li>RabbitMQ 在吞吐量方面虽然稍逊于 Kafka 和 RocketMQ ，但是由于它基于 erlang 开发，所以并发能力很强，性能极其好，延时很低，达到微秒级。但是也因为 RabbitMQ 基于 erlang 开发，所以国内很少有公司有实力做erlang源码级别的研究和定制。如果业务场景对并发量要求不是太高（十万级、百万级），那这四种消息队列中，RabbitMQ 一定是你的首选。如果是大数据领域的实时计算、日志采集等场景，用 Kafka 是业内标准的，绝对没问题，社区活跃度很高，绝对不会黄，何况几乎是全世界这个领域的事实性规范。</li><li>RocketMQ 阿里出品，Java 系开源项目，源代码我们可以直接阅读，然后可以定制自己公司的MQ，并且 RocketMQ 有阿里巴巴的实际业务场景的实战考验。RocketMQ 社区活跃度相对较为一般，不过也还可以，文档相对来说简单一些，然后接口这块不是按照标准 JMS 规范走的有些系统要迁移需要修改大量代码。还有就是阿里出台的技术，你得做好这个技术万一被抛弃，社区黄掉的风险，那如果你们公司有技术实力我觉得用RocketMQ 挺好的</li><li>kafka 的特点其实很明显，就是仅仅提供较少的核心功能，但是提供超高的吞吐量，ms 级的延迟，极高的可用性以及可靠性，而且分布式可以任意扩展。同时 kafka 最好是支撑较少的 topic 数量即可，保证其超高吞吐量。kafka 唯一的一点劣势是有可能消息重复消费，那么对数据准确性会造成极其轻微的影响，在大数据领域中以及日志采集中，这点轻微影响可以忽略这个特性天然适合大数据实时计算以及日志收集。</li></ul>', '2019119115750454', '0', '0', '0', null, '2', '201912010438', null);
INSERT INTO `article` VALUES ('5', 'wz201912020347298679', '123', '<p>123</p>', '2019119115750454', '0', '0', '0', null, '2', '201912020347', null);

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `commentId` int(20) NOT NULL AUTO_INCREMENT,
  `comment` varchar(50) DEFAULT NULL,
  `userId` varchar(20) DEFAULT NULL,
  `forId` int(20) DEFAULT NULL,
  `createTime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`commentId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('9', '141234141413123', '2019119115750454', '1', '201912020055');
INSERT INTO `comments` VALUES ('10', '141234141413123', '2019119115750454', '1', '201912020115');
INSERT INTO `comments` VALUES ('11', '1412312', '2019119115750454', '2', '201912020237');

-- ----------------------------
-- Table structure for forum_user
-- ----------------------------
DROP TABLE IF EXISTS `forum_user`;
CREATE TABLE `forum_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `userId` varchar(50) NOT NULL,
  `userName` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `passWord` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `email` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `sex` varchar(4) CHARACTER SET latin1 DEFAULT NULL,
  `introduction` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `weChat` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `qq` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `address` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `createDate` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `lastDate` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `isStat` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of forum_user
-- ----------------------------
INSERT INTO `forum_user` VALUES ('2', '1', '1', null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `forum_user` VALUES ('3', '20191181545995567', null, null, '1214895040@qq.com', null, null, null, null, null, '201911815459', null, '0');
INSERT INTO `forum_user` VALUES ('5', '2019118154354403105', 'alwaysacc', 'alwaysacc', '1214895040@qq.com', null, null, null, null, null, '2019118154354', null, '0');
INSERT INTO `forum_user` VALUES ('6', '2019118154529340857', '1', '1', '1214895040@qq.com', null, null, null, null, null, '2019118154529', null, '0');
INSERT INTO `forum_user` VALUES ('7', '201911816234106772', '1', '1', '1214895040@qq.com', null, null, null, null, null, '201911816234', null, '0');
INSERT INTO `forum_user` VALUES ('8', '201911816347532798', '1', '1', '123@qq.com', null, null, null, null, null, '201911816347', null, '0');
INSERT INTO `forum_user` VALUES ('9', '201911816442260731', '1', '1', '123@qq.com', null, null, null, null, null, '201911816442', null, '0');
INSERT INTO `forum_user` VALUES ('10', '201911816554972425', '1', '1', '123@qq.com', null, null, null, null, null, '201911816554', null, '0');
INSERT INTO `forum_user` VALUES ('11', '2019118168325586', '1', '1', 'asd@qwe.casd', null, null, null, null, null, '201911816832', null, '0');
INSERT INTO `forum_user` VALUES ('12', '20191181612157757', '1', '1', '12164@qe.adad', null, null, null, null, null, '2019118161215', null, '0');
INSERT INTO `forum_user` VALUES ('15', '2019119115424797108', '1234', '3123', '56415@541.casd', null, null, null, null, null, '2019119115424', null, '0');
INSERT INTO `forum_user` VALUES ('16', '2019119115750454', '123', '123', '123@15.cas', null, null, null, null, null, '201911911575', '201912020342', '0');
INSERT INTO `forum_user` VALUES ('18', '2019119121031749120', '1321', '123', '123@15.cad', null, null, null, null, null, '2019119121031', null, '0');
INSERT INTO `forum_user` VALUES ('19', '2019119151937156487', '1214895040', 'alwaysacc', '1214895040@qq.com', null, null, null, null, null, '2019119151937', null, '0');

-- ----------------------------
-- Table structure for sort
-- ----------------------------
DROP TABLE IF EXISTS `sort`;
CREATE TABLE `sort` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sortId` int(20) DEFAULT NULL,
  `sortName` varchar(20) DEFAULT NULL,
  `createDate` varchar(20) DEFAULT NULL,
  `createForUser` varchar(20) DEFAULT NULL,
  `boardUserId` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sort
-- ----------------------------
INSERT INTO `sort` VALUES ('1', '1', 'java', null, null, null);
INSERT INTO `sort` VALUES ('2', '2', 'PHP', null, null, null);
INSERT INTO `sort` VALUES ('3', '3', 'MySQL', null, null, null);
INSERT INTO `sort` VALUES ('4', '4', 'vue', null, null, null);
