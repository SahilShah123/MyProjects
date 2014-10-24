<%@ page import="java.sql.*" %><%
String subcatname=request.getParameter("subcatname");
int cat_id= Integer.parseInt(request.getParameter("cat_id"));

Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_cart","root","");
Statement st=con.createStatement();
//ResultSet rst=st.executeQuery("select * from sub_category where category_id="+cat_id+";");
st.executeUpdate("insert into sub_category values(null,'"+subcatname+"',"+cat_id+")");
%>