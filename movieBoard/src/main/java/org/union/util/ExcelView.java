package org.union.util;

import java.text.SimpleDateFormat;
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
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsView;
import org.union.domain.ExtractVO;

public class ExcelView extends AbstractXlsView {

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook wb, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		try {
			
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
			  
			  // 타이틀 설정
			  String[] titleList = { "사이트", "키워드", "제목","내용","URL","작성날짜", "분류"};
			 
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
			  List<ExtractVO> list = (List) model.get("list");
			  
			  for (ExtractVO vo : list) {
			   HSSFRow dataRow = sheet.createRow(rowIdx++);
			   
			    HSSFCell domainCell = dataRow.createCell(0);
			    domainCell.setCellValue(new HSSFRichTextString(vo.getDomainType()));
			    
			    HSSFCell keywordCell = dataRow.createCell(1);
			    
			    keywordCell.setCellValue(new HSSFRichTextString(vo.getKeyword()));
			    
			    HSSFCell titleCell = dataRow.createCell(2);
			    titleCell.setCellValue(new HSSFRichTextString(vo.getTitle()));

			    HSSFCell contentCell = dataRow.createCell(3);
			    contentCell.setCellValue(new HSSFRichTextString(vo.getContent()));
			    
			    HSSFCell dateCell = dataRow.createCell(4);
			    dateCell.setCellValue(new HSSFRichTextString(vo.getUrl()));
			    
			    HSSFCell urlCell = dataRow.createCell(5);
			    urlCell.setCellValue(new HSSFRichTextString(vo.getWriteDate()));
			    
			    HSSFCell classiCell = dataRow.createCell(6);
			    classiCell.setCellValue(new HSSFRichTextString(vo.getTextType()));
			  

			  }

			  for (int i = 0; i < titleList.length; i++) {
			   sheet.autoSizeColumn((short)i);
			  }

			  // 파일 다운로드 시작
			  String fileInfo = String.format("attachment; filename=\"" + createFileName() + "\"");
			  response.setHeader("Content-Disposition", fileInfo);
			  
			 
			 
			 
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
			
		}

	}
		private String createFileName() {
			  SimpleDateFormat fileFormat = new SimpleDateFormat("yyyyMMdd_HHmmss");
			  return new StringBuilder("User")
			    .append("-").append(fileFormat.format(new Date())).append(".xls").toString();
			 }


}
