package com.service;

import java.util.List;

import com.dao.DBHelper;
import com.vo.Shopcart;
import com.vo.Site;
import com.vo.Tea;
import com.vo.User;

public class StoreService {
	DBHelper helper=new DBHelper();
//	----  findUserByName
	public User findUserByName(String username) {
		return helper.findUserByName(username);
	}
//	----  isRightUser
	public boolean isRightUser(String username,String password) {
		User user=findUserByName(username);
		return (null==user||!password.equals(user.getPassword()))?false:true;
	}
//	----  isAdmin 
	public boolean isAdmin(String username) {
		User user=findUserByName(username);
		return (user.getRole()==0)?true:false;
	}
//	-----  insertUser
	public boolean insertUser(User user) {
		return helper.insertUser(user)==0?false:true;
	}
//	-----  findAllTea
	public List<Tea> findAllTea(){
		return helper.findAllTea();
	}
//	-----  findTeaByName
	public List<Tea> findTeaByName(String t_name){
		return helper.findTeaByName(t_name);
	}
//	-----  findTeaById
	public Tea findTeaById(int tid) {
		return helper.findTeaById(tid);
	}
//	-----  updateSc_detailed
	public int updateSc_detailed(int uid,int tid,int num) {
		Shopcart sc=helper.findScByUidTid(uid, tid);
		if(null==sc) {
			return helper.insertSc(uid, tid, num);
		}else {
			return helper.updateSc_detailed(uid, tid, num);
		}
	}
//	-----  updateSc_shopcart
	public int updateSc_shopcart(int uid,int tid,int num,String f) {
		Shopcart sc=helper.findScByUidTid(uid, tid);
		if(f.equals("no")) {
			return helper.updateSc_shopcart(uid, tid, num);
		}else if(f.equals("plus")) {
			return helper.updateSc_shopcart(uid, tid,++num);
		}else  if(f.equals("minus")&&sc.getNum()>1){
			return helper.updateSc_shopcart(uid, tid,--num);
		} 
		return 0;
	}
//	-----  findTeaSc_shopcart
	public List<Tea> findTeaSc(int uid){
		return helper.findTeaSc(uid);
	}
//	-----  findTeaSc_orders
	public Tea findTeaSc(int uid,int tid){
		return  helper.findTeaSc(uid,tid);
	}
//	-----  findSiteByUid
	public List<Site> findSiteByUid(int uid){
		return helper.findSiteByUid(uid);
	}
//	-----  insertSite
	public int insertSite(int uid,String site){
		return helper.insertSite(uid, site);
	}
//	-----  findScByUidTid
	public Shopcart findScByUidTid(int uid,int tid) {
		return helper.findScByUidTid(uid, tid);
	}
//	-----  deleteSc_shopcart
	public int deleteSc_shopcart(int uid,int tid) {
		return helper.deleteSc_shopcart(uid, tid);
	}
//	-----  deleteTea
	public int deleteTea(int tid) {
		return helper.deleteTea(tid);
	}
//	-----  update Tea
	public int updateTea(Tea tea) {
		return helper.updateTea(tea);
	}
//	-----  insert Tea
	public int insertTea(Tea tea) {
		return helper.insertTea(tea);
	}
}
