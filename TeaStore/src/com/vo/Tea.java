package com.vo;

public class Tea {
	private int tid;
	private String tname;
	private double price;
	private double stock;
	private String src;
	private String typ;
	private String origin;
	private String des;
	private int num;
	
	public Tea() {}
	public Tea(String tname, double price, double stock, String src, 
			String typ, String origin,String des) {
		this.tname = tname;
		this.price = price;
		this.stock = stock;
		this.src = src;
		this.typ = typ;
		this.origin = origin;
		this.des = des;
	}
	public Tea(int tid, String tname, double price, double stock, String src, 
			String typ, String origin,String des) {
		this.tid = tid;
		this.tname = tname;
		this.price = price;
		this.stock = stock;
		this.src = src;
		this.typ = typ;
		this.origin = origin;
		this.des = des;
	}
	public Tea(int tid, String tname, double price, double stock, String src, 
			String typ, String origin,String des,int num) {
		this.tid = tid;
		this.tname = tname;
		this.price = price;
		this.stock = stock;
		this.src = src;
		this.typ = typ;
		this.origin = origin;
		this.des = des;
		this.num=num;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getStock() {
		return stock;
	}
	public void setStock(double stock) {
		this.stock = stock;
	}
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	public String getTyp() {
		return typ;
	}
	public void setTyp(String typ) {
		this.typ = typ;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	@Override
	public String toString() {
		return "Tea [tid=" + tid + ", tname=" + tname + ", price=" + price + ", stock=" +
	stock+", src="+ src+", typ=" + typ + ", origin=" + origin + ", des=" + des + "]";
	}
	
}
