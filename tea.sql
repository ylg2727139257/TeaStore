/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.11 
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

create table `tea` (
	`tid` int (11),
	`tname` varchar (60),
	`price` double ,
	`stock` double ,
	`src` varchar (300),
	`typ` varchar (150),
	`origin` varchar (150),
	`des` varchar (300)
); 
insert into `tea` (`tid`, `tname`, `price`, `stock`, `src`, `typ`, `origin`, `des`) values('1','碧螺茶','69.00','100000','imgs/blc_bl.jpg','绿茶','太湖','糙米黄、扁平光滑、板栗香、味醇');
insert into `tea` (`tid`, `tname`, `price`, `stock`, `src`, `typ`, `origin`, `des`) values('2','林湖碧螺春','34.00','100000','imgs/blc_lh.jpg','绿茶','林湖','糙米黄、扁平光滑、板栗香、味醇');
insert into `tea` (`tid`, `tname`, `price`, `stock`, `src`, `typ`, `origin`, `des`) values('3','乐品乐茶碧螺春','39.00','100000','imgs/blc_lplc.jpg','绿茶','苏州','糙米黄、扁平光滑、板栗香、味醇');
insert into `tea` (`tid`, `tname`, `price`, `stock`, `src`, `typ`, `origin`, `des`) values('4','艺福堂碧螺春','32.00','100000','imgs/blc_yft.jpg','绿茶','温州','糙米黄、扁平光滑、板栗香、味醇');
insert into `tea` (`tid`, `tname`, `price`, `stock`, `src`, `typ`, `origin`, `des`) values('5','巴山雀舌','49.00','100000','imgs/bsqs.png','红茶','信阳','糙米黄、扁平光滑、板栗香、味醇');
insert into `tea` (`tid`, `tname`, `price`, `stock`, `src`, `typ`, `origin`, `des`) values('6','金筒大红袍','42.00','100000','imgs/dhp_jt.jpg','红茶','峨眉','糙米黄、扁平光滑、板栗香、味醇');
insert into `tea` (`tid`, `tname`, `price`, `stock`, `src`, `typ`, `origin`, `des`) values('7','礼盒装大红袍','66.00','100000','imgs/dhp_lh.jpg','红茶','白沙','糙米黄、扁平光滑、板栗香、味醇');
insert into `tea` (`tid`, `tname`, `price`, `stock`, `src`, `typ`, `origin`, `des`) values('8','醉品商城大红袍','36.00','100000','imgs/dhp_zpsc.jpg','红茶','重庆','糙米黄、扁平光滑、板栗香、味醇');
insert into `tea` (`tid`, `tname`, `price`, `stock`, `src`, `typ`, `origin`, `des`) values('9','齊云村六安瓜片','47.00','100000','imgs/liuangua.jpg','白茶','瓮安','糙米黄、扁平光滑、板栗香、味醇');
insert into `tea` (`tid`, `tname`, `price`, `stock`, `src`, `typ`, `origin`, `des`) values('10','龙井','57.00','100000','imgs/lj_hz.jpg','黄茶','杭州','糙米黄、扁平光滑、板栗香、味醇');
insert into `tea` (`tid`, `tname`, `price`, `stock`, `src`, `typ`, `origin`, `des`) values('11','盛茗世家龙井','76.00','100000','imgs/lj_smsj.jpg','黄茶','杭州','糙米黄、扁平光滑、板栗香、味醇');
insert into `tea` (`tid`, `tname`, `price`, `stock`, `src`, `typ`, `origin`, `des`) values('12','艺福堂西湖龙井','54.00','100000','imgs/lj_yft.jpg','黄茶','杭州','糙米黄、扁平光滑、板栗香、味醇');
insert into `tea` (`tid`, `tname`, `price`, `stock`, `src`, `typ`, `origin`, `des`) values('13','杉林溪','45.00','100000','imgs/slx.jpg','黑茶','瓮安','糙米黄、扁平光滑、板栗香、味醇');
insert into `tea` (`tid`, `tname`, `price`, `stock`, `src`, `typ`, `origin`, `des`) values('14','铁观音','58.00','100000','imgs/tgy.jpg','黄茶','杭州','糙米黄、扁平光滑、板栗香、味醇');
insert into `tea` (`tid`, `tname`, `price`, `stock`, `src`, `typ`, `origin`, `des`) values('15','速顶烏龍','46.00','100000','imgs/wl_sd.jpg','乌龙茶','重庆','糙米黄、扁平光滑、板栗香、味醇');
insert into `tea` (`tid`, `tname`, `price`, `stock`, `src`, `typ`, `origin`, `des`) values('16','吴裕泰烏龍','67.00','100000','imgs/wl_wyt.jpg','乌龙茶','西湖','糙米黄、扁平光滑、板栗香、味醇');
insert into `tea` (`tid`, `tname`, `price`, `stock`, `src`, `typ`, `origin`, `des`) values('17','禧藀速顶烏龍','73.00','100000','imgs/wl_xy.jpg','乌龙茶','苏州','糙米黄、扁平光滑、板栗香、味醇');
