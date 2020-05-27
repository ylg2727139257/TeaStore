package com.vo;

public class Shopcart {
	private int uid;
	private int tid;
	private int num;
	
	public Shopcart() {}
	
	public Shopcart(int uid, int tid, int num) {
		this.uid = uid;
		this.tid = tid;
		this.num = num;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	@Override
	public String toString() {
		return "Shopcart [uid=" + uid + ", tid=" + tid + ", num=" + num + "]";
	}
	
	
	
	
}
