package svc;

import java.sql.Connection;
import java.sql.SQLException;

import dao.InfoDAO;
import db.JdbcUtill;
import vo.InfoDTO;

public class Check_Service {
	public static InfoDTO updateSvc(String id, String password) throws ClassNotFoundException, SQLException {
		Connection conn = JdbcUtill.DB_Connection();
		InfoDAO infoDAO = new InfoDAO();
		infoDAO.connect(conn);
		InfoDTO infoDTO = infoDAO.update(id, password);

		return infoDTO;
	}

	public static int deleteSvc(String id, String password) throws ClassNotFoundException, SQLException {
		Connection conn = JdbcUtill.DB_Connection();
		InfoDAO infoDAO = new InfoDAO();
		infoDAO.connect(conn);
		int result = infoDAO.delete(id, password);

		return result;
	}

}
