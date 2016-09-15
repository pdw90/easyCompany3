# easyCompany3
전자정부표준프레임워크의 easy company3예제 입니다.

기본적인 내용은 거의 동일하고, 다음 세 가지를 추가 진행하고 있습니다.

1. 정적 분석을 감안한 환경 구성
1. 정적 분석 결과, 개선 작업
1. 테스트 소스 추가/ 커버리지 추가

##환경 구성

###H2 데이터베이스 세팅.
- H2 데이터베이스 다운로드(위치: http://h2database.com/html/main.html )
- bin/ 아레에서 h2.sh 실행 (localhost:8082 로 콘솔 접근)
- 신규 생성 
  . Driver Class : org.h2.Driver
  . JDBC : jdbc:h2:file:/Users/limsunghyun/DEV/git_clone/easyCompany3/db/easyDB;MODE=MySQL;AUTO_SERVER=TRUE
  . USER/Password : ec/ec
- 이 때, MODE는 MySQL 호환모드로, 다른 프로세스에서 접근 허용하기 위해 AUTO_SERVER=TRUE를 지정함.

###스크립트 업로드
- DDL : script/script_h2.sql 실행.
- DML : script/data_h2.sql 실행.

## 서버 실행 
(TBD)
