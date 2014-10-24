<%@ page import="java.sql.*" %><%
String catname=request.getParameter("catname");
int catid= Integer.parseInt(request.getParameter("catid"));
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_cart","root","");
Statement st=con.createStatement();
//ResultSet rst=st.executeQuery("select * from sub_category where category_id="+cat_id+";");
st.executeUpdate("UPDATE  `shop_cart`.`category` SET  `category_name` ='"+catname+"' WHERE  `category`.`category_id` ="+catid+";");%>