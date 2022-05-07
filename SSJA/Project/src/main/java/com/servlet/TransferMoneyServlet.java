package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import com.entities.AccountInfo;
import com.entities.SignUpInfo;
import com.helper.FactoryProvider;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class TransferMoneyServlet extends HttpServlet {

	public TransferMoneyServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	public static String generateOTP() {
		int randomPin = (int) (Math.random() * 9000) + 1000;
		String otp = String.valueOf(randomPin);
		return otp;
	}

	private static void sendEmail(String message, String subject, String to, String from) {

		// Variable for gmail
		String host = "smtp.gmail.com";

		// get the system properties
		Properties properties = System.getProperties();
		//System.out.println("PROPERTIES " + properties);

		// setting important information to properties object

		// host set
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.auth", "true");

		// Step 1: to get the session object..
		javax.mail.Session session = javax.mail.Session.getInstance(properties, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("susantaadak527@gmail.com", "udnpfqjlzrlnxivp");
			}

		});

		session.setDebug(true);

		// Step 2 : compose the message [text,multi media]
		MimeMessage m = new MimeMessage(session);

		try {

			// from email
			m.setFrom(from);

			// adding recipient to message
			m.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			// adding subject to message
			m.setSubject(subject);

			// adding text to message
			m.setText(message);

			// send

			// Step 3 : send the message using Transport class
			Transport.send(m);

			System.out.println("Sent success...................");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			long senderAccount = Long.parseLong(request.getParameter("tsfAccount"));
			long receverAccount = Long.parseLong(request.getParameter("tsfRecAccount"));
			long amount = Long.parseLong(request.getParameter("tsfAmount"));
			long pin = Long.parseLong(request.getParameter("tsfPin"));

			Session session = FactoryProvider.getFactory().openSession();

			AccountInfo senderObj = (AccountInfo) session.get(AccountInfo.class, senderAccount);
			
			

			if (senderObj.getPin() == pin) {
				if (senderObj.getAmount() >= amount) {
					long otpval  =Long.parseLong(generateOTP());
					String message = otpval+" is your one time password.";
					String subject = "Transaction OTP ";
					String to = senderObj.getSignUpInfo().getEmail();
					String from = "susantaadak527@gmail.com";
					
					sendEmail(message,subject,to,from);
					
					HttpSession httpsession = request.getSession(true);
					httpsession.setAttribute("senderAccount", senderAccount);
					httpsession.setAttribute("receverAccount", receverAccount);
					httpsession.setAttribute("otp", otpval);
					httpsession.setAttribute("amount", amount);
					response.sendRedirect("transferMoneyAuth.jsp");
				}
			}
			session.close();

		} catch (Exception e) {

			e.printStackTrace();
		}
	}

}
