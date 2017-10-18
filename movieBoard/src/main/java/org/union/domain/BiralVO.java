package org.union.domain;

import java.util.Date;

public class BiralVO {

	
	private Integer biral_idx;
	private Integer user_idx;
	private Integer biral_isUser;
	private Integer biral_rank;
	private String biral_title;
	private Date writeDate;
	private String keyword;
	private String url;
	private String textType;
	private String thumbnail;
	private Date createDate;
	private Date updateDate;
	
	
	public Integer getBiral_idx() {
		return biral_idx;
	}
	public void setBiral_idx(Integer biral_idx) {
		this.biral_idx = biral_idx;
	}
	public Integer getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(Integer user_idx) {
		this.user_idx = user_idx;
	}
	public Integer getBiral_isUser() {
		return biral_isUser;
	}
	public void setBiral_isUser(Integer biral_isUser) {
		this.biral_isUser = biral_isUser;
	}
	public Integer getBiral_rank() {
		return biral_rank;
	}
	public void setBiral_rank(Integer biral_rank) {
		this.biral_rank = biral_rank;
	}
	public String getBiral_title() {
		return biral_title;
	}
	public void setBiral_title(String biral_title) {
		this.biral_title = biral_title;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getTextType() {
		return textType;
	}
	public void setTextType(String textType) {
		this.textType = textType;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
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
		return "BiralVO [biral_idx=" + biral_idx + ", user_idx=" + user_idx + ", biral_isUser=" + biral_isUser
				+ ", biral_rank=" + biral_rank + ", biral_title=" + biral_title + ", writeDate=" + writeDate
				+ ", keyword=" + keyword + ", url=" + url + ", textType=" + textType + ", thumbnail=" + thumbnail
				+ ", createDate=" + createDate + ", updateDate=" + updateDate + "]";
	}
	
}
