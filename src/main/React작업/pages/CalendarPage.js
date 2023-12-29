import MyCalendar from "../components/MyCalender";
import '../utils/css/sb-admin-2.css';

const Eventmanage = () => {
  return (
    <>
            {/* 여기에 현재 접속한 사원이름 출력과 연차현황 출력 */}
      <div class="d-sm-flex align-items-center justify-content-between mb-4"> 
        <h1 class="h3 mb-0 text-gray-800">일정관리</h1> 
      </div>
    {/* Calendar 컴포넌트 추가   */}
    <div class="row">
        <div class="col-xl-8 col-lg-7">
          <MyCalendar />
        </div>
    </div>
  </>
  );
}

export default Eventmanage;
