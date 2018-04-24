#-*- coding: utf-8 -*-
import sys
reload(sys)
sys.setdefaultencoding('utf-8')

import pymysql,time,datetime
import logging
import logging.handlers
import threading

class MailSend:
    def __init__(self):
        self.endTime = datetime.datetime.now() + datetime.timedelta(seconds=(60*10))
        # self.timer = threading.Timer(25,self.main,args=[0])
        self.logger = logging.getLogger('mail')
        fomatter = logging.Formatter('[%(levelname)s | %(asctime)s] %(message)s',datefmt="%Y-%m-%d %H:%M:%S")
        fileMaxByte = 1024 * 1024 * 100 #100MB
        filename = './mail_'+datetime.datetime.now().strftime('%Y%m%d')+'.log'
        fileHandler = logging.handlers.RotatingFileHandler(filename, maxBytes=fileMaxByte, backupCount=10)
        streamHandler = logging.StreamHandler()
        fileHandler.setFormatter(fomatter)
        streamHandler.setFormatter(fomatter)
        self.logger.addHandler(fileHandler)
        self.logger.addHandler(streamHandler)

    def main(self):
        self.logger.setLevel(logging.DEBUG)

        self.mail = self.selectMail()
        for item in at.mail:
            sendDateTime = datetime.datetime.strptime(item['M_send'], "%Y-%m-%d %H:%M:%S").strftime("%Y-%m-%d %H:%M")
            nowDateTime = datetime.datetime.now().strftime("%Y-%m-%d %H:%M")

            if sendDateTime > nowDateTime:
                print('sendDateTime : '+sendDateTime+' / nowDateTime: '+nowDateTime)
                continue

            # 메일API 파라미터
            import base64
            param = {
                'subject': base64.b64encode(item['M_subject'].encode('euc-kr')),
                'body': base64.b64encode(item['M_body'].encode('euc-kr')),
                'sender': '',
                'recipients': '',
                'username': 'unionc',
                'key': 'w4EzdnbOY3oypxO',
                'mail_type': 'NORMAL',
                'return_url':'http://mail.overware.co.kr/email/send/result',
                'unique_id': item['n_idx']
            };
            # 첨부파일 있을 때
            if item['M_file'] != '' and item['M_file'] != None:
                fileDate = datetime.datetime.strptime(item['M_regdate'], "%Y-%m-%d %H:%M:%S").strftime("%Y%m%d")
                param['file_url'] = ['http://mail.overware.co.kr/uploads/files/'+fileDate+"/"+f for f in item['M_file'].split('|')]
                param['file_url'] = '|'.join(param['file_url'])
                param['file_name'] = item['M_file_name']

            # 받는사람/보낸사람
            param['sender'] = self.selectSenderRecipi(item['n_idx'],'s',sender=item['M_sender'])
            param['recipients'] = self.selectSenderRecipi(item['n_idx'],'r',recipi=item['M_recipi'])
            if item['M_group'] is not None:
                groupList = self.selectGroup(item['M_group'])
                param['recipients'] = param['recipients'].split(',')
                param['recipients'].extend(groupList)
                param['recipients']=','.join(param['recipients'])
            result = self.directsendAPI(param)

            if 'err' in result:
                sendCount = self.selectSendCount(param['unique_id'])
                self.updateMailFailCount([sendCount,param['unique_id']])
                self.updateMailStatus([result['err'],param['unique_id']])
            elif 'id' in result:
                self.updateMail([result['id'],param['unique_id']])

    def main30Task(self,num):
        self.logger.setLevel(logging.DEBUG)
        num += 1

        if self.endTime < datetime.datetime.now():
            self.timer.cancel()
            self.endNum = num
            self.logger.info('endTime :'+self.endTime.strftime('%Y-%m-%d %H:%M:%S'))
            self.logger.info('now :'+datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'))
            self.logger.info("===========================")
            return False

        try:
            self.timer = threading.Timer(25,self.main,args=[num])
            self.timer.start()

            self.mail = self.selectMail()
            for item in at.mail:
                # print(item);
                sendDateTime = datetime.datetime.strptime(item['M_send'], "%Y-%m-%d %H:%M:%S").strftime("%Y-%m-%d %H:%M")
                nowDateTime = datetime.datetime.now().strftime("%Y-%m-%d %H:%M")

                if sendDateTime > nowDateTime:
                    print('sendDateTime : '+sendDateTime+' / nowDateTime: '+nowDateTime)
                    continue

                # 메일API 파라미터
                import base64
                param = {
                    'subject': base64.b64encode(item['M_subject'].encode('euc-kr')),
                    'body': base64.b64encode(item['M_body'].encode('euc-kr')),
                    'sender': '',
                    'recipients': '',
                    'username': 'unionc',
                    'key': 'w4EzdnbOY3oypxO',
                    'mail_type': 'NORMAL',
                    'return_url':'http://mail.overware.co.kr/email/send/result',
                    'unique_id': item['n_idx']
                };
                # 첨부파일 있을 때
                if item['M_file'] != '' and item['M_file'] != None:
                    fileDate = datetime.datetime.strptime(item['M_regdate'], "%Y-%m-%d %H:%M:%S").strftime("%Y%m%d")
                    param['file_url'] = ['http://mail.overware.co.kr/uploads/files/'+fileDate+"/"+f for f in item['M_file'].split('|')]
                    param['file_url'] = '|'.join(param['file_url'])
                    param['file_name'] = item['M_file_name']

                # 받는사람/보낸사람
                param['sender'] = self.selectSenderRecipi(item['n_idx'],'s',sender=item['M_sender'])
                param['sender']=','.join(param['sender'])
                param['recipients'] = self.selectSenderRecipi(item['n_idx'],'r',recipi=item['M_recipi'])
                groupList = self.selectGroup(item['M_group'])
                param['recipients'].extend(groupList)
                param['recipients']=','.join(param['recipients'])
                result = self.directsendAPI(param)
                print(result)
                self.updateMail([result,param['unique_id']])

        except Exception as e :
            print(e)
            self.timer.cancel()
            self.logger.error("%d번 main func error", num)

    def updateMail(self,param):
        conn = pymysql.connect(host='14.52.66.20',user='soas',password='qwer1234',db='union',charset='utf8')
        # print('updateMail:',param)
        try:
            curs = conn.cursor(pymysql.cursors.DictCursor)
            sql = 'update m_mail_all_a set M_a_id=%s where n_idx=%s'
            # print(sql,param)
            curs.execute(sql,param)
            conn.commit()
        except Exception as e:
            print(e)
            self.logger.error("updateMail func error")
        finally:
            conn.close()

    def updateMailStatus(self,param):
        conn = pymysql.connect(host='14.52.66.20',user='soas',password='qwer1234',db='union',charset='utf8')
        # print('updateMailStatus:',param)
        try:
            curs = conn.cursor(pymysql.cursors.DictCursor)
            sql = 'update m_mail_detail_b set M_result=%s where M_idx_A=%s'
            # print(sql,param)
            curs.execute(sql,param)
            conn.commit()
        except Exception as e:
            print(e)
            self.logger.error("updateMailStatus func error")
        finally:
            conn.close()

    def updateMailFailCount(self,param):
        conn = pymysql.connect(host='14.52.66.20',user='soas',password='qwer1234',db='union',charset='utf8')
        print('updateMailFailCount:',param)
        try:
            curs = conn.cursor(pymysql.cursors.DictCursor)
            sql = 'update m_mail_all_a set M_success=0,M_failed=%s where n_idx=%s'
            # print(sql,param)
            curs.execute(sql,param)
            conn.commit()
        except Exception as e:
            print(e)
            self.logger.error("updateMailFailCount func error")
        finally:
            conn.close()


    def selectSendCount(self,param):
        conn = pymysql.connect(host='14.52.66.20',user='soas',password='qwer1234',db='union',charset='utf8')

        try:
            curs = conn.cursor(pymysql.cursors.DictCursor)
            sql = "SELECT sendCount FROM period_view where n_idx=%s;"
            curs.execute(sql,param)
            row = curs.fetchone()
        except Exception as e:
            print(e)
            self.logger.error("selectMail func error")
        else:
            return row['sendCount']
        finally:
            conn.close()


    def selectMail(self):
        conn = pymysql.connect(host='14.52.66.20',user='soas',password='qwer1234',db='union',charset='utf8')

        try:
            curs = conn.cursor(pymysql.cursors.DictCursor)
            sql = "SELECT * FROM period_view where M_type = 1 and M_send between DATE_SUB(now(), INTERVAL 10 MINUTE) and now() and success = 0 and fail = 0"
            # sql = "SELECT * FROM period_view where M_type = 1 and Date(M_send) = CURRENT_DATE() and n_idx = 103;"
            curs.execute(sql)
            row = curs.fetchall()
        except Exception as e:
            print(e)
            self.logger.error("selectMail func error")
        else:
            return row
        finally:
            conn.close()

    def selectSenderRecipi(self,idx,type,**kwargs):
        conn = pymysql.connect(host='14.52.66.20',user='soas',password='qwer1234',db='union',charset='utf8')

        try:
            curs = conn.cursor(pymysql.cursors.DictCursor)
            sql = "SELECT M_email FROM m_mail_list_all where n_idx = %s"
            param = [a for a in kwargs.values() if a is not None]
            if type == 'r':
                r = kwargs['recipi'].split(',')
                if len(r) > 1:
                    placeholders = ' or n_idx= '.join(['%s'] * len(r))
                    sql += placeholders[2:]
                param = [a for a in r if a is not None]
            curs.execute(sql,param)
            row = curs.fetchall()
        except Exception as e:
            print(e)
            self.logger.error("selectSenderRecipi func error")
        else:
            result = [str(r.values()[0]) for r in row]
            return (len(result) == 1) and result[0] or result
        finally:
            conn.close()

    def selectGroup(self,idx):
        conn = pymysql.connect(host='14.52.66.20',user='soas',password='qwer1234',db='union',charset='utf8')

        try:
            curs = conn.cursor(pymysql.cursors.DictCursor)
            sql = "SELECT M_group_title,M_id FROM m_mail_list_c where M_idx_a = %s"
            print(sql,idx)
            curs.execute(sql,idx)
            row = curs.fetchone()
            sql = "SELECT M_email FROM m_mail_list_c where M_group_title = %s and M_id = %s"
            print(sql,row.values())
            curs.execute(sql,row.values())
            row = curs.fetchall()
        except Exception as e:
            print(e)
            self.logger.error("selectGroup func error")
        else:
            return [r.values()[0] for r in row]
        finally:
            conn.close()

    def directsendAPI(self,body):
        import urllib
        import urllib2
        try:
            url = "https://directsend.co.kr/index.php/api/result_v2/mail"
            param = urllib.urlencode(body)
            headers ={'content-type': 'application/x-www-form-urlencoded;'}
            self.logger.info("directsendAPI send query:%s %s",url, param)
            request = urllib2.Request(url, param)
            response = urllib2.urlopen(request)
            rescode = response.getcode()
            # print(url,body)
            if rescode == 200:
                import json
                response_body = json.loads(response.read())
                self.logger.info("directsendAPI func url result:%s",json.dumps(response_body))
                if response_body['status'] == '103':
                    response_body['err'] = 3
                elif response_body['status'] == '104':
                    response_body['err'] = 4
                elif response_body['status'] == '105':
                    response_body['err'] = 5
                elif response_body['status'] == '113':
                    response_body['err'] = 13
                return response_body
            else:
                print("url Error Code:" + rescode)
                self.logger.error("directsendAPI func url Error")
        except Exception as e:
            print("python Error Code:",type(e),e)
            self.logger.error("directsendAPI func error")

        return False

if __name__=='__main__':
    start_time = time.time()
    at = MailSend()
    at.main()
