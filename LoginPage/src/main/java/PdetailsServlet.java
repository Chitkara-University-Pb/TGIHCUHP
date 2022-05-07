

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/PdetailsServlet")
public class PdetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
        public PdetailsServlet() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String a = request.getParameter("uname");
		String b = request.getParameter("cgpa");
		String c = request.getParameter("lknown");
		String d = request.getParameter("crse");
		String e = request.getParameter("skls");
		String f = request.getParameter("glink");
		String g = request.getParameter("plink");
		
		
		try {
            
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe" , "alpha" , "123456");
			
            PreparedStatement psmt = conn.prepareStatement("insert into P_Details values(?,?,?,?,?,?,?)");
            
            psmt.setObject(1, a);
            psmt.setObject(2, b);
            psmt.setObject(3, c);
            psmt.setObject(4, d);
            psmt.setObject(5, e);
            psmt.setObject(6, f);
            psmt.setObject(7, g);
            
            int res = psmt.executeUpdate();
            
            if(res > 0) {
            	
            	RequestDispatcher rd = request.getRequestDispatcher("home.html");
            	
            	rd.forward(request, response);
            	
            }
            
            else {
            	
            	
            	RequestDispatcher rd2 = request.getRequestDispatcher("form2.html");
				
				out.println("<script type=\"text/javascript\">");
				out.println("alert(\"Please Check your details\")");
				out.println("</script>");
				
				rd2.include(request, response);
            }
		}
		
		catch(ClassNotFoundException | SQLException er) {
			
			er.printStackTrace();
			
		}
		
		finally {
			
			out.close();
		}
		
		
	}

}
