package com.cn.connodity.util;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
public class EmailAttachmentSender {
	
	public void send(String toMail , String username) throws MessagingException {
		ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		JavaMailSender mailSender = (JavaMailSender) context.getBean("mailSender");
		MimeMessage mailMessage = mailSender.createMimeMessage();
		MimeMessageHelper mail = new MimeMessageHelper(mailMessage,true,"utf-8");
		//String host = "smtp.163.com";
		//String port = "25";	
		String mailFrom = "trading__platform@163.com";
		//String password = "hdu106151x";		
		String mailTo = toMail;
		String subject = "ע����֤";
		String message = "����һ���ɺ��繺��ƽ̨�Զ���������֤�ʼ�,�뾡����֤.<a href=\"http://localhost:8080/Commodity-trading-platform/from/user_save!usersave?username=" + username + "\">ȷ��ע��</a>";
		//String [] attachFiles = null;
		mail.setFrom(mailFrom);
		mail.setTo(toMail);
		mail.setSubject(subject);
		mail.setText(message,true);
		try {
			mailSender.send(mailMessage);
			System.out.println("�ʼ����ͳɹ�!");
		}catch(Exception ex) {
			System.out.println("�ʼ�����ʧ��!!!");
			ex.printStackTrace();
		}
	}
}
