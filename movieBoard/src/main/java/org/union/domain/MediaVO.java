package org.union.domain;

import java.util.Date;

public class MediaVO {

	
	private Integer media_idx;
	private String media_name;
	private String media_title;
	private String media_content;
	private String reporter_name;
	private String reporter_ID;
	private String reporter_email;
	private Date writeDate;
	private String keyword;
	private String keyword_type;
	private String url;
	private String textType;
	private String thumbnail;
	private Date createDate;
	private Date updateDate;
	
	
	public Integer getMedia_idx() {
		return media_idx;
	}
	public void setMedia_idx(Integer media_idx) {
		this.media_idx = media_idx;
	}
	public String getMedia_name() {
		return media_name;
	}
	public void setMedia_name(String media_name) {
		this.media_name = media_name;
	}
	public String getMedia_title() {
		return media_title;
	}
	public void setMedia_title(String media_title) {
		this.media_title = media_title;
	}
	public String getMedia_content() {
		return media_content;
	}
	public void setMedia_content(String media_content) {
		this.media_content = media_content;
	}
	public String getReporter_name() {
		return reporter_name;
	}
	public void setReporter_name(String reporter_name) {
		this.reporter_name = reporter_name;
	}
	public String getReporter_ID() {
		return reporter_ID;
	}
	public void setReporter_ID(String reporter_ID) {
		this.reporter_ID = reporter_ID;
	}
	public String getReporter_email() {
		return reporter_email;
	}
	public void setReporter_email(String reporter_email) {
		this.reporter_email = reporter_email;
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
	public String getKeyword_type() {
		return keyword_type;
	}
	public void setKeyword_type(String keyword_type) {
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
		return "MediaVO [media_idx=" + media_idx + ", media_name=" + media_name + ", media_title=" + media_title
				+ ", media_content=" + media_content + ", reporter_name=" + reporter_name + ", reporter_ID="
				+ reporter_ID + ", reporter_email=" + reporter_email + ", writeDate=" + writeDate + ", keyword="
				+ keyword + ", keyword_type=" + keyword_type + ", url=" + url + ", textType=" + textType
				+ ", thumbnail=" + thumbnail + ", createDate=" + createDate + ", updateDate=" + updateDate + "]";
	}
	
}
