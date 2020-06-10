package svc;

import java.sql.Connection;
import java.sql.SQLException;

import dao.UserDAO;
import db.JdbcUtill;
import vo.UserDTO;

public class SignUp_Service {

	public static int signupSvc(UserDTO userDTO) throws ClassNotFoundException, SQLException {

		Connection conn = JdbcUtill.DB_Connection();
		UserDAO userDAO = new UserDAO();
		userDAO.connect(conn);
		int result = userDAO.join(userDTO);
		JdbcUtill.Close_DB(conn);
		return result;
	}

}
