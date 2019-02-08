package org.union.domain;


public class KeywordListVO {

	private String keyword_main, company;
	
	private Integer first, second;
	
	private String createDate;
	
	private String keyword_state;

	public String getKeyword_main() {
		return keyword_main;
	}

	public void setKeyword_main(String keyword_main) {
		this.keyword_main = keyword_main;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public Integer getFirst() {
		return first;
	}

	public void setFirst(Integer first) {
		this.first = first;
	}

	public Integer getSecond() {
		return second;
	}

	public void setSecond(Integer second) {
		this.second = second;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	
	public String getKeyword_state() {
		return keyword_state;
	}

	public void setKeyword_state(String keyword_state) {
		this.keyword_state = keyword_state;
	}

	@Override
	public String toString() {
		return "KeywordListVO [keyword_main=" + keyword_main + ", company=" + company + ", first=" + first + ", second="
				+ second + ", createDate=" + createDate + ", keyword_state=" + keyword_state + "]";
	}
}
