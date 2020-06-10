package action;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.SignUp_Service;
import vo.UserDTO;

public class SignUp_Action {

	public static ActionForward signAction(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, SQLException {

		ActionForward forward = new ActionForward();
		UserDTO userDTO = new UserDTO();

		userDTO.setId(request.getParameter("id"));
		userDTO.setPassword(request.getParameter("password"));
		userDTO.setName(request.getParameter("name"));
		userDTO.setBirth(request.getParameter("birth"));
		userDTO.setPhone(request.getParameter("phone"));
		userDTO.setAddress(request.getParameter("address"));
		userDTO.setEmail(request.getParameter("email"));

		int result = SignUp_Service.signupSvc(userDTO);
		if (result == 1) {
			// 회원가입 성공
			forward.setPath("../alert/Success.jsp");
			return forward;
		} else if(result == -4) {
			forward.setPath("../alert/Fail.jsp?key=name");
		} else if(result == -5) {
			forward.setPath("../alert/Fail.jsp?key=phone");
		} else if(result == -6) {
			forward.setPath("../alert/Fail.jsp?key=email");
		} else if(result == -7) {
			forward.setPath("../alert/Fail.jsp?key=id");
		}

		return forward;
	}

}
