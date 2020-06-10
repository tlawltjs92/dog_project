package dao;

import java.sql.*;

import vo.InfoDTO;

public class InfoDAO {
	Connection conn;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public void connect(Connection conn) {
		this.conn = conn;
	}

	public InfoDTO view(String id) {
		InfoDTO infoDTO = null;
		try {
			String sql = "select id, name, to_char(birth,'yyyy-MM-dd') as birth, phone, address, email from member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				infoDTO = new InfoDTO();
				infoDTO.setId(rs.getString("id"));
				infoDTO.setName(rs.getString("name"));
				infoDTO.setBirth(rs.getString("birth"));
				infoDTO.setPhone(rs.getString("phone"));
				infoDTO.setAddress(rs.getString("address"));
				infoDTO.setEmail(rs.getString("email"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return infoDTO;
	}

	public InfoDTO update(String id, String password) {
		InfoDTO infoDTO = null;
		try {
			if (password != null) {
				pstmt = conn.prepareStatement("select password from member where id=?");
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					if (!rs.getString("password").equals(password)) {
						return null; // 비밀번호 오류
					}
				}
			}

			pstmt = conn.prepareStatement("select id, password, name, to_char(birth,'yyyy-MM-dd') as birth, phone, address, email from member where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				infoDTO = new InfoDTO();
				infoDTO.setId(rs.getString("id"));
				infoDTO.setPassword(rs.getString("password"));
				infoDTO.setName(rs.getString("name"));
				infoDTO.setBirth(rs.getString("birth"));
				infoDTO.setPhone(rs.getString("phone"));
				infoDTO.setAddress(rs.getString("address"));
				infoDTO.setEmail(rs.getString("email"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return infoDTO;
	}

	public int update(InfoDTO infoDTO) {
		try {
			if (infoDTO.getName() != null) {
				pstmt = conn.prepareStatement("select name, id from member");
				rs = pstmt.executeQuery();

				while (rs.next()) {
					if (rs.getString("name").equals(infoDTO.getName()) && !rs.getString("id").equals(infoDTO.getId())) {
						return -4; // 닉네임 중복
					}
				}
			}
			if (infoDTO.getPhone() != null) {
				pstmt = conn.prepareStatement("select phone, id from member");
				rs = pstmt.executeQuery();

				while (rs.next()) {
					if (rs.getString("phone").equals(infoDTO.getPhone())
							&& !rs.getString("id").equals(infoDTO.getId())) {

						return -5; // 전화번호 중복

					}
				}
			}
			if (infoDTO.getEmail() != null) {
				pstmt = conn.prepareStatement("select email, id from member");
				rs = pstmt.executeQuery();

				while (rs.next()) {
					if (rs.getString("email").equals(infoDTO.getEmail())
							&& !rs.getString("id").equals(infoDTO.getId())) {
						return -6; // 이메일 중복
					}
				}
			}

			pstmt = conn.prepareStatement(
					"update member set password=?, name=?, birth=?, phone=?, address=?, email=? where id=?");
			pstmt.setString(1, infoDTO.getPassword());
			pstmt.setString(2, infoDTO.getName());
			pstmt.setString(3, infoDTO.getBirth());
			pstmt.setString(4, infoDTO.getPhone());
			pstmt.setString(5, infoDTO.getAddress());
			pstmt.setString(6, infoDTO.getEmail());
			pstmt.setString(7, infoDTO.getId());

			int result = pstmt.executeUpdate();

			if (result != 0) {
				return 1; // 수정 완료
			} else {
				return -1; // 수정 실패
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0; // db 오류
	}

	public int delete(String id, String password) {
		int result = 0;
		try {
			if (password != null) {
				pstmt = conn.prepareStatement("select password from member where id=?");
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					if (!rs.getString("password").equals(password)) {
						return -1; // 비밀번호 오류
					}
				}
			}

			pstmt = conn.prepareStatement("delete from member where id=?");
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int delete(String id) {
		try {
			String sql = "DELETE MEMBER WHERE ID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			int result = pstmt.executeUpdate();

			if (result > 0) {
				return 1; // 삭제 성공
			} else {
				return 0; // 삭제 실패
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return 0;
	}
}
