<%@ page import="java.sql.*" %><%
String itemname=request.getParameter("itemname");
String itempath=request.getParameter("itempath");
int price= Integer.parseInt(request.getParameter("price"));
int quantity= Integer.parseInt(request.getParameter("quantity"));
String brand=request.getParameter("brand");
String status=request.getParameter("status");
int catid= Integer.parseInt(request.getParameter("catid"));
int subcatid= Integer.parseInt(request.getParameter("subcatid"));
String path1=request.getParameter("path1");
String path2=request.getParameter("path2");
String path3=request.getParameter("path3");
String path4=request.getParameter("path4");
int itemid=0;
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_cart","root","");
Statement st=con.createStatement();
st.executeUpdate("insert into item VALUES(null,  '"+itemname+"',  '"+itempath+"',  "+catid+",  "+subcatid+",  "+price+",  "+quantity+",  '"+brand+"',  '"+status+"');");
ResultSet rst=st.executeQuery("select * from item order by item_id DESC;");
rst.next();
itemid=rst.getInt(1);
out.print(itemid);
Connection con1= DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_cart","root","");
Statement st1=con1.createStatement();
st1.executeUpdate("insert into item_thumb VALUES("+itemid+",  '"+path1+"',  '"+path2+"',  '"+path3+"',  '"+path4+"');");
%>