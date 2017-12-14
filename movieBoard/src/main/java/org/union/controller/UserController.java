package org.union.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
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
		
		if(vo.getUser_type() == 1) {
			logger.info("관리자 접속");

			session.setAttribute("companyList", userService.listAll());
			session.setAttribute("keywordList", keywordService.listAll());
		
		}else {
			logger.info("CP 접속");
			
			session.setAttribute("keywordList", keywordService.listByUser(vo.getUser_idx()));
			session.setAttribute("companyList", vo);
		}
		
		
		return "redirect:../dashBoard/dashBoard";
	}
	
	@GetMapping("/logout")
	public String logout() {
		logger.info("logout...");
		
		return "redirect:../logoutAction";
	}
	
	@GetMapping("/login")
	public void login() {
		logger.info("login....");
	}

}
