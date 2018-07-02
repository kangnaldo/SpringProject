package com.kang.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kang.model.Todo;
import com.kang.service.TodoService;

@Controller
@RequestMapping("/todo/*") 
public class TodoController {
	private static final Logger logger = LoggerFactory.getLogger(TodoController.class);
	private static final int PAGE_GROUP = 5; // [1][2][3][4][5] 페이지 그룹
	@Autowired
	private TodoService service;
	
	@RequestMapping(value="/todoMain", method = RequestMethod.GET)
	public String todoMainFm(Principal principal, @RequestParam(value="pageNum",required=false) String pageNum, Model model) { //@SessionAttribute 는 해당 name 세션의 이름을 불러옴
		List<Todo> list = null;
		/* 페이지 넘버 가져옴 위에 RequestParam을 required=false 를 해야 에러 안남 required=false 뜻 => 있어도 되고 없어도 된다는 뜻 */
		if(pageNum == null) {
			pageNum = "1";
		}
		int pageNumber = Integer.parseInt(pageNum);
		/* 해당 아이디의 투두 페이지의 총합 수 이다 */
		int todoCount = service.todoCount(principal.getName());
		int start = (pageNumber -1) * PAGE_GROUP; //가져올 시작번호
		
		Map map = new HashMap();
		map.put("id", principal.getName());
		map.put("start", start);
		map.put("pageGroup", PAGE_GROUP);
		if(todoCount > 0) { //일정이 있으면
			list = service.todoList(map); //맵으로 바꾸자
		}
		//정상 : listCount , listPg, startPg
		//리스트 페이지수 계산 
		int  listPg  =  todoCount  /  PAGE_GROUP +  (todoCount %  PAGE_GROUP  ==  0  ?  0  :  1);
		int startPg = (pageNumber / PAGE_GROUP) * PAGE_GROUP + 1 - (pageNumber %  PAGE_GROUP  ==  0  ?  PAGE_GROUP  :  0);
		int endPg = startPg + PAGE_GROUP -1;
		if(endPg > listPg) {
			endPg = listPg;
		}
		
		model.addAttribute("pageNum", pageNumber); //요청 페이지 숫자
		model.addAttribute("todoCount", todoCount); //해당아이디의 투두의 전체갯수
		model.addAttribute("todoList", list); //해당아이디의 투두
		model.addAttribute("listPg", listPg); //페이지 전체수
		model.addAttribute("startPg", startPg);
		model.addAttribute("endPg", endPg);
		model.addAttribute("pageGroup", PAGE_GROUP);
		
		System.out.println("투수의 갯수 : " +todoCount);
		
		System.out.println("List size " +list);
		
		return "page/todoMain";
		
	}
	
	@RequestMapping(value="/todoInsert",method= RequestMethod.GET)
	public String todoInsertFm() {
		logger.info("투두 인서트 폼 호출");
		return "page/todoInsert";
	}
	@RequestMapping(value="/todoInsert", method = RequestMethod.POST)
	public String todoInsert(@ModelAttribute Todo todo, Principal principal) { //@ModelAttribute는 폼에서 넘어온 데이터를 해당 이름의 빈으로 자동으로 저장. 형변환까지 자동으로 된다
		logger.info("투수 인서트 수행");
		Map map = new HashMap();
		map.put("todo", todo);
		map.put("userId", principal.getName());
		service.todoInsert(map);
		return "redirect:/todo/todoMain";
	}
	@RequestMapping(value="/todoDetail", method = RequestMethod.GET)
	public String todoDetail(@RequestParam("todono") int todono, Model model) {
		Todo todo = service.todoDetail(todono);
		model.addAttribute("todo",todo);
		return "page/todoDetail";
	}
	
	@RequestMapping(value="/tododelete" , method = RequestMethod.GET)
	public String todoDelete(@RequestParam("todono") int todono) {
		service.delete(todono);
		return "redirect:/todo/todoMain";
	}
	
	@RequestMapping(value="/todoUpdateF", method= RequestMethod.GET)
	public String todoUpdateFm(@RequestParam("todono") int todono,Model model) {
		Todo todo= service.todoDetail(todono);
		model.addAttribute("todo",todo);
		return "page/todoModify";
	}
	
	@RequestMapping(value="/todoUpdate", method = RequestMethod.POST)
	public String todoUpdate(@ModelAttribute("todo") Todo todo) {
		
		System.out.println("우어어어엉어엉");
		service.update(todo);
		
		return "redirect:/todo/todoMain";
	}
}
