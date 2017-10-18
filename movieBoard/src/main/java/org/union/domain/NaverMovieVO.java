package org.union.domain;

import java.util.Date;

public class NaverMovieVO {

	
	private Integer NM_idx;
	private String NM_title;
	private String NM_media_name;
	private String NM_reporter_name;
	private String NM_reporter_ID;
	private String NM_reporter_email;
	private Date writeDate;
	private String keyword;
	private Integer keyword_type;
	private String url;
	private String textType;
	private String thumbnail;
	private Date createDate;
	private Date updateDate;
	
	
	public Integer getNM_idx() {
		return NM_idx;
	}
	public void setNM_idx(Integer nM_idx) {
		NM_idx = nM_idx;
	}
	public String getNM_title() {
		return NM_title;
	}
	public void setNM_title(String nM_title) {
		NM_title = nM_title;
	}
	public String getNM_media_name() {
		return NM_media_name;
	}
	public void setNM_media_name(String nM_media_name) {
		NM_media_name = nM_media_name;
	}
	public String getNM_reporter_name() {
		return NM_reporter_name;
	}
	public void setNM_reporter_name(String nM_reporter_name) {
		NM_reporter_name = nM_reporter_name;
	}
	public String getNM_reporter_ID() {
		return NM_reporter_ID;
	}
	public void setNM_reporter_ID(String nM_reporter_ID) {
		NM_reporter_ID = nM_reporter_ID;
	}
	public String getNM_reporter_email() {
		return NM_reporter_email;
	}
	public void setNM_reporter_email(String nM_reporter_email) {
		NM_reporter_email = nM_reporter_email;
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
	public Integer getKeyword_type() {
		return keyword_type;
	}
	public void setKeyword_type(Integer keyword_type) {
		this.keyword_type = keyword_type;
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
		return "NaverMovieVO [NM_idx=" + NM_idx + ", NM_title=" + NM_title + ", NM_media_name=" + NM_media_name
				+ ", NM_reporter_name=" + NM_reporter_name + ", NM_reporter_ID=" + NM_reporter_ID
				+ ", NM_reporter_email=" + NM_reporter_email + ", writeDate=" + writeDate + ", keyword=" + keyword
				+ ", keyword_type=" + keyword_type + ", url=" + url + ", textType=" + textType + ", thumbnail="
				+ thumbnail + ", createDate=" + createDate + ", updateDate=" + updateDate + "]";
	}
	
}
