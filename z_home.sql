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
(NULL,"images/carousel1.jpg","轮播图片1","#"),
(NULL,"images/carousel2.jpg","轮播图片2","#"),
(NULL,"images/carousel3.jpg","轮播图片3","#");