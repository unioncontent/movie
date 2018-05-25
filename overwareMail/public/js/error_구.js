function settingErrorMsg(msg){
  var returnMsg = '';
  var lowerStr = msg.toLowerCase();
  if(lowerStr.indexOf('421 4.3.2 your ip blocked from this server') != -1){
    returnMsg = '발송 서버의 IP 주소로부터 오랫동안 대량의 스팸메일이 발송되어 차단되었습니다.';
  }
  else if(lowerStr.indexOf('dns lookup error: lookup') != -1 && lowerStr.indexOf('no such host') != -1){
    returnMsg = '이메일 주소의 사이트를 찾을 수 없습니다.';
  }
  else if(lowerStr.indexOf('server too busy') != -1){
    returnMsg = '수신 측 서버의 일시 장애로 연결이 안되는 현상으로 잠시 후 다시 시도해주세요.';
  }
  else if(lowerStr.indexOf('too many recipients. we allow maximum ') != -1){
    returnMsg = '하나의 메일에 허용하는 수 이상의 수신 주소를 지정하여 차단되었습니다.';
  }
  else if(lowerStr.indexOf('you sent too many commands. total 35 commands in 1 session are allowed.') != -1){
    returnMsg = '한 번의 접속으로 허용하는 수 이상의 수신자를 지정하거나 명령을 수행하여 차단되었습니다.';
  }
  else if(lowerStr.indexOf('550, 5.3.2 rejected by mailbox host. erplay:(550 mailbox is inactive!! (#5.2.1))') != -1 || lowerStr.indexOf('550 5.1.1 Suspended(Inactive) user') != -1){
    returnMsg = '수신 주소가 휴면 상태입니다. 휴면 상태인 수신 주소로 반복하여 발송을 시도한 경우 스팸메일로 판단될 수 있습니다.';
  }
  else if(lowerStr.indexOf('550 5.1.1 no such user') != -1){
    returnMsg = '존재하지 않는 메일 주소입니다. 존재하지 않는 메일 주소로 반복하여 발송을 시도한 경우 스팸메일로 판단될 수 있습니다.';
  }
  else if(lowerStr.indexOf('550 your mail is classified as spam and rejected') != -1){
    returnMsg = '발송 메일이 네이버 메일 스팸 정책에 따라 스팸메일로 판단되어 거부되었습니다.';
  }
  else if(lowerStr.indexOf('421 4.3.0 too long idle time. You are disconnected') != -1){
    returnMsg = '접속 후 오랜 시간 응답하지 않아 접속을 종료합니다.';
  }
  else if(lowerStr.indexOf('421 4.4.1 chic ip adress: network is busy.') != -1){
    returnMsg = '메일 수신 서버가 응답을 못하는 상황입니다. 잠시 후 다시 접속을 시도해 주시기 바랍니다.';
  }
  else if(lowerStr.indexOf('421 4.4.5 ccrt ip address: connection refused. server is busy(rt)') != -1){
    returnMsg = 'Daum 스팸센터에서 해당IP를 스팸IP로 판단하여 일시적으로 접속을 차단하였습니다. 자세한 사항은 스팸센터로 문의 하시기 바랍니다.';
  }
  else if(lowerStr.indexOf('421 4.4.5 crcp ip address: connection refused. server is busy') != -1){
    returnMsg = 'Daum 메일 수신서버에 동시접속 가능한 수를 초과하였습니다. (white IP기준 100개) 접속 수를 줄여 재발송을 시도해 주시기 바랍니다.';
  }
  else if(lowerStr.indexOf('421 4.5.0 xtout ip address: closing connection by timeout451') != -1){
    returnMsg = '타임아웃이 발생해 커넥션을 종료합니다. 잠시 후 다시 접속을 시도해 주시기 바랍니다.';
  }
  else if(lowerStr.indexOf('4.4.1 xerr ip address: network is busy(error)') != -1){
    returnMsg = 'Client와 통신하는 과정에서 I/O 이외의 에러가 발생했습니다.';
  }
  else if(lowerStr.indexOf('451 4.4.1 xnioe ip address: network is busy(i/o)') != -1){
    returnMsg = 'Client와 통신하는 과정에서 I/O 에러가 발생했습니다. 잠시 후 다시 접속을 시도해 주시기 바랍니다.';
  }
  else if(lowerStr.indexOf('451 4.4.1 dxns1 ip address: network is busy(xdns)') != -1){
    returnMsg = '발송자의 이메일 주소 도메인 확인에 실패해 메일을 수신할 수 없습니다.'
  }
  else if(lowerStr.indexOf('451 4.4.1 dxns2 ip address: dns lookup failed(xdns)') != -1){
    returnMsg = '메일발송 IP 정보와 Hostname 정보가 일치하지 않아 메일 수신이 차단되었습니다.';
  }
  else if(lowerStr.indexOf('501 5.5.4 marg2 ip address: invalid mail command argument: argument') != -1){
    returnMsg = '메일 명령어에 필요한 인자값이 없습니다. SMTP 규약에 맞게 수정 후 다시 입력해 주시기 바랍니다.';
  }
  else if(lowerStr.indexOf('503 5.5.1 mdup ip address: sender already specified') != -1){
    returnMsg = '보낸이의 메일 주소가 이미 정의되어 있습니다. SMTP 규약에 따라 보낸이의 메일주소는 중복해서 정의될 수 없습니다.';
  }
  else if(lowerStr.indexOf('503 5.5.1 rmcmd ip address: mail command required') != -1){
    returnMsg = '받는이의 메일주소를 정의하기 전에 반드시 보낸이의 메일주소를 정의하여야 합니다. SMTP 규약에 맞게 명령어를 다시 입력해주시기 바랍니다.';
  }
  else if(lowerStr.indexOf('550 5.1.8 ip address: no such user: sender address') != -1){
    returnMsg = '보낸이의 메일 주소가 Daum에 가입되지 않은 아이디입니다. 보낸이 주소를 확인 후, 재 발송해 주시기 바랍니다.';
  }
  else if(lowerStr.indexOf('553 5.1.3 raddr ip address: invalid mail address: sender address') != -1){
    returnMsg = '보낸이의 메일 주소가 Daum 메일 수신 서버에서 확인되지 않는 주소입니다. 보낸이 주소를 확인 후, 재발송 해주시기 바랍니다.';
  }
  else if(lowerStr.indexOf('554 5.7.1 dzcnt ip address: message refused. your host name(host name) dosen\'t match with your ip address') != -1){
    returnMsg = '해당 도메인에서 너무 많은 메일이 발송되어 Daum 메일 수신이 원활하지 않습니다. 잠시 후 다시 발송해 주시기 바랍니다.';
  }
  else if(lowerStr.indexOf('553 access denied. please visit http://www.spamhaus.org for details') != -1){
    returnMsg = '수신 메일 서버에 문제가 발생했습니다. 사이트 담당자에게 문의해 주시기 바랍니다.';
  }
  else{
    returnMsg = msg;
  }



  return returnMsg;
}
