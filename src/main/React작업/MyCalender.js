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
 * @param dateClick 날짜를 눌러서 일정등록 (현재는 날짜누르면 알림창만 구현함)
 * @param eventClick 일정 상세보기
 * @param events 일정
 * @returns 현재 날짜 지정 이벤트
 */

// 일정을 커스텀 하는 옵션 (여러개일땐?)
const renderEventContent = (eventInfo) => {
  return (
    <>
      <b>{eventInfo.timeText}</b>
      <i>{eventInfo.event.title}</i>
    </>
  )
}

const handleDateSelect = (selectInfo) => {
  let title = prompt('일정 제목을 입력해주세요.')
  let calendarApi = selectInfo.view.calendar

  calendarApi.unselect() // clear date selection

  if (title) {
    calendarApi.addEvent({
      // id: createEventId(), 아직 메소드 정의 안됨
      title,
      start: selectInfo.startStr,
      end: selectInfo.endStr,
      allDay: selectInfo.allDay
    })
  }
}

// 일정을 클릭하면 일정이 삭제됨 ( db 연동 해야함 )
const handleEventClick = (clickInfo) => {
  if (window.confirm(`${clickInfo.event.title} 일정을 삭제하시겠습니까?`)) {
    clickInfo.event.remove()
  }
}

const MyCalendar = ()=> {
  const [events, setEvents] = useState([]);
  const [currentEvents, setCurrentEvents] = useState([]);

  // const handleEvents = (events) => {
  //   setCurrentEvents(events);
  // }

  return( 
        <div className="App">
          <FullCalendar 
            plugins={[dayGridPlugin, timeGridPlugin, interactionPlugin]}
            initialView={'dayGridMonth'}
            headerToolbar={{
              start: 'today', 
              center: 'title',
              end: 'prev,next' 
            }}
            events={[
              { title: '창립기념일',
                start: '2023-12-10T14:30:00',
                date: '2023-12-10' },
              { title: '워크샵', date: '2023-12-24' }
            ]}
            editable={true}
            selectable={true}
            dayMaxEvents={true}
            select={handleDateSelect}
            height={"85vh"}
            eventAdd={function(){}}
            eventContent={renderEventContent}
            eventClick={handleEventClick}
            // eventsSet={handleEvents()}
            // events={events}
          />
        </div>
    )
}

export default MyCalendar;