package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JdbcUtill {

	static Connection conn;

	public static Connection DB_Connection() throws ClassNotFoundException, SQLException {
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "dog_find", "123321");
		return conn;
	}

	public static void Close_DB(Connection conn) throws SQLException {
		conn.close();
	}

}
