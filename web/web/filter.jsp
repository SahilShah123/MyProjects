<%@ page import="java.sql.*" %>
<%
String user=request.getParameter("user");
String type="";
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_cart","root","");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from user_register where username='"+user+"' ");
while(rs.next())
{
type=rs.getString("user_type");
}
if(type.equals("admin") )
{
}
else
{
}
%>