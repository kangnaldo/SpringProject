package com.kang.service;

import java.util.List;
import java.util.Map;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.kang.model.Todo;
import com.kang.model.User;

public interface TodoService extends UserDetailsService {
	public void insertUser(User user) throws Exception;
	public String userCk(String id); 
	public void todoInsert(Map map);
	public List<Todo> todoList(Map map); 
	public int todoCount(String id);
	public Todo todoDetail(int todono);
	public int completionUpdate(Map map);
	public boolean selectCompletion(int todono);
	public void delete(int todono);
	public void update(Todo todo);
}
