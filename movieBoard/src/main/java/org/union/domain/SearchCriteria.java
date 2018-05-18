package org.union.domain;



public class SearchCriteria extends Criteria {

	
	private String searchType, keyword, selectKey, company, textType, portal_name, portal_type, hour, url;
	private Integer total;
	private String startDate, endDate, createstartDate, createendDate, createminusDate;

	
	public String getPortal_name() {
		return portal_name;
	}


	public String getHour() {
	    return hour;
	}


	public void setHour(String hour) {
	    this.hour = hour;
	}


	public void setPortal_name(String portal_name) {
		this.portal_name = portal_name;
	}


	public String getPortal_type() {
		return portal_type;
	}


	public void setPortal_type(String portal_type) {
		this.portal_type = portal_type;
	}


	public SearchCriteria(){
	}

	
	public String getSearchType() {
		
		if(this.searchType == null){
			this.searchType = "t";
		}
		
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}
	

	public String getSelectKey() {
		return selectKey;
	}


	public void setSelectKey(String selectKey) {
		this.selectKey = selectKey;
	}


	public String getStartDate() {
		return startDate;
	}


	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}


	public String getEndDate() {
		return endDate;
	}


	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}


	public String getCompany() {
		
		return company;
		
	}


	public void setCompany(String company) {
		
		this.company = company;
	}

	

	public String getTextType() {
		return textType;
	}


	public void setTextType(String textType) {
		this.textType = textType;
	}

	
	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}


	public String getCreatestartDate() {
		return createstartDate;
	}


	public void setCreatestartDate(String createstartDate) {
		this.createstartDate = createstartDate;
	}


	public String getCreateendDate() {
		return createendDate;
	}


	public void setCreateendDate(String createendDate) {
		this.createendDate = createendDate;
	}
	
	public String getCreateminusDate() {
		return createminusDate;
	}


	public void setCreateminusDate(String createminusDate) {
		this.createminusDate = createminusDate;
	}

	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + ", selectKey=" + selectKey
				+ ", company=" + company + ", textType=" + textType + ", portal_name=" + portal_name + ", portal_type="
				+ portal_type + ", hour=" + hour + ", url=" + url + ", total=" + total + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", createstartDate=" + createstartDate + ", createendDate=" + createendDate
				+ ", createminusDate=" + createminusDate + "]";
	}

}
