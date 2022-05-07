package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.AccountInfo;
import com.entities.SignUpInfo;
import com.helper.FactoryProvider;

public class SaveAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SaveAccountServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			
			long accountNumber = Long.parseLong(request.getParameter("acAccountNo"));
			String fname = request.getParameter("acFirstName");
			String lname = request.getParameter("acLastName");
			String name = fname+" "+lname;
			String dateOfBirth = request.getParameter("acDOB");
			long phoneNumber = Long.parseLong(request.getParameter("acPhoneNo"));
			int age =Integer.parseInt(request.getParameter("acAge"));
			String gender = request.getParameter("gender");		
			String accountType = request.getParameter("acType");
			String ifscCode = request.getParameter("acIFSC");
			long zipCode = Long.parseLong(request.getParameter("acZIP"));
			String branch = request.getParameter("scBranch");
			long pin = Long.parseLong(request.getParameter("acPin"));
			long amount =0;
			
			HttpSession httpsession = request.getSession();
			String user =(String) httpsession.getAttribute("username");
			
			Session s = FactoryProvider.getFactory().openSession();
			SignUpInfo sobj = (SignUpInfo)s.get(SignUpInfo.class,user);
					
			AccountInfo obj = new AccountInfo(accountNumber, name, dateOfBirth, phoneNumber, age, gender, accountType, ifscCode, zipCode, branch, pin,amount, sobj);
			
			
			Transaction tx = s.beginTransaction();
			s.save(obj);
			tx.commit();
			s.close();
			
			RequestDispatcher req = request.getRequestDispatcher("userDashboard.jsp");
			req.forward(request, response);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}
}
