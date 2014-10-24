<%@ page import="java.sql.*" %><%
	String user=request.getParameter("user");
	String pass=request.getParameter("pass");
	boolean flag=false;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_cart","root","");
	Statement st=con.createStatement();
	ResultSet k=st.executeQuery("select * from user_register where user_name='"+user+"' and password='"+pass+"'");
	if(k.next())
	{
		if(k.getString("user_type").equals("admin"))
		{
			session.setAttribute("admin",user);
			out.print("admin");
		}else{
			session.setAttribute("user",user);
		out.print("normal");
		}
	}
	else
	{
		out.println("*please enter correct username and password");
	}
	
%>