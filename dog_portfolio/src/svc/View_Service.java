package svc;

import java.sql.Connection;
import java.sql.SQLException;

import dao.InfoDAO;
import db.JdbcUtill;
import vo.InfoDTO;

public class View_Service {

	public static InfoDTO viewSvc(String id) throws ClassNotFoundException, SQLException {
		Connection conn = JdbcUtill.DB_Connection();
		InfoDAO infoDAO = new InfoDAO();
		infoDAO.connect(conn);
		InfoDTO infoDTO = infoDAO.view(id);

		return infoDTO;
	}

}
