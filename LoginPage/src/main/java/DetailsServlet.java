
import java.io.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
@WebServlet("/DetailsServlet")
public class DetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DetailsServlet() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String a = request.getParameter("fname");
		String b = request.getParameter("mname");
		String c = request.getParameter("lname");
		
		String d = request.getParameter("age");
		
		int Age = Integer.parseInt(d);
		
		String e = request.getParameter("dob");
		String f = request.getParameter("mail");
		String g = request.getParameter("pnum");
		String h = request.getParameter("sts");
		String i = request.getParameter("addr");
		
		
		try {
            
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe" , "alpha" , "123456");
			
            PreparedStatement psmt = conn.prepareStatement("insert into Personal_Details values(?,?,?,?,?,?,?,?,?)");
            
            psmt.setObject(1, a);
            psmt.setObject(2, b);
            psmt.setObject(3, c);
            psmt.setObject(4, Age);
            psmt.setObject(5, e);
            psmt.setObject(6, f);
            psmt.setObject(7, g);
            psmt.setObject(8, h);
            psmt.setObject(9, i);
            
            int res = psmt.executeUpdate();
            
            if(res > 0) {
            	
            	RequestDispatcher rd = request.getRequestDispatcher("form2.html");
            	
            	rd.forward(request, response);
            	
            }
            
            else {
            	
            	
            	RequestDispatcher rd2 = request.getRequestDispatcher("form.html");
				
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
