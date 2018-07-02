package com.kang.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kang.model.Todo;
import com.kang.model.User;

@Repository
public class TodoDAOImpl implements TodoDAO {
	@Autowired
	private SqlSession session;
	private static final String name = "com.kang.mapper.TodoMapper";
	@Override
	public User userSearch(String id){
		return session.selectOne(name + ".selectUser" , id);
	}
	@Override
	public void insertUser(User user) throws Exception{
		session.insert(name + ".insertUser",user);
	}
	@Override
	public String userCk(String id) {
		return session.selectOne(name + ".idCk" , id);
	}
	@Override
	public void todoInsert(Map map) {
		session.insert(name + ".insertTodo", map);
	}
	@Override
	public List<Todo> todoList(Map map) {
		return session.selectList(name + ".todoList", map);
	}
	@Override
	public int todoCount(String id) {
		return session.selectOne(name + ".todoCount", id);
	}
	@Override
	public Todo todoDetail(int todono) {
		return session.selectOne(name + ".todoDetail" , todono);
	}
	@Override
	public int completionUpdate(Map map) {
		int ck = session.update(name+".todoCompleteUpdate", map);
		return ck;
	}
	@Override
	public boolean selectCompletion(int todono) {
		
		return session.selectOne(name + ".todoCompletionSelect", todono);
	}
	@Override
	public void delete(int todono) {
		// TODO Auto-generated method stub
		session.delete(name +".delete", todono);
	}
	@Override
	public void update(Todo todo) {
		session.update(name + ".update", todo);
	}

	

}
