package org.union.domain;

import java.util.Date;

public class PortalVO {

	
	private Integer portal_idx;
	private String portal_name;
	private String protal_type;
	private String portal_title;
	private Integer deviceType; // 1 = PC, 2 = Mobile
	private Date writeDate;
	private String keyword;
	private String keyword_type;
	private String url;
	private String textType;
	private String thumbnail;
	private Date createDate;
	private Date updateDate;
	
	
	public Integer getPortal_idx() {
		return portal_idx;
	}
	public void setPortal_idx(Integer portal_idx) {
		this.portal_idx = portal_idx;
	}
	public String getPortal_name() {
		return portal_name;
	}
	public void setPortal_name(String portal_name) {
		this.portal_name = portal_name;
	}
	public String getProtal_type() {
		return protal_type;
	}
	public void setProtal_type(String protal_type) {
		this.protal_type = protal_type;
	}
	public String getPortal_title() {
		return portal_title;
	}
	public void setPortal_title(String portal_title) {
		this.portal_title = portal_title;
	}
	public Integer getDeviceType() {
		return deviceType;
	}
	public void setDeviceType(Integer deviceType) {
		this.deviceType = deviceType;
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
		return "PortalVO [portal_idx=" + portal_idx + ", portal_name=" + portal_name + ", protal_type=" + protal_type
				+ ", portal_title=" + portal_title + ", deviceType=" + deviceType + ", writeDate=" + writeDate
				+ ", keyword=" + keyword + ", keyword_type=" + keyword_type + ", url=" + url + ", textType=" + textType
				+ ", thumbnail=" + thumbnail + ", createDate=" + createDate + ", updateDate=" + updateDate + "]";
	}
	
}
