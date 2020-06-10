package svc;

import java.sql.Connection;
import java.sql.SQLException;

import dao.UserDAO;
import db.JdbcUtill;
import vo.UserDTO;

public class Login_Service {

	public static int loginSvc(UserDTO userDTO) throws ClassNotFoundException, SQLException {
		Connection conn = JdbcUtill.DB_Connection();
		UserDAO userDAO = new UserDAO();
		userDAO.connect(conn);
		int result = userDAO.login(userDTO);
		return result;
	}
}
