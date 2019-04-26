<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<!-- Meta -->
<meta charset="utf-8">
<meta name="_csrf" content="${_csrf.token}" />
<!-- default header name is X-CSRF-TOKEN -->
<meta name="_csrf_header" content="${_csrf.headerName}" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="Phoenixcoded">
<meta name="keywords" content="flat ui, admin , Flat ui, Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
<meta name="author" content="Phoenixcoded">
<link rel="stylesheet" type="text/css" href="../assets/pages/glo/css/style.css">
</head>
<body>
							<div class="modal-header">
                              <h5 class="modal-title">${site} 상세보기</h5>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true"><i class="icofont icofont-close-line"></i></span>
                              </button>
                            </div>
                            <div class="modal-body">
                              <div class="col-lg-12">
                              	<div class="row">
                              	<div class="col-lg-12">
                              	  <select id="selectNation" name="select" class="col-sm-1 form-control form-control-inverse m-r-5 m-b-5 m-t-5 f-left selectNation" style="height:40px; float: left;">
								      <option>국가</option>
									  <c:forEach items="${nationList}" var = "nationList">
									  	<option value="${nationList.glo_nation}">${nationList.glo_nation}</option>
									  </c:forEach>
							      </select>
                              	  <select id="selectSite" name="select" class="col-sm-1 form-control form-control-inverse m-r-5 m-b-5 m-t-5 f-left selectSite" style="height:40px; float: left;">
								      <option>사이트</option>
									  <c:forEach items="${siteList}" var = "siteList">
									  	<option value="${siteList.glo_site}">${siteList.glo_site}</option>
									  </c:forEach>
							      </select>
							      <select id="selectState" name="select" class="col-sm-1 form-control form-control-inverse m-r-5 m-b-5 m-t-5 f-left selectState" style="height:40px; float: left;">
								      <option>검출상태</option>
									  	<option value="0">유지</option>
									  	<option value="1">삭제</option>
							      </select>
							      <select id="selectKeyword" name="select" class="col-sm-1 form-control form-control-inverse m-r-5 m-b-5 m-t-5 f-left selectKeyword" style="height:40px; float: left;">
								      <option>키워드</option>
									  <c:forEach items="${keywordList}" var = "keywordList">
									  	<option value="${keywordList.keyword_main}">${keywordList.keyword_main}</option>
									  </c:forEach>
							      </select>
	                           	  <div class="col-sm-2 input-group input-group-button input-group-inverse p-l-0 p-r-0 m-r- 0 m-b-5 m-t-5 f-right btn-select" style="margin-right: 5px;">
		                              <input onkeyup="if(event.keyCode == 13){$('.btn-detail').trigger('click');};" id="keywordInput" type="text" class="form-control" placeholder="" style="height:40px;">
		                              <span class="input-group-addon" id="basic-addon1">
		                              <button id="searchBtn" class="btn btn-detail"><i class="icofont icofont-ui-search"></i></button>
		                              </span>
	                              </div>
	                              <select id = "selectSearchType" name="select" class="col-sm-1 form-control form-control-inverse m-r-5 m-b-5 m-t-5 f-right search-select" style="height:40px;">
	                              <option id="t" value="t">제목</option>
								  <option id="r" value="r">게시물번호</option>
	                              <option id="m" value="m">키워드</option>
	                            </select>
	                            <button class="btn btn-warning gloexcel f-left p-r-5 p-l-5 m-b-5 m-t-5" style="height:40px;"><i class="icofont icofont-download-alt"></i>EXCEL</button>
	                            </div>
	                            <div class="col-lg-12">
	                            	<div class="card" style="border-top: 0px solid; margin-top: 5px;">
	                            	<div class="card-block table-border-style table-responsivess">
	                            	<!-- list satart -->
                                         <table class="table table-detail">
                                         <c:if test="${empty detailList}">
	                                     <tbody>
									          <tr>
									          	<td style="vertical-align:middle;" align="center" height="150px">
									          	<input type="hidden" id="nation" value="${nation}">
									          	<input type="hidden" id="site" value="${site}">
												<input type="hidden" id="work" value="${work}">
									          	<h5 align="center">등록된 리스트가 없습니다.</h5>
									          	</td>
									          </tr>
								          </tbody>
								          </c:if>
								          <c:if test="${!empty detailList}">
								          <thead>
												<tr>
													<th width="1%">NO</th>
													<th width="1%">검토</th>
													<th width="1%">키워드</th>
													<th width="15%">제목</th>
													<th width="3%">검출일</th>
													<th width="1%">검출상태</th>
													<th width="3%">마지막검출</th>
													<th width="3%"></th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${detailList}" var="gloList" varStatus="index">
													<tr class="trList">
														<th scope="row">
														<input type="hidden" id="selectKey" value="${selectKey}">
														<input type="hidden" id="textType" value="${state}">
														<input type="hidden" id="nation" value="${nation}">
														<input type="hidden" id="site" value="${site}">
											            <input type="hidden" id="work" value="${work}">
											            <div class="keyword-nowrap">
															${totalCount -index.count +1 -minusCount}
														</div>
														</th>
														<td>
															<input type="hidden" id="index" value="${index.count}">
															<select id = "selectWork${index.count}" name="select${index.count}" class="col-sm-1 form-control form-control-inverse m-r-5 m-b-5 m-t-5 f-left search-select" style="font-size: 12px; min-width: 95px;">
								                              <option value="0" <c:if test="${gloList.glo_work == 0}">selected</c:if>>보류</option>
								                              <option value="1" <c:if test="${gloList.glo_work == 1}">selected</c:if>>삭제요청</option>
								                              <option value="2" <c:if test="${gloList.glo_work == 2}">selected</c:if>>기관전달</option>
								                              <option value="3" <c:if test="${gloList.glo_work == 3}">selected</c:if>>기타</option>
								                            </select>
							                            </td>
							                            <td>${gloList.glo_k_word}</td>
							                            <td style="white-space: pre-line;">
							                            	<a href="${gloList.glo_url}" target="_blank" style="font-size: 12px;">${gloList.glo_title}</a>
								                            <%-- <div class="title-nowrap">
									                        	<a href="${gloList.glo_url}" target="_blank" style="font-size: 12px;"> ${gloList.glo_title} </a>
								                            </div> --%>
							                            </td>
							                            <td>
							                            	<div class="date-nowrap">
							                            		<fmt:formatDate value="${gloList.glo_regdate}" type="DATE" pattern="yyyy-MM-dd HH:mm:ss" />
							                            	</div>
							                            </td>
							                            <td>
							                            	<div class="keyword-nowrap">
							                            	<c:if test="${gloList.glo_del_chk == '0'}">유지</c:if>
							                            	<c:if test="${gloList.glo_del_chk == '1'}">삭제</c:if>
							                            	</div>
							                            </td>
							                            <td>
							                            	<div class="date-nowrap">
							                            		<fmt:formatDate value="${gloList.glo_work_date}" type="DATE" pattern="yyyy-MM-dd HH:mm:ss" />
							                            	</div>
							                            </td>
							                            <td>
							                            	<c:if test="${gloList.glo_idx != null}">
						                                      <input type="hidden" value="${gloList.glo_idx}">
						                                    </c:if>
							                            	<div class="btn-group btn-group-md text-center" style="min-width: 115px; padding-right: 0; text-align: center;">
						    							    <button type="button" class="insertBtn2 btn btn-list waves-effect waves-light alert-confirm1" style="margin-right: 5px;" data-toggle="tooltip" data-placement="top" data-original-title="키워드 추가">
						      								  수정
						    								</button>
						    								<button type="button" class="tabledit-delete-button btn btn-list waves-effect waves-light alert-confirm2" data-toggle="tooltip" data-placement="top" data-original-title="삭제">
						      								  삭제
						    								</button>
						  								  </div>
							                            </td>
													</tr>
												</c:forEach>
											</tbody>
											<tfoot>
                                          <tr>
                                            <td colspan="8">
                                               <ul class="pagination float-right">
	        					                   <c:if test="${pageMaker.prev}">
		        					                   <li class="page-item">
			        					                   <a class="page-link" value="${pageMaker.startPage - 1}" aria-label="Previous">&laquo;
				        					               <span aria-hidden="true"></span>
				        					               <span class="sr-only">Previous</span>
			        					                   </a>
		        					                   </li>
	        					                   </c:if>
        					                   <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
	        					                   <li class= "${pageMaker.cri.page == idx? 'active':''} page-item">
	        					                   	<a class="page-link" data-value="${idx}" value="${idx}">${idx}</a>
	        					                   </li>
        					                   </c:forEach>
        					                   <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	        					                   <li class="page-item">
		        					                   <a class="page-link" value="${pageMaker.endPage +1}" aria-label="Next">&raquo;
			        					               <span aria-hidden="true"></span>
			        					               <span class="sr-only">Next</span>
		        					                   </a>
	        					                   </li>
        					                   </c:if>
        					                   </ul>
                                            </td>
                                          </tr>
                                        </tfoot>
                                        </c:if>
									  	</table>
									  	</div>
									  </div>
									</div>
									</div>
                                  <!-- list end -->
                              </div>
                            </div>
                            <!-- <div class="modal-footer">
                              <button type="button" class="btn btn-default waves-effect " data-dismiss="modal" style="float: right;">Close</button>
                            </div> -->
