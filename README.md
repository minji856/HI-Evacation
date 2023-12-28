### 1. Full Calendar API 사용
  - npm install --save @fullcalendar/react @fullcalendar/core @fullcalendar/daygrid
  - npm install style-loader css-loader sass-loader node-sass --save

### 2. MyCalendar.js 생성 후 import
   ![image](https://github.com/minji856/HI-Evacation/assets/144756912/c66cc596-7154-495c-8048-f857a1ef1f8e)
- Plugin
  - dayGrid : 기본 달력을 그리기 위한
  - interaction : 이벤트 감지, 클릭, 드래그
  - https://fullcalendar.io/docs/plugin-index 전체 플로그인 목록
  - https://fullcalendar.io/docs/toolbar-demo

### 3. React에 css와 footer sidebar 추가
- css https://startbootstrap.com/theme/sb-admin-2

![image](https://github.com/minji856/HI-Evacation/assets/144756912/556dad30-1563-45b6-b3bc-19dc52a57277)
- font-awesome icon 설치해서 import 해야함
- https://velog.io/@ka0son/React-%EB%A6%AC%EC%95%A1%ED%8A%B8-%EC%95%84%EC%9D%B4%EC%BD%98react-icons-%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0

- footer와 navbar가 2개가 나오는 문제 해결
- Route의 위치를 바꿔주면 됐다 !!!!

Navbar에 링크 달고 App.js에 라우트 걸기
https://totally-developer.tistory.com/97

### 4. React 와 Spring Boot 연동
- proxy 설정
	- setProxy.js 를 일단 사용 안하고 React package.json 에 "proxy" : "http://localhost:8484" 추가해줌
 ![image](https://github.com/minji856/HI-Evacation/assets/144756912/d011af2d-8a3e-4dff-b85e-1b5f79566b1f)
- map 으로 꺼내니까 데이터가 넘어왔다
- [ ] 가져온 데이터를 반복문으로 날짜에 맞게 출력하게 해줘야 한다.
- [ ] 프롬프트 창에서 입력하면 DB 에 저장되게
![image](https://github.com/minji856/HI-Evacation/assets/144756912/fc0e0c6c-ef0c-4a15-a589-6c93dbd71554)

- 컨트롤러로 ajax로 데이터 받는지 확인
- `useEffect` 훅을 사용하여 컴포넌트가 마운트될 때 데이터를 가져온다.
- axios 라이브러리 활용
- default 포트
	- SpringBoot: http://localhost:8080/
  	- React: http://localhost:3000/

### 5. DB 만들기
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

### [ ] 6. 로그인 이름 띄우기 
- jwt 와 충돌 가능성이 높아 Session 은 사용 안 함

|No|기능|설명|
|---|---|---|
|1|조회|내용 3|
|2|변경|내용 7|
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

### 7. 일정관리랑 휴가신청을 로직 분리
일정관리에 여유가 되면 modal 써보기
	- 오른쪽에 배치하는게 어려움 => row로 묶어주면 된다
![image](https://github.com/minji856/HI-Evacation/assets/144756912/6b28665b-0e4a-4529-aa7b-4eae700f23c7)

![image](https://github.com/minji856/HI-Evacation/assets/144756912/b65bebe4-71d2-4e0d-b55e-7b9b3d33fa96)
- 여러개일때 + 더보기 생김<br>
![image](https://github.com/minji856/HI-Evacation/assets/144756912/1a8857a9-fef3-413e-9065-d66da8f4d495)

	- 일정을 클릭하면 삭제 기능도 됨<br>
![image](https://github.com/minji856/HI-Evacation/assets/144756912/59d651eb-d721-4c55-9dd2-6742f19ac6b3)

- 이벤트에 시간을 입력하니까 CSS가 깨짐

### 8. 구글 캘린더 API 연동
- Apikey는 환경 변수를 이용해 숨겨주기
```javascript
import React from 'react';
import FullCalendar from '@fullcalendar/react';
import dayGridPlugin from '@fullcalendar/daygrid';
import googleCalendarPlugin from '@fullcalendar/google-calendar';
import '../css/Calendar.css';

// https://fullcalendar.io/docs/google-calendar
export default function Calendarpg() {
  const apiKey = process.env.REACT_APP_CAL_API_KEY;

  return (
    <div className="cal-container">
      <FullCalendar
        plugins={[dayGridPlugin, googleCalendarPlugin]}
        initialView="dayGridMonth"
        googleCalendarApiKey={apiKey}
        events={{
          googleCalendarId: '(권한자)@gmail.com',
        }}
        eventDisplay={'block'}
        eventTextColor={'#FFF'}
        eventColor={'#F2921D'}
        height={'660px'}
        Toolbar
      />
    </div>
  );
}
```
