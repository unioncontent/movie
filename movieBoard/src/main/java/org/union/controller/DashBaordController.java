package org.union.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.union.domain.CalendarVO;
import org.union.domain.GraphVO;
import org.union.domain.SearchCriteria;
import org.union.domain.UserVO;
import org.union.service.CalendarService;
import org.union.service.CommunityService;
import org.union.service.KeywordService;
import org.union.service.MediaService;
import org.union.service.PortalService;
import org.union.service.RelationService;
import org.union.service.SNSService;
import org.union.service.UserService;

@Controller
@RequestMapping("/dashBoard/*")
public class DashBaordController {

	
	@Autowired
	private PortalService portalService;
	
	@Autowired
	private SNSService snsService;
	
	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private MediaService mediaService;
	
	@Autowired
	private KeywordService keywordService;
	
	@Autowired
	private RelationService relationService;
	
	@Autowired
	private CalendarService calendarService;
	
	@Autowired
	private UserService userService;
	
	private static Logger logger = LoggerFactory.getLogger(DashBaordController.class);
	
	@GetMapping("/dashBoard")
	public void dashBoardGET(@ModelAttribute("cri") SearchCriteria cri, Model model) {
		logger.info("dashBaordGET called....");
		
		if(cri.getKeyword() == "" || "undefined".equals(cri.getKeyword()))  {
			logger.info("keyword is null");
			cri.setKeyword(null);
			
		} 
		if(cri.getSelectKey() == "" || "키워드".equals(cri.getSelectKey()) ) {
			logger.info("selectKey is null");
			cri.setSelectKey(null);
		}
		
		if("undefined".equals(cri.getStartDate()) || "undefined".equals(cri.getEndDate())
				|| cri.getStartDate() == "" || cri.getEndDate() == ""){
			cri.setStartDate(null);
			cri.setEndDate(null);
		
		} 
		if(cri.getStartDate() != null && cri.getEndDate() != null) {
			logger.info("not null");
			logger.info(cri.getStartDate());
			logger.info(cri.getEndDate());
			if(cri.getStartDate().indexOf("00:00:00") < 0 && cri.getEndDate().indexOf("23:59:59") < 0){ 
				cri.setStartDate(cri.getStartDate() + " 00:00:00"); 
				cri.setEndDate(cri.getEndDate() + " 23:59:59"); 
			}
		}
		if(cri.getCompany() != null) {
			if(cri.getCompany().isEmpty()) {
				cri.setCompany(null);
			}
		}
		
		if(cri.getCompany() == null || cri.getCompany().equals("회사")) {
			logger.info(SecurityContextHolder.getContext().getAuthentication().getName().toString());
			UserVO vo = userService.viewById(SecurityContextHolder.getContext().getAuthentication().getName());
			
			if(!vo.getUser_name().equals("union")) {
			cri.setCompany(vo.getUser_name());
			
			}else {
				cri.setCompany(null);
			}
		}
		if(cri.getTextType() != null) {
			if(cri.getTextType().equals("undefined") || cri.getTextType().equals("분류") || cri.getTextType().isEmpty()) {
				cri.setTextType(null);
			}
		}
		
		model.addAttribute("blogCount", portalService.toDayCount("blog"));
		model.addAttribute("cafeCount", portalService.toDayCount("cafe"));
		model.addAttribute("kintipCount", portalService.toDayCount("kintip"));
		model.addAttribute("webdocCount", portalService.toDayCount("webdoc"));
		model.addAttribute("mediaCount", portalService.toDayCount("media"));
		
		model.addAttribute("keywordCount", keywordService.listAll().size());
		model.addAttribute("relationCount", portalService.toDayCount("score"));
		
		model.addAttribute("portalCount", portalService.yesterdayCount());
		model.addAttribute("mediaCount", mediaService.yesterdayCount());
		model.addAttribute("facebookCount", snsService.yesterdayCount("facebook"));
		model.addAttribute("twitterCount", snsService.yesterdayCount("twitter"));
		model.addAttribute("instagramCount", snsService.yesterdayCount("instagram"));
		
		
		model.addAttribute("showboxblogCount", portalService.showboxToDayCount("blog"));
		model.addAttribute("showboxcafeCount", portalService.showboxToDayCount("cafe"));
		model.addAttribute("showboxkintipCount", portalService.showboxToDayCount("kintip"));
		model.addAttribute("showboxwebdocCount", portalService.showboxToDayCount("webdoc"));
		model.addAttribute("showboxmediaCount", portalService.showboxToDayCount("media"));
		
		model.addAttribute("showboxkeywordCount", keywordService.showboxListAll().size());
		model.addAttribute("showboxrelationCount", portalService.showboxToDayCount("score"));
		
		model.addAttribute("showboxportalCount", portalService.showboxYesterdayCount());
		model.addAttribute("showboxmediaCount", mediaService.showboxYesterdayCount());
		model.addAttribute("showboxfacebookCount", snsService.showboxYesterdayCount("facebook"));
		model.addAttribute("showboxtwitterCount", snsService.showboxYesterdayCount("twitter"));
		model.addAttribute("showboxinstagramCount", snsService.showboxYesterdayCount("instagram"));
		
		
	}
	
