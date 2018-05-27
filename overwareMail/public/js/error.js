function settingErrorMsg(code){
  var returnMsg = '';
  if (code == '31'){
    returnMsg = '호스트에 연결 경로가 없음 (라우팅 경로상의 특정 라우터에 이상이 있는 경우 발생)';
  }
  else if (code == '35'){
    returnMsg = '메일박스 용량 초과 (수신측 서버의 디스크 용량 초과)';
  }
  else if (code == '36'){
    returnMsg = '서버에 접속할 수 없음(스팸 블로킹 등의 이유로 서버에서 접속을 차단하는 경우)';
  }
  else if (code == '37'){
    returnMsg = 'Transaction Failed (구체적인 에러 사유 없이 수신측 서버에서 이메일 수신이 실패하였음을 통보)';
  }
  else if (code == '38'){
    returnMsg = '소켓 대기 시간 초과 (Timeout 시간(1분)동안 수신측 서버에서 응답이 없는 경우)';
  }
  else if (code == '3A'){
    returnMsg = '네트워크 연결이 끊어짐 (수신측 서버와 통신 연결이 성공하였으나 통신과정에서 스팸체킹 룰 등의 이유로 통신 중간에 연결을 끊어버리는 경우)';
  }
  else if (code == '3C'){
    returnMsg = '스풀 파일을 생성할 수 없음.(임시 파일 생성시 디스크 에러)';
  }
  else if (code == '3D'){
    returnMsg = '호스트를 찾을 수 없음(이메일 주소의 도메인 명이 유효한 도메인이 아닌 경우)';
  }
  else if (code == '3E'){
    returnMsg = '수신서버가 일시적으로 응답불가(메일 수신 서버 과부하 등의 이유로 일시적으로 메일 수신 처리가 불가한 경우)';
  }
  else if (code == '3F'){
    returnMsg = '치환값 없음(이메일 제목이나 본문 내에 치환할 변수(예:성명)가 있으나 변수를 치환할 값이 존재하지 않는 경우)';
  }
  else if (code == '3H' || code == '3L'){
    returnMsg = 'DNS Timeout (DNS 서버의 다운 등의 이유로 DNS 질의 응답을 수신하지 못하는 경우)';
  }
  else if (code == '3J'){
    returnMsg = '메시지가 금칙어를 포함하고 있음 (수신 서버에서 제한하는 금칙어를 메일 본문에 포함한 경우)';
  }
  else if (code == '3M'){
    returnMsg = 'Sender Denied (보내는 이 메일 주소가 스패머 리스트에 등록되어 차단되는 경우)';
  }
  else if (code == '3N' || code == '3P'){
    returnMsg = '서버 연결 거부 (송신 서버의 IP가 스팸 블랙리스트 등에 등록되어 수신서버가 연결을 차단하는 경우)';
  }
  else if (code == '3Q'){
    returnMsg = 'Too Many Session (수신서버 측이 허용한 세션보다 많은 연결을 시도하는 경우 또는 수신서버의 동시 최대 연결 세션이 초과된 경우)';
  }
  else if (code == '3T'){
    returnMsg = '수신 서버의 스팸 탐지 로직에 양성 반응을 하여 스팸으로 처리됨';
  }
  else if (code == '3U'){
    returnMsg = '메일링크 캐시(포인트) 부족';
  }
  else if (code == '39'){
    returnMsg = '기타 시스템 에러';
  }
  else if (code == '42'){
    returnMsg = '존재하지 않는 사용자';
  }
  else if (code == '43'){
    returnMsg = '부적절한 메일 주소 (이메일 주소의 문법 오류)';
  }
  else if (code == '44'){
    returnMsg = '휴면 계정 (대형 포탈의 경우 대부분 2개월 이상 로그인 기록이 없는 경우)';
  }
  else if (code == '45'){
    returnMsg = 'Unserviceable Domain(intizen.com, sayclub.com등 과거에는 이메일 서비스를 제공하였으나 사업정리 등의 이유로 더 이상 메일 서비스를 제공하지 않는 도메인인 경우)';
  }
  return returnMsg;
}
