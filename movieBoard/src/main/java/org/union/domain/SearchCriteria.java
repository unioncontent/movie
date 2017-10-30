package org.union.domain;

public class SearchCriteria extends Criteria {

	
	private String searchType, keyword, selectKey;
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
	

	public String getSelectKey() {
		return selectKey;
	}


	public void setSelectKey(String selectKey) {
		this.selectKey = selectKey;
	}


	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + ", selectKey=" + selectKey
				+ ", total=" + total + "]";
	}

	
}
