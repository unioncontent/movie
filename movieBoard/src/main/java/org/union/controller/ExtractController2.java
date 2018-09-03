package org.union.controller;

import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.union.domain.SearchCriteria;
import org.union.domain.UserVO;
import org.union.service.CommunityService;
import org.union.service.KeywordService;
import org.union.service.MediaService;
import org.union.service.PortalService;
import org.union.service.SNSService;
import org.union.service.UserService;

@Controller
@RequestMapping("/extract/*")
public class ExtractController2 {

	private static Logger logger=LoggerFactory.getLogger(ExtractController2.class);
	
	@Autowired
	private SNSService snsSerivce;
	@Autowired
	private CommunityService communityService;
	@Autowired
	private PortalService portalService;
	@Autowired
	private MediaService mediaService;
	@Autowired
	private KeywordService keywordService;
	@Autowired
	private UserService userService;
	
	@RequestMapping("/extract")
	public void getExtract(@ModelAttribute("scritera") SearchCriteria scriteria,Model model) throws SQLException {
		logger.info("-----------getExtract 호출--------------");
		// 1. 검색옵션에서 회사이름을 선택했을때
		if(scriteria.getCompany()!=null) {
			if(scriteria.getCompany().isEmpty()) {
				scriteria.setCompany(null);
			}
		}
		// 2. 검색옵션에서 "회사"로  되어있을때 
		if(scriteria.getCompany()==null||scriteria.getCompany().equals("회사")) {
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			UserVO vo=userService.viewById(authentication.getName());
			if(!vo.getUser_name().equals("union")) {
				scriteria.setCompany(vo.getUser_name());
			}else {
				scriteria.setCompany(null);
			}
		}
		//3. 검색을 날짜로 했을때
		if(scriteria.getStartDate()!=null&&scriteria.getEndDate()!=null) {
			if(scriteria.getStartDate().indexOf("00:00:00")<0 && scriteria.getEndDate().indexOf("23:59:59")<0) {
				scriteria.setStartDate(scriteria.getStartDate()+"00:00:00");
				scriteria.setEndDate(scriteria.getEndDate()+"23:59:59");
			}
		}
	}
	
}
