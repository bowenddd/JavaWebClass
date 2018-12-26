


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

import Users.User;



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
		StudentDAO  studentDao = new StudentDAO();
		User user = studentDao.Searchstudent(username, uid);
		if(uid.equals(user.getUserid())) {			
			request.setCharacterEncoding("GBK");
			request.setAttribute("username",user.getUsername());
			request.setAttribute("userid", user.getUserid());
			request.getRequestDispatcher("show.jsp").forward(request, response);
		}
		else {
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
		
	}

}
