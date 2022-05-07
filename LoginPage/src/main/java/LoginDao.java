 import java.sql.DriverManager;

import java.sql.*;

public class LoginDao {

	public static void main(String[] args) {

	}

	public static boolean Validate(String uname, String pass) {
		
		boolean status=false;
		
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe" , "alpha" , "123456");
			
			PreparedStatement psmt = conn.prepareStatement("select * FROM Login WHERE username=? AND password=?");
			
			psmt.setObject(1, uname);
			psmt.setObject(2, pass);
			
			//System.out.println(uname + " " + pass);
			
			ResultSet rs = psmt.executeQuery();
			status = rs.next();
			
		}
		
		catch(ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		
		return status;
	}


}