</body>
<!-- Required Jquery -->
	<script type="text/javascript" src="../bower_components/jquery/dist/jquery.min.js"></script>
	<script type="text/javascript" src="../bower_components/jquery-ui/jquery-ui.min.js"></script>
	<script type="text/javascript" src="../bower_components/tether/dist/js/tether.min.js"></script>
	<script type="text/javascript" src="../bower_components/bootstrap/js/bootstrap.min.js"></script>
	<!-- jquery slimscroll js -->
	<script type="text/javascript" src="../bower_components/jquery-slimscroll/jquery.slimscroll.js"></script>
	<!-- modernizr js -->
	<script type="text/javascript" src="../bower_components/modernizr/modernizr.js"></script>
	<script type="text/javascript" src="../bower_components/modernizr/feature-detects/css-scrollbars.js"></script>
	<!-- classie js -->
	<script type="text/javascript" src="../bower_components/classie/classie.js"></script>
	<!-- Bootstrap date-time-picker js -->
	<script type="text/javascript" src="../assets/pages/advance-elements/moment-with-locales.min.js"></script>
	<!-- Date-range picker js -->
	<script type="text/javascript" src="../bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
	<!-- Date-time picker js -->
	<script type="text/javascript" src="../assets/pages/advance-elements/bootstrap-datetimepicker.min.js"></script>
	<!-- echart js -->
	<script src="../assets/pages/chart/echarts/js/echarts-all.js" type="text/javascript"></script>
	<!-- i18next.min.js -->
	<script type="text/javascript" src="../bower_components/i18next/i18next.min.js"></script>
	<script type="text/javascript" src="../bower_components/i18next-xhr-backend/i18nextXHRBackend.min.js"></script>
	<script type="text/javascript" src="../bower_components/i18next-browser-languagedetector/i18nextBrowserLanguageDetector.min.js"></script>
	<script type="text/javascript" src="../bower_components/jquery-i18next/jquery-i18next.min.js"></script>
	<!-- Custom js -->
	<script type="text/javascript" src="../assets/pages/naver/script.js"></script>
	<script type="text/javascript" src="../assets/pages/picker.js"></script>
	<script type="text/javascript" src="../assets/js/script.js"></script>
	<script src="../assets/js/pcoded.min.js"></script>
	<script src="../assets/js/demo-12.js"></script>
	<script src="../assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="../assets/js/jquery.mousewheel.min.js"></script>                   
