package org.union.domain;

public class GraphVO {

	
	private String startDate;
	private String endDate;
	private String sns_name;
	private String writeDate;
	private Integer likeCount;
	private Integer shareCount;
	private Integer replyCount;
	private Integer facebookCount, instagramCount, twitterCount;
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getSns_name() {
		return sns_name;
	}
	public void setSns_name(String sns_name) {
		this.sns_name = sns_name;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public Integer getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(Integer likeCount) {
		this.likeCount = likeCount;
	}
	public Integer getShareCount() {
		return shareCount;
	}
	public void setShareCount(Integer shareCount) {
		this.shareCount = shareCount;
	}
	public Integer getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(Integer replyCount) {
		this.replyCount = replyCount;
	}
	public Integer getFacebookCount() {
		return facebookCount;
	}
	public void setFacebookCount(Integer facebookCount) {
		this.facebookCount = facebookCount;
	}
	public Integer getInstagramCount() {
		return instagramCount;
	}
	public void setInstagramCount(Integer instagramCount) {
		this.instagramCount = instagramCount;
	}
	public Integer getTwitterCount() {
		return twitterCount;
	}
	public void setTwitterCount(Integer twitterCount) {
		this.twitterCount = twitterCount;
	}
	@Override
	public String toString() {
		return "GraphVO [startDate=" + startDate + ", endDate=" + endDate + ", sns_name=" + sns_name + ", writeDate="
				+ writeDate + ", likeCount=" + likeCount + ", shareCount=" + shareCount + ", replyCount=" + replyCount
				+ ", facebookCount=" + facebookCount + ", instagramCount=" + instagramCount + ", twitterCount="
				+ twitterCount + "]";
	}
	
}
