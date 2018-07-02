package com.kang.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kang.model.Todo;
import com.kang.service.TodoService;

@Controller
public class AjaxController {
	private static final Logger logger = LoggerFactory.getLogger(AjaxController.class);
	@Autowired
	private TodoService service;

	@RequestMapping(value = "/idCk", method = RequestMethod.GET)
	public void idCk(@RequestParam("id") String id, HttpServletResponse response) {
		System.out.println("끄억~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" + id);
		String ck = service.userCk(id);
		System.out.println(ck);
		try {
			response.getWriter().print(ck);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/complete", method = RequestMethod.GET)
	public void completeCk(@RequestParam("todono") int todono, @RequestParam("completion") boolean completion,
			HttpServletResponse response) {
		Map map = new HashMap();
		map.put("todono", todono);
		System.out.println("컴플리션 : " + completion);
		map.put("completion", !completion);
		service.completionUpdate(map);

		System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
		boolean bool = service.selectCompletion(todono);
		System.out.println("불리언 값 : " + bool);
		try {
			response.getWriter().print(bool);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	@RequestMapping(value="/todoUpdate" , method = RequestMethod.POST)
	public void todoUpdate(@ModelAttribute("todo") Todo todo) {
		
	}
}
