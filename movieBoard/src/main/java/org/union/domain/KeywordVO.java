package org.union.domain;

import java.util.Date;

public class KeywordVO {

	
	private Integer keyword_idx;
	private Integer user_idx;
	private String keyword;
	private Integer keyword_type; 
	private String keyword_property; // 제외 or 포함
	private Date createDate;
	private Date updateDate;
	
	
	public Integer getKeyword_idx() {
		return keyword_idx;
	}
	public void setKeyword_idx(Integer keyword_idx) {
		this.keyword_idx = keyword_idx;
	}
	public Integer getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(Integer user_idx) {
		this.user_idx = user_idx;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public Integer getKeyword_type() {
		return keyword_type;
	}
	public void setKeyword_type(Integer keyword_type) {
		this.keyword_type = keyword_type;
	}
	public String getKeyword_property() {
		return keyword_property;
	}
	public void setKeyword_property(String keyword_property) {
		this.keyword_property = keyword_property;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
	
	@Override
	public String toString() {
		return "KeywordVO [keyword_idx=" + keyword_idx + ", user_idx=" + user_idx + ", keyword=" + keyword
				+ ", keyword_type=" + keyword_type + ", keyword_property=" + keyword_property + ", createDate="
				+ createDate + ", updateDate=" + updateDate + "]";
	}
	
}
