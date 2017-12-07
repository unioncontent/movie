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
import org.springframework.web.bind.annotation.ResponseBody;
import org.union.domain.UserVO;
import org.union.service.MonitorService;
import org.union.service.UserService;

@Controller
@RequestMapping("/manage/*")
public class ManageController {

	
	@Autowired
	private UserService userService;
	
	@Autowired
	private MonitorService monitorService;
	
	private static Logger logger = LoggerFactory.getLogger(ManageController.class);
	
	
	@GetMapping("/company")
	public void companyGET(Model model) {
		logger.info("companyGET called....");
		
		List<UserVO> userVO = userService.listAll();
		
		model.addAttribute("userList", userVO);
	}
	
	
	@PostMapping("/companyInsert")
	public String companyInsertGET(UserVO userVO) {
		logger.info("companyInsertPOST called....");
	
		logger.info("UserVO: " + userVO);
		
		userVO.setUser_type(1);
		userVO.setUser_name(userVO.getCompany_name());
		
		userService.insert(userVO);
		
		return "redirect:/manage/company";
	}
	
	@ResponseBody
	@PostMapping("/idCheck")
	public String idCheckGET(String user_ID) {
		logger.info("idCheckGET called....");
		
		logger.info("user_ID: " + user_ID);
		
		UserVO userVO = userService.viewById(user_ID);
		
		logger.info("userVO: " + userVO);
		
		if(userVO == null) {
			return "success";
			
		}else {
			return "fail";
		}
		
	}
	
	
	@GetMapping("/monitor")
	public void monitorGET(Model model) {
		logger.info("monitorGET called....");
		
		model.addAttribute("monitorList", monitorService.pageAll());
	}
	
	
	/*@PostMapping("/monitorInsert")
	public String monitorInsertPOST(MonitorVO vo) {
		logger.info("monitorInsertPOST called....");
		
		logger.info("monitorVO: " + vo);
		
		monitorService.insert(vo);
	
		
		return "redirect:/manage/monitor";
	}*/
}
