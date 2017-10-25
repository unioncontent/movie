package org.union.domain;

public class SearchCriteria extends Criteria {

	
	private String searchType, keyword;
	private Integer total;

	
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
	

	@Override
	public String toString() {
		return "SearchVO [searchType=" + searchType + ", keyword=" + keyword + ", total=" + total + "]";
	}
	
}
