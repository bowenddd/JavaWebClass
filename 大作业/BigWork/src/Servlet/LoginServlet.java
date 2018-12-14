package Servlet;

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
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("gb2312");
		String username = request.getParameter("username");
		String pwd = request.getParameter("pwd");
		try{
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/yanhuitechnology?useUnicode=true&characterEncoding=utf8","root","root");
			
			Statement stmt = (Statement) conn.createStatement();
			
			ResultSet rs = stmt.executeQuery("select * from users where username='" + username + "' and pwd='"+ pwd +"'");
			if(rs.next()) {
				response.sendRedirect("admin/web/main.jsp");
				//request.getRequestDispatcher("admin/web/main.html").forward(request, response);
			}
			else {
				response.sendRedirect("admin/login/login.html");
				//request.getRequestDispatcher("admin/login/login.html").forward(request, response);
			}
			
			
	      }catch(Exception ex)
	      {
	    	  ex.printStackTrace();
	      }
		
	}

}
