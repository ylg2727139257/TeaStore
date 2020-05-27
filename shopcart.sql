/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.11 
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

create table `shopcart` (
	`uid` int (11),
	`tid` int (11),
	`num` int (11)
); 
insert into `shopcart` (`uid`, `tid`, `num`) values('1','2','3');
insert into `shopcart` (`uid`, `tid`, `num`) values('5','9','1');
insert into `shopcart` (`uid`, `tid`, `num`) values('5','10','2');
