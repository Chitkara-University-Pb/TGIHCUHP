
import java.io.*;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LoginServlet() {
        super();
    }


    
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			
			String uname = request.getParameter("uname");
			String pass = request.getParameter("pass");
			
			if(LoginDao.Validate(uname,pass)) {
				
				RequestDispatcher rd = request.getRequestDispatcher("form.html");
				rd.forward(request, response);
			}
			
			else {
				
				out.println("<script type=\"text/javascript\">");
				out.println("alert(\"Please Re-Enter the username Password\")");
				out.println("</script>");
				
				RequestDispatcher rd = request.getRequestDispatcher("login.html");
				
				rd.include(request, response);
			}
			
		}
		
		catch(Exception e) {
			
			e.printStackTrace();
		}
		
		finally {
			
			out.close();
		}
	}

}
