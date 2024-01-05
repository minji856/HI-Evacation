import Footer from "./components/footer";
import Sidebar from "./components/sidebar";
import Topbar from "./components/topbar";
import Vacation from "./pages/Vacation";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import CalendarPage from "./pages/CalendarPage";
import { useEffect, useState } from "react";
import axios from "axios";
// import './utils/css/sb-admin-2.css';

const App = () => {
  const [message, setMessage] = useState("");

  useEffect(()=>{
    axios.get('http://localhost:8484/api/event')
    .then(response => setMessage(response.data))
  })

  /* jwt token 가져오기 */
  fetch("/info",{
    method: 'get',
    headers: {
        'content-type': 'application/json',
        'Authorization': 'Bearer ' + localStorage.getItem("jwt"),
        // {jwt.secret}
    }
    }).then(res => res.json())
        .then(json => alert("이름 : " + json.name+", 비밀번호 : " + json.pwd))
        
  return (
    <BrowserRouter>
      <div id="page-top">
        <div id="wrapper">
            <Sidebar/>
            <h1>{message}</h1>
            <h1>{message}</h1>
            <h1>{message}</h1>
            <h1>{message}</h1>
          <div id="content-wrapper" className="d-felx flex-column">
            {/* User Information 에 이름 출력하게하기 */}
            <div id="content">
              <Topbar />
            </div>
            <div className="container-fluid">
              <Routes>
                  <Route path="/event" element={<CalendarPage />} />
                  <Route path="/vac" element={<Vacation />}/>
                  {/* <Route path="/att" element={<AttendanceTable />}/> */}
              </Routes>
              <div>
                <Footer />
              </div>
            </div>
          </div>
          {/* Wrapper 끝 */}
        </div>
      </div>
    </BrowserRouter>
  );
}

export default App;