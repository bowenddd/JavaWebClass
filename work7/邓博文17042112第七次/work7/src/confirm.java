

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class confirm
 */
@WebServlet("/confirm")
public class confirm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public confirm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("GBK");
		String username=request.getParameter("username");
		String sid=request.getParameter("id");
		String link=request.getParameter("link");
		String pwd=request.getParameter("pwd");
		String roles=request.getParameter("role");
		String uid=request.getParameter("uid");
		int id = Integer.parseInt(sid);
		int rs = 0;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatebase?useUnicode=true&characterEncoding=utf8","root","root");
			
			String sql = "INSERT INTO students(id,link,pwd,roles,uid,username) VALUES (?,?,?,?,?,?)";  
		
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,id);
			pstmt.setString(2,link);
			pstmt.setString(3,pwd);
			pstmt.setString(4,roles);
			pstmt.setString(5,uid);
			pstmt.setString(6,username);
		    rs = pstmt.executeUpdate();			
	      }catch(Exception ex)
	      {
	    	  ex.printStackTrace();
	      }	
		if(rs == 1)
			response.sendRedirect("newconfirm.jsp");
			//如果不存在的话
		
	}
}
