package org.union.controller;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
import org.union.domain.CommunityVO;
import org.union.domain.ExtractVO;
import org.union.domain.GloVO;
import org.union.domain.GraphVO;
import org.union.domain.MediaVO;
import org.union.domain.PageMaker;
import org.union.domain.PageMakerFv;
import org.union.domain.PortalVO;
import org.union.domain.SNSVO;
import org.union.domain.SearchCriteria;
import org.union.domain.UserVO;
import org.union.service.GloService;
import org.union.service.KeywordService;
import org.union.service.UserService;
import org.union.util.ExcelView;
import org.union.util.ExcelViewGlo;
import org.union.util.ExtractComparator;
import org.union.util.ListUtil;

@Controller
@RequestMapping("/glo/*")
public class GloController {
	
	 @Autowired
	    private GloService gloService;
	 
	 @Autowired
		private UserService userService;
	 
	 @Autowired
	    private KeywordService keywordService;
	 
	 private static Logger logger = LoggerFactory.getLogger(GloController.class);
	
	@GetMapping("/glo")
	public void gloGET(@ModelAttribute("cri") SearchCriteria cri, Model model) throws SQLException {
		logger.info("gloGET called....");
		
		if(cri.getSite() == "" || "사이트".equals(cri.getSite()) ) {
			cri.setSite(null);
		}
		if(cri.getNation() == null || cri.getNation().equals("국가")) {
			cri.setNation(null);;
		}
		if("undefined".equals(cri.getStartDate()) || "undefined".equals(cri.getEndDate())
				|| cri.getStartDate() == "" || cri.getEndDate() == ""){
			cri.setStartDate(null);
			cri.setEndDate(null);
		
		} 
		if(cri.getStartDate() != null && cri.getEndDate() != null) {
			if(cri.getStartDate().indexOf("00:00:00") < 0 && cri.getEndDate().indexOf("23:59:59") < 0){ 
				cri.setStartDate(cri.getStartDate() + " 00:00:00"); 
				cri.setEndDate(cri.getEndDate() + " 23:59:59"); 
			}
		}

		logger.info("glo cri: " + cri);
		
		model.addAttribute("nationList", gloService.nationList());
		model.addAttribute("siteList", gloService.siteList());
		
		model.addAttribute("totalCnt", gloService.totalCnt());
		model.addAttribute("gloCnt", gloService.gloCnt());
		model.addAttribute("gloTypeCount", gloService.gloTypeCount());
		
		model.addAttribute("gloList", gloService.graphGloList(cri));
		
	}
	
