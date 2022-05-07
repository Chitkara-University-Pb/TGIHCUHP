

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public RegisterServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		String a = request.getParameter("urname");
		String b = request.getParameter("urpass");
		
			 
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe" , "alpha" , "123456");
			
            PreparedStatement psmt = conn.prepareStatement("select * FROM Login WHERE username=? AND password=?");
			
			psmt.setObject(1, a);
			psmt.setObject(2, b);
			
			ResultSet rs = psmt.executeQuery();
			boolean status = rs.next();
			
			if(status) {
				
				out.println("<script type=\"text/javascript\">");
				out.println("alert(\"User Already Exist Please login\")");
				out.println("</script>");
				
				RequestDispatcher req = request.getRequestDispatcher("login.html");
				req.include(request, response);
				
			}
			
			else {
				
				
				PreparedStatement psmt2 = conn.prepareStatement("insert into Login values(?,?)");
				
				psmt2.setObject(1, a);
				psmt2.setObject(2, b);
				
					
				
				int res = psmt2.executeUpdate();
				
				if(res > 0) {
					conn.commit();
					
					RequestDispatcher rd = request.getRequestDispatcher("login.html");
					
					out.println("<script type=\"text/javascript\">");
					out.println("alert(\"You Have Successfully Register\")");
					out.println("</script>");
					
					rd.include(request, response);
				}
				
				else {
					
					RequestDispatcher rd2 = request.getRequestDispatcher("login.html");
					
					out.println("<script type=\"text/javascript\">");
					out.println("alert(\"Please Check your details\")");
					out.println("</script>");
					
					rd2.include(request, response);
				}
				
			}
			
			
		}
		
		catch(ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		
		finally {
			
			out.close();
		}
	}
}

