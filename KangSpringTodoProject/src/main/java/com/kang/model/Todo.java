package com.kang.model;

import java.sql.Timestamp;

public class Todo {
	public String getTodosubject() {
		return todosubject;
	}
	public void setTodosubject(String todosubject) {
		this.todosubject = todosubject;
	}
	public String getTodocontent() {
		return todocontent;
	}
	public void setTodocontent(String todocontent) {
		this.todocontent = todocontent;
	}
	private int todono; // 자동
    private String id; // 자동
    private String todosubject;
    private String todocontent;
    private String cano;
    private Timestamp createtododate; //자동
  
	@Override
	public String toString() {
		return "Todo [todono=" + todono + ", id=" + id + ", todosubject=" + todosubject + ", todocontent=" + todocontent
				+ ", cano=" + cano + ", createtododate=" + createtododate + ", todostartdate=" + todostartdate
				+ ", todoenddate=" + todoenddate + ", completion=" + completion + "]";
	}
	private String todostartdate;
    private String todoenddate;
    private boolean completion;
    
    //해야할일 불리언 처리
    
    public int getTodono() {
		return todono;
	}
	public String getCano() {
		return cano;
	}
	public void setCano(String cano) {
		this.cano = cano;
	}
	public boolean isCompletion() {
		return completion;
	}
	public void setCompletion(boolean completion) {
		this.completion = completion;
	}
	public void setTodono(int todono) {
		this.todono = todono;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	
	
	public Timestamp getCreatetododate() {
		return createtododate;
	}
	public void setCreatetododate(Timestamp createtododate) {
		this.createtododate = createtododate;
	}
	public String getTodostartdate() {
		return todostartdate;
	}
	public void setTodostartdate(String todostartdate) {
		this.todostartdate = todostartdate;
	}
	public String getTodoenddate() {
		return todoenddate;
	}
	public void setTodoenddate(String todoenddate) {
		this.todoenddate = todoenddate;
	}
	

	
}
