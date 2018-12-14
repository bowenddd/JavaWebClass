package db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ConnectDB {
	private String content;
	private Statement stmt = null;
	private String[]news = new String[100];
	private int []id = new int[100];
	private String[]usersname = new String[100];
	private String[]pwd = new String[100];
	private int usersnum;
	private String username;
	private String userpwd;
	public ConnectDB() {
		try{
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/yanhuitechnology?useUnicode=true&characterEncoding=utf8","root","root");
			
			stmt = (Statement) conn.createStatement();
		}catch(Exception ex)
	      {
	    	  ex.printStackTrace();
	      }
	}
	public void ConnectDBlanmu(String name ,String id ) {
		try{			
			ResultSet rs = stmt.executeQuery("select * from lanmu  where " + name + " = '" + id + "'");
			rs.next();
			content = rs.getString("ldescription");
			System.out.println("success!!");
		}catch(Exception ex)
	      {
	    	  ex.printStackTrace();
	      }
	}
	public void ConnectDBnews(String name ,String id,String content ) {
		int i = 0;
		try{			
			ResultSet rs = stmt.executeQuery("select * from news  where " + name + " = '" + id + "'");
			while(rs.next()) {
				news[i] = rs.getString(content);
				i++;
			}		
			System.out.println("success!!");
		}catch(Exception ex)
	      {
	    	  ex.printStackTrace();
	      }
	}
	public void ConnectDBusers() {
		int i = 0;
		try{			
			ResultSet rs = stmt.executeQuery("select * from users ");
			while(rs.next()) {
				id[i] = rs.getInt("id");
				usersname[i] = rs.getString("username");
				pwd[i] = rs.getString("pwd");
				i++;
			}
			this.usersnum = i;
		}catch(Exception ex)
	      {
	    	  ex.printStackTrace();
	      }
	}
	public void ConnectDBuser(String uid) {
		try{			
			ResultSet rs = stmt.executeQuery("select * from users where id = " + uid );
			if(rs.next()) {
				username = rs.getString("username");
				userpwd = rs.getString("pwd");
			}
		}catch(Exception ex)
	      {
	    	  ex.printStackTrace();
	      }
	}
	public String getcontent() {
		return this.content;
	}
	public String[] getnews() {
		return this.news;
	}
	public int[] getid() {
		return this.id;
	}
	public String[] getusersname(){
		return this.usersname;
	}
	public String[] getpwd() {
		return this.pwd;
	}
	public int getusersnum() {
		return this.usersnum;
	}
	public String getusername() {
		return this.username;
	}
	public String getuserpwd() {
		return this.userpwd;
	}
}
