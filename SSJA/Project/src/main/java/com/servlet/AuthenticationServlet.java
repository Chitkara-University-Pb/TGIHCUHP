package com.servlet;


import java.io.IOException;
import java.io.PrintWriter;


import org.hibernate.Session;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entities.SignUpInfo;
import com.helper.FactoryProvider;

public class AuthenticationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AuthenticationServlet() {
		super();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try {
			String loginusername = request.getParameter("logInUsername");
			HttpSession httpsession = request.getSession(true);
			httpsession.setAttribute("username",loginusername);
			response.sendRedirect("userDashboard.jsp");
			
		}catch (Exception e) {
            
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String loginusername = request.getParameter("logInUsername");
			String loginpassword = request.getParameter("logInPassword");
			
			
			Session session = FactoryProvider.getFactory().openSession();
			
			SignUpInfo obj = (SignUpInfo)session.get(SignUpInfo.class, loginusername);
			
			if(!obj.equals(null)) {
				if(loginusername.equals(obj.getUserName()) && loginpassword.equals(obj.getPassword())) {
					doPost(request, response);
					
					
					
//					RequestDispatcher req = request.getRequestDispatcher("userDashboard.jsp");
//					req.forward(request, response);
					
				}else {
					response.setContentType("text/html");
					PrintWriter out = response.getWriter();
					out.println("<h1 style='text-align:center;'>wrong user or password<h1/>");
					out.println("<h1 style='text-align:center;'><a href='login.jsp'>Login Now</a><h1/>");
				}
				
			}else {
				response.setContentType("text/html");
				PrintWriter out = response.getWriter();
				out.println("<h1 style='text-align:center;'>wrong user or password<h1/>");
				out.println("<h1 style='text-align:center;'><a href='login.jsp'>Login Now</a><h1/>");
			}
			
			session.close();
			
		} catch (Exception e) {
             System.out.println("susanta-----------");
			e.printStackTrace();
		}
	}
}

