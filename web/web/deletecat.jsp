<%@ page import="java.sql.*" %><%
int catid= Integer.parseInt(request.getParameter("catid"));
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_cart","root","");
Statement st=con.createStatement();
st.executeUpdate("DELETE FROM `shop_cart`.`item` WHERE `item`.`category_id` ="+catid+" ;");
Connection con2= DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_cart","root","");
Statement st2=con2.createStatement();
st2.executeUpdate("DELETE FROM `shop_cart`.`category` WHERE `category`.`category_id` ="+catid+" ;");
Connection con1= DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_cart","root","");
Statement st1=con1.createStatement();
st1.executeUpdate("DELETE FROM `shop_cart`.`sub_category` WHERE `sub_category`.`category_id` ="+catid+" ;");
%>