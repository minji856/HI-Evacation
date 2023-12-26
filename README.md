# HI-Evacation
## 1. Full Calendar API 사용
  - npm install --save @fullcalendar/react @fullcalendar/core @fullcalendar/daygrid
  - npm install style-loader css-loader sass-loader node-sass --save

## 2. MyCalendar.js 생성 후 import
   ![image](https://github.com/minji856/HI-Evacation/assets/144756912/c66cc596-7154-495c-8048-f857a1ef1f8e)
- Plugin
  - dayGrid : 기본 달력을 그리기 위한
  - interaction : 이벤트 감지, 클릭, 드래그
  - https://fullcalendar.io/docs/plugin-index 전체 플로그인 목록
  - https://fullcalendar.io/docs/toolbar-demo

## 3. React에 css와 footer sidebar 추가
- css https://startbootstrap.com/theme/sb-admin-2

![image](https://github.com/minji856/HI-Evacation/assets/144756912/556dad30-1563-45b6-b3bc-19dc52a57277)
- font-awesome icon 설치해서 import 해야함
- https://velog.io/@ka0son/React-%EB%A6%AC%EC%95%A1%ED%8A%B8-%EC%95%84%EC%9D%B4%EC%BD%98react-icons-%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0

Navbar에 링크 달고 App.js에 라우트 걸기
https://totally-developer.tistory.com/97

## 4. React 와 Sprin boot 연동
- default 포트번호 연동
  포트 설정 및 proxy 설정
  SpringBoot: http://localhost:8080/
  React: http://localhost:3000/
  default로 springboot: 8080포트, react: 3000포트를 사용한다.
  이 둘을 하나의 포트로 통합하는 작업을 진행
  SpringBoot 포트 설정
  먼저 프로젝트에서 application.properties 파일을 열기

  React package.json "Proxy" : "포트번호" 설정과 npm install 해주기
  혹은 Proxy.js 파일 만들기

## 5. Table 만들기
```sql
  drop table if exists member CASCADE;
  create table member
  (
      id bigint generated by default as identity,
      email varchar(255) not null,
      ename varchar(255) ,
      pw varchar(255) not null,
      roles varchar(255) not null,
      birth_day varchar(255) ,
      phone_number varchar(255) default null ,
      address varchar(255) ,
      street_address varchar(255) ,
      detail_address varchar(255) ,
      picture varchar(1000) default '/img/undraw_profile_1.svg' ,
      primary key (id),
      unique (email)
  );
```
```sql
DROP TABLE CALENDAR CASCADE CONSTRAINTS;

CREATE SEQUENCE CALENDAR_NO_SEQ
    START WITH 1
    INCREMENT BY 1;


CREATE TABLE CALENDAR (
	CALENDAR_NO NUMBER	NOT NULL PRIMARY KEY,
	CALENDAR_TITLE	VARCHAR2(200)	NOT NULL,
	CALENDAR_MEMO	VARCHAR2(500),
	CALENDAR_START	DATE,
	CALENDAR_END	DATE
);
```


## [ ] 6. 로그인 이름 띄우기 

|No|기능|설명|
|---|---|---|
|1|조회|내용 3|
|2|내용 6|내용 7|
|3|내용 10|내용 11|

```javascript
app.post('/submitVacationRequest', (req, res) => {
  // 현재 로그인된 사용자의 이름을 가져옴
  const loggedInUserName = req.session.user.username;

  // 사용자 이름을 formData에 추가
  const formData = {
    vacationtype: 'Some Vacation',
    startday: '2023-01-01',
    endday: '2023-01-10',
    startTime: '09:00',
    endTime: '18:00',
    currentTime: new Date(),
    reason: 'Some reason for vacation',
    userName: loggedInUserName, // 사용자 이름 추가
  };
```

## [ ] 7. React/ Spring boot 연동
- 컨트롤러로 ajax로 데이터 받는지 확인

## 8. 일정관리랑 휴가신청을 나눔
휴가신청에서는 달력을 더 작게 만들고 일정관리 페이지에서는 일정 등록칸도 만들면 좋을거같다
오른쪽에 배치하는게 어려움 => row로 묶어주면 된다
![image](https://github.com/minji856/HI-Evacation/assets/144756912/6b28665b-0e4a-4529-aa7b-4eae700f23c7)

## 일정을 입력하면 날짜에 나오게 출력
- 내가 원하는 대로 이벤트를 꾸밀 수 있음
```javascript
// 일정을 커스텀 하는 옵션
const renderEventContent = (eventInfo) => {
  return (
    <>
      <b>테스트 : </b>
      <i>{eventInfo.event.title}</i>
    </>
  )
}
```
![image](https://github.com/minji856/HI-Evacation/assets/144756912/b65bebe4-71d2-4e0d-b55e-7b9b3d33fa96)


[*] 사이드바 연동하기
