package action;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.Update_Service;
import vo.InfoDTO;

public class Update_Action {

	public static ActionForward updateAction(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, SQLException {
		ActionForward forward = new ActionForward();
		InfoDTO infoDTO = new InfoDTO();

		infoDTO.setId(request.getParameter("id"));
		infoDTO.setPassword(request.getParameter("password"));
		infoDTO.setName(request.getParameter("name"));
		infoDTO.setBirth(request.getParameter("birth"));
		infoDTO.setPhone(request.getParameter("phone"));
		infoDTO.setAddress(request.getParameter("address"));
		infoDTO.setEmail(request.getParameter("email"));
		
		int result = Update_Service.updateSvc(infoDTO);

		if (result == 1) {
			// 수정 성공
			forward.setPath("../alert/Success.jsp");
			return forward;
		} else if (result == -4) {
			forward.setPath("../alert/Fail.jsp?key=name");
		} else if (result == -5) {
			forward.setPath("../alert/Fail.jsp?key=phone");
		} else if (result == -6) {
			forward.setPath("../alert/Fail.jsp?key=email");
		}
		return forward;
	}

}
