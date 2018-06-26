//일별은 전날 날짜로 검색 - key,targetDt
//http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=0c4c68be2ac6da9c6283754c7fdac877&targetDt=20180614
// 주말/주간 - key,targetDt,weekGb
//http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json?key=0c4c68be2ac6da9c6283754c7fdac877&targetDt=20180604&weekGb=0
// key : 0c4c68be2ac6da9c6283754c7fdac877
function KobisOpenAPIRestService(key,host){
	this.key = key;
	this.host = host? host:"http://www.kobis.or.kr";
	this.DAILY_BOXOFFICE_URI = "/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList";
	this.WEEKLY_BOXOFFICE_URI = "/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList";
	this.COM_CODE_LIST_URI = "/kobisopenapi/webservice/rest/code/searchCodeList";
	this.MOVIE_LIST_URI = "/kobisopenapi/webservice/rest/movie/searchMovieList";
	this.MOVIE_INFO_URI = "/kobisopenapi/webservice/rest/movie/searchMovieInfo";
	this.COMPANY_LIST_URI = "/kobisopenapi/webservice/rest/company/searchCompanyList";
	this.COMPANY_INFO_URI = "/kobisopenapi/webservice/rest/company/searchCompanyInfo";
	this.PEOPLE_LIST_URI = "/kobisopenapi/webservice/rest/people/searchPeopleList";
	this.PEOPLE_INFO_URI = "/kobisopenapi/webservice/rest/people/searchPeopleInfo";
}
function KobisOpenAPIError(message) {
	 this.message = message;
}
KobisOpenAPIError.prototype = new Error;
KobisOpenAPIRestService.prototype.requestGet
=  function(key, host, serviceURI, isJson, paramMap){
		var urlStr = host + serviceURI+(isJson?'.json':'.xml');
		var retVal = null;
		$.extend(paramMap,{key:this.key});
		$.ajax({
			type: "get",
			url : urlStr,
			data : paramMap,
			success:function(responseData){
				retVal = responseData;
			},
			error:function(jqXHR, textStatus, err){
				throw new KobisOpenAPIError(jqXHR.responseText);
			},
			dataType: isJson?"json":"xml",
			async : false
		});
		return retVal;
	};
	KobisOpenAPIRestService.prototype.getDailyBoxOffice
	=  function(isJson, paramMap){
		return this.requestGet(this.key, this.host, this.DAILY_BOXOFFICE_URI, isJson, paramMap);

	};
	KobisOpenAPIRestService.prototype.getWeeklyBoxOffice
	=  function(isJson, paramMap){
		return this.requestGet(this.key, this.host, this.WEEKLY_BOXOFFICE_URI, isJson, paramMap);

	};
	KobisOpenAPIRestService.prototype.getComCodeList
	=  function(isJson, paramMap){
		return this.requestGet(this.key, this.host, this.COM_CODE_LIST_URI, isJson, paramMap);

	};
	KobisOpenAPIRestService.prototype.getMovieList
	=  function(isJson, paramMap){
		return this.requestGet(this.key, this.host, this.MOVIE_LIST_URI, isJson, paramMap);

	};

	KobisOpenAPIRestService.prototype.getMovieInfo
	=  function(isJson, paramMap){
		return this.requestGet(this.key, this.host, this.MOVIE_INFO_URI, isJson, paramMap);

	};
	KobisOpenAPIRestService.prototype.getCompanyList
	=  function(isJson, paramMap){
		return this.requestGet(this.key, this.host, this.COMPANY_LIST_URI, isJson, paramMap);

	};

	KobisOpenAPIRestService.prototype.getCompnayInfo
	=  function(isJson, paramMap){
		return this.requestGet(this.key, this.host, this.COMPANY_INFO_URI, isJson, paramMap);

	};
	KobisOpenAPIRestService.prototype.getPeopleList
	=  function(isJson, paramMap){
		return this.requestGet(this.key, this.host, this.PEOPLE_LIST_URI, isJson, paramMap);

	};

	KobisOpenAPIRestService.prototype.getPeopleInfo
	=  function(isJson, paramMap){
		return this.requestGet(this.key, this.host, this.PEOPLE_INFO_URI, isJson, paramMap);

	};
