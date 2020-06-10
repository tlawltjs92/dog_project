package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import action.Logout_Action;
import action.Search_Action;
import action.View_Action;

@WebServlet("*.do")
public class Page_Controller extends HttpServlet {

	private void process(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, ClassNotFoundException, SQLException, ParseException {
		String RequestURI = request.getRequestURI(); // URI의 맵핑주소를 가져온다.
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length()); // 원하는 URI 부분만 가져온다.
		ActionForward forward = null;

		if (command.equals("/main.do")) { // index -> 메인 페이지로
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("main/main_petFind.jsp");
		} else if (command.equals("/main/main.do")) { // 로고 클릭 -> 메인페이지로
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("main_petFind.jsp");
		} else if (command.equals("/main/login.do")) { // 로그인 회원가입 (헤드부분) 클릭 시 로그인,회원가입 페이지로
			String path = request.getParameter("contentPage");
			forward = new ActionForward();
			request.setAttribute("contentPage", path);
			forward.setPath("/login_join/template.jsp");
		} else if (command.equals("/main/template.do")) { // 로그인 회원가입 클릭 시
			String path = request.getParameter("contentPage");
			forward = new ActionForward();
			request.setAttribute("contentPage", path);
			forward.setPath("/login_join/template.jsp");
		} else if (command.equals("/main/myinfo.do")) { // 내정보 페이지
			String path = request.getParameter("contentPage");
			request.setAttribute("contentPage", path);
			forward = new ActionForward();
			View_Action va = new View_Action();
			forward = va.execute(request, response);
		} else if (command.equals("/main/list.do")) { // 유기견 조회 페이지
			forward = new ActionForward();
			String path = request.getParameter("count");
			if (path == null) {
				path = "1";
			}
			forward.setPath("/search/dog_list.jsp?count=" + path);
		} else if (command.equals("/main/logout.do")) { // 로그아웃 페이지
			forward = new ActionForward();
			Logout_Action logout = new Logout_Action();
			forward = logout.execute(request, response);
		} else if (command.equals("/main/dog_info.do")) {
			forward = new ActionForward();
			request.setAttribute("desertionNo", request.getParameter("desertionNo"));
			request.setAttribute("happenDt", request.getParameter("happenDt"));
			request.setAttribute("happenPlace", request.getParameter("happenPlace"));
			request.setAttribute("kindcd", request.getParameter("kindcd"));
			request.setAttribute("color", request.getParameter("color"));
			request.setAttribute("age", request.getParameter("age"));
			request.setAttribute("weight", request.getParameter("weight"));
			request.setAttribute("noticeNo", request.getParameter("noticeNo"));
			request.setAttribute("noticeSdt", request.getParameter("noticeSdt"));
			request.setAttribute("noticeEdt", request.getParameter("noticeEdt"));
			request.setAttribute("popfile", request.getParameter("popfile"));
			request.setAttribute("processState", request.getParameter("processState"));
			request.setAttribute("sex", request.getParameter("sex"));
			request.setAttribute("neuter", request.getParameter("neuter"));
			request.setAttribute("special", request.getParameter("special"));
			request.setAttribute("careNm", request.getParameter("careNm"));
			request.setAttribute("careTel", request.getParameter("careTel"));
			request.setAttribute("careAddr", request.getParameter("careAddr"));
			request.setAttribute("orgNm", request.getParameter("orgNm"));
			request.setAttribute("officetel", request.getParameter("officetel"));
			forward.setPath("/search/dog_info.jsp");
		} else if(command.equals("/main/find.do")) {
			forward = new ActionForward();
			request.setAttribute("upr_cd", request.getParameter("upr_cd"));
			request.setAttribute("org_cd", request.getParameter("org_cd"));
			request.setAttribute("care", request.getParameter("care"));
			request.setAttribute("care_reg_no", request.getParameter("care_reg_no"));
			request.setAttribute("state", request.getParameter("state"));
			request.setAttribute("bgnde", request.getParameter("bgnde"));
			request.setAttribute("endde", request.getParameter("endde"));
			request.setAttribute("upkind", request.getParameter("upkind"));
			request.setAttribute("kind", request.getParameter("kind"));
			request.setAttribute("neuter_yn", request.getParameter("neuter_yn"));
			Search_Action search = new Search_Action();
			forward = search.execute(request, response);
		}

		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
				rd.forward(request, response);
			}
		}

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			try {
				process(request, response);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (ClassNotFoundException | IOException | ServletException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			try {
				process(request, response);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (ClassNotFoundException | IOException | ServletException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
