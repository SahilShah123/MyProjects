<%@ page import="java.security.Security" %>
<%@ page import="java.util.Properties" %>
<%@ page import="javax.activation.DataHandler" %>
<%@ page import="javax.activation.DataSource" %>
<%@ page import="javax.activation.FileDataSource" %>
<%@ page import="javax.mail.BodyPart" %>
<%@ page import="javax.mail.Message" %>
<%@ page import="javax.mail.MessagingException" %>
<%@ page import="javax.mail.Multipart" %>
<%@ page import="javax.mail.PasswordAuthentication" %>
<%@ page import="javax.mail.Session" %>
<%@ page import="javax.mail.Transport" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.internet.MimeBodyPart" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="javax.mail.internet.MimeMultipart" %>
<%
Properties props = new Properties();
props.put("mail.smtp.host","smtp.gmail.com");
props.put("mail.smtp.auth", "true");
props.put("mail.debug", "true");
props.put("mail.smtp.port","465");
props.put("mail.smtp.socketFactory.port", "465");
props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
props.put("mail.smtp.socketFactory.fallback", "false");

Session session1 = Session.getDefaultInstance(props,new javax.mail.Authenticator() {protected PasswordAuthentication getPasswordAuthentication() {return new PasswordAuthentication("ketulce21@gmail.com","hackituseit");
}});



Message msg = new MimeMessage(session1);
InternetAddress addressFrom = new InternetAddress("ketulce21@gmail.com");
msg.setFrom(addressFrom);
System.out.print(addressFrom);

InternetAddress addressTo = new InternetAddress("spshah.shah@gmail.com");
msg.setRecipient(Message.RecipientType.TO, addressTo);
System.out.print(addressTo);
// Setting the Subject and Content Type
msg.setSubject("fashion fiesta");
  BodyPart messageBodyPart = new MimeBodyPart();
  messageBodyPart.setText("hello");
/*  Multipart multipart = new MimeMultipart();
  multipart.addBodyPart(messageBodyPart);
  messageBodyPart = new MimeBodyPart();
  String filename = "file.txt";
  DataSource source = new FileDataSource(filename);
  messageBodyPart.setDataHandler(new DataHandler(source));
  messageBodyPart.setFileName(filename);
  multipart.addBodyPart(messageBodyPart);
  msg.setContent(multipart);*/
msg.setContent("hello", "text/plain");
Transport.send(msg);

%>