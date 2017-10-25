'use strict';
$(document).ready(function () {
  $("button[type='submit']").on("click",function(){
    var check=true;
    // 기자 등록 필수 입력 체크
    if($("#newsName option:selected").text() == "언론사"){
      check = requiredMessage("newsName","언론사명을 선택해주세요.");
    }
    if($("input:checkbox:checked") && $("#newsNewName1").val() == ""){
      check = requiredMessage("newsNewName1","언론사명을 입력해주세요.");
    }
    if($("input:checkbox:checked") && $("#newsNewName2").val() == ""){
      check = requiredMessage("newsNewName2","언론사명을 입력해주세요.");
    }
    if($("#serachNewsName").val() == ""){
      check = requiredMessage("serachNewsName","검색언론사명을 입력해주세요.");
    }
    if($("#pressName").val() == ""){
      check = requiredMessage("pressName","기자명을 입력해주세요.");
    }
    if($("#pressID").val() == ""){
      check = requiredMessage("pressID","기자아이디를 입력해주세요.");
    }
    return check;
  });
  $("input, select").on("focus",function(){
    $(this).removeClass("form-control-danger");
    $(this).siblings().children("p").text("");
  });
});

function requiredMessage(target,msg){
  $("#"+target).siblings().children().text(msg);
  $("#"+target).addClass("form-control-danger");
  return false;
}
