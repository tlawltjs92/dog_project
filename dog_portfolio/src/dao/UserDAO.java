package dao;

import java.sql.*;

import vo.UserDTO;

public class UserDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public void connect(Connection conn) {
		this.conn = conn;
	}

	public int join(UserDTO userDTO) {
		try {
			// 회원 가입
			if(userDTO.getId() != null) {
				pstmt = conn.prepareStatement("select id from member");
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					if (rs.getString("id").equals(userDTO.getId())) {
						return -7; // 아이디 중복
					}
				}
			}
			if (userDTO.getName() != null) {
				pstmt = conn.prepareStatement("select name from member");
				rs = pstmt.executeQuery();

				while (rs.next()) {
					if (rs.getString("name").equals(userDTO.getName())) {
						return -4; // 닉네임 중복
					}
				}
			}
			if (userDTO.getPhone() != null) {
				pstmt = conn.prepareStatement("select phone from member");
				rs = pstmt.executeQuery();

				while (rs.next()) {
					if (rs.getString("phone").equals(userDTO.getPhone())) {
						return -5; // 전화번호 중복
					}
				}
			}
			if (userDTO.getEmail() != null) {
				pstmt = conn.prepareStatement("select email from member");
				rs = pstmt.executeQuery();

				while (rs.next()) {
					if (rs.getString("email").equals(userDTO.getEmail())) {
						return -6; // 이메일 중복
					}
				}
			}

			pstmt = conn.prepareStatement("insert into member values(?,?,?,?,?,?,?)");
			pstmt.setString(1, userDTO.getId());
			pstmt.setString(2, userDTO.getPassword());
			pstmt.setString(3, userDTO.getName());
			pstmt.setString(4, userDTO.getBirth());
			pstmt.setString(5, userDTO.getPhone());
			pstmt.setString(6, userDTO.getAddress());
			pstmt.setString(7, userDTO.getEmail());
			int result = pstmt.executeUpdate();

			if (result != 0) {
				return 1; // 회원가입 완료
			} else {
				return -1; // 값을 잘못넣을 경우
			}
		} catch (

		SQLIntegrityConstraintViolationException e) {
			return -2; // 아이디값 중복
		} catch (SQLDataException e) {
			return -3; // 데이터값 틀려서 오류
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeJDBC(conn, pstmt);
		}
		return 0; // db오류
	}
	
	public int login(UserDTO userDTO) {
		try {
			pstmt = conn.prepareStatement("select * from member where id=?");
			pstmt.setString(1, userDTO.getId());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(userDTO.getPassword().equals(rs.getString("password"))) {
					return 1;		// 로그인 완료
				}
				return -1;			// 비밀번호 오류
			} else {
				return -2;			// 없는 아이디
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeJDBC(conn, pstmt, rs);
		}
		return 0;					// db오류
	}


	public void closeJDBC(Connection conn, PreparedStatement pstmt) {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void closeJDBC(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	
	

	// ======================================================================

}