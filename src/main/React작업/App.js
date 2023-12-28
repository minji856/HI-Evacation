import Footer from "./components/footer";
import Sidebar from "./components/sidebar";
import Topbar from "./components/topbar";
import Eventmanage from "./pages/Eventmanage";
import Vacation from "./pages/Vacation";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import './utils/css/sb-admin-2.css';

const App = () => {
  return (
    <BrowserRouter>
      <div id="page-top">
        <div id="wrapper">
          {/* sidebar 컴포넌트를 렌더링하는 코드 추가 */}
            <Sidebar/>
          {/* content-wrapper와 topbar 컴포넌트를 렌더링하는 코드 추가 */}
          <div id="content-wrapper" class="d-felx flex-column">
            {/* User Information 에 이름 출력하게하기 */}
            <div id="content">
              <Topbar />
            </div>
            <div className="container-fluid">
            {/* 여기에 현재 접속한 사원이름 출력과 연차현황 출력 */}
              <Routes>
                  <Route path="/event" element={<Eventmanage />} />
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
