package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.AccountInfo;
import com.helper.FactoryProvider;

public class TransferAuthenticationServlet extends HttpServlet {
	public TransferAuthenticationServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession httpsession = request.getSession();

			long authOtp = Long.parseLong(request.getParameter("authOtp"));
			long senderAccount = Long.parseLong(httpsession.getAttribute("senderAccount").toString());
			long receverAccount = Long.parseLong(httpsession.getAttribute("receverAccount").toString());
			long amount = Long.parseLong(httpsession.getAttribute("amount").toString());
			long otp = Long.parseLong(httpsession.getAttribute("otp").toString());

			Session session = FactoryProvider.getFactory().openSession();

			AccountInfo senderObj = (AccountInfo) session.get(AccountInfo.class, senderAccount);
			
			AccountInfo receverObj = (AccountInfo) session.get(AccountInfo.class, receverAccount);
			Transaction tx = session.beginTransaction();
			if (authOtp == otp) {
				senderObj.setAmount(senderObj.getAmount() - amount);
				receverObj.setAmount(receverObj.getAmount()+ amount);
				response.sendRedirect("userDashboard.jsp");
			} else {
				response.sendRedirect("transferMoneyAuth.jsp");
			}
			tx.commit();
			session.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
