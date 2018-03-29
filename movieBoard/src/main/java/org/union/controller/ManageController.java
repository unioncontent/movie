package org.union.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.union.domain.GraphVO;
import org.union.domain.ReporterVO;
import org.union.domain.SearchCriteria;
import org.union.domain.TextTypeVO;
import org.union.domain.UserVO;
import org.union.service.CommunityService;
import org.union.service.KeywordService;
import org.union.service.MediaService;
import org.union.service.MonitorService;
import org.union.service.PortalService;
import org.union.service.ReporterService;
import org.union.service.SNSService;
import org.union.service.UserService;

@Controller
@RequestMapping("/manage/*")
public class ManageController {

	private static Logger logger = LoggerFactory.getLogger(ManageController.class);
	
	@Autowired
	private MediaService mediaService;
	
	@Autowired
	private CommunityService communityService;

	@Autowired
	private PortalService portalService;
	
	@Autowired
	private SNSService snsService;

	@Autowired
	private KeywordService keywordService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private MonitorService monitorService;
	
	@Autowired
	private ReporterService reporterService;

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
		model.addAttribute("portalBList", monitorService.portalBMonitor());
		model.addAttribute("portalCList", monitorService.portalCMonitor());
		model.addAttribute("portalWList", monitorService.portalWMonitor());
		model.addAttribute("portalBList2", monitorService.portalBMonitor2());
		model.addAttribute("portalCList2", monitorService.portalCMonitor2());
		model.addAttribute("portalWList2", monitorService.portalWMonitor2());
		
		model.addAttribute("snsListf", monitorService.snsMonitorf());
		model.addAttribute("snsListi", monitorService.snsMonitori());
		model.addAttribute("snsListt", monitorService.snsMonitort());
		
		model.addAttribute("mediaListA", monitorService.mediaMonitor("naver"));
		model.addAttribute("mediaListB", monitorService.mediaMonitor("daum"));
		
