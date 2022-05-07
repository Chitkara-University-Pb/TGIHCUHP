package com.servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entities.AccountInfo;
import com.entities.SignUpInfo;
import com.helper.FactoryProvider;

public class SaveSignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SaveSignUpServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String username = request.getParameter("signUpUsername");
			long phone = Long.parseLong(request.getParameter("signUpPhoneNumber"));
			String email = request.getParameter("signUpEmail");
			String password = request.getParameter("password");
			
			Session s = FactoryProvider.getFactory().openSession();
			Query q=s.createQuery("from AccountInfo");
		    List<AccountInfo> list=q.list();
		    
		    List<AccountInfo> acinfolist = new ArrayList<AccountInfo>();
		    for(AccountInfo info:list) {
		    	if(info.getSignUpInfo().getUserName().equals(username)) {
		    		acinfolist.add(info);
		    	}
		    }
		    
			
			
			SignUpInfo ob = new SignUpInfo(username,phone,email,password,acinfolist);
			
			
			Transaction tx = s.beginTransaction();
			s.save(ob);
			tx.commit();
			s.close();

			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("<h1 style='text-align:center;'>User is Successfully created<h1/>");
			out.println("<h1 style='text-align:center;'><a href='login.jsp'>Login Now</a><h1/>");
		} catch (Exception e) {
			System.out.println("Signup error ------------");
			e.printStackTrace();
		}
	}
}
