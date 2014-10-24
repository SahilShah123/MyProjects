<%@ page import="java.sql.*" %><%
int subcatid= Integer.parseInt(request.getParameter("subcatid"));
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_cart","root","");
Statement st=con.createStatement();
st.executeUpdate("DELETE FROM `shop_cart`.`item` WHERE `item`.`sub_category_id` ="+subcatid+" ;");
Connection con1= DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_cart","root","");
Statement st1=con1.createStatement();
st1.executeUpdate("DELETE FROM `shop_cart`.`sub_category` WHERE `sub_category`.`sub_category_id` ="+subcatid+" ;");
%>