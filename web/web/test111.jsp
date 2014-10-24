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
<%!

public class Mail {

private static final String SMTP_HOST_NAME = "smtp.gmail.com";
private static final String SMTP_PORT = "465";
private static final String emailMsgTxt = "Test Message Contents";
private static final String emailSubjectTxt = "A test from gmail";
private static final String emailFromAddress = "ketulce21@gmail.com";
private static final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
private static final String sendTo = "ketul_3084@yahoo.com";

public static void main(String args[]) throws Exception {

Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());

new Mail().sendSSLMessage(sendTo, emailSubjectTxt,
emailMsgTxt, emailFromAddress);
System.out.println("Sucessfully Sent mail to All Users");
}

public void sendSSLMessage(String recipients, String subject,
String message, String from) throws MessagingException {
boolean debug = true;

Properties props = new Properties();
props.put("mail.smtp.host", SMTP_HOST_NAME);
props.put("mail.smtp.auth", "true");
props.put("mail.debug", "true");
props.put("mail.smtp.port", SMTP_PORT);
props.put("mail.smtp.socketFactory.port", SMTP_PORT);
props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
props.put("mail.smtp.socketFactory.fallback", "false");

Session session = Session.getDefaultInstance(props,

 new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("ketulce21@gmail.com","hackituseit");
                    }
                });

session.setDebug(debug);

Message msg = new MimeMessage(session);
InternetAddress addressFrom = new InternetAddress(from);
msg.setFrom(addressFrom);
System.out.print(addressFrom);

InternetAddress addressTo = new InternetAddress(recipients);
msg.setRecipient(Message.RecipientType.TO, addressTo);
System.out.print(addressTo);
// Setting the Subject and Content Type
/*msg.setSubject(subject);
  BodyPart messageBodyPart = new MimeBodyPart();
  messageBodyPart.setText(message);
  Multipart multipart = new MimeMultipart();
  multipart.addBodyPart(messageBodyPart);
  messageBodyPart = new MimeBodyPart();
  String filename = "file.txt";
  DataSource source = new FileDataSource(filename);
  messageBodyPart.setDataHandler(new DataHandler(source));
  messageBodyPart.setFileName(filename);
  multipart.addBodyPart(messageBodyPart);
  msg.setContent(multipart);*/
msg.setContent(message, "text/plain");
Transport.send(msg);
}
}



%>
<%


Mail m=new Mail();

%>