package action;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.View_Service;
import vo.InfoDTO;

public class View_Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		InfoDTO infoDTO = View_Service.viewSvc((String) session.getAttribute("userID"));
		
		if(infoDTO != null) {
			session.setAttribute("infoDTO", infoDTO);
			forward.setPath("../info/my_info.jsp");
		}
		
		return forward;
	}

}
