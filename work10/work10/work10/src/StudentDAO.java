import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import Users.User;

public class StudentDAO {
	public User Searchstudent(String username , String uid) {
		User user = new User();
		try{
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatebase?useUnicode=true&characterEncoding=utf8","root","root");
			
			Statement stmt = (Statement) conn.createStatement();
			
			ResultSet rs = stmt.executeQuery("select * from students where uid='" + uid + "' and username='"+ username +"'");
			
			if(rs.next()) {
				username =  rs.getString("username");
				uid = rs.getString("uid");
				user.setUserid(uid);
				user.setUsername(username);
				System.out.println("success£¡");
//				request.getRequestDispatcher("show.jsp").forward(request, response);
			}		
	      }catch(Exception ex)	      {
	    	  ex.printStackTrace();
	      }
		return user;
	}
}
