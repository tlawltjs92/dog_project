package action;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.Check_Service;
import vo.InfoDTO;

public class Check_Action {

	public static ActionForward updateAction(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		InfoDTO infoDTO = new InfoDTO();
		String id = (String) session.getAttribute("userID");
		String password = request.getParameter("password");
		
		infoDTO = Check_Service.updateSvc(id, password);
		
		if(infoDTO != null) {
			session.setAttribute("infoDTO", infoDTO);
			forward.setPath("../info/my_info.jsp?contentPage=update_form");
		} else {
			forward.setPath("../alert/Fail.jsp?key=check");
		}
		
		return forward;
	}

	public static ActionForward deleteAction(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		String id = (String) session.getAttribute("userID");
		String password = request.getParameter("password");
		
		int result = Check_Service.deleteSvc(id, password);
		
		if(result == 1) {
			// 삭제 성공
			session.removeAttribute("userID");
			session.removeAttribute("userPassword");
			forward.setPath("../alert/Success.jsp");
		} else {
			// 삭제 실패
			forward.setPath("../alert/Fail.jsp?key=check");
		}
		
		return forward;
	}

}
