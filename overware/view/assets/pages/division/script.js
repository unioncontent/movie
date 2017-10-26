'use strict';
$(document).ready(function () {
  $('[data-toggle="tooltip"]').tooltip();
  //일괄처리 확인메시지
	document.querySelector('.alert-confirm').onclick = function(){
		swal({
					title: "일괄처리 하시겠습니까?",
					text: "선택한 분류들로 일괄처리 됩니다.",
					type: "warning",
					showCancelButton: true,
					confirmButtonClass: "btn-danger",
					confirmButtonText: "YES",
					closeOnConfirm: false
				},
				function(){
					swal("Success!", "일괄처리가 완료되었습니다.", "success");
				});
	};
  //삭제처리 확인메시지
	document.querySelector('.alert-confirm1').onclick = function(){
		swal({
					title: "삭제처리 하시겠습니까?",
					text: "바로 삭제처리 됩니다.",
					type: "warning",
					showCancelButton: true,
					confirmButtonClass: "btn-danger",
					confirmButtonText: "YES",
					closeOnConfirm: false
				},
				function(){
					swal("Delete!", "삭제처리가 완료되었습니다.", "success");
				});
  };
  //즉시처리 확인메시지
	document.querySelector('.alert-confirm2').onclick = function(){
		swal({
					title: "즉시처리 하시겠습니까?",
					text: "선택된 분류로 즉시처리 됩니다.",
					type: "warning",
					showCancelButton: true,
					confirmButtonClass: "btn-danger",
					confirmButtonText: "YES",
					closeOnConfirm: false
				},
				function(){
					swal("Success!", "즉시처리가 완료되었습니다.", "success");
				});
  };
  //이미지 보기 클릭시 모달
  $(".image").on("click",function(){
    $('#image-Modal').modal('show');
  });
});
