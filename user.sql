/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.11 
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

create table `user` (
	`uid` double ,
	`uname` varchar (60),
	`password` varchar (60),
	`sex` varchar (6),
	`address` varchar (30000),
	`mail` varchar (90),
	`phone` double ,
	`role` int (11)
); 
insert into `user` (`uid`, `uname`, `password`, `sex`, `address`, `mail`, `phone`, `role`) values('1','admin','123456','男','甘肃静宁','2727139257@qq.com','17683147646','0');
insert into `user` (`uid`, `uname`, `password`, `sex`, `address`, `mail`, `phone`, `role`) values('2','yang','123456','男','陕西西安','1712141636@qq.com','15734674605','1');
insert into `user` (`uid`, `uname`, `password`, `sex`, `address`, `mail`, `phone`, `role`) values('3','angela','123456','女','陕西西安','1580609629@qq.com','15561751598','1');
insert into `user` (`uid`, `uname`, `password`, `sex`, `address`, `mail`, `phone`, `role`) values('4','tina','123456','女','陕西西安','3128206388@qq.com','15693386448','1');
insert into `user` (`uid`, `uname`, `password`, `sex`, `address`, `mail`, `phone`, `role`) values('5','欧阳雅圣','123456','男','陕西西安','2727139257@qq.com','1712141636','1');
insert into `user` (`uid`, `uname`, `password`, `sex`, `address`, `mail`, `phone`, `role`) values('6','amjgf','123456',NULL,NULL,NULL,NULL,'1');
