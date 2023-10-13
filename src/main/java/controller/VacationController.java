package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.EmpvacDto;

@WebServlet("/vac")
public class VacationController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = "";
		
		req.setCharacterEncoding("utf-8");
		
		String cmd = req.getParameter("command");
		HttpSession session = req.getSession();
		
		ArrayList vacList = 
				(ArrayList)session.getAttribute("vacList");
		
		if(cmd.equals("CONFIRM")) {
			url = "/application.jsp";
		}
		
		if(cmd.equals("RETURN")) {
			url = "/vacComplete.html";
		}
		
		if(vacList == null) {
			vacList = new ArrayList();
		}
		
		/* String department = req.getParameter("department"); */
		String department = "인사팀"; // 임시 데이터
		/* String name = req.getParameter("name"); */
		String name = "홍길동"; // 임시로 데이터 삽입
		String vacationtype = req.getParameter("vacationtype");
		String startday = req.getParameter("startday");
		String endday = req.getParameter("endday");
		String starttime = req.getParameter("starttime");
		String endtime = req.getParameter("endtime");
		String numberofdays = req.getParameter("numberofdays");
		String currentTime = req.getParameter("currentTime");
		String reason = req.getParameter("reason");
		
		EmpvacDto dto = new EmpvacDto();
		
		dto.setDepartment(department);
		dto.setName(name);
		dto.setVacationtype(vacationtype);
		dto.setStartday(startday);
		dto.setEndday(endday);
		dto.setStarttime(starttime);
		dto.setEndtime(endtime);
		dto.setNumberofdays(numberofdays);
		dto.setCurrentTime(currentTime);
		dto.setReason(reason);
		
		vacList.add(dto);

		session.setAttribute("vacList", vacList);
		
		RequestDispatcher view =
				req.getRequestDispatcher(url);
		view.forward(req, resp);
	}
}
