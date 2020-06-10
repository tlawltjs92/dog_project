package svc;

import java.sql.Connection;
import java.sql.SQLException;

import dao.InfoDAO;
import db.JdbcUtill;
import vo.InfoDTO;

public class Update_Service {

	public static int updateSvc(InfoDTO infoDTO) throws ClassNotFoundException, SQLException {
		Connection conn = JdbcUtill.DB_Connection();
		InfoDAO infoDAO = new InfoDAO();
		infoDAO.connect(conn);
		int result = infoDAO.update(infoDTO);
		JdbcUtill.Close_DB(conn);
		
		return result;
	}

}
