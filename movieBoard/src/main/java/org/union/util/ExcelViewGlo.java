package org.union.util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.util.CellRangeAddress;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsView;
import org.union.domain.GloVO;

public class ExcelViewGlo extends AbstractXlsView {

	@Override
    protected void buildExcelDocument(Map<String, Object> model, Workbook wb, HttpServletRequest request,
	    HttpServletResponse response) throws Exception {

	try {

	    System.out.println("GloExcelView called....");
	
	
	    HSSFSheet sheet = (HSSFSheet) wb.createSheet();
	    int rowIdx = 0;
	    
	    HSSFCellStyle titleStyle = (HSSFCellStyle) wb.createCellStyle();
	    titleStyle.setFillForegroundColor(HSSFColor.LIGHT_YELLOW.index);
	    titleStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
	    titleStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
	    titleStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    titleStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
	    titleStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	    titleStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
	    
	    List<GloVO> glolist = (List) model.get("gloList");
	    sheet.addMergedRegion(new CellRangeAddress(0,0,0,5));
	    
	    HSSFRow siteRow = sheet.createRow(rowIdx++);
	    HSSFCell cellTitle = siteRow.createCell(0);
	    HSSFCell cellTitle2 = siteRow.createCell(5);
	    cellTitle.setCellValue(new HSSFRichTextString(glolist.get(0).getGlo_site()));
	    cellTitle.setCellStyle(titleStyle);
	    cellTitle2.setCellStyle(titleStyle);
	    
		// 타이틀 설정
	    String[] titleList = { "검토", "키워드", "제목", "검출일", "검출상태","마지막검출"};
		
	    HSSFRow titleRow = sheet.createRow(rowIdx++);
		for (int i = 0; i < titleList.length; i++) {
		    HSSFCell cell = titleRow.createCell(i);
		    cell.setCellValue(new HSSFRichTextString(titleList[i]));
		    cell.setCellStyle(titleStyle);
		}
	
		// 엑셀 서식 설정
		HSSFCellStyle numStyle = (HSSFCellStyle) wb.createCellStyle();
	
		numStyle.setDataFormat(wb.createDataFormat().getFormat("#,##0"));
	
		HSSFCellStyle percentStyle = (HSSFCellStyle) wb.createCellStyle();
		percentStyle.setDataFormat(wb.createDataFormat().getFormat("0%"));
	
		HSSFCellStyle dateStyle = (HSSFCellStyle) wb.createCellStyle();
		dateStyle.setDataFormat(wb.createDataFormat().getFormat("yyyy/mm/dd"));
	
	
		// 데이터 추가
		List<GloVO> list = (List) model.get("gloList");
		
			for (GloVO vo : list) {
			    HSSFRow dataRow = sheet.createRow(rowIdx++);
		    	
		    	HSSFCell workCell = dataRow.createCell(0);
		    	workCell.setCellValue(new HSSFRichTextString(vo.getGlo_work()));
			    
			    HSSFCell kwordCell = dataRow.createCell(1);
			    kwordCell.setCellValue(new HSSFRichTextString(vo.getGlo_k_word()));
			    
			    HSSFCell titleCell = dataRow.createCell(2);
			    titleCell.setCellValue(new HSSFRichTextString(vo.getGlo_title()));
			    
				HSSFCell regdateCell = dataRow.createCell(3);
				regdateCell.setCellValue(new HSSFRichTextString(vo.getRegdate()));
				
				HSSFCell delCheckCell = dataRow.createCell(4);
				delCheckCell.setCellValue(new HSSFRichTextString(vo.getGlo_del_chk()));
				
				HSSFCell workDateCell = dataRow.createCell(5);
				workDateCell.setCellValue(new HSSFRichTextString(vo.getWork_date()));
			}
			
			for (int i = 0; i < titleList.length; i++) {
			    sheet.autoSizeColumn((short)i);
			}
		
			// 파일 다운로드 시작
		    String fileInfo = String.format("attachment; filename=\"" + createFileName() + "\"");
		    response.setContentType("application/x-msdownload");
		    response.setHeader("Content-Disposition", fileInfo);
		    System.out.println("fileInfo: " + fileInfo);
		    System.out.println("response: " + response);



	} catch (Exception e) {
	    e.printStackTrace();
	    throw new RuntimeException(e.getMessage());

	}

    }
    private String createFileName() {
	SimpleDateFormat fileFormat = new SimpleDateFormat("yyyyMMdd_HHmmss");
	return new StringBuilder("unioncontent")
		.append("-").append(fileFormat.format(new Date())).append(".xls").toString();
    }


}
