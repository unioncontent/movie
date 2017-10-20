package org.union.domain;

public class SearchVO extends PageVO {

	
	private String searchType, keyword, orderType;
	private Integer total;

	public SearchVO(){
	}

	public String getSearchType() {
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

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "SearchVO [searchType=" + searchType + ", keyword=" + keyword + ", orderType=" + orderType + ", total="
				+ total + "]";
	}
}
