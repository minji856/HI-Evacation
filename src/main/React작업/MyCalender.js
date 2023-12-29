import React , { useState, useEffect }from 'react';
import FullCalendar from '@fullcalendar/react';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from "@fullcalendar/timegrid";
import interactionPlugin from "@fullcalendar/interaction";
import googleCalendarPlugin from '@fullcalendar/google-calendar';
import axios from "axios";
import './Mycalendar.css'

/**
 * FullCalendar API 사용
 * google API 키 환경 변수로 설정

 * 일정 출력 모양을 커스텀 하는 메서드입니다.
 * @param info 일정 정보
 * @return 일정 제목과 시간
 */ 
const renderEventContent = (info) => {
  return (
    <>
      <b>{info.timeText}</b>
      <i>{info.event.title}</i>
    </>
  )
}

/**
 * 날짜를 누르면 입력 프롬프트 생성 후 정보 기입하는 메서드
 * @param clickInfo 빈 날짜 클릭 정보
 * @return 일정 제목, 시작일, 종료일
 */
const handleDateSelect = (clickInfo) => {
  let title = prompt('일정 제목을 입력해주세요.')
  let calendarApi = clickInfo.view.calendar // 원하는 정보가 담겨있진 않음

  // calendarApi.unselect()

  // 현재는 제목만 입력됨
  if (title) {
    calendarApi.addEvent({
      title: title,
      start: clickInfo.startStr,
      end: clickInfo.endStr,
      // allDay: selectInfo.allDay 시간기능 구현해야지만 됨
    })
  }
}

/**
 * 일정을 클릭하면 일정이 삭제됨 ( db 연동 해야함 )
 * 일정 상세보기 구현해야함
 * @param clickInfo 일정 클릭했을 때의 정보
 */
const handleEventClick = (clickInfo) => {
  if (window.confirm(`${clickInfo.event.title} 일정을 삭제하시겠습니까?`)) {
    clickInfo.event.remove()
  }
}

const MyCalendar = ()=> {
  const [eventdata, setEvents] = useState([]);
  // 환경변수로 API 키 숨기기
  const apiKey = process.env.REACT_APP_CAL_API_KEY;
  // const apiKey = import.meta.env.REACT_APP_CAL_API_KEY; 

  /**
   * 서버에서로부터 데이터 가져오는 메서드
   */
  useEffect(() => {
    fetch("/api/event")
        .then((res) => {return res.json();})
        .then((data) => {setEvents(data);})
  }, []);

  return( 
        <div className="cal-container">
          <FullCalendar 
            plugins={[dayGridPlugin, timeGridPlugin, interactionPlugin, googleCalendarPlugin]}
            initialView={'dayGridMonth'} // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
            // 해더에 표시할 툴바
            headerToolbar={{
              start: 'today', 
              center: 'title',
              end: 'prev,next' 
            }}
            // 더미데이터 + 공휴일 불러 오기
            // events={[
            //   { title: '창립기념일', 
            //     start: '2023-12-10',
            //     end: '2023-12-15' },
            //   { title: '워크샵', date: '2023-12-24' }
            // ]}
            /* 구글 캘린더 API 추가 */
            googleCalendarApiKey={apiKey}
            events={{googleCalendarId:'sistar96@gmail.com',
              googleCalendarId : 'ko.south_korea#holiday@group.v.calendar.google.com',
              className : 'ko_event' }}
            eventDisplay={'block'}
            eventClick={handleEventClick}
            editable={true}
            selectable={true} // 달력 일자 드래그 설정가능
            dayMaxEvents={true} // 일정이 오버되면 높이 제한 +더보기 나오는 기능
            select={handleDateSelect}
            height={"85vh"}
            locale={'ko'} // 한국어 설정
            // eventAdd={function(){}} // 이벤트가 추가되면 발생하는 이벤트
            // eventChange={function(){}} // 이벤트가 수정되면 발생하는 이벤트
            // eventContent={renderEventContent}
            // 서버에서 출력은 되지만 날짜가 같이 입력됨. 수정해야함
            // events={eventdata.map((title) => 
            //   ({ title, start: '2023-12-10', end: '2023-12-13' }))} // 동적으로 불러온 데이터를 사용
          />
        </div>
    )
}

export default MyCalendar;