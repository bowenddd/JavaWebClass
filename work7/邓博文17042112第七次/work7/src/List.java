
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Servlet implementation class List
 */
@WebServlet("/List")
public class List extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public List() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String check=request.getParameter("check");
		System.out.println(check);
		int []id = new int[100];
		String [] link = new String[100];
		String [] pwd = new String[100];
		String [] roles = new String[100];
		String [] uid = new String[100];
		String [] username = new String[100];
		int i = 0;
		try{
			Class.forName("com.mysql.jdbc.Driver");	
			Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatebase?useUnicode=true&characterEncoding=utf8","root","root");
			Statement stmt = (Statement) conn.createStatement();	
			ResultSet rs = stmt.executeQuery("select * from students");				
			while(rs.next()){	
				id[i]=rs.getInt("id");
				System.out.println(id[i]);
				link[i] = rs.getString("link");
				pwd[i] = rs.getString("pwd");
				roles[i] = rs.getString("roles");
				uid[i] = rs.getString("uid");
				username[i] = rs.getString("username");
				request.setCharacterEncoding("GBK");
				String sid = Integer.toString(id[i]);
				request.setAttribute("id"+Integer.toString(i),sid);
				request.setAttribute("link"+Integer.toString(i) , link[i]);
				request.setAttribute("pwd"+Integer.toString(i) , pwd[i]);
				request.setAttribute("roles"+Integer.toString(i) , roles[i]);
				request.setAttribute("uid"+Integer.toString(i) , uid[i]);
				request.setAttribute("username"+Integer.toString(i) , username[i]);
				i++;
			}
			request.setAttribute("sum",Integer.toString(i));
			System.out.println(i);
			request.setAttribute("check",check);
			request.getRequestDispatcher("show.jsp").forward(request, response);


		}
        catch(Exception ex){
		    ex.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
