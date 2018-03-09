package org.union.domain;

import java.util.Date;

public class NewsVO {
	
	private Integer news_idx;
	private String company_name;
	private String media_name;
	private String media_title;
	private String reporter_name;
	private String writeDate; 
	private String title_key;
	private String keyword;
	private String url;
	private String news_type;
	private Integer news_state;
	private Date createDate;
	private Date updateDate;
	
	public NewsVO() {
		super();
	}

	public NewsVO(Integer news_idx, String company_name, String media_name, String media_title, String reporter_name,
			String writeDate, String title_key, String keyword, String url, String news_type, Integer news_state,
			Date createDate, Date updateDate) {
		super();
		this.news_idx = news_idx;
		this.company_name = company_name;
		this.media_name = media_name;
		this.media_title = media_title;
		this.reporter_name = reporter_name;
		this.writeDate = writeDate;
		this.title_key = title_key;
		this.keyword = keyword;
		this.url = url;
		this.news_type = news_type;
		this.news_state = news_state;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}

	public Integer getNews_idx() {
		return news_idx;
	}

	public void setNews_idx(Integer news_idx) {
		this.news_idx = news_idx;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
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

	public String getReporter_name() {
		return reporter_name;
	}

	public void setReporter_name(String reporter_name) {
		this.reporter_name = reporter_name;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public String getTitle_key() {
		return title_key;
	}

	public void setTitle_key(String title_key) {
		this.title_key = title_key;
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

	public String getNews_type() {
		return news_type;
	}

	public void setNews_type(String news_type) {
		this.news_type = news_type;
	}

	public Integer getNews_state() {
		return news_state;
	}

	public void setNews_state(Integer news_state) {
		this.news_state = news_state;
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
}
