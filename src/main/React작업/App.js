import Footer from "./components/footer";
import Sidebar from "./components/sidebar";
import Topbar from "./components/topbar";
import Eventmanage from "./pages/Eventmanage";
import Vacation from "./pages/Vacation";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import './utils/css/sb-admin-2.css';

const App = () => {
  // const [event, setEvent] = useState("");

  // useEffect(()=>{
  //   axios.post("/api/events").then((response)=>{
  //       console.log(response.data);
  //       setEvent(response.data)
  //     }
  //   );
  // }, []);
  

  return (
    <BrowserRouter>
            <Routes>
                <Route path="/event" element={<Eventmanage />} />
                <Route path="/vac" element={<Vacation />}/>
            </Routes>
            <div id="page-top">
          <div id="wrapper">
            

            {/* 여기에 sidebar 컴포넌트를 렌더링하는 코드 추가 */}
              <Sidebar />
            
            {/* 여기에 content-wrapper와 topbar 컴포넌트를 렌더링하는 코드 추가 */}
            <div id="content-wrapper" class="d-felx flex-column">
            
            {/* User Information 에 이름 출력하게하기 */}
            <div id="content">
              <Topbar />
            </div>
            
          <div className="container-fluid">
            {/* 여기에 현재 접속한 사원이름 출력과 연차현황 출력 */}
            <div class="d-sm-flex align-items-center justify-content-between mb-4"> 
              <h1 class="h3 mb-0 text-gray-800">기본 Home</h1> 
            </div>

                <div>
                  <Footer />
                </div>

            </div>
          </div>
        </div>
        </div>
    </BrowserRouter>
    
  );
}

export default App;
