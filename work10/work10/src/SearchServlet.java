


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
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
		request.setCharacterEncoding("gb2312");
		String username=request.getParameter("username");
		String uid=request.getParameter("userid");
		System.out.println(username);
		System.out.println(uid);
		try{
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatebase?useUnicode=true&characterEncoding=utf8","root","root");
			
			Statement stmt = (Statement) conn.createStatement();
			
			ResultSet rs = stmt.executeQuery("select * from students where uid='" + uid + "' and username='"+ username +"'");
			if(rs.next()) {
				username =  rs.getString("username");
				uid = rs.getString("uid");
				request.setCharacterEncoding("GBK");
				request.setAttribute("username",username);
				request.setAttribute("userid", uid);
				System.out.println("success£¡");
				request.getRequestDispatcher("show.jsp").forward(request, response);
			}
			else {
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
			
			
	      }catch(Exception ex)
	      {
	    	  ex.printStackTrace();
	      }
		
	}

}
