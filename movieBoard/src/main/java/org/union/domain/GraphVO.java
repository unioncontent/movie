package org.union.domain;

public class GraphVO {

	
	private String startDate;
	private String endDate;
	private String sns_name;
	
	
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
	
	@Override
	public String toString() {
		return "GraphVO [startDate=" + startDate + ", endDate=" + endDate + ", sns_name=" + sns_name + "]";
	}
	
	
}
