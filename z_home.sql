#设置编码格式
SET NAMES UTF8;
#丢弃已存在的数据库
DROP DATABASE IF EXISTS z_home;
#创建数据库
CREATE DATABASE z_home CHARSET=UTF8;
#进入数据库
USE z_home;
#创建数据表
CREATE TABLE carousel(
	cid INT PRIMARY KEY AUTO_INCREMENT, #图片id
	img VARCHAR(128), #图片地址
	title VARCHAR(64),#图片标题
	href VARCHAR(128)#图片链接
);
#往表中添加数据
INSERT INTO carousel VALUES
(NULL,"http://127.0.0.1:5050/images/carousel1.jpg","轮播图片1","#"),
(NULL,"http://127.0.0.1:5050/images/carousel2.jpg","轮播图片2","#"),
(NULL,"http://127.0.0.1:5050/images/carousel3.jpg","轮播图片3","#");

#创建首页商品表
CREATE TABLE index_show(
	id INT PRIMARY KEY AUTO_INCREMENT, #id
	pid INT,#商品编号
	img VARCHAR(128), #地址
	title VARCHAR(64),#标题
	subtitle VARCHAR(64),#副标题
	price DECIMAL(10,2), #商品价格
	position VARCHAR(32) #在首页的位置
);
#往商品展示表添加数据
INSERT INTO index_show VALUES
(NULL,1,"http://127.0.0.1:5050/images/index_show/new1.jpg","北欧实木ins风边几 | 安装简单","优质楠竹腿|承重强防霉防潮湿|简约百搭","48.80","new"),
(NULL,2,"http://127.0.0.1:5050/images/index_show/new2.jpg","日式不规则餐盘|不易开裂耐腐蚀","健康环保|木纹清晰|切面光滑","47.00","new"),
(NULL,3,"http://127.0.0.1:5050/images/index_show/new3.jpg","创意实木Y椅|使用寿命长","舒适体在每时每刻","799.00","new"),
(NULL,4,"http://127.0.0.1:5050/images/index_show/new4.jpg","榉木静音挂钟|实木指针","优质静音挂钟给生活一点小静谧","98.80","new"),
(NULL,5,"http://127.0.0.1:5050/images/index_show/new5.jpg","竖耳床头柜|多功能置物","睡前生活也要安排的明明白白","1400.80","new"),
(NULL,6,"http://127.0.0.1:5050/images/index_show/recommend1.jpg","布艺双人沙发|座垫靠背可拆洗","沙发垫采用进口高密度海绵，表面再附上天然羽毛，增加坐感层次","4464.05","recommend"),
(NULL,7,"http://127.0.0.1:5050/images/index_show/recommend2.jpg","马卡龙活角电视柜|收纳空间大","超大中柜子,强力收纳，活角柜子以漆补木反复喷涂，然后再进行纯平","2849.05","recommend"),
(NULL,8,"http://127.0.0.1:5050/images/index_show/recommend3.jpg","阿牛多格边柜|收纳空
间强","体格庞大的萌物,回归大自然的轻
松,四柜空间,大容量收纳","1400.80","recommend"),
(NULL,9,"http://127.0.0.1:5050/images/index_show/recommend4.jpg","创意人字衣架|多功能
收纳","极致的态度,让你井井有条","1400.80","recommend"),
(NULL,10,"http://127.0.0.1:5050/images/index_show/recommend5.jpg","罗马场茶几|承重力强","细节感人,古罗马竞技场造型,层
层退台,模仿古罗马四层竞台","1400.80","recommend")
;

#创建体验家表
CREATE TABLE trial(
	tid INT PRIMARY KEY AUTO_INCREMENT, #id
	showimg VARCHAR(128), #图片地址
	showtitle VARCHAR(64),#标题
	is_show INT #是否展示到首页
);

#向表中插入数据
INSERT INTO trial VALUES
(NULL,"http://127.0.0.1:5050/images/index_trial/trial_p1.jpg","成就别致空间",1),
(NULL,"http://127.0.0.1:5050/images/index_trial/trial_p2.jpg","享受趣味生活",1),
(NULL,"http://127.0.0.1:5050/images/index_trial/trial_p3.jpg","遇见新活力",1),
(NULL,"http://127.0.0.1:5050/images/index_trial/trial_p4.jpg","温馨雅致幻想生活",1),
(NULL,"http://127.0.0.1:5050/images/index_trial/trial_p5.jpg","欧式简约风",1);

#创建商品表
CREATE TABLE product(
	pid INT PRIMARY KEY AUTO_INCREMENT, #商品pid
	showimg VARCHAR(128),#展示图片
	title VARCHAR(128),#商品标题
	subtitle VARCHAR(128),#商品副标题
	style VARCHAR(64),#款式
	spec VARCHAR(64),#规格
	price DECIMAL(10,2),
	subprice DECIMAL(10,2),
	main_id INT,
	minor_id INT,
	is_show INT
);
#插入数据
INSERT INTO product VALUES
(NULL,"http://127.0.0.1:5050/images/product/chair1.png","日式简约休闲椅 | 黄铜铁艺","靠背木材弯曲工艺|贴合人体曲线|厚实皮革椅面",'粉色','57cm*61cm*76cm',2460.00,2920.00,4,12,1),
(NULL,"http://127.0.0.1:5050/images/product/chair2.png","日式简约休闲椅 | 黄铜铁艺","靠背木材弯曲工艺|贴合人体曲线|厚实皮革椅面",'粉色','57cm*61cm*76cm',1360.00,2920.00,4,12,1),
(NULL,"http://127.0.0.1:5050/images/product/chair3.png","日式简约休闲椅 | 黄铜铁艺","靠背木材弯曲工艺|贴合人体曲线|厚实皮革椅面",'粉色','57cm*61cm*76cm',1460.00,2920.00,4,12,1),
(NULL,"http://127.0.0.1:5050/images/product/chair4.png","日式简约休闲椅 | 黄铜铁艺","靠背木材弯曲工艺|贴合人体曲线|厚实皮革椅面",'粉色','57cm*61cm*76cm',1060.00,2920.00,4,12,1),
(NULL,"http://127.0.0.1:5050/images/product/chair5.png","日式简约休闲椅 | 黄铜铁艺","靠背木材弯曲工艺|贴合人体曲线|厚实皮革椅面",'粉色','57cm*61cm*76cm',1660.00,2920.00,4,12,1),
(NULL,"http://127.0.0.1:5050/images/product/chair6.png","日式简约休闲椅 | 黄铜铁艺","靠背木材弯曲工艺|贴合人体曲线|厚实皮革椅面",'粉色','57cm*61cm*76cm',1960.00,2920.00,4,12,1),
(NULL,"http://127.0.0.1:5050/images/product/chair1.png","日式简约休闲椅 | 黄铜铁艺","靠背木材弯曲工艺|贴合人体曲线|厚实皮革椅面",'粉色','57cm*61cm*76cm',1460.00,2920.00,4,13,1),
(NULL,"http://127.0.0.1:5050/images/product/chair2.png","日式简约休闲椅 | 黄铜铁艺","靠背木材弯曲工艺|贴合人体曲线|厚实皮革椅面",'粉色','57cm*61cm*76cm',1660.00,2920.00,4,13,1),
(NULL,"http://127.0.0.1:5050/images/product/chair3.png","日式简约休闲椅 | 黄铜铁艺","靠背木材弯曲工艺|贴合人体曲线|厚实皮革椅面",'粉色','57cm*61cm*76cm',1760.00,2920.00,4,13,1),
(NULL,"http://127.0.0.1:5050/images/product/chair4.png","日式简约休闲椅 | 黄铜铁艺","靠背木材弯曲工艺|贴合人体曲线|厚实皮革椅面",'粉色','57cm*61cm*76cm',1060.00,2920.00,4,13,1),
(NULL,"http://127.0.0.1:5050/images/product/chair5.png","日式简约休闲椅 | 黄铜铁艺","靠背木材弯曲工艺|贴合人体曲线|厚实皮革椅面",'粉色','57cm*61cm*76cm',1360.00,2920.00,4,13,1),
(NULL,"http://127.0.0.1:5050/images/product/chair6.png","日式简约休闲椅 | 黄铜铁艺","靠背木材弯曲工艺|贴合人体曲线|厚实皮革椅面",'粉色','57cm*61cm*76cm',1260.00,2920.00,4,13,1);
#创建图片表


#创建灵感表
CREATE TABLE inspiration(
	id INT PRIMARY KEY AUTO_INCREMENT, #灵感id
	imgurl VARCHAR(128), #灵感图片url
	exp VARCHAR(128), #灵感说明
	publish_date VARCHAR(32), #发表时间
	like_num INT, #被标记喜欢的个数
	comment_num INT,#评论个数
	is_show INT  #是否展示到首页
);
#向灵感表插入数据
INSERT INTO inspiration VALUES
(NULL,"http://127.0.0.1:5050/images/inspiration/inspiration1.jpg","啥灵感都没有","2018年5月20日",15,10,1),
(NULL,"http://127.0.0.1:5050/images/inspiration/inspiration2.jpg","啥灵感都没有","2018年5月20日",15,10,1),
(NULL,"http://127.0.0.1:5050/images/inspiration/inspiration3.jpg","啥灵感都没有","2018年5月20日",15,10,1),
(NULL,"http://127.0.0.1:5050/images/inspiration/inspiration1.jpg","啥灵感都没有","2018年5月20日",15,10,0),
(NULL,"http://127.0.0.1:5050/images/inspiration/inspiration2.jpg","啥灵感都没有","2018年5月20日",15,10,0),
(NULL,"http://127.0.0.1:5050/images/inspiration/inspiration3.jpg","啥灵感都没有","2018年5月20日",15,10,0);

#商品设计展示表
CREATE TABLE design_show(
	id INT PRIMARY KEY AUTO_INCREMENT, #id
	did INT,#设计编号
	showimg VARCHAR(128), #地址
	title VARCHAR(64)#标题
);
#向设计展示表插入数据
INSERT INTO design_show VALUES
(NULL,1,"http://127.0.0.1:5050/images/design/designshow1.jpg","喜欢舒适沙发,加上植物完美"),
(NULL,2,"http://127.0.0.1:5050/images/design/designshow2.jpg","想要的简约复古轻奢范"),
(NULL,3,"http://127.0.0.1:5050/images/design/designshow3.jpg","时光里唯一不变的准则是我喜欢"),
(NULL,3,"http://127.0.0.1:5050/images/design/designshow4.jpg","准备一下夏天的卧室"),
(NULL,3,"http://127.0.0.1:5050/images/design/designshow5.jpg","尽量把小朋友休息区需要的东西摆齐了");

#创建商品主要分类表
CREATE TABLE main_class(
	main_id INT PRIMARY KEY  AUTO_INCREMENT, #主要分类id
	main_class VARCHAR(32), #主要分类名称
	main_title VARCHAR(32),#主要分类标题
	main_img VARCHAR(128) #主要分类图片
);

INSERT INTO main_class VALUES
(NULL,"sofa","沙发","http://127.0.0.1:5050/images/class/sofa_03.jpg"),
(NULL,"bed","床","http://127.0.0.1:5050/images/class/bed_03.jpg"),
(NULL,"bedmore","床品配件","http://127.0.0.1:5050/images/class/bedmore_03.jpg"),
(NULL,"chair","椅凳","http://127.0.0.1:5050/images/class/chair_03.png"),
(NULL,"scabinet","柜架","http://127.0.0.1:5050/images/class/cabinet_03.jpg"),
(NULL,"table","桌几","http://127.0.0.1:5050/images/class/table_03.png"),
(NULL,"decorate","装饰","http://127.0.0.1:5050/images/class/decorate_03.jpg"),
(NULL,"lamp","灯具","http://127.0.0.1:5050/images/class/lamp_03.jpg");

CREATE TABLE minor_class(#次要的分类表
	minor_id INT PRIMARY KEY  AUTO_INCREMENT, #次要分类id
	minor_title VARCHAR(32),#次要分类标题
	minor_img VARCHAR(128), #次要分类图片
	mainclass INT, #隶属于哪个主分类
	FOREIGN KEY(mainclass) REFERENCES main_class(main_id)  #外键
);

INSERT INTO minor_class VALUES
(NULL,"单人沙发","http://127.0.0.1:5050/images/class/sofa_07.jpg",1),
(NULL,"双人沙发","http://127.0.0.1:5050/images/class/sofa_09.jpg",1),
(NULL,"多人沙发","http://127.0.0.1:5050/images/class/sofa_13.jpg",1),
(NULL,"双人床","http://127.0.0.1:5050/images/class/bed_07.jpg",2),
(NULL,"儿童床","http://127.0.0.1:5050/images/class/bed_07.jpg",2),
(NULL,"床品件套","http://127.0.0.1:5050/images/class/bedmore_07.jpg",3),
(NULL,"枕套","http://127.0.0.1:5050/images/class/bedmore_09.jpg",3),
(NULL,"毯类","http://127.0.0.1:5050/images/class/bedmore_13.jpg",3),
(NULL,"枕芯","http://127.0.0.1:5050/images/class/bedmore_14.jpg",3),
(NULL,"被芯","http://127.0.0.1:5050/images/class/bedmore_17.jpg",3),
(NULL,"床垫","http://127.0.0.1:5050/images/class/bedmore_19.jpg",3),
(NULL,"餐椅","http://127.0.0.1:5050/images/class/chair_07.png",4),
(NULL,"书椅","http://127.0.0.1:5050/images/class/chair_09.png",4),
(NULL,"吧椅","http://127.0.0.1:5050/images/class/chair_13.png",4),
(NULL,"休闲椅","http://127.0.0.1:5050/images/class/chair_14.png",4),
(NULL,"坐凳坐墩","http://127.0.0.1:5050/images/class/chair_17.png",4),
(NULL,"电视柜","http://127.0.0.1:5050/images/class/cabinet_07.jpg",5),
(NULL,"餐边柜","http://127.0.0.1:5050/images/class/cabinet_09.jpg",5),
(NULL,"床头柜","http://127.0.0.1:5050/images/class/cabinet_13.jpg",5),
(NULL,"衣柜","http://127.0.0.1:5050/images/class/cabinet_15.jpg",5),
(NULL,"书柜","http://127.0.0.1:5050/images/class/cabinet_19.jpg",5),
(NULL,"鞋柜","http://127.0.0.1:5050/images/class/cabinet_20.jpg",5),
(NULL,"餐桌","http://127.0.0.1:5050/images/class/table_07.jpg",6),
(NULL,"书桌","http://127.0.0.1:5050/images/class/table_09.jpg",6),
(NULL,"玄关桌","http://127.0.0.1:5050/images/class/table_13.jpg",6),
(NULL,"梳妆台","http://127.0.0.1:5050/images/class/table_14.jpg",6),
(NULL,"茶几","http://127.0.0.1:5050/images/class/table_17.jpg",6),
(NULL,"边几","http://127.0.0.1:5050/images/class/table_18.jpg",6),
(NULL,"挂画","http://127.0.0.1:5050/images/class/decorate_07.jpg",7),
(NULL,"壁挂","http://127.0.0.1:5050/images/class/decorate_09.jpg",7),
(NULL,"挂毯","http://127.0.0.1:5050/images/class/decorate_13.jpg",7),
(NULL,"花艺","http://127.0.0.1:5050/images/class/decorate_14.jpg",7),
(NULL,"烛台","http://127.0.0.1:5050/images/class/decorate_17.jpg",7),
(NULL,"摆件","http://127.0.0.1:5050/images/class/decorate_18.jpg",7),
(NULL,"吊灯","http://127.0.0.1:5050/images/class/lamp_07.jpg",8),
(NULL,"壁灯","http://127.0.0.1:5050/images/class/lamp_09.jpg",8),
(NULL,"台灯","http://127.0.0.1:5050/images/class/lamp_13.jpg",8),
(NULL,"落地灯","http://127.0.0.1:5050/images/class/lamp_14.jpg",8),
(NULL,"吸顶灯","http://127.0.0.1:5050/images/class/lamp_17.jpg",8);

#建立用户表
CREATE TABLE user(
	uid INT PRIMARY KEY AUTO_INCREMENT,
	uname VARCHAR(64),
	phone CHAR(11),
	upwd VARCHAR(128)
);

#创建购物车表
CREATE TABLE cart(
	c_id INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(128),
	price DECIMAL(10,2),
	pid INT,
	uid INT,
	show_img VARCHAR(128),
	style VARCHAR(64),
	spec VARCHAR(64),
	count INT,
	is_check BOOL
);