package com.kang.controller;

import java.security.Principal;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kang.model.User;
import com.kang.service.TodoService;

@Controller
//@SessionAttributes("userId") //이렇게 지정해두면 같은 이름으로 addAttribute 되는것은 세션으로 간주함
public class SecurityController {
	private static final Logger logger = LoggerFactory.getLogger(SecurityController.class);
	@Autowired
	private TodoService service;
	@RequestMapping("/login") // 페이지를 뿌려준당
	public String login(Locale locale, Model model) {
		logger.info("login get called");
		return "/process/login";
	}

/*	@RequestMapping(value = "/logins", method = RequestMethod.POST)
	public String login2(Model model, String id, String password) {
		logger.info("login secess called");
		System.out.println(id);
		System.out.println(password);

		UserDetails user = service.loadUserByUsername(id);
		if(user != null) {
			if(user.getPassword().equals(password)) {
				
				model.addAttribute("userId", user); //위에 SessionAttributes("userId") 로 지정해 두었기 때문에 같은 이름인 이것은 세션에 저장된다
			}
			else {
				return "redirect:/error";
			}
		} else {
			return "redirect:/error";
		}	
		return "/home";
	}*/
	
	@RequestMapping(value="/register", method= RequestMethod.POST)
	public String register(@Valid @ModelAttribute("user") User user, BindingResult result,RedirectAttributes rttr) throws Exception {
		logger.info("회원가입 호출 : " + user.getId());
		if(result.hasErrors()) {
			return "process/register";
		}
		service.insertUser(user);
		rttr.addFlashAttribute("result","success");
		return "redirect:/registerSuccess";
	}
	@RequestMapping(value="/registerSuccess", method=RequestMethod.GET)
	public String registerSuccess() {
		logger.info("회원가입 성공 페이징");
		return "/process/registerSuccess";
	}

	@RequestMapping("/error")
	public String error(Locale locale, Model model) {
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);
		model.addAttribute("error", "로그인 실패, 잘못된 ID/PASSWORD입니다");

		return "/process/login";
	}
}
