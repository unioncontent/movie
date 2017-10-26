package org.union.domain;


public class Criteria {

	private Integer pageUnit, page;


	public void getSearchVO() {

	}

	public void setSearchVO() {

	}

	public Integer getStartPage() {
		return (this.page - 1) * pageUnit;
	}

	public Criteria() {
		this.pageUnit = 10;
		this.page = 1;
	}

	public Integer getPageUnit() {
		return pageUnit;
	}

	public void setPageUnit(Integer pageUnit) {

		if (pageUnit <= 0 || pageUnit > 90) {
			this.pageUnit = 9;
			return;
		}

		this.pageUnit = pageUnit;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {

		if (page <= 0) {
			this.page = 1;
			return;
		}

		this.page = page;
	}

	@Override
	public String toString() {
		return "PageVO [pageUnit=" + pageUnit + ", page=" + page + "]";
	}
}
