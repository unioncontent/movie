package org.union.domain;



public class SearchCriteria extends Criteria {

	
	private String searchType, keyword, selectKey, company;
	private Integer total;
	private String startDate, endDate;

	
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


	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + ", selectKey=" + selectKey
				+ ", company=" + company + ", total=" + total + ", startDate=" + startDate + ", endDate=" + endDate
				+ "]";
	}


}