<script type="text/javascript">
//ajax 보안
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");

$(function() {
	  $(document).ajaxSend(function(e, xhr, options) {
	  	xhr.setRequestHeader(header, token);
	  });
});

$(document).ready(function(){
	
	// 사이트 선택시
	var siteOption = $('#site').val();
	var $selectSite = $('.selectSite');
	 if(siteOption != 'undefined'){
		for(var i = 0; i < $selectSite[0].length; i++ ){
			if($selectSite[0].children[i].value == siteOption){
				$selectSite[0].children[i].selected = 'selected';
			}
		}
	}
	$selectSite[0][0].disabled = true;
	
	$selectSite.change(function(){
		console.log("selectSite clicked....");
		
		selectChange();
	});
	
	// 국가 선택시
	var nationOption = $('#nation').val();
	console.log("nationOption :"+nationOption);
	var $selectNation = $('.selectNation');
	if(nationOption != 'undefined'){
		for(var i = 0; i < $selectNation[0].length; i++ ){
			if($selectNation[0].children[i].value == nationOption){
				$selectNation[0].children[i].selected = 'selected';
			}
			
		}
		$selectNation[0][0].disabled = true;
		$('.selectNation').val($('.selectNation option:selected').val());
	}
	
	$selectNation.change(function(){
		console.log("selectSite clicked....");
		
		selectChange();
	});
	
	// 키워드 선택시
	var keywordOption = $('#selectKey').val();
	console.log("keywordOption :"+keywordOption);
	var $selectKeyword = $('.selectKeyword');
	if(keywordOption != "undefined"){
		for(var i = 0; i < $selectKeyword[0].length; i++ ){
			if($selectKeyword[0].children[i].value == keywordOption){
				$selectKeyword[0].children[i].selected = 'selected';
			}
		}
		$selectKeyword[0][0].disabled = true;
		$('.selectKeyword').val($('.selectKeyword option:selected').val());
	}
	
	$selectKeyword.change(function(){
		console.log("selectSite clicked....");
		
		selectChange();
	});
	
	// 상태 선택시
	var stateOption = $('#textType').val();
	var $selectState = $('.selectState');
	if(stateOption != "undefined"){
		for(var i = 0; i < $selectState[0].length; i++ ){
			if($selectState[0].children[i].value == stateOption){
				$selectState[0].children[i].selected = 'selected';
			}
		}
		$selectState[0][0].disabled = true;
		$('.selectState').val($('.selectState option:selected').val());
	}
	
	$selectState.change(function(){
		console.log("selectSite clicked....");
		
		selectChange();
	});
	
	//엑셀출력 확인메시지
	$(document).on("click",".gloexcel",function(){
	swal({
	      title: "엑셀출력 하시겠습니까?",
	      text: "현재 리스트가 엑셀출력 됩니다.",
	      type: "warning",
	      showCancelButton: true,
	      confirmButtonClass: "btn-danger",
	      confirmButtonText: "YES",
	      closeOnConfirm: true
	    },
	    function(){//엑셀 출력하겠다고 할 시 진행 함수
	    	var work = $('#work').val();
			if (work == ""){
				var work = "0";
			}
			self.location = "gloExcel?"
			  + "&work=" + work
			  + "&site=" + $('#site').val()
			  + "&startDate=" + decodeURI(window.location.href.split("startDate=")[1]).split("&")[0].split(" ")[0]
			  + "&endDate=" + decodeURI(window.location.href.split("endDate=")[1]).split("&")[0].split(" ")[0]
			  + "&searchType=" + $("#selectSearchType option:selected").val().replace(" ", "")
			  + "&keyword=" + $('#keywordInput').val().replace(" ", "").trim();
	    });
	});
}); // end ready...
//검색버튼 클릭시
$('.btn-detail').on("click", function(event){
  console.log("searchBtn clicked....");
	
  if($('#keywordInput').val() == ''){
	  swal("검색어를 입력해주세요.");
  }
  
  	var idx = $(this).attr('value');
	console.log("idx : "+idx);
	var site = $('#site').val();
	console.log("site : "+site);
	var work = $('#work').val();
	if (work == "" || work == "undefined"){
		var work = "전체";
		console.log("work : "+work);
	}
	var startDate = decodeURI(window.location.href.split("startDate=")[1]).split("&")[0].split(" ")[0];
	var endDate =  decodeURI(window.location.href.split("endDate=")[1]).split("&")[0].split(" ")[0];
	var searchType = $("#selectSearchType option:selected").val();
	var keyword = $('#keywordInput').val().replace(" ", "").trim();
	var keywordIn = $('#keywordInput').val();
	
	$.ajax({
		type : "POST",
		url : "gloModal",
		data : {
			site : site,
			work : work,
			startDate : startDate,
			endDate : endDate,
			page : idx,
			perPageNum : "10",
			searchType : searchType,
			keyword : keyword
		},
		cache: false, 
		success : function(data) {
			$('.modal-content').empty();
			$('.modal-content').append(data);
			$('#keywordInput').val(keywordIn);
			$('#selectSearchType').val(searchType);
		}
	}); 
});

