import React , { useState }from 'react';
import FullCalendar from '@fullcalendar/react';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from "@fullcalendar/timegrid";
import interactionPlugin from "@fullcalendar/interaction";
import axios from "axios";
import './Mycalendar.css'

/**
 * FullCalendar API 사용
 * npm install --save @fullcalendar/react @fullcalendar/core @fullcalendar/daygrid @fullcalendar/interaction @fullcalendar/timegrid
 * npm install style-loader css-loader sass-loader node-sass --save
 */

/**
 * 일정 출력 모양을 커스텀 하는 함수
 * @param eventInfo 이벤트 정보
 * @return 일정 제목과 시간
 *  */ 
const renderEventContent = (eventInfo) => {
  return (
    <>
      <b>{eventInfo.timeText}</b>
      <i>{eventInfo.event.title}</i>
    </>
  )
}

/**
 * 날짜를 누르면 입력 프롬프트 생성 후 정보 기입하는 메서드
 * @param selectInfo 선택된 정보
 * @return 일정 제목, 시작일, 종료일
 */
const handleDateSelect = (selectInfo) => {
  let title = prompt('일정 제목을 입력해주세요.')
  let calendarApi = selectInfo.view.calendar

  // calendarApi.unselect()

  // 현재 제목만 입력됨
  if (title) {
    calendarApi.addEvent({
      title: title,
      start: selectInfo.startStr,
      end: selectInfo.endStr,
      // allDay: selectInfo.allDay 시간기능 구현해야지만 됨
    })
  }
}

/**
 * 일정을 클릭하면 일정이 삭제됨 ( db 연동 해야함 )
 * 일정 상세보기 구현하기
 * @param clickInfo 일정 클릭했을 때의 정보
 */
const handleEventClick = (clickInfo) => {
  if (window.confirm(`${clickInfo.event.title} 일정을 삭제하시겠습니까?`)) {
    clickInfo.event.remove()
  }
}

const MyCalendar = ()=> {
  const [events, setEvents] = useState([]);

  return( 
        <div className="App">
          <FullCalendar 
            plugins={[dayGridPlugin, timeGridPlugin, interactionPlugin]}
            initialView={'dayGridMonth'} // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
            // 해더에 표시할 툴바
            headerToolbar={{
              start: 'today', 
              center: 'title',
              end: 'prev,next' 
            }}
            events={[
              { title: '창립기념일', // 더미데이터
                start: '2023-12-10',
                end: '2023-12-15' },
              { title: '워크샵', date: '2023-12-24' }
            ]}
            editable={true}
            selectable={true} // 달력 일자 드래그 설정가능
            dayMaxEvents={true} // 일정이 오버되면 높이 제한 +더보기 나오는 기능
            select={handleDateSelect}
            height={"85vh"}
            locale={'ko'} // 한국어 설정
            eventAdd={function(){}} // 이벤트가 추가되면 발생하는 이벤트
            eventChange={function(){}} // 이벤트가 수정되면 발생하는 이벤트
            eventContent={renderEventContent}
            eventClick={handleEventClick}
            // events={events}
          />
        </div>
    )
}

export default MyCalendar;