package action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.Login_Service;
import vo.UserDTO;

public class Login_Action {

	public static ActionForward loginAction(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		ActionForward forward = new ActionForward();
		UserDTO userDTO = new UserDTO();
		
		userDTO.setId(request.getParameter("id"));
		userDTO.setPassword(request.getParameter("password"));
		
		int result = Login_Service.loginSvc(userDTO);
		
		if(result == 1) {
			//로그인 성공
			HttpSession session = request.getSession();
			session.setAttribute("userID", userDTO.getId());
			session.setAttribute("userPassword", userDTO.getPassword());
			forward.setPath("../alert/Success.jsp");
			return forward;
		} else if(result == -1) {
			forward.setPath("../alert/Fail.jsp?key=pass");
		} else if(result == -2) {
			forward.setPath("../alert/Fail.jsp?key=noid");
		}
		return forward;
	}
	
}