$('.page-link').on("click", function(){
	var idx = $(this).attr('value');
	var site = $(".selectSite option:selected").val()
	var nation = $(".selectNation option:selected").val()
	var key = $(".selectKeyword option:selected").val()
	var state = $(".selectState option:selected").val()
	var work = $('#work').val();
	if (work == ""){
		var work = "전체";
	}
	var startDate = decodeURI(window.location.href.split("startDate=")[1]).split("&")[0].split(" ")[0];
	var endDate =  decodeURI(window.location.href.split("endDate=")[1]).split("&")[0].split(" ")[0];
	var searchType = $("#selectSearchType option:selected").val().replace(" ", "");
	var keyword = $('#keywordInput').val().replace(" ", "").trim();
	var keywordIn = $('#keywordInput').val();
	
	$.ajax({
		type : "POST",
		url : "gloModal",
		data : {
			site : site,
			nation : nation,
			selectKey : key,
			textType : state,
			work : work,
			startDate : startDate,
			endDate : endDate,
			page : idx,
			perPageNum : "10",
			searchType : searchType,
			keyword : keyword
		},
		cache: false, 
		success : function(data) {
			$('.modal-content').empty();
			$('.modal-content').append(data);
			$('#keywordInput').val(keywordIn);
			$('#selectSearchType').val(searchType);
		}
	});
});