	@RequestMapping(value="/gloModal", method=RequestMethod.POST)
	public Model gloModal(HttpServletRequest request, @RequestParam Map<String, Object> param, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
	    
		
		if(cri.getSite() == "" || "사이트".equals(cri.getSite()) ) {
			cri.setSite(null);
		}
		if(cri.getNation() == null || cri.getNation().equals("국가")) {
			cri.setNation(null);
		}
		if(cri.getSelectKey() == null || cri.getSelectKey().equals("키워드")) {
			cri.setSelectKey(null);
		}
		if(cri.getTextType() == null || cri.getTextType().equals("검출상태")) {
			cri.setTextType(null);
		}
		if(cri.getWork().equals("전체")) {
			cri.setWork(null);
		}
		if("undefined".equals(cri.getStartDate()) || "undefined".equals(cri.getEndDate())
				|| cri.getStartDate() == "" || cri.getEndDate() == ""){
			cri.setStartDate(null);
			cri.setEndDate(null);
		
		} 
		if(cri.getStartDate() != null && cri.getEndDate() != null) {
			if(cri.getStartDate().indexOf("00:00:00") < 0 && cri.getEndDate().indexOf("23:59:59") < 0){ 
				cri.setStartDate(cri.getStartDate() + " 00:00:00"); 
				cri.setEndDate(cri.getEndDate() + " 23:59:59"); 
			}
		}
		if(cri.getKeyword() == "" || "undefined".equals(cri.getKeyword()))  {
			cri.setKeyword(null);
		} 
		
		logger.info("MODAL cri: " + cri);
		
		model.addAttribute("detailList", gloService.detailList(cri));
		Integer totalCount = gloService.detailCnt(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		
		model.addAttribute("nationList", gloService.nationList());
		model.addAttribute("siteList", gloService.siteList());
		model.addAttribute("keywordList", gloService.keywordList());
		model.addAttribute("site", cri.getSite());
		model.addAttribute("work", cri.getWork());
		model.addAttribute("nation", cri.getNation());
		model.addAttribute("selectKey", cri.getSelectKey());
		model.addAttribute("state", cri.getTextType());
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("minusCount", cri.getPerPageNum() * (cri.getPage()-1));
		
	    return model;
	}
	
	@ResponseBody
    @PostMapping("/graph")
    public List<GraphVO> graph_rePOST(Model model, String success, @ModelAttribute("cri") SearchCriteria cri,String part, String company, String selectKey) throws SQLException {
		logger.info("graph_rePOST called....");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		String current = sdf.format(new Date());
		logger.info("current: " + current);
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		
		List<GraphVO> graphList = new ArrayList<GraphVO>();
		
		
		logger.info("cal.getTime: " + cal.getTime());
		
		for(int i = 0; i < 30; i++) {
			GraphVO graphVO = new GraphVO();
		
		cri.setSelectKey(selectKey);
		String  startDate = sdf.format(cal.getTime());
		String  endDate = sdf.format(cal.getTime());
		cri.setStartDate(startDate + " 00:00:00");
		cri.setEndDate(endDate + " 23:59:59");
			
		graphVO.setWriteDate(sdf.format(cal.getTime()));
		graphVO.setType1(gloService.graphGloCount(cri));
		graphVO.setType2(gloService.graphKoCount(cri));
			
		graphList.add(graphVO);
			
		cal.add(Calendar.DATE, -1);
		}
		
		Collections.reverse(graphList);
		logger.info("graphList: " + graphList);
		return graphList;
	}
	
	@ResponseBody
	@PostMapping("/remove")
	public String removePOST(Integer idx) throws SQLException {
		logger.info("removePOST called....");
		
		logger.info("idx: " + idx);
		
		gloService.deleteGlo(idx);
		
		return "success";
	}
	
	@ResponseBody
	@PostMapping("/gloUp")
	public String gloUpPOST(Integer idx, String work) throws SQLException {
		logger.info("insertPOST called....");
		
		logger.info("idx: " + idx);
		logger.info("work: " + work);
		
		GloVO vo = new GloVO();
		vo.setGlo_work(work);
		vo.setGlo_idx(idx);
			
		gloService.modifyGlo(vo);
		
		return "success";
	}
	
	@ResponseBody
	@GetMapping("/gloExcel")
	public ModelAndView excelGET(@ModelAttribute("cri") ModelAndView model, ExcelViewGlo excelViewglo, SearchCriteria cri) throws SQLException {
		
		logger.info("GETgloExcel");
		
		if(cri.getSite() == "" || "사이트".equals(cri.getSite()) ) {
			cri.setSite(null);
		}
		if(cri.getNation() == null || cri.getNation().equals("국가")) {
			cri.setNation(null);
		}
		if(cri.getSelectKey() == null || cri.getSelectKey().equals("키워드")) {
			cri.setSelectKey(null);
		}
		if(cri.getTextType() == null || cri.getTextType().equals("검출상태")) {
			cri.setTextType(null);
		}
		if(cri.getWork().equals("전체")) {
			cri.setWork(null);
		}
		if("undefined".equals(cri.getStartDate()) || "undefined".equals(cri.getEndDate())
				|| cri.getStartDate() == "" || cri.getEndDate() == ""){
			cri.setStartDate(null);
			cri.setEndDate(null);
		
		} 
		if(cri.getStartDate() != null && cri.getEndDate() != null) {
			if(cri.getStartDate().indexOf("00:00:00") < 0 && cri.getEndDate().indexOf("23:59:59") < 0){ 
				cri.setStartDate(cri.getStartDate() + " 00:00:00"); 
				cri.setEndDate(cri.getEndDate() + " 23:59:59"); 
			}
		}
		if(cri.getKeyword() == "" || "undefined".equals(cri.getKeyword()))  {
			cri.setKeyword(null);
		} 
		
		logger.info("MODALExcel cri: " + cri);

		ListUtil util = new ListUtil();
		List<GloVO> gloList = new ArrayList<GloVO>();
		
		model.addObject("gloList", util.listAddGloList(gloList, gloService.detailExcel(cri)));
		model.setView(excelViewglo);
		
		return model;
	}

}
