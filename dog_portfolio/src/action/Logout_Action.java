package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Logout_Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();

		session.removeAttribute("userID");
		session.removeAttribute("userPassword");
		forward.setPath("../alert/Success.jsp");
		request.setAttribute("suc", "logout");
		return forward;
	}

}
