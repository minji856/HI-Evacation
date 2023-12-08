import React, { Component } from 'react';
import FullCalendar from '@fullcalendar/react';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from "@fullcalendar/timegrid";
import interactionPlugin from "@fullcalendar/interaction";
import Axios from "axios";
import './Mycalendar.css'

const MyCalendar = ()=> {
  const dateClick = (info) => {
    alert(info.dateStr)
  }

  const eventClick = (info) => {
    const eventTitle = info.event.title;
    alert(`Clicked on event: ${eventTitle}`);

    sendEventToServer(eventTitle);
  };

  const sendEventToServer = (eventTitle) => {
    Axios.post('/api/saveEventTitle', { eventTitle })
      .then(response => {
        console.log('Server response:', response.data);
      })
      .catch(error => {
        console.error('값이 넘어오지 않았습니다.', error);
      });
  }

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
            height={"85vh"}
            dateClick={dateClick}
            eventClick={eventClick}
            events={[
              { title: '창립기념일', date: '2023-12-10' },
              { title: '워크샵', date: '2023-12-24' }
          ]}

          // events: '/api/demo-feeds/events.json'
          />
        </div>
    )
}
export default MyCalendar;