'use strict';
$(document).ready(function () {
  //modal date picker
  $('#datetimepicker').datetimepicker({
    locale : 'ko',
    format: 'hh:mm:ss',
    defaultDate: new Date(),
    icons: {
      time: "icofont icofont-clock-time",
      date: "icofont icofont-ui-calendar",
      up: "icofont icofont-rounded-up",
      down: "icofont icofont-rounded-down",
      next: "icofont icofont-rounded-right",
      previous: "icofont icofont-rounded-left"
    }
  });
  $('#datepicker').daterangepicker({
    singleDatePicker: true,
    showDropdowns: true,
    locale: {
      format: 'YYYY/MM/DD',
      "customRangeLabel": "Custom",
      "daysOfWeek": [
          "일", "월", "화", "수", "목", "금", "토"
      ],
      "monthNames": [
        "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"
      ],
    }
  });
  $("#submit").on("click",function(){
    if($("#select1 option:checked").text() == "소속사명"){
      swal("error!", "소속사명을 선택해주세요.", "error");
    }
    else if($("#select2 option:checked").text() == "연예인명"){
      swal("error!", "연예인명을 선택해주세요.", "error");
    }
    else if($("#siteName").val() == ""){
      swal("error!", "사이트명을 입력해주세요.", "error");
    }
    else if($("#boardNum").val() == ""){
      swal("error!", "게시판 번호를 입력해주세요.", "error");
    }
    else if($("#title").val() == ""){
      swal("error!", "제목을 입력해주세요.", "error");
    }
    else if($("#content").val() == ""){
      swal("error!", "내용을 입력해주세요.", "error");
    }
    else if($("#content").val() == ""){
      swal("error!", "내용을 입력해주세요.", "error");
    }
    else{
      $("#frm").submit();
      $("#frmModal").modal("hide");
      // swal("success!", "등록에 성공하였습니다.", "success");
      // swal("error!", "등록에 실패하였습니다.", "error");
    }
  });

  //이미지다운 확인메시지
  $(document).on("click",".alert-image",function(){
    swal({
          title: "이미지다운 하시겠습니까?",
          text: "현재 리스트 이미지가 다운됩니다.",
          type: "warning",
          showCancelButton: true,
          confirmButtonClass: "btn-danger",
          confirmButtonText: "YES",
          closeOnConfirm: false
        },
        function(){
          swal("Success!", "이미지다운 되었습니다.", "success");
        });
  });
  //이미지 보기 클릭시 모달
  $(".image").on("click",function(event){

	  var thumbName = event.target.parentElement.parentElement.children[0].value;
	  console.log(thumbName);
	  
	  var path = '../classification/show?name=' + thumbName;
	  $("#thumbnail").attr("src", path);
    $('#imageModal').modal('show');
  });
  //이미지업로드 클릭시
  $(document).on("click",".alert-upload",function(){
    $("#imageModal").modal("hide");

/*    var formObj = $("#imageForm");
    
    formObj.attr("action", "uploadFile");
	formObj.attr("method", "post");
    formObj.submit();
    */

    console.log($("#imageIinput")[0]);
    
    
    //이미지처리메시지 - 성공시
    
    
    
    swal("Success!", "이미지업로드가 되었습니다.", "success");
    //이미지처리메시지 - 실패시
    // swal("error!", "이미지업로드가 실패했습니다.", "error");
  });
  //이미지삭제 클릭시
  $(document).on("click",".alert-delete",function(){
    $("#imageModal").modal("hide");

    // db textType 삭제...
    
    //이미지처리메시지 - 성공시
    swal("Success!", "이미지삭제가 되었습니다.", "success");
    //이미지처리메시지 - 실패시
    // swal("Delete!", "이미지삭제가 실패했습니다.", "error");
  });
});

function uploadImage(event,fn){
	var files = event.originalEvent.dataTransfer.files;
	var file = files[0];
	var formData = new FormData();
	if(checkImageType(file.type)){
		
		formData.append("file", file);

		$.ajax({
			url : '/uploadAjax',
			data : formData,
			dataType : 'text',
			processData : false,
			contentType : false,
			method : 'POST',
			success : function(data) {
				console.log(data);

				if(checkImageType(data)){
					fn(data);

				}	
			}
		});
	}else{
		alert("이미지 파일로 올려주세요!");				
	}
}