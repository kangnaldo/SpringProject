package com.kang.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.kang.model.Todo;
import com.kang.model.User;
import com.kang.persistence.TodoDAO;

@Service
public class TodoServiceImpl implements TodoService {
	// UserDetailService 인터페이스 정보가 나와있는 곳 http://zgundam.tistory.com/49 에서 보세용
	@Autowired
	private TodoDAO dao;


	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		User userz = dao.userSearch(id);
		System.out.println(userz);
		if(userz == null) {
			  return null;
		}
		Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
		roles.add(new SimpleGrantedAuthority("ROLE_USER"));	
	    UserDetails user = new User(id, userz.getPassword(), roles);
		
	    return user;
	}

	@Override
	public void insertUser(User user) throws Exception {
		dao.insertUser(user);
	}

	@Override
	public String userCk(String id) {
		return dao.userCk(id);
	}

	@Override
	public void todoInsert(Map map) {
		dao.todoInsert(map);
	}

	@Override
	public List<Todo> todoList(Map map) {
		return dao.todoList(map);
	}

	@Override
	public int todoCount(String id) {
		return dao.todoCount(id);
	}

	@Override
	public Todo todoDetail(int todono) {
		return dao.todoDetail(todono);
	}

	@Override
	public int completionUpdate(Map map) {
		return dao.completionUpdate(map);
	}

	@Override
	public boolean selectCompletion(int todono) {
		return dao.selectCompletion(todono);
	}

	@Override
	public void delete(int todono) {
		dao.delete(todono);
	}

	@Override
	public void update(Todo todo) {
		dao.update(todo);
	}
}
