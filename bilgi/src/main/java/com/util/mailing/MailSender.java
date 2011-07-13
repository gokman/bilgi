package com.util.mailing;

import java.net.URI;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.Security;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailSender {
	public static String sendActivationEmail (String to)throws Exception{

	try{	
		String activationUrl =null;
		String title = "Bilgi Uygulamasi Aktivasyon Maili";

	     Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider()); 
	     final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory"; 
	     Properties props = System.getProperties(); 
	     props.setProperty("mail.smtp.host", "smtp.gmail.com"); 
	     props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY); 
	     props.setProperty("mail.smtp.socketFactory.fallback", "false"); 
	     props.setProperty("mail.smtp.port", "465"); 
	     props.setProperty("mail.smtp.socketFactory.port", "465"); 
	     props.put("mail.smtp.auth", "true"); 

	     final String username = "bilgi.app@gmail.com"; 
	     final String password = "bilgiapp"; 
	     
		 String content = "show must go on...";
			
	     Session session = Session.getDefaultInstance(props,new Authenticator() { 
	        protected PasswordAuthentication getPasswordAuthentication() { 
	         return new PasswordAuthentication(username, 
	           password); 
	        } 
	       });   
	   
	     // -- Create a new message -- 
	     Message msg = new MimeMessage(session);   
	   
	     // -- Set the FROM and TO fields -- 
	     msg.setFrom(new InternetAddress(to)); 
	     msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse( 
	       to, false)); 
	     msg.setSubject(title); 
	     msg.setText(content); 
	     msg.setSentDate(new Date()); 
	     Transport.send(msg); 

	     return activationUrl;
    }

    catch (Exception ex) {

      ex.printStackTrace( ); 

    }
	return null;
		
		
	}
	
	
	
}
