package com.dao;

import java.util.ArrayList;
import java.util.List;

import com.vo.Shopcart;
import com.vo.Site;
import com.vo.Tea;
import com.vo.User;

public class DBHelper {
//	-----  findUserByName
	public User findUserByName(String username) {
		List<User> users=new ArrayList<User>();
		String sql="select * from user where uname='"+username+"'";
		users=DBUtils.findUser(sql);
		return users.size()==0?null:users.get(0);
	}
//	-----  insertUser
	public int insertUser(User user) {
		String sql="insert into user(uname,password) values('"+user.getUname()+"','" 
			+user.getPassword()+"')";
		return DBUtils.updateTable(sql);
	}
//	-----  findAllTea
	public List<Tea> findAllTea(){
		String sql="select * from tea";
		return DBUtils.findTea(sql);
	}
//	-----  findTeaByName
	public List<Tea> findTeaByName(String t_name){
		String sql="select * from tea where tname like '%"+t_name+"%'";
		return DBUtils.findTea(sql);
	}
//	-----  findTeaSc_shopcart
	public List<Tea> findTeaSc(int uid){
		String sql="select t.*,s.num from tea t,shopcart s where t.tid=s.tid and uid="+uid;
		return DBUtils.findTeaSc(sql);
	}
//	-----  findTeaSc_orders
	public Tea findTeaSc(int uid,int tid){
		String sql="select t.*,s.num from tea t,shopcart s where t.tid=s.tid and uid="+uid
				+" and s.tid="+tid;
		List<Tea> teas=new ArrayList<Tea>();
		teas=DBUtils.findTeaSc(sql);
		return teas.size()==0?null:teas.get(0);
	}
//	-----  findTeaById
	public Tea findTeaById(int tid) {
		String sql="select * from tea where tid="+tid;
		List<Tea> teas=DBUtils.findTea(sql);
		return teas.size()==0?null:teas.get(0);
	}
//	-----  findScByUidTid
	public Shopcart findScByUidTid(int uid,int tid) {
		String sql="select * from shopcart where uid="+uid+" and tid="+tid;
		List<Shopcart> shopcarts=DBUtils.findShopCart(sql);
		return shopcarts.size()==0?null:shopcarts.get(0);
	}
//	-----  findSiteByUid
	public List<Site> findSiteByUid(int uid){
		String sql="select * from site where uid="+uid;
		return DBUtils.findSite(sql);
	}
//	-----  insertSite
	public int insertSite(int uid,String site){
		String sql="insert into site values(" + uid + ",'" + site + "')";
		return DBUtils.updateTable(sql);
	}
//	-----  insetSc
	public int insertSc(int uid,int tid,int num) {
		String sql="insert into shopcart values("+uid+","+tid+","+num+")";
		return	DBUtils.updateTable(sql);
	}
//	-----  updateSc_detailed
	public int updateSc_detailed(int uid,int tid,int num) {
		String sql="update shopcart set num=num+"+num+" where uid="+uid+" and tid="+tid;
		return	DBUtils.updateTable(sql);
	}
//	-----  updateSc_shopcart
	public int updateSc_shopcart(int uid,int tid,int num) {
		String sql="update shopcart set num="+num+" where uid="+uid+" and tid="+tid;
		return	DBUtils.updateTable(sql);
	}
//	-----  deleteSc_shopcart
	public int deleteSc_shopcart(int uid,int tid) {
		String sql="delete from shopcart where uid="+uid+" and tid="+tid;
		return	DBUtils.updateTable(sql);
	}
//	-----  delete Tea
	public int deleteTea(int tid) {
		String sql="delete from tea where tid="+tid;
		return	DBUtils.updateTable(sql);
	}
//	-----  update Tea
	public int updateTea(Tea tea) {
		String sql="update tea set tname='" + tea.getTname()+ "',price="+
				tea.getPrice()+",stock="+tea.getStock() +",src='"+tea.getSrc()
				+"',typ='"+tea.getTyp()+"',origin='"+tea.getOrigin()+"',des='"
				+tea.getDes()+"' where tid="+tea.getTid();
		return	DBUtils.updateTable(sql);
	}
//	-----  insert Tea
	public int insertTea(Tea tea) {
		String sql="insert into tea(tname,price,stock,src,typ,origin,des) values('" 
				+ tea.getTname()+ "',"+tea.getPrice()+","+tea.getStock() +",'"+
				tea.getSrc()+"','"+tea.getTyp()+"','"+tea.getOrigin()+"','"+
				tea.getDes()+"')";
		return	DBUtils.updateTable(sql);
	}
	
}
