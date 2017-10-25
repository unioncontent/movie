'use strict';
$(document).ready(function () {
  // 대표키워드 중복체크
  document.querySelector('.alert-prompt').onclick = function(){
    swal({
      title: "✓ 대표 키워드 중복체크",
      text: "대표키 워드를 입력해주세요.",
      type: "input",
      showCancelButton: true,
      closeOnConfirm: false,
      inputValue:$("#keyword").val(),
      inputPlaceholder: "대표 키워드 입력"
    }, function (inputValue) {
      if (inputValue === false){
        swal.showInputError("키워드를 다시 입력해 주세요.");
        return false;
      }
      if (inputValue == ""){
        swal.showInputError("키워드를 다시 입력해 주세요.");
        return false;
      }
      if (inputValue === "union") {
        swal.showInputError("키워드가 중복됩니다. 다시 입력해 주세요.");
        return false
      }
      $("#keyword").val(inputValue);
      $("#keywordCheck").val("true");
      $("#keyword").removeClass("form-control-danger");
      $("#keyword").siblings().children("p").text("");
      swal("중복확인!", inputValue+"는 사용가능한 키워드입니다.", "success");
    });
  };

  // 키워드 등록 필수 입력 체크
  $("button[type='submit']").on("click",function(){
    var check=true;
    if($("#select").val() != "" && $("#id").val() == ""){
      check = requiredMessage("id","아이디를 입력해주세요.");
    }
    //키워드가 입력되어 있는데 중복체크 안했을 경우
    if($("#keyword").val() != "" && $("#keywordCheck").val() == ""){
      check = requiredMessage("id","아이디 중복확인 해주세요.");
    }
    return check;
  });
  $("input, select").on("focus",function(){
    $(this).removeClass("form-control-danger");
    $(this).siblings().children("p").text("");
  });

});
