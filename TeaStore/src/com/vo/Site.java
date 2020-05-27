package com.vo;

public class Site {
	
	private int uid;
	private String site;
	
	public Site() {}
	public Site(int uid, String site) {
		super();
		this.uid = uid;
		this.site = site;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getSite() {
		return site;
	}
	public void setSite(String site) {
		this.site = site;
	}
	@Override
	public String toString() {
		return "Address [uid=" + uid + ", site=" + site + "]";
	}
}
