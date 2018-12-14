package Servlet;

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
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
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
		String uid = request.getParameter("id");
		int id = Integer.parseInt(uid);
		try{
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/yanhuitechnology?useUnicode=true&characterEncoding=utf8","root","root");
			
			String sql = "delete from users where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,id);
			ps.executeUpdate();
			ps.close();
			conn.close();
			response.sendRedirect("admin/web/tab/user.jsp");
				//request.getRequestDispatcher("admin/web/main.html").forward(request, response);
					
	      }catch(Exception ex)
	      {
	    	  ex.printStackTrace();
	      }

	}

}
