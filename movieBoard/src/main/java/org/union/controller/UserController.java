package org.union.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.union.domain.UserVO;
import org.union.service.KeywordService;
import org.union.service.UserService;

@Controller
@RequestMapping("/login")
public class UserController {

	
	static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private KeywordService keywordService;
	
	@GetMapping("/loginSuccess")
	public String loginSuccess(HttpSession session) {
			
		logger.info(SecurityContextHolder.getContext().getAuthentication().getName().toString());
		UserVO vo = userService.viewById(SecurityContextHolder.getContext().getAuthentication().getName());
		
		session.setAttribute("user", vo);
		
		List<String> keywordList = keywordService.listByUser(vo.getUser_idx());
		
		logger.info("keywordList: " + keywordList);
		session.setAttribute("keywordList", keywordList);
		
		return "redirect:../dashBoard/dashBoard";
	}
	
	@GetMapping("/logout")
	public String logout() {
		logger.info("logout...");
		
		return "../logoutAction";
	}
	
	@GetMapping("/login")
	public void login() {
		logger.info("login....");
	}

}