		model.addAttribute("communityList1", monitorService.communityMonitor("82cook"));
		model.addAttribute("communityList2", monitorService.communityMonitor("todayhumor"));
		model.addAttribute("communityList3", monitorService.communityMonitor("bestiz"));
		model.addAttribute("communityList4", monitorService.communityMonitor("bobae"));
		model.addAttribute("communityList5", monitorService.communityMonitor("bobaedream"));
		model.addAttribute("communityList6", monitorService.communityMonitor("clien"));
		model.addAttribute("communityList7", monitorService.communityMonitor("dcinside"));
		model.addAttribute("communityList8", monitorService.communityMonitor("dogdrip"));
		model.addAttribute("communityList9", monitorService.communityMonitor("dramameeting"));
		model.addAttribute("communityList10", monitorService.communityMonitor("dyb"));
		model.addAttribute("communityList11", monitorService.communityMonitor("ygosu"));
		model.addAttribute("communityList12", monitorService.communityMonitor("extrememovie"));
		model.addAttribute("communityList13", monitorService.communityMonitor("humoruniv"));
		model.addAttribute("communityList14", monitorService.communityMonitor("ilbe"));
		model.addAttribute("communityList15", monitorService.communityMonitor("ilyo"));
		model.addAttribute("communityList16", monitorService.communityMonitor("instiz"));
		model.addAttribute("communityList17", monitorService.communityMonitor("inven"));
		model.addAttribute("communityList18", monitorService.communityMonitor("issuein"));
		model.addAttribute("communityList19", monitorService.communityMonitor("mlbpark"));
		model.addAttribute("communityList20", monitorService.communityMonitor("ppomppu"));
		model.addAttribute("communityList21", monitorService.communityMonitor("ruliweb"));
		model.addAttribute("communityList22", monitorService.communityMonitor("soccerline"));
		model.addAttribute("communityList23", monitorService.communityMonitor("square"));
		model.addAttribute("communityList24", monitorService.communityMonitor("theqoo"));
		model.addAttribute("communityList25", monitorService.communityMonitor("tistory"));
	}
	
	@PostMapping("/report")
	public ModelAndView report(String startDate, String endDate) {
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("date", startDate);
		mav.addObject("date2", endDate);
		mav.setViewName("manage/report");
		return mav;
	}
	
	@GetMapping("/report")
	public void reportGet(@ModelAttribute("cri") SearchCriteria cri, Model model, String startDate, String endDate, String company, String selectKey) throws Exception{
		logger.info("reportGET called....");
		
		cri.setKeyword(null);
		cri.setTextType(null);
		
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

		// 회사 선택에 따른 키워드 재추출
		if (cri.getCompany() != null) {	
			if (cri.getCompany().isEmpty() == false) {

				UserVO userVO = userService.viewByName(cri.getCompany());
				logger.info("userVO: " + userVO);
				logger.info("keywordList: " + keywordService.listByUser(userVO.getUser_idx()));
				model.addAttribute("modelKeywordList",
						keywordService.listByUser(userService.viewByName(cri.getCompany()).getUser_idx()));
			}
		}
		
		logger.info("cri: " + cri);
		
		model.addAttribute("portalCount", portalService.wgetSearchCount(cri));
		model.addAttribute("communityCount", communityService.wgetSearchCount(cri));
		model.addAttribute("snsCount", snsService.getSearchCount(cri));
		model.addAttribute("mediaCount", mediaService.wgetSearchCount(cri));
		
		model.addAttribute("portalTextType", portalService.textTypeCount(cri));
		model.addAttribute("portalTextType2", portalService.textTypeCount2(cri));
		model.addAttribute("communityTextType", communityService.textTypeCount(cri));
		
		model.addAttribute("blogTextType", portalService.blogTextType(cri));
		model.addAttribute("cafeTextType", portalService.cafeTextType(cri));
		
		model.addAttribute("facebookTT", snsService.facebookSum(cri));
		model.addAttribute("twitterTT", snsService.twitterSum(cri));
		model.addAttribute("instagramTT", snsService.instagramSum(cri));
		
		model.addAttribute("naverMediaCount", mediaService.naverMediaCount(cri));
		model.addAttribute("daumMediaCount", mediaService.daumMediaCount(cri));
		model.addAttribute("totalMediaCount", mediaService.totalMediaCount(cri));
		
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		model.addAttribute("company", company);
		model.addAttribute("selectKey", selectKey);
	}
	
	@ResponseBody
	@PostMapping("/getTextType")
	public List<TextTypeVO> getTextType(String url, String part, String keyword){
		logger.info("getTextType called....");

		SearchCriteria cri  = new SearchCriteria();
		
		if(!url.equals("undefined")) {
			String company = url.split("company")[1].split("&")[0];
			String selectKey = url.split("selectKey")[1].split("&")[0];
			String startDate = url.split("startDate")[1].split("&")[0] + " 00:00:00";
			String endDate = url.split("endDate")[1].split("&")[0] + " 23:59:50";
			
			cri.setCompany(company);
			cri.setSelectKey(selectKey);
			cri.setStartDate(startDate);
			cri.setEndDate(endDate);
		}
		
		cri.setKeyword(keyword);
		
		logger.info("cri: " + cri);
		
		List<TextTypeVO> list = new ArrayList<TextTypeVO>();
		
		if(part.equals("media")) {
			list.add(mediaService.getMediaPortalCount(cri));
			list.add(mediaService.getMediaTextTypeTotalCount(cri));
			list.add(mediaService.getMediaTextTypeSearchCount(cri));
			
		}else if(part.equals("press")) {
			list.add(mediaService.getPressPortalCount(cri));
			list.add(mediaService.getPressTextTypeTotalCount(cri));
			list.add(mediaService.getPressTextTypeSearchCount(cri));
			
			TextTypeVO textTypeVO = new TextTypeVO();
			ReporterVO reporterVO = reporterService.readByName(keyword);
			
			try {
				textTypeVO.setName1(reporterVO.getReporter_name());
				textTypeVO.setName2(reporterVO.getReporter_media_name());
				if(reporterVO.getReporter_email() != null) {
					textTypeVO.setEmail(reporterVO.getReporter_email());
				}
			} catch (Exception e) {
				e.printStackTrace();
				
			}finally {
				list.add(textTypeVO);
			}
			
		}
		
		return list;
	}
	
	@PostMapping("/graph")
	@ResponseBody
	public List<GraphVO> graphPOST(String startDate, String endDate, String company, String selectKey) throws Exception{
		logger.info("grpahPOST called....");
		
		logger.info("company: " + company);
		logger.info("selectKey: " + selectKey);
		
		if(company == null || company.equals("회사")) {
			logger.info(SecurityContextHolder.getContext().getAuthentication().getName().toString());
			UserVO vo = userService.viewById(SecurityContextHolder.getContext().getAuthentication().getName());
			
			if(!vo.getUser_name().equals("union")) {
				company = vo.getUser_name();
			
			}else {
				company = null;
			}
		}
		if(selectKey != null) {
			if(selectKey.isEmpty() || selectKey.equals("키워드")) {
				selectKey = null;
			}
		}
		
		startDate = startDate + " 00:00:00";
		endDate = endDate + " 23:59:59";
		logger.info("startDate: " + startDate);
		logger.info("endDate: " + endDate);
		
		SearchCriteria cri = new SearchCriteria();
		cri.setSelectKey(selectKey);
		cri.setCompany(company);
		logger.info("cri: " + cri);
		
		SimpleDateFormat standFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		Date transStart = standFormat.parse(startDate);
		Date transEnd = standFormat.parse(endDate);
		
		Long gap = (transEnd.getTime() - transStart.getTime()) / (24 * 60 * 60 * 1000);
		logger.info("gap: " + gap);
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(transStart);

		List<GraphVO> graphList = new ArrayList<GraphVO>();
		
		for(int i = 0; i < gap +1; i++) {
			
			cri.setStartDate(standFormat.format(cal.getTime()));
			cal.add(Calendar.SECOND, (24 * 60 * 60) -1);
			cri.setEndDate(standFormat.format(cal.getTime()));
				
			GraphVO graphVO = new GraphVO();
			graphVO.setWriteDate(standFormat.format(cal.getTime()).toString().split(" ")[0]);
			graphVO.setType1(portalService.getSearchCount(cri));
			graphVO.setType2(communityService.getSearchCount(cri));
			graphVO.setType3(snsService.getSearchCount(cri));
			graphVO.setType4(mediaService.getSearchCount(cri));
				
			graphList.add(graphVO);
				
			cal.add(Calendar.SECOND, 1);
			}
			
		return graphList;
		
	}
	
	@GetMapping("/email")
	public void email() {
		
	}
	
	 @RequestMapping(value = "/insertBoard.do", method = RequestMethod.POST)
	    public String insertBoard(String editor) {
	        System.err.println("저장할 내용 : " + editor);
	        return "redirect:/email";
	}
	
	// 다중파일업로드
    @RequestMapping(value = "/file_uploader_html5", method = RequestMethod.POST)
    @ResponseBody
    public String multiplePhotoUpload(HttpServletRequest request) {
        // 파일정보
        StringBuffer sb = new StringBuffer();
        try {
            // 파일명을 받는다 - 일반 원본파일명
            String oldName = request.getHeader("file-name");
            // 파일 기본경로 _ 상세경로
            String filePath = "C:/Users/Administrator/eclipse-workspace/movieBoard2/src/main/webapp/resources/photoUpload/";
            String saveName = sb.append(new SimpleDateFormat("yyyyMMddHHmmss")
                          .format(System.currentTimeMillis()))
                          .append(UUID.randomUUID().toString())
                          .append(oldName.substring(oldName.lastIndexOf("."))).toString();
            InputStream is = request.getInputStream();
            OutputStream os = new FileOutputStream(filePath + saveName);
            int numRead;
            byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
            while ((numRead = is.read(b, 0, b.length)) != -1) {
                os.write(b, 0, numRead);
            }
            os.flush();
            os.close();
            // 정보 출력
            sb = new StringBuffer();
            sb.append("&bNewLine=true")
              .append("&sFileName=").append(oldName)
              .append("&sFileURL=").append("http://localhost:8080/Spring/resources/photoUpload/")
        .append(saveName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sb.toString();
    }
	
	
	/*@PostMapping("/monitorInsert")
	public String monitorInsertPOST(MonitorVO vo) {
		logger.info("monitorInsertPOST called....");
		
		logger.info("monitorVO: " + vo);
		
		monitorService.insert(vo);
	
		
		return "redirect:/manage/monitor";
	}*/
}