	@ResponseBody
	@PostMapping("/graph")
	public List<GraphVO> graphPOST(Model model, String success) {
		logger.info("graphPOST called....");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH");
		
		String current = sdf.format(new Date());
		logger.info("current: " + current);
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		
		List<GraphVO> graphList = new ArrayList<GraphVO>();
		
		
		logger.info("cal.getTime: " + cal.getTime());

		for(int i = 0; i < 24; i++) {
			GraphVO graphVO = new GraphVO();
			
			graphVO.setWriteDate(sdf.format(cal.getTime()) + ":00:00");
			graphVO.setType1(portalService.countAll(cal.getTime()));
			graphVO.setType2(communityService.countAll(cal.getTime()));
			graphVO.setType3(snsService.countAll(cal.getTime()));
			
			graphList.add(graphVO);
			
			cal.add(Calendar.HOUR, -1);
			
		}
		

		logger.info("graphList: " + graphList);
		return graphList;
	}
	
	@ResponseBody
	@PostMapping("/showGraph")
	public List<GraphVO> showGraphPOST(Model model, String success) {
		logger.info("graphPOST called....");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH");
		
		String current = sdf.format(new Date());
		logger.info("current: " + current);
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		
		List<GraphVO> graphList = new ArrayList<GraphVO>();
		
		
		logger.info("cal.getTime: " + cal.getTime());

		for(int i = 0; i < 24; i++) {
			GraphVO graphVO = new GraphVO();
			
			graphVO.setWriteDate(sdf.format(cal.getTime()) + ":00:00");
			graphVO.setType1(portalService.showboxCountAll(cal.getTime()));
			graphVO.setType2(communityService.showboxCountAll(cal.getTime()));
			graphVO.setType3(snsService.showboxCountAll(cal.getTime()));
			
			graphList.add(graphVO);
			
			cal.add(Calendar.HOUR, -1);
			
		}
		

		logger.info("graphList: " + graphList);
		return graphList;
	}
	
	@ResponseBody
	@PostMapping("listDate")
	public List<CalendarVO> listDatePOST(String date){
		logger.info("listDatePost called....");
		
		List<CalendarVO> calList = calendarService.listDate();
		//List<CalendarVO> resultList = new ArrayList<CalendarVO>();
		
		logger.info("calList: " + calList);
		
		/*for(int i = 0; i < calList.size(); i++) {
			
			if(resultList.size() > 0) {
				for(int j = 0; j < resultList.size(); j++) {
					if(resultList.get(j).getCalendar_date().equals(calList.get(i).getCalendar_date())) {
						resultList.get(j).setCalendar_title(resultList.get(j).getCalendar_title() + "\n"
															+ calList.get(i).getCalendar_title());
						
						calList.remove(i);
					}else {
						resultList.add(calList.get(i));
						
					}
				}
				
			}else {
				resultList.add(calList.get(i));
				
			}
		}
		
		logger.info("resultList: " + resultList);*/
		
		return calList;
	}
	
	@ResponseBody
	@PostMapping("insert")
	public String insertPOST(String title, String date) {
		logger.info("insertPOST called....");
		
		date = date.replaceAll("/", "-");
		
		logger.info("title: " + title);
		logger.info("date: " + date);
		
		CalendarVO calendarVO = new CalendarVO();
		
		calendarVO.setCalendar_title(title);
		calendarVO.setCalendar_date(date);
		
		calendarService.insert(calendarVO);
		
		return "success";
	}
	
	@ResponseBody
	@PostMapping("delete")
	public String deletePOST(String title) {
		logger.info("deletePOST called....");
		
		calendarService.remove(title);
		
		return "success";
		
	}
}