//삭제버튼 클릭시
$(document).on("click",".alert-confirm2",function(event){
	swal({
		title: "삭제처리 하시겠습니까?",
		text: "바로 삭제처리 됩니다.",
		type: "warning",
		showCancelButton: true,
		confirmButtonClass: "btn-danger",
		confirmButtonText: "YES",
		closeOnConfirm: true
		},
	function(){
		var parent = event.target.parentNode;
			if(parent.type == 'submit'){
			console.log("button click...");
			parent = parent.parentNode;
		}

		var tr = parent.parentNode;
		console.log(tr);

		var idx = tr.children[0].value;
		console.log(idx);
		
		$.ajax({
			type: "POST",
			url: "remove",
			data: {idx : idx},
			cache: false, 
			success : function(data) {
				var idx = $(this).attr('value');
				console.log(idx);
				var site = $('#site').val();
				var work = $('#work').val();
				console.log(work);
				if (work == ""){
					var work = "전체";
					console.log(work);
				}
				var startDate = decodeURI(window.location.href.split("startDate=")[1]).split("&")[0].split(" ")[0];
				var endDate =  decodeURI(window.location.href.split("endDate=")[1]).split("&")[0].split(" ")[0];
				var searchType = $("#selectSearchType option:selected").val().replace(" ", "");
				var keyword = $('#keywordInput').val().replace(" ", "").trim();
				var keywordIn = $('#keywordInput').val();
				
				$.ajax({
					type : "POST",
					url : "gloModal",
					data : {
						site : site,
						work : work,
						startDate : startDate,
						endDate : endDate,
						page : idx,
						perPageNum : "10",
						searchType : searchType,
						keyword : keyword
					},
					cache: false, 
					success : function(data) {
						$('.modal-content').empty();
						$('.modal-content').append(data);
						$('#keywordInput').val(keywordIn);
						$('#selectSearchType').val(searchType);
					}
				});
			}
		});
	});
});

