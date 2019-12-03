package org.union.controller;

import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	
	private static Logger logger = LoggerFactory.getLogger(KeywordController.class);
	
	@GetMapping("/privacy")
	public void privacyGET() throws SQLException {
		
	}
	
	@GetMapping("/terms")
	public void termsGET() throws SQLException {
		
	}

}
