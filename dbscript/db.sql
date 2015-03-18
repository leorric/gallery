-- ������ִ�нű�  -------------------------------------------------
-- \. d:\0321\workspace\game_home\scripts\db.sql  ------------------
drop database if exists gallery;
create database gallery;
use gallery;

grant all privileges on gallery.* to gal@localhost identified by 'qnws';
flush privileges;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `account` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `createDatetime` datetime DEFAULT NULL,
  `updateDatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `works`;
CREATE TABLE `works` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(32) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `imageUrl` varchar(100) DEFAULT NULL,
  `type` tinyint DEFAULT 0,
  `createDatetime` datetime DEFAULT NULL,
  `updateDatetime` datetime DEFAULT NULL,
  `reserve1` varchar(32)  DEFAULT NULL,
  `reserve2` varchar(32)  DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
