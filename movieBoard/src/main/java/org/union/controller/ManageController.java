package org.union.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.union.domain.UserVO;
import org.union.service.UserService;

@Controller
@RequestMapping("/manage/*")
public class ManageController {

	
	@Autowired
	private UserService userService;
	
	private static Logger logger = LoggerFactory.getLogger(ManageController.class);
	
	
	@GetMapping("/company")
	public void companyGET(Model model) {
		logger.info("companyGET called....");
		
		List<UserVO> userVO = userService.listAll();
		
		model.addAttribute("userList", userVO);
	}
	
	
	@PostMapping("/companyInsert")
	public void companyInsertPOST(UserVO userVO) {
		
	}
	
	
	@GetMapping("/monitor")
	public void monitorGET() {
		logger.info("monitorGET called....");
	}
	
}
