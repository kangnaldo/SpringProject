package com.kang.persistence;

import java.util.List;
import java.util.Map;

import com.kang.model.Todo;
import com.kang.model.User;

public interface TodoDAO {
	public User userSearch(String id);

	public void insertUser(User user) throws Exception; // 권한 부여및 계정 아이디/비밀번호 일치 확인

	public String userCk(String id); //회원가입시 아이디 중복체크
	
	public void todoInsert(Map map); //일정 추가
	
	public List<Todo> todoList(Map map); // 투두 리스트 조회
	
	public int todoCount(String id); // 해당 아이디의 투두 총 갯수, 페이징 처리를 위해 얻어옴
	
	public Todo todoDetail(int todono); //해당 투두의 정보를 가져오는 거
	
	public int completionUpdate(Map map); // 해당 투두의 완료/미완료 업데이트
	
	public boolean selectCompletion(int todono);
	
	public void delete(int todono);
	
	public void update(Todo todo);
}
