package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import board.common.DBManager;
import board.dto.UserDto;

//singleton
public class UserDaoImpl implements UserDao {
	private static UserDaoImpl instance = new UserDaoImpl();
	
	private UserDaoImpl() {}
	
	public static UserDaoImpl getInstance() {
		return instance;
	}
	
	@Override
	public int userRegister(UserDto userDto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int ret = -1;
		try {
			con = DBManager.getConnection();
			//insert
			StringBuilder sb = new StringBuilder();
	
			sb.append(" insert into users")
			                .append( " ( user_name, user_password, user_email, user_register_date ) ")
			                .append(" value( ?, ?, ?, now() )");
			
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, userDto.getUserName());
			pstmt.setString(2, userDto.getUserPassword());
			pstmt.setString(3, userDto.getUserEmail());
			
			ret = pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.releaseConnection(pstmt, con);
		}
		return ret;
	}
	
	public int userLogin(String id, String pw) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int ret = -1;
		ResultSet rs;
		
		try {
			con = DBManager.getConnection();
			String query = "SELECT * FROM users WHERE user_name = ? AND user_password = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			System.out.println(query);

			rs = pstmt.executeQuery();
			if(rs.next()) {
				ret=1;
			}

			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}
	
}





















