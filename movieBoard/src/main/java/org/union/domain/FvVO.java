package org.union.domain;

import java.util.Date;

public class FvVO {

	private Integer sns_idx;
	private String sns_name;
	private String sns_content;
	private String sns_writer;
	private String url;
	private Integer view_cnt;
	private Integer like_cnt;
	private Integer reply_cnt;
	private Integer share_cnt;
	private String writeDate;
	private String uid;
	private String title_key;
	private String keyword;
	private String keyword_type;
	private String textType;
	private String thumbnail;
	private Date createDate;
	private Date updateDate;
	
	public Integer getSns_idx() {
		return sns_idx;
	}
	public void setSns_idx(Integer sns_idx) {
		this.sns_idx = sns_idx;
	}
	public String getSns_name() {
		return sns_name;
	}
	public void setSns_name(String sns_name) {
		this.sns_name = sns_name;
	}
	public String getSns_content() {
		return sns_content;
	}
	public void setSns_content(String sns_content) {
		this.sns_content = sns_content;
	}
	public String getSns_writer() {
		return sns_writer;
	}
	public void setSns_writer(String sns_writer) {
		this.sns_writer = sns_writer;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Integer getView_cnt() {
		return view_cnt;
	}
	public void setView_cnt(Integer view_cnt) {
		this.view_cnt = view_cnt;
	}
	public Integer getLike_cnt() {
		return like_cnt;
	}
	public void setLike_cnt(Integer like_cnt) {
		this.like_cnt = like_cnt;
	}
	public Integer getReply_cnt() {
		return reply_cnt;
	}
	public void setReply_cnt(Integer reply_cnt) {
		this.reply_cnt = reply_cnt;
	}
	public Integer getShare_cnt() {
		return share_cnt;
	}
	public void setShare_cnt(Integer share_cnt) {
		this.share_cnt = share_cnt;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
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
	public String getKeyword_type() {
		return keyword_type;
	}
	public void setKeyword_type(String keyword_type) {
		this.keyword_type = keyword_type;
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
		return "FvVO [sns_idx=" + sns_idx + ", sns_name=" + sns_name + ", sns_content=" + sns_content + ", sns_writer="
				+ sns_writer + ", url=" + url + ", view_cnt=" + view_cnt + ", like_cnt=" + like_cnt + ", reply_cnt="
				+ reply_cnt + ", share_cnt=" + share_cnt + ", writeDate=" + writeDate + ", uid=" + uid + ", title_key="
				+ title_key + ", keyword=" + keyword + ", keyword_type=" + keyword_type + ", textType=" + textType
				+ ", thumbnail=" + thumbnail + ", createDate=" + createDate + ", updateDate=" + updateDate + "]";
	}
	
	
}