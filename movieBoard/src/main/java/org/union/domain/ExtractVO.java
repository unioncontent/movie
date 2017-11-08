package org.union.domain;

public class ExtractVO {

	
	private String domain, domainType, company,keyword, title, content, writeDate, createDate, url, textType;
	private Integer sns_idx, community_idx, media_idx, portal_idx;
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	public String getDomainType() {
		return domainType;
	}
	public void setDomainType(String domainType) {
		this.domainType = domainType;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
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
	public Integer getSns_idx() {
		return sns_idx;
	}
	public void setSns_idx(Integer sns_idx) {
		this.sns_idx = sns_idx;
	}
	public Integer getCommunity_idx() {
		return community_idx;
	}
	public void setCommunity_idx(Integer community_idx) {
		this.community_idx = community_idx;
	}
	public Integer getMedia_idx() {
		return media_idx;
	}
	public void setMedia_idx(Integer media_idx) {
		this.media_idx = media_idx;
	}
	public Integer getPortal_idx() {
		return portal_idx;
	}
	public void setPortal_idx(Integer portal_idx) {
		this.portal_idx = portal_idx;
	}
	@Override
	public String toString() {
		return "ExtractVO [domain=" + domain + ", domainType=" + domainType + ", company=" + company + ", keyword="
				+ keyword + ", title=" + title + ", content=" + content + ", writeDate=" + writeDate + ", createDate="
				+ createDate + ", url=" + url + ", textType=" + textType + ", sns_idx=" + sns_idx + ", community_idx="
				+ community_idx + ", media_idx=" + media_idx + ", portal_idx=" + portal_idx + "]";
	}
	
	
	
}