function selectChange(event) {
	console.log("셀렉 접속");
	var idx = $(this).attr('value');
	var site = $(".selectSite option:selected").val()
	console.log("site :"+site);
	var nation = $(".selectNation option:selected").val()
	console.log("nation :"+nation);
	var key = $(".selectKeyword option:selected").val()
	console.log("key :"+key);
	var state = $(".selectState option:selected").val()
	console.log("state :"+state);
	var work = $('#work').val();
	if (work == ""){
		var work = "전체";
	}
	var startDate = decodeURI(window.location.href.split("startDate=")[1]).split("&")[0].split(" ")[0];
	var endDate =  decodeURI(window.location.href.split("endDate=")[1]).split("&")[0].split(" ")[0];
	var searchType = $("#selectSearchType option:selected").val().replace(" ", "");
	var keyword = $('#keywordInput').val().replace(" ", "").trim();
	var keywordIn = $('#keywordInput').val();
	
	$.ajax({
		type : "POST",
		url : "gloModal",
		data : {
			site : site,
			nation : nation,
			selectKey : key,
			textType : state,
			work : work,
			startDate : startDate,
			endDate : endDate,
			page : idx,
			perPageNum : "10",
			searchType : searchType,
			keyword : keyword
		},
		cache: false, 
		success : function(data) {
			$('.modal-content').empty();
			$('.modal-content').append(data);
			$('#keywordInput').val(keywordIn);
		}
	});	
}

//수정버튼 클릭시
$(document).on("click",".alert-confirm1",function(event){
	swal({
		title: "변경처리 하시겠습니까?",
		text: "선택된 상태로 변경처리 됩니다.",
		type: "warning",
		showCancelButton: true,
		confirmButtonClass: "btn-danger",
		confirmButtonText: "YES",
		closeOnConfirm: true
	},
	function(){
		
		var parent = event.target.parentNode.parentNode;
		
		var tr = parent.parentNode;
		console.log(tr);
		
		var idx = tr.children[7].children[0].value;
		console.log(idx);
		
		var index = tr.children[1].children[0].value;
		
		var work = $("#selectWork"+index+" option:selected").val()
		console.log(work);
		
		$.ajax({
			type: "POST",
			url: "gloUp",
			data: {idx : idx, work : work},
			cache: false, 
			success : function(data) {
				var idx = $(this).attr('value');
				console.log(idx);
				var site = $('#site').val();
				var work = $('#work').val();
				console.log(work);
				if (work == ""){
					var work = "전체";
					console.log(work);
				}
				var startDate = decodeURI(window.location.href.split("startDate=")[1]).split("&")[0].split(" ")[0];
				var endDate =  decodeURI(window.location.href.split("endDate=")[1]).split("&")[0].split(" ")[0];
				var searchType = $("#selectSearchType option:selected").val().replace(" ", "");
				var keyword = $('#keywordInput').val().replace(" ", "").trim();
				var keywordIn = $('#keywordInput').val();
				
				$.ajax({
					type : "POST",
					url : "gloModal",
					data : {
						site : site,
						work : work,
						startDate : startDate,
						endDate : endDate,
						page : idx,
						perPageNum : "10",
						searchType : searchType,
						keyword : keyword
					},
					cache: false, 
					success : function(data) {
						$('.modal-content').empty();
						$('.modal-content').append(data);
						$('#keywordInput').val(keywordIn);
						$('#selectSearchType').val(searchType);
					}
				});
			} 
		});
	});
});



</script>