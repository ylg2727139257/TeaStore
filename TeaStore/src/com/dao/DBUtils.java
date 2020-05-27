package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.vo.Shopcart;
import com.vo.Site;
import com.vo.Tea;
import com.vo.User;

public class DBUtils {
//	-----  getConn  ----
	public static Connection getConn() {
		Connection conn=null;
		try {
			Class.forName(DBInfo.DRIVER);
			conn = DriverManager.getConnection(DBInfo.URL, DBInfo.USERNAME,
					DBInfo.PASSWORD);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
//	----  findUser ----
	public static List<User> findUser(String sql){
		ResultSet rs=null;
		Connection conn=null;
		PreparedStatement ps=null;
		List<User> users=new ArrayList<User>();
		try {
			conn=getConn();
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				User user=new User();
				user.setUid(rs.getInt("uid"));
				user.setUname(rs.getString("uname"));
				user.setPassword(rs.getString("password"));
				user.setSex(rs.getString("sex"));
				user.setAddress(rs.getString("address"));
				user.setPhone(rs.getString("phone"));
				user.setRole(rs.getInt("role"));
				
				users.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn,ps,rs);
		}
		return users;
	}
//	----  findTea  ----
	public static List<Tea> findTea(String sql){
		ResultSet rs=null;
		Connection conn=null;
		PreparedStatement ps=null;
		List<Tea> teas=new ArrayList<Tea>();
		try {
			conn=getConn();
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				Tea tea=new Tea();
				tea.setTid(rs.getInt("tid"));
				tea.setTname(rs.getString("tname"));
				tea.setPrice(rs.getDouble("price"));
				tea.setStock(rs.getDouble("stock"));
				tea.setSrc(rs.getString("src"));
				tea.setTyp(rs.getString("typ"));
				tea.setOrigin(rs.getString("origin"));
				tea.setDes(rs.getString("des"));
				
				teas.add(tea);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn,ps,rs);
		}
		return teas;
	}
//	----  findTeaSc  ----
	public static List<Tea> findTeaSc(String sql){
		ResultSet rs=null;
		Connection conn=null;
		PreparedStatement ps=null;
		List<Tea> teas=new ArrayList<Tea>();
		try {
			conn=getConn();
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				Tea tea=new Tea();
				tea.setTid(rs.getInt("tid"));
				tea.setTname(rs.getString("tname"));
				tea.setPrice(rs.getDouble("price"));
				tea.setStock(rs.getDouble("stock"));
				tea.setSrc(rs.getString("src"));
				tea.setTyp(rs.getString("typ"));
				tea.setOrigin(rs.getString("origin"));
				tea.setDes(rs.getString("des"));
				tea.setNum(rs.getInt("num"));
				
				teas.add(tea);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn,ps,rs);
		}
		return teas;
	}
//	----  findShopCart  -----
	public static List<Shopcart> findShopCart(String sql){
		ResultSet rs=null;
		Connection conn=null;
		PreparedStatement ps=null;
		List<Shopcart> shopcarts=new ArrayList<Shopcart>();
		try {
			conn=getConn();
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				Shopcart shopcart=new Shopcart();
				shopcart.setUid(rs.getInt("uid"));
				shopcart.setTid(rs.getInt("tid"));
				shopcart.setNum(rs.getInt("num"));
				
				shopcarts.add(shopcart);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn,ps,rs);
		}
		return shopcarts;	
	}
//	----  findSite  -----
	public static List<Site> findSite(String sql){
		ResultSet rs=null;
		Connection conn=null;
		PreparedStatement ps=null;
		List<Site> sites=new ArrayList<Site>();
		try {
			conn=getConn();
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				Site site=new Site();
				site.setUid(rs.getInt("uid"));
				site.setSite(rs.getString("site"));
				
				sites.add(site);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn,ps,rs);
		}
		return sites;	
	}
	
//	----  updateTable  ----
	public static int updateTable(String sql) {
		int rows=0;
		Connection conn=null;
		PreparedStatement ps=null;
		try {
			conn=getConn();
			ps=conn.prepareStatement(sql);
			rows=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn,ps,null);
		}
		return rows;
	}
//	-----  close  -----
	public static void close(Connection conn,PreparedStatement ps,ResultSet rs) {
		try {
			if(null!=rs&&!rs.isClosed()) {
				rs.close();
			}
			if(null!=ps&&!ps.isClosed()) {
				ps.close();
			}
			if(null!=conn&&!conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
