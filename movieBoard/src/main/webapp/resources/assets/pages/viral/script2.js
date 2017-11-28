"use strict";
$(window).on('resize',function() {
  /*점유율 그래프 resize할때 다시 만들어줌*/
  $(".dial").knob({
        draw: function() {
            // "tron" case
            if (this.$.data('skin') == 'tron') {
                this.cursorExt = 0.3;
                var a = this.arc(this.cv) // Arc
                    ,
                    pa // Previous arc
                    , r = 1;
                this.g.lineWidth = this.lineWidth;
                if (this.o.displayPrevious) {
                    pa = this.arc(this.v);
                    this.g.beginPath();
                    this.g.strokeStyle = this.pColor;
                    this.g.arc(this.xy, this.xy, this.radius - this.lineWidth, pa.s, pa.e, pa.d);
                    this.g.stroke();
                }
                this.g.beginPath();
                this.g.strokeStyle = r ? this.o.fgColor : this.fgColor;
                this.g.arc(this.xy, this.xy, this.radius - this.lineWidth, a.s, a.e, a.d);
                this.g.stroke();
                this.g.lineWidth = 2;
                this.g.beginPath();
                this.g.strokeStyle = this.o.fgColor;
                this.g.arc(this.xy, this.xy, this.radius - this.lineWidth + 1 + this.lineWidth * 2 / 3, 0, 2 * Math.PI, false);
                this.g.stroke();
                return false;
            }
        }
    });
});
$(document).ready(function() {
  /*계정 버튼 설명*/
  $('[data-toggle="tooltip"]').tooltip();

  /*시간선택*/
  $('#time').timepicker({
	    timeFormat: 'HH:mm',
	    interval: 60,
	    defaultTime:'00:00',
	    pick12HourFormat: false,
	    pickDate: false,
	    pickSeconds: false,
	    dynamic: true,
	    dropdown: true,
	    scrollbar: true
	  });

  /*엑셀출력*/
  document.querySelector('.alert-confirm').onclick = function(){
    swal({
          title: "엑셀출력 하시겠습니까?",
          text: "현재 리스트가 엑셀출력 됩니다.",
          type: "warning",
          showCancelButton: true,
          confirmButtonClass: "btn-danger",
          confirmButtonText: "YES",
          closeOnConfirm: false
        },
        function(){//엑셀 출력하겠다고 할 시 진행 함수
          swal("Success!", "엑셀출력 되었습니다.", "success");
        });
  };

  /*본사계정변경*/
  document.querySelector('.alert-confirm1').onclick = function(){
    swal({
          title: "본사계정으로 변경하시겠습니까?",
          text: "선택된 리스트가 본사계정으로 변경됩니다.",
          type: "warning",
          showCancelButton: true,
          confirmButtonClass: "btn-danger",
          confirmButtonText: "YES",
          closeOnConfirm: false
        },
        function(){
          swal("Success!", "본사계정으로 변경되었습니다.", "success");
        });
  };

  /*외부계정변경*/
  document.querySelector('.alert-confirm2').onclick = function(){
    swal({
          title: "외부계정으로 변경하시겠습니까?",
          text: "선택된 리스트가 외부계정으로 변경됩니다.",
          type: "warning",
          showCancelButton: true,
          confirmButtonClass: "btn-danger",
          confirmButtonText: "YES",
          closeOnConfirm: false
        },
        function(){
          swal("Success!", "외부계정으로 변경되었습니다.", "success");
        });
  };

  /*전체선택*/
  $('#allCheck').on("click",function(){
    if($("#allCheck").prop("checked")){
      $(".checkbox").prop("checked",true);
    }else{
      $(".checkbox").prop("checked",false);
    }
  });

  /*점유율 그래프 생성*/
  $(".dial").knob({
      draw: function() {
          // "tron" case
          if (this.$.data('skin') == 'tron') {
              this.cursorExt = 0.3;
              var a = this.arc(this.cv) // Arc
                  ,
                  pa // Previous arc
                  , r = 1;
              this.g.lineWidth = this.lineWidth;
              if (this.o.displayPrevious) {
                  pa = this.arc(this.v);
                  this.g.beginPath();
                  this.g.strokeStyle = this.pColor;
                  this.g.arc(this.xy, this.xy, this.radius - this.lineWidth, pa.s, pa.e, pa.d);
                  this.g.stroke();
              }
              this.g.beginPath();
              this.g.strokeStyle = r ? this.o.fgColor : this.fgColor;
              this.g.arc(this.xy, this.xy, this.radius - this.lineWidth, a.s, a.e, a.d);
              this.g.stroke();
              this.g.lineWidth = 2;
              this.g.beginPath();
              this.g.strokeStyle = this.o.fgColor;
              this.g.arc(this.xy, this.xy, this.radius - this.lineWidth + 1 + this.lineWidth * 2 / 3, 0, 2 * Math.PI, false);
              this.g.stroke();
              return false;
          }
      }
  });
});
